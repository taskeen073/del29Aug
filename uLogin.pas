unit uLogin;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  IWCompEdit, IWCompLabel, Vcl.Imaging.pngimage, Vcl.Controls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Data.DB, MemDS, DBAccess, Uni, Datasnap.DBClient,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect ;

type
  TfrLogin = class(TIWAppForm)
    imgLogo: TIWImage;
    lbUsername: TIWLabel;
    lbPassword: TIWLabel;
    lbSBC: TIWLabel;
    edUsername: TIWEdit;
    edPassword: TIWEdit;
    btLogin: TIWButton;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    qEmployee: TUniQuery;
    imgEye: TIWImage;
    procedure btLoginClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure imgEyeClick(Sender: TObject);
    procedure edPasswordAsyncExit(Sender: TObject; EventParams: TStringList);
  public
  pass:boolean;
  keeppass: String;
  end;

implementation

{$R *.dfm}

uses uMenu, ServerController, UserSessionUnit, uReport;


procedure TfrLogin.btLoginClick(Sender: TObject);
begin

      UserSession.ActiveEmployeeID := 0 ;
      UserSession.ActiveCustomerID := 0 ;

  if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;
      qemployee.Close ;
      qEmployee.Parambyname('Code').AsString := Trim(edusername.Text) ;
      qEmployee.Parambyname('Password').AsString := Trim(edpassword.Text) ;
      qEmployee.Open  ;
      if (Not qEmployee.IsEmpty) then
        begin
          usersession.ActiveEmployeeID   :=  qEmployee.FieldByName('Id').AsInteger ;
          usersession.ActiveEmployeeCode :=  qEmployee.FieldByName('Code').AsString ;
          tfrmenu.Create(self).Show;
          Release;
        end
      else
        begin
          WebApplication.ShowMessage('User or Password incorrect !!') ;
        end;
end;
procedure TfrLogin.edPasswordAsyncExit(Sender: TObject;
  EventParams: TStringList);
begin
  keeppass:=edPassword.Text;
end;

procedure TfrLogin.IWAppFormCreate(Sender: TObject);
begin
  layoutmgr.Enabled:=true;
  pass:=false;
  imgEye.Picture.LoadFromFile('images\IconMat-Black\ClosePass.png');
end;
procedure TfrLogin.imgEyeClick(Sender: TObject);
begin
if (not pass) then
  begin
    Edpassword.DataType :=sttext  ;
    Edpassword.DataTypeOptions.NumberType:=ntText;
    keeppass:=edPassword.Text;
    pass:=true;
    imgEye.Picture.LoadFromFile('images\IconMat-Black\OpenPass.png');
    edPassword.Text:=keeppass;
  end
  else
    begin
      pass:=false;
      Edpassword.DataType :=stPassword;
      Edpassword.DataTypeOptions.NumberType:=ntText;
      imgEye.Picture.LoadFromFile('images\IconMat-Black\ClosePass.png');
      edPassword.Text:=keeppass;
    end;
end;
initialization
  tfrlogin.SetAsMainForm;
//  TfrReport.SetAsMainForm;
end.

