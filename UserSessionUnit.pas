unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, UniProvider, SQLServerUniProvider,FMX.WebBrowser,IdURI,
  Data.DB, DBAccess, Uni,MemData,Idhttp,
   IdIOHandler,
   IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TIWUserSession = class(TIWUserSessionBase)
    DB: TUniConnection;
    config: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    procedure DBConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
    procedure configConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
    procedure IWUserSessionBaseCreate(Sender: TObject);
    procedure IWUserSessionBaseBeforeExecuteForm(Sender: TObject);
  private
    { Private declarations }
  public
   //Server.Dat
   WebApppath,
   ServerIP,
   HttpPort,
   HttpsPort,
   DBIP,
   DBName : String ;

  jobid : integer;
  statusid:integer;
  scheduleid:integer;
  faqid:integer;
  customerid:integer;
  empid: integer;
  messageid:integer;
  areyouupdate:integer;
    { Public declarations }
  ActiveEmployeeID: Integer;
  ActiveEmployeeCode: String;
  ActiveCustomerID: Integer;
  ActiveCustomerCode: String;
  month : TStringList;
  ServerHttpPort:String;
  MainURL:string;          // Define our string list variable


Procedure SendLine(Token : String; Message : String);
  end;


implementation

{$R *.dfm}

procedure TIWUserSession.configConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
  RetryMode := rmReconnectExecute;
end;

procedure TIWUserSession.DBConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
  RetryMode := rmReconnectExecute;
end;

procedure TIWUserSession.IWUserSessionBaseBeforeExecuteForm(Sender: TObject);
begin
  SysUtils.FormatSettings.ShortDateFormat := 'dd/MM/yyyy' ;
end;

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
Var  F          : Textfile ;
     CurrentDir : String ;
begin
  CurrentDir    := GetCurrentDir ;
  if (FileExists(Currentdir+'\server.dat')) then
    Begin
      AssignFile(F,Currentdir+'\server.dat') ;
      {$I-}Reset(F) ; {$I+}
      Readln(F,WebApppath) ;
      Readln(F,ServerIP) ;
      Readln(F,DBName) ;
      Readln(F,HttpPort) ;
      Readln(F,HttpSPort) ;
      CloseFile(F) ;

      DB.Close;
      DB.Server    := TRim(ServerIP);
      DB.Port      := 1433;
      DB.Database  := TRim(DBName);
      DB.Open;
    End ;

//    SSL.SSLPort := StrToInt(Trim(ServerHttpPort));
    MainURL := 'http://'+ServerIP+':'+HttpPort ;
    //'https://'+ServerIP+':'+ServerHttpPort ;


end;

Procedure TIWUserSession.SendLine(Token : String; Message : String);
//Var URL_GooGoo            : string;
//    Webbrowser_GooGoo     : TWebbrowser;
//begin
//  Webbrowser_GooGoo := TWebbrowser.Create(nil);
//  URL_GooGoo        := TIdURI.URLEncode(
//  'http://ns5.sbcserver.com/line/send.php?line_token='+Trim(Token)+'&message='+Trim(Message));
//  Webbrowser_GooGoo.Navigate(TIdURI.URLEncode(URL_GOOGOO));
//end;
//
//end.
//
Var RunOk     : Boolean;
    strResult : string;
    Param     : TStringStream;
    URL       : String;
    idhttp1   : TIdhttp ;

    URL_GooGoo            : string;
    Webbrowser_GooGoo     : TWebbrowser;

    LIOHandleSSL   : TIdSSLIOHandlerSocketOpenSSL;
begin
  RunOk := True;
  try
    Idhttp1 := TIdhttp.Create(Nil);
    Try
      LIOHandleSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
      LIOHandleSSL.SSLOptions.Mode        := sslmUnassigned;
      //LIOHandleSSL.OnGetPassword          := SSLGetPassword;
      //LIOHandleSSL.OnVerifyPeer          := SSLVerifyPeer;
      LIOHandleSSL.SSLOptions.VerifyMode   := [];
      //LIOHandleSSL.SSLOptions.Method      := sslvSSLv23;
      LIOHandleSSL.SSLOptions.SSLVersions  := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
      LIOHandleSSL.SSLOptions.VerifyDepth   := 0;
      Idhttp1.IOHandler              := LIOHandleSSL;

      Idhttp1.Request.CustomHeaders.Clear;
      URL   := 'https://notify-api.line.me/api/notify';
      Param := TStringStream.Create('message=' + TRim(Message),TEncoding.UTF8);
      Idhttp1.Request.ContentType    := 'application/x-www-form-urlencoded';
      Idhttp1.Request.CacheControl   := 'no-cache';
      Idhttp1.Request.CharSet        := 'UTF-8';
      Idhttp1.Request.CustomHeaders.AddValue('Authorization','Bearer '+TRim(Token));
      strResult := Idhttp1.Post(Trim(Url),Param);
    Finally
      Param.Free;
      Idhttp1.Free ;
    End;

  Except on E: Exception do
    begin
      WebApplication.ShowMessage(E.Message);
      RunOk := False;
    end;
  End;
end;
end.
