unit uMessageDeatail;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Data.DB,
  DBAccess, Uni, MemDS, IWCompListbox, Vcl.Controls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompEdit, IWDBStdCtrls,
  IWCompButton, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, Vcl.Imaging.pngimage,
  IWCompExtCtrls, IWCompLabel, IWCompMemo;

type
  TfrMessageDetail = class(TIWAppForm)
    qforcallmessage: TUniQuery;
    htmlMessagedetail: TIWTemplateProcessorHTML;
    btBack: TIWImage;
    lbMessageDetail: TIWLabel;
    lbMessage: TIWLabel;
    btSave: TIWImage;
    qupdate: TUniQuery;
    qforinsert: TUniQuery;
    lbRedAlertMessage: TIWLabel;
    mmMessage: TIWMemo;
    procedure IWAppFormCreate(Sender: TObject);
    procedure btBackClick(Sender: TObject);
    procedure MyConfirmCallback(EventParams: TStringList);
    procedure btSaveClick(Sender: TObject);
    procedure IWMemo1AsyncExit(Sender: TObject; EventParams: TStringList);
  public
    i,tmpindex:integer;
    cm:string;
    procedure updatemess();
  end;

implementation

{$R *.dfm}



uses ServerController, UserSessionUnit, uSchedule, uMessageDigest;


procedure TfrMessageDetail.updatemess;
var saveok: Boolean;
begin
    saveok:=false;
    UserSession.DB.StartTransaction;

try
    if UserSession.areyouupdate = 1 then
    begin
    qupdate.Close;
    qupdate.ParamByName('mess').AsString:=mmMessage.Text;
    qupdate.ParamByName('id').AsInteger:=UserSession.messageid;
    qupdate.Execute  ;
end

else
  begin
      qforinsert.Close;
      qforinsert.ParamByName('mess').AsString:=mmMessage.Text;
      qforinsert.Execute  ;
  end;

UserSession.DB.Commit;
saveok:=true;
except on E : Exception do
    begin
    saveok:=false;
    UserSession.DB.Rollback;
    WebApplication.ShowMessage('ClearToken Error : '+E.Message);
    end;
end;
if saveok then
begin
   Release;
   Tfrmessagediagest.Create(self).Show;
end
else
begin
WebApplication.ShowMessage('err ja');
end;
end;


procedure tfrmessagedetail.MyConfirmCallback(EventParams: TStringList);
var
  Response: Boolean;
begin
  Response := SameText(EventParams.Values['RetValue'], 'True');
  if Response then
    begin
    updatemess();
    end;
end;


procedure TfrMessageDetail.IWAppFormCreate(Sender: TObject);
begin
//IWLabel1.Caption:=UserSession.areyouupdate.ToString;
if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;


    qforcallmessage.Close;
    qforcallmessage.ParamByName('id').AsInteger:=UserSession.messageid;
    qforcallmessage.open;
    mmMessage.Text:=qforcallmessage.FieldByName('messagetochat').AsString;


    if UserSession.areyouupdate = 0 then
      mmMessage.Text:='';


  if not (mmMessage.Text = '') then
    lbRedAlertMessage.Visible:=false;

  layoutmgr.Enabled:=true;

  WebApplication.RegisterCallBack('MyConfirmCallback', MyConfirmCallback);
end;


procedure TfrMessageDetail.IWMemo1AsyncExit(Sender: TObject;
  EventParams: TStringList);
begin
    if mmMessage.Text = '' then
        lbRedAlertMessage.Visible:=true
    else
        lbRedAlertMessage.Visible:=false;
end;

procedure TfrMessageDetail.btBackClick(Sender: TObject);
  begin
    release;
    Tfrmessagediagest.Create(self).Show;
  end;

procedure TfrMessageDetail.btSaveClick(Sender: TObject);
begin
if mmMessage.Text = '' then
   begin
     WebApplication.ShowMessage('please input message for save');
   end
else
   begin
      WebApplication.ShowConfirm('ยืนยัน','MyConfirmCallback', Title,'Yes', 'No');
   end;
end;

end.
