unit uNewMessage;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompExtCtrls,
  IWCompButton, IWCompEdit, IWCompListbox, Vcl.Controls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel, Data.DB, MemDS,
  DBAccess, Uni, IWDBStdCtrls, Vcl.Imaging.pngimage, IWCompMemo, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, VirtualTable;

type
  TfrNewMessage = class(TIWAppForm)
    lbNewMessage: TIWLabel;
    lbCustomer: TIWLabel;
    lbShownameCustomer: TIWLabel;
    lbFAQ: TIWLabel;
    lbSendMessage: TIWLabel;
    slCustomer: TIWComboBox;
    btCancle: TIWButton;
    btSendMessage: TIWButton;
    btBack: TIWImage;
    qcustomer: TUniQuery;
    qforfaq: TUniQuery;
    qfindcustomer: TUniQuery;
    mmSendMessage: TIWMemo;
    slFAQ_o: TIWComboBox;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    slShownameCustomer: TIWComboBox;
    qMessage: TUniQuery;
    lbRedAlertCustomer: TIWLabel;
    lbRedAlertSendMessage: TIWLabel;
    lbMessage: TIWLabel;
    slFAQ: TIWDBLookupComboBox;
    dforfaq: TUniDataSource;
    qTempfaq: TVirtualTable;
    dTempfaq: TDataSource;
    qFAQId: TUniQuery;
    procedure IWAppFormCreate(Sender: TObject);
    procedure slCustomerAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure btCancleClick(Sender: TObject);
    procedure btSendMessageClick(Sender: TObject);
    procedure MyConfirmsendline(EventParams: TStringList);
    procedure btBackClick(Sender: TObject);
    procedure slFAQ_oAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure slShownameCustomerAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure mmSendMessageAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure mmSendMessageAsyncExit(Sender: TObject; EventParams: TStringList);
    procedure slFAQAsyncChange(Sender: TObject; EventParams: TStringList);
  public
     i,tmpindex:integer;
    cm:string;
    ia,tmpindexa,keepfaq:integer;
    cma:string;
    ib,tmpindexb:integer;
    cmb:string;
  end;

implementation

{$R *.dfm}

uses ServerController, uMenu, UserSessionUnit;

procedure tfrnewmessage.MyConfirmsendline(EventParams: TStringList);
var
  Response: Boolean;
begin
  Response := SameText(EventParams.Values['RetValue'], 'True');
  if Response then
    begin
      //UserSession.SendLine('XbaYkvKtlxaySW1vnOJTyPi7m3L6Y87CXd76plTFDbl',(mmSendMessage.Text));
      UserSession.SendLine(Trim(qfindcustomer.FieldByName('LineGroupToken').AsString),(mmSendMessage.Text));
      WebApplication.ShowNotification('Success',ntSuccess);
    end;
end;


procedure TfrNewMessage.btCancleClick(Sender: TObject);
begin
      mmSendMessage.Clear;
end;

procedure TfrNewMessage.btSendMessageClick(Sender: TObject);
begin
  if (slCustomer.ItemIndex = 0) and (mmSendMessage.Text = EmptyStr) then
    begin
      WebApplication.ShowMessage('plese select customer!!!');
    end
  else if mmSendMessage.Text = '' then
    begin
       WebApplication.ShowMessage('plese input message !!!');
    end
  else
    WebApplication.ShowConfirm('ยืนยัน','MyConfirmsendline', Title,'Yes', 'No');
end;

procedure TfrNewMessage.IWAppFormCreate(Sender: TObject);
begin
  if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End;

    qMessage.Close;
    qMessage.Open;

    qcustomer.Close;
    qcustomer.Open;

    qforfaq.Close;
    qforfaq.open;


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
    End ;
  slCustomer.ItemIndex := TmpIndex ;

  //FAQ
  (*
  TmpIndexa := 0 ;
  Ia := -1 ;
  slFAQ.Items.Clear ;
  qforfaq.First ;
  while (Not qforfaq.Eof) do
    begin
      Inc(Ia) ;
      Cma := qforfaq.FieldByName('show').AsString ;

      slFAQ.Items.Append(Cma);
      qforfaq.Next ;
    End ;
  slFAQ.ItemIndex := TmpIndexa ;
  *)
  qTempfaq.close  ;
  qTempfaq.Open   ;
  qTempfaq.append ;
  qTempfaq.Edit ;
  qTempfaq.FieldByName('IdFAQ').AsInteger := 0 ;

  qforfaq.Close ;
  qforfaq.Open  ;
  slFAQ.ItemIndex := 0;
  slFAQ.RefreshItems;


  TmpIndexb := 0 ;
  Ib := -1 ;
  slShownameCustomer.Items.Clear ;
  qMessage.First ;
  while (Not qMessage.Eof) do
    begin
      Inc(Ib) ;
      Cmb := qMessage.FieldByName('mess').AsString ;

      slShownameCustomer.Items.Append(Cmb);
      qMessage.Next ;
    End ;
  slShownameCustomer.ItemIndex := TmpIndexb ;
  
  WebApplication.RegisterCallBack('MyConfirmsendline',MyConfirmsendline);
  LayoutMgr.Enabled:=true;

end;

procedure TfrNewMessage.slCustomerAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  qfindcustomer.Close;
  qfindcustomer.ParamByName('code').AsString:=slCustomer.Text;
  qfindcustomer.Open;
  lbShownameCustomer.Text:=qfindcustomer.FieldByName('name').AsString;


  if not (slCustomer.ItemIndex = 0)  then
  lbRedAlertCustomer.Visible:=false;
end;

procedure TfrNewMessage.slFAQAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  if (Not Sametext('please select',slFAQ.Text)) then
    begin
      qFAQId.Close;
      qFAQId.ParamByName('Id').AsInteger := qTempFAQ.FieldByName('IdFAQ').AsInteger;
      qFAQId.Open;
      if (qFAQId.IsEmpty) then
        mmSendMessage.Text:= Trim(slFAQ.Text)
      else
        begin
          if (Trim(qFAQId.FieldByName('problemanswer').AsString) = '') then
            mmSendMessage.Text:= Trim(qFAQId.FieldByName('problemquestion').AsString)
          else
            mmSendMessage.Text:= Trim(qFAQId.FieldByName('problemanswer').AsString);
        end;
    end
  else
    mmSendMessage.Clear;
end;

procedure TfrNewMessage.slFAQ_oAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
//  if not(slFAQ.ItemIndex=(0))then
//  mmSendMessage.Text:=(slFAQ.Text);
end;

procedure TfrNewMessage.slShownameCustomerAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
  if not(slShownameCustomer.ItemIndex=(0))then
  mmSendMessage.Text:=(slShownameCustomer.Text);
end;

procedure TfrNewMessage.btBackClick(Sender: TObject);
begin
Release;
end;

procedure TfrNewMessage.mmSendMessageAsyncExit(Sender: TObject;
  EventParams: TStringList);
begin
  if mmSendMessage.Text = '' then
    lbRedAlertSendMessage.Visible:=true
  else
    lbRedAlertSendMessage.Visible:=false;
end;

procedure TfrNewMessage.mmSendMessageAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  if mmSendMessage.Text = '' then
    lbRedAlertSendMessage.Visible:=true
  else
    lbRedAlertSendMessage.Visible:=false;
end;
end.
