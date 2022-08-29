unit ufAQDetail;
interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Data.DB, DBAccess, Uni, MemDS, IWCompText,
  IWCompListbox, IWCompEdit, IWCompLabel, Vcl.Imaging.pngimage, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls,
  IWDBStdCtrls, IWCompMemo;

type
  Tfrfaqdetail = class(TIWAppForm)
    btBackforFaq: TIWImage;
    btSaveFaqDetail: TIWImage;
    lbFaqDetail: TIWLabel;
    lbCatagory: TIWLabel;
    lbProblem: TIWLabel;
    lbCustomer: TIWLabel;
    lbDetail: TIWLabel;
    edCatagory: TIWEdit;
    edProblem: TIWEdit;
    htmlfaqdetail: TIWTemplateProcessorHTML;
    qcustomer: TUniQuery;
    qforinsertFaq: TUniQuery;
    qforcus: TUniQuery;
    qforupdateFaq: TUniQuery;
    qforcallpdateFaq: TUniQuery;
    slCustomer: TIWComboBox;
    lbRedAlertCatagory: TIWLabel;
    lbRedAlertProblem: TIWLabel;
    lbRedAlertDetail: TIWLabel;
    mmFaqDetail: TIWMemo;
    procedure btBackforFaqClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure MyConfirmCallback(EventParams: TStringList);
    procedure slCustomerAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure btSaveFaqDetailClick(Sender: TObject);
    procedure edCatagoryAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure edProblemAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure IWEdmoreAsyncChange(Sender: TObject; EventParams: TStringList);
  public
  cumtomerr:String;
  i,tmpindex,slid:integer;
  cm:string;
  procedure faqup();
  end;

implementation

{$R *.dfm}

uses uFAQ, ServerController, UserSessionUnit;

procedure tfrfaqdetail.faqup;
var saveok: Boolean;
    errormsg:string;
  begin
    saveok:=false;
    UserSession.DB.StartTransaction;
  try
    if UserSession.faqid = 0 then
      begin
        qforinsertFaq.Close;
        qforinsertFaq.ParamByName('PMD').AsString:=(edcatagory.text);
        qforinsertFaq.ParamByName('PQA').AsString:=(edProblem.text);
        qforinsertFaq.ParamByName('PANSW').AsString:=(mmFaqDetail.text);
        if slCustomer.ItemIndex=-1 then
          begin
            qforinsertFaq.ParamByName('CUSID').AsInteger:=0;
          end
        else
          begin
            qforinsertFaq.ParamByName('CUSID').AsInteger:=qforcus.FieldByName('id').AsInteger;
          end;
        qforinsertFaq.ExecSQL;
    end
    else
      begin
       qforupdateFaq.Close;
       qforupdateFaq.ParamByName('PMD').AsString:=(edcatagory.text);
       qforupdateFaq.ParamByName('PQA').AsString:=(edProblem.text);
       qforupdateFaq.ParamByName('PANSW').AsString:=(mmFaqDetail.text);
       qforupdateFaq.ParamByName('id').AsInteger:=strtoint(UserSession.faqid.ToString);
       qforupdateFaq.ExecSQL;
    end;
      UserSession.DB.Commit;
      saveok:=true;
    except on E : Exception do
    begin
        saveok:=false;
        UserSession.DB.Rollback;
        errormsg:='ClearToken Error : '+E.Message;
      end;
     end;
    if saveok then
      begin
        Release;
        Tfrfaq.Create(self).Show;
      end
    else
      begin
        WebApplication.ShowMessage(errormsg);
      end;
  end;


procedure tfrfaqdetail.MyConfirmCallback(EventParams: TStringList);
var
  Response: Boolean;
begin
  Response := SameText(EventParams.Values['RetValue'], 'True');
  if Response then
    begin
      faqup();
    end;
end;


procedure Tfrfaqdetail.IWAppFormCreate(Sender: TObject);
begin
layoutmgr.Enabled:=true;
if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;

if NOT(UserSession.faqid > 0) then
  begin
    qCustomer.Close ;
    qCustomer.Open  ;
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
    End;

     slCustomer.ItemIndex:=-1;
     edcatagory.Text:=EmptyStr;
     edProblem.Text:=EmptyStr;
     mmFaqDetail.Text:=EmptyStr;


  end
else
  begin
     qforcallpdateFaq.Close;
     qforcallpdateFaq.ParamByName('id').AsInteger:=(UserSession.faqid);
     qforcallpdateFaq.Open;
     edcatagory.Text:=qforcallpdateFaq.FieldByName('problemmodule').AsString;
     edProblem.Text:=qforcallpdateFaq.FieldByName('problemquestion').AsString;
     mmFaqDetail.Text:=qforcallpdateFaq.FieldByName('problemanswer').AsString;
     qCustomer.Close ;
     qCustomer.Open  ;
     slcustomer.Enabled:=false;

    TmpIndex := 0 ;
    I := -1 ;
    slCustomer.Items.Clear ;
    qCustomer.First ;
    while (Not qCustomer.Eof) do
      begin
        Inc(I) ;
        if (qforcallpdateFaq.FieldbyName('customer').asinteger = qCustomer.FieldByName('Id').AsInteger) Then
          TmpIndex := I ;
          Cm := qCustomer.FieldByName('Code').AsString ;
          slCustomer.Items.Append(Cm);
          qCustomer.Next ;
      End;
      if qforcallpdateFaq.FieldByName('customer').AsInteger = 0 then
      begin
      slCustomer.Text := '-1';
      end
      else
      slCustomer.ItemIndex := TmpIndex ;
end;
  qcustomer.Open;
  WebApplication.RegisterCallBack('MyConfirmCallback', MyConfirmCallback);

  if edcatagory.Text='' then
    begin
      lbRedAlertCatagory.Visible:=true;
    end
  else
    begin
      lbRedAlertCatagory.Visible:=false;
    end;


  if edProblem.Text='' then
    begin
      lbredalertproblem.Visible:=true ;
    end

  else
    begin
      lbredalertproblem.Visible:=false;
    end;


  if mmFaqDetail.Text='' then
    begin
      lbRedAlertDetail.Visible:=true ;
    end
  else
    begin
      lbRedAlertDetail.Visible:=false;
    end;

end;

procedure Tfrfaqdetail.btBackforFaqClick(Sender: TObject);
begin
  UserSession.faqid:=0;
  release;
  Tfrfaq.Create(self).show;
end;

procedure Tfrfaqdetail.edCatagoryAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
if edcatagory.Text = '' then
    lbRedAlertCatagory.Visible:=true
else
    lbRedAlertCatagory.Visible:=false;
end;

procedure Tfrfaqdetail.IWEdmoreAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
if mmFaqDetail.Text = '' then
    lbRedAlertDetail.Visible:=true
else
    lbRedAlertDetail.Visible:=false;
end;

procedure Tfrfaqdetail.edProblemAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
if edProblem.Text = '' then
    lbredalertproblem.Visible:=true
else
    lbredalertproblem.Visible:=false;
end;

procedure Tfrfaqdetail.btSaveFaqDetailClick(Sender: TObject);
begin
if ((edcatagory.Text=EmptyStr)OR(edProblem.Text=EmptyStr)OR(mmFaqDetail.Text=EmptyStr)) then
   begin
        webapplication.ShowMessage('please input data for save !!!');
   end
   else
        WebApplication.ShowConfirm('ยืนยัน','MyConfirmCallback', Title,'Yes', 'No');
end;

procedure Tfrfaqdetail.slCustomerAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
    qforcus.close;
    qforcus.ParamByName('code').AsString:=(slcustomer.text);
    qforcus.Open;
end;
end.
