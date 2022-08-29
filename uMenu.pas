unit uMenu;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  Vcl.Imaging.pngimage, IWCompExtCtrls, IWCompEdit, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel,
  IWCompButton, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, uReport;

type
  Tfrmenu = class(TIWAppForm)
    lbNameSBC: TIWLabel;
    btShutdown: TIWImage;
    btFAQ: TIWButton;
    btSchedule: TIWButton;
    btStatus: TIWButton;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    btMessageDigest: TIWButton;
    btToken: TIWButton;
    lbName: TIWLabel;
    btNewMessage: TIWButton;
    btSidebar: TIWImage;
    btHomeSidebar: TIWLabel;
    btTokenSidebar: TIWLabel;
    btMessageDigestSidebar: TIWLabel;
    btFAQSidebar: TIWLabel;
    btScheduleSidebar: TIWLabel;
    btStatusSidebar: TIWLabel;
    btShutdownSidebar: TIWLabel;
    btNewMessageSidebar: TIWLabel;
    btJobService: TIWButton;
    btReport: TIWButton;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;

    procedure btShutdownClick(Sender: TObject);
    procedure btFAQClick(Sender: TObject);
    procedure btScheduleClick(Sender: TObject);
    procedure btStatusClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure btMessageDigestClick(Sender: TObject);
    procedure btTokenClick(Sender: TObject);
    procedure btFAQSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btTokenSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btMessageDigestSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btScheduleSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btStatusSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btShutdownSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btNewMessageClick(Sender: TObject);
    procedure btJobServiceClick(Sender: TObject);
    procedure btReportClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses uLogin, uFAQ, uSchedule, uStatus, ServerController, UserSessionUnit,
  uMessageDigest, uToken, uNewMessage, uJobService;


procedure Tfrmenu.btMessageDigestClick(Sender: TObject);
begin
  tfrmessagediagest.Create(self).Show;
end;

procedure Tfrmenu.btNewMessageClick(Sender: TObject);
begin
  TfrNewMessage.Create(self).Show;
end;

procedure Tfrmenu.btReportClick(Sender: TObject);
begin
  tfrReport.Create(self).Show;
end;

procedure Tfrmenu.IWAppFormCreate(Sender: TObject);
begin
  if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;
  btSidebar.Visible := False;
  lbName.Caption:='('+UserSession.ActiveEmployeeCode+')';
  layoutmgr.Enabled:=true;
  IWLabel1.Caption:=UserSession.ActiveEmployeeID.ToString;
  IWLabel2.Caption:=UserSession.ActiveCustomerID.ToString;
end;

procedure Tfrmenu.btFAQClick(Sender: TObject);
begin
  tfrfaq.Create(self).Show;
end;

procedure Tfrmenu.btScheduleClick(Sender: TObject);
begin
  tfrschedule.Create(self).Show;
end;

procedure Tfrmenu.btStatusClick(Sender: TObject);
begin
  tfrstastusversion.Create(self).Show;
end;

procedure Tfrmenu.btTokenClick(Sender: TObject);
begin
  tfrToken.Create(self).Show;
end;

procedure Tfrmenu.btShutdownClick(Sender: TObject);
begin
  //WebApplication.ShowMessage('ServerIP : '+Usersession.ServerIP+'  , DBName : '+Usersession.DBName);
  release;
  TfrLogin.Create(self).Show;
end;

procedure Tfrmenu.btTokenSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  tfrToken.Create(self).Show;
end;

procedure Tfrmenu.btMessageDigestSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  tfrmessagediagest.Create(self).Show;
end;

procedure Tfrmenu.btFAQSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  tfrfaq.Create(self).Show;
end;

procedure Tfrmenu.btJobServiceClick(Sender: TObject);
begin
  TfrJobService.Create(self).Show;
end;

procedure Tfrmenu.btScheduleSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  tfrschedule.Create(self).Show;
end;

procedure Tfrmenu.btStatusSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  tfrstastusversion.Create(self).Show;
end;

procedure Tfrmenu.btShutdownSidebarAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  release;
  TfrLogin.Create(self).Show;
end;

end.
