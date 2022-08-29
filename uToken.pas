unit uToken;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Data.DB, MemDS,
  DBAccess, Uni, IWCompListbox, IWDBStdCtrls, IWCompEdit, Vcl.Imaging.pngimage,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompExtCtrls, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWCompLabel, IWCompButton;

type
  TfrToken = class(TIWAppForm)
    btBack: TIWImage;
    edName: TIWEdit;
    edPassword: TIWEdit;
    edToken: TIWEdit;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    lbTokenTitle: TIWLabel;
    lbCustomer: TIWLabel;
    lbName: TIWLabel;
    lbPassword: TIWLabel;
    lbToken: TIWLabel;
    slCustomer: TIWComboBox;
    qCustometCode: TUniQuery;
    btSave: TIWImage;
    qcustomer: TUniQuery;
    qupdate: TUniQuery;
    btEye: TIWImage;
    procedure btBackClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure slCustomerAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure btSaveClick(Sender: TObject);
    procedure MyConfirmCallback(EventParams: TStringList);
    procedure btEyeClick(Sender: TObject);

  public
    i,tmpindex,slid:integer;
    cm:string;
    pass:boolean;
    Procedure UpdatepassorToken();

  end;

implementation

{$R *.dfm}

uses uMenu, ServerController, UserSessionUnit;

procedure tfrtoken.MyConfirmCallback(EventParams: TStringList);
var
  Response: Boolean;
begin
  Response := SameText(EventParams.Values['RetValue'], 'True');
  if Response then
    begin
    UpdatepassorToken();
    end;
end;

procedure TfrToken.IWAppFormCreate(Sender: TObject);
begin
layoutmgr.Enabled:=true;

if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;


    qcustomer.Close;
    qcustomer.Open;

  TmpIndex := 0 ;
  I := -1 ;
  slCustomer.Items.Clear ;
  qCustomer.First ;
  while (Not qCustomer.Eof) do
    begin
      Inc(I) ;

      Cm := qCustomer.FieldByName('Code').AsString ;

      slCustomer.Items.Append(Cm);
      qCustomer.Next ;
    end;

  WebApplication.RegisterCallBack('MyConfirmCallback', MyConfirmCallback);
    pass:=false;
end;

Procedure tfrtoken.Updatepassortoken();
Var SaveOk : Boolean;
begin
saveok:=False;
    UserSession.DB.StartTransaction;
    Try
    qupdate.Close;
    qupdate.ParamByName('pass').AsString:=edPassword.Text;
    qupdate.ParamByName('linetoken').AsString:=edtoken.Text;
    qupdate.ParamByName('code').AsString:=slcustomer.Text;
    qupdate.Execute  ;
        UserSession.DB.Commit;
        SaveOK := True;
      Except on E : Exception do
        begin
          UserSession.db.Rollback;
          SaveOk := False;
          WebApplication.ShowMessage('ClearToken Error : '+E.Message);
        end;
      End;
      if (SaveOK) then
        begin
//        WebApplication.ShowNotification('Toker  Succsess',ntSuccess);
        Release;
        end;
end;


procedure TfrToken.btSaveClick(Sender: TObject);
var saveok: Boolean;
begin
if slcustomer.ItemIndex=(-1) then
begin
WebApplication.ShowMessage('Please select customer !!!');
end
else
WebApplication.ShowConfirm('ยืนยัน','MyConfirmCallback', Title,'Yes', 'No');
end;

procedure TfrToken.btEyeClick(Sender: TObject);
begin

if (not pass) then
  begin
    edPassword.DataType :=sttext  ;
    edPassword.DataTypeOptions.NumberType:=ntText;
    edPassword.Text:=qCustometCode.FieldByName('password').AsString;
    pass:=true;
    btEye.Picture.LoadFromFile('images\IconMat-Black\OpenPass.png');
  end
  else
  begin
    pass:=false;
    edPassword.DataType :=stPassword;
    edPassword.DataTypeOptions.NumberType:=ntText;
    edPassword.Text:=qCustometCode.FieldByName('password').AsString;
    btEye.Picture.LoadFromFile('images\IconMat-Black\ClosePass.png');
end;

end;

procedure TfrToken.btBackClick(Sender: TObject);
begin
  Release;
end;

procedure TfrToken.slCustomerAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  qCustometCode.close;
  qCustometCode.ParamByName('code').AsString:=(slcustomer.text);
  qCustometCode.Open;
  slid:=qCustometCode.FieldByName('id').AsInteger;
  edName.Text:=qCustometCode.FieldByName('name').AsString;
  edPassword.Text:=qCustometCode.FieldByName('password').Asstring;
  edtoken.Text:=qCustometCode.FieldByName('linegrouptoken').Asstring;
end;

end.

