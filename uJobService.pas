unit uJobService;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompTimeEdit,
  IWControl, IWTMSCal, IWCompFileUploader, IWCompListbox, IWDBStdCtrls,
  IWCompEdit, IWCompMemo, IWCompCheckbox, IWCompLabel, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWCompExtCtrls,
  Vcl.Imaging.pngimage, Data.DB, MemDS, DBAccess, Uni, ServerController, uMenu,
  UserSessionUnit, VirtualTable, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  IWCompButton;

type
  TfrJobService = class(TIWAppForm)
    btBack: TIWImage;
    btSave: TIWImage;
    lbJobService: TIWLabel;
    lbNameUser: TIWLabel;
    lbCustomer: TIWLabel;
    lbDate: TIWLabel;
    lbTime: TIWLabel;
    cbNotAlert: TIWCheckBox;
    cbUrgent: TIWCheckBox;
    lbHrCost: TIWLabel;
    lbInformant: TIWLabel;
    lbProblem: TIWLabel;
    lbDetail: TIWLabel;
    mmDetail: TIWMemo;
    lbtimeShow: TIWLabel;
    edProblem: TIWEdit;
    edInformant: TIWEdit;
    lbJobType: TIWLabel;
    lbJobStatus: TIWLabel;
    lbJobEmployee: TIWLabel;
    lbDueDate: TIWLabel;
    lbDueTime: TIWLabel;
    slJobType: TIWDBLookupComboBox;
    slJobEmp: TIWDBLookupComboBox;
    lbImgSelect: TIWLabel;
    imgSl1: TIWImage;
    imgSl2: TIWImage;
    imgSl3: TIWImage;
    slCustomer: TIWDBLookupComboBox;
    imgSl4: TIWImage;
    imgSl5: TIWImage;
    imgSl6: TIWImage;
    imgSl7: TIWImage;
    imgSl8: TIWImage;
    btUploadImg1: TIWFileUploader;
    btUploadImg2: TIWFileUploader;
    btUploadImg3: TIWFileUploader;
    btUploadImg4: TIWFileUploader;
    btUploadImg5: TIWFileUploader;
    btUploadImg6: TIWFileUploader;
    btUploadImg7: TIWFileUploader;
    btUploadImg8: TIWFileUploader;
    edHrCost: TIWEdit;
    lbtest: TIWLabel;
    qCustomer: TUniQuery;
    dCustomer: TUniDataSource;
    vCustomer: TVirtualTable;
    dvCustomer: TUniDataSource;
    qJobType: TUniQuery;
    dJobType: TUniDataSource;
    dvJobtype: TUniDataSource;
    vJobType: TVirtualTable;
    qJobStatus: TUniQuery;
    dJobStatus: TUniDataSource;
    vJobStatus: TVirtualTable;
    dvJobStatus: TUniDataSource;
    qJobEmp: TUniQuery;
    dJobEmp: TUniDataSource;
    vJobEmp: TVirtualTable;
    dvJobEmp: TUniDataSource;
    edDueTime: TIWEdit;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    qSaveJobService: TUniQuery;
    qCheckEmp: TUniQuery;
    qCheckCustomer: TUniQuery;
    qSeverdate: TUniQuery;
    qJobStatusId: TUniQuery;
    qCustomerid: TUniQuery;
    qEmployeeID: TUniQuery;
    qJobTypeId: TUniQuery;
    slJobStatus: TIWComboBox;
    btClearImg1: TIWButton;
    btClearImg2: TIWButton;
    btClearImg3: TIWButton;
    btClearImg7: TIWButton;
    btClearImg6: TIWButton;
    btClearImg5: TIWButton;
    btClearImg4: TIWButton;
    btClearImg8: TIWButton;
    dslDueDate: TTIWDateSelector;
    dslDateSelect: TTIWDateSelector;
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormShow(Sender: TObject);
    procedure btUploadImg1AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg1AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg2AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg2AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg3AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg4AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg5AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg6AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg7AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg8AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImg8AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg7AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg6AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg5AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg4AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImg3AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure MyConfirmCallback(EventParams: TStringList);
    procedure btBackClick(Sender: TObject);
    procedure btSaveAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg1AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg2AsyncClick(Sender: TObject; EventParams: TStringList);
//    procedure btClearImg2Click(Sender: TObject);
    procedure btClearImg3AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg4AsyncClick(Sender: TObject; EventParams: TStringList);
//    procedure btClearImg5Click(Sender: TObject);
    procedure btClearImg5AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg6AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg7AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg8AsyncClick(Sender: TObject; EventParams: TStringList);
//    procedure btClearImg1Click(Sender: TObject);
    procedure imgSl7Click(Sender: TObject);
  public
    havepic1:Boolean;
    havepic2:Boolean;
    havepic3:Boolean;
    havepic4:Boolean;
    havepic5:Boolean;
    havepic6:Boolean;
    havepic7:Boolean;
    havepic8:Boolean;
   Procedure SaveJobService;
  end;

implementation

{$R *.dfm}

uses uUtilitys;

// img selecter and refresh
//img1
procedure TfrJobService.btUploadImg1AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg1.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl1.Picture.LoadFromStream(MS) ;
    havepic1:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg1AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin
  imgSl1.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg1AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic1 := False;
  imgSl1.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl1.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg2AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic2 := False;
  imgSl2.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl2.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg3AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic3 := False;
  imgSl3.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl3.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg4AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
havepic4 := False;
  imgSl4.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl4.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg5AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
havepic5 := False;
  imgSl5.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl5.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg6AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
havepic6 := False;
  imgSl6.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl6.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg7AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
havepic7 := False;
  imgSl7.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl7.RefreshAsyncRender;
end;

procedure TfrJobService.btClearImg8AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
havepic8 := False;
  imgSl8.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl8.RefreshAsyncRender;
end;

//end img1

//img2
procedure TfrJobService.btUploadImg2AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg2.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl2.Picture.LoadFromStream(MS) ;
    havepic2:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg2AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgSl2.RefreshAsyncRender;

end;
//end img2

//img3
procedure TfrJobService.btUploadImg3AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg3.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl3.Picture.LoadFromStream(MS) ;
    havepic3:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg3AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgSl3.RefreshAsyncRender;

end;
//end img3

//img4
procedure TfrJobService.btUploadImg4AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg4.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl4.Picture.LoadFromStream(MS) ;
    havepic4:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg4AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgSl4.RefreshAsyncRender;

end;
//end img4

//img5
procedure TfrJobService.btUploadImg5AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg5.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl5.Picture.LoadFromStream(MS) ;
    havepic5:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg5AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgSl5.RefreshAsyncRender;

end;
//end img5

//img6
procedure TfrJobService.btUploadImg6AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg6.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgsl6.Picture.LoadFromStream(MS) ;
    havepic6:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg6AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgsl6.RefreshAsyncRender;

end;
//end img6

//img7
procedure TfrJobService.btUploadImg7AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg7.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl7.Picture.LoadFromStream(MS) ;
    havepic7:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg7AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgSl7.RefreshAsyncRender;

end;
//end img7

//img8
procedure TfrJobService.btUploadImg8AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImg8.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl8.Picture.LoadFromStream(MS) ;
    havepic8:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobService.btUploadImg8AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
    var id:String;
begin

    imgSl8.RefreshAsyncRender;

end;
procedure TfrJobService.imgSl7Click(Sender: TObject);
begin

end;

//end img8

procedure TfrJobService.btBackClick(Sender: TObject);
begin
  Release;
end;

procedure TfrJobService.IWAppFormCreate(Sender: TObject);
begin
  LayoutMgr.Enabled := false;
  if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;

  lbNameUser.Caption:='('+UserSession.ActiveEmployeeCode+')';

  edHrCost.Text:='00:00';

  qCheckCustomer.Close;
  qCheckCustomer.ParamByName('id').AsInteger:=UserSession.ActiveCustomerID;
  qCheckCustomer.Open;


  qCheckEmp.Close;
  qCheckEmp.ParamByName('id').AsInteger:=UserSession.ActiveEmployeeID;
  qCheckEmp.Open;



  if ( UserSession.ActiveCustomerID > 0 ) then
    begin
      lbNameUser.Caption        :=  'รับแจ้งปัญหา'+' '+'('+qCheckCustomer.FieldByName('Code').Asstring+')' ;
      dslDateSelect.Enabled     := False ;
      slCustomer.Visible        := False ;
      dslDateSelect.Visible     := False ;
      dslDueDate.Visible        := False ;
      cbNotAlert.Visible        := False ;
    end
  else if ( UserSession.ActiveEmployeeID > 0 )then
     begin
      lbNameUser.Caption        :=  'รับแจ้งปัญหา'+' '+'('+qCheckEmp.FieldByName('Code').Asstring+')' ;
      dslDateSelect.Enabled     := true ;
      slCustomer.Visible        := true ;
      dslDateSelect.Visible     := true ;
      dslDueDate.Visible        := true ;
      cbNotAlert.Visible        := true ;
     end;

  //unigui
  qSeverdate.Close ;
  qSeverDate.Open  ;
end;

procedure TfrJobService.IWAppFormShow(Sender: TObject);
var checkdate,checkmount,checkyear:integer;
    indexJS : Integer;
    StrJS   : String;
begin
  //stSelectCustomer
  vCustomer.Close;
  vCustomer.Open;
  vCustomer.Append;
  vCustomer.Edit;
  vCustomer.FieldByName('idCustomer').AsInteger:=0;

  qCustomer.Close;
  qCustomer.Open;

  slCustomer.RefreshItems;

  //enSelectCustomer

  //stTimeselect

  lbtimeShow.Caption:=FormatDateTime('hh:nn',(Now));

  imgSl1.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl2.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl3.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl4.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl5.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl6.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl7.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl8.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');

  dslDateSelect.Date := qSeverDate.FieldByName('ServerDate').AsDateTime;
  //enTimeSelect

  //stJobType
  vJobType.Close;
  vJobType.Open;
  vJobType.Append;
  vJobType.Edit;
  vJobType.FieldByName('idJobType').AsInteger := 0;

  qJobType.Close;
  qJobType.Open;

  slJobType.RefreshItems;
  //enJobType

  //stJobStatus
  (*
  vJobStatus.Close;
  vJobStatus.Open;
  vJobStatus.Append;
  vJobStatus.Edit;
  vJobStatus.FieldByName('idJobStatus').AsInteger := 0;
  *)
  slJobStatus.Clear;
  qJobStatus.Close;
  qJobStatus.Open;
  qJobStatus.First;
  while (Not qJobStatus.Eof) do
    begin
      StrJS :=  Trim(qJobStatus.FieldByName('Description').AsString);
      slJobStatus.Items.Append(StrJS);
      qJobStatus.Next;
    end;
  slJobStatus.RefreshItems;
  slJobStatus.ItemIndex := 0;
  //enJobStatus

  //stJobEmp
  vJobEmp.Close;
  vJobEmp.Open;
  vJobEmp.Append;
  vJobEmp.Edit;
  vJobEmp.FieldByName('idJobEmp').AsInteger:=0;

  qJobEmp.Close;
  qJobEmp.Open;

  slJobEmp.RefreshItems;
  //enJobStatus


  //stTimeDeadLine
  dslDueDate.Date := qSeverDate.FieldByName('ServerDueDate').AsDateTime;
  //enTimeDeadLine

  edDueTime.text := '10:00';

  havepic1 := False;
  havepic2 := False;
  havepic3 := False;
  havepic4 := False;
  havepic5 := False;
  havepic6 := False;
  havepic7 := False;
  havepic8 := False;

  WebApplication.RegisterCallBack('MyConfirmCallback', MyConfirmCallback);
end;

procedure tfrjobservice.MyConfirmCallback(EventParams: TStringList);
var
  Response: Boolean;
begin
  Response := SameText(EventParams.Values['RetValue'], 'True');
  if Response then
    begin
      SaveJobService;
    end;
end;

procedure TfrJobService.btSaveAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if (Trim(edProblem.Text)='') then
    Begin
      WebApplication.ShowMessage('กรุณาป้อน หัวข้อปัญหา') ;
    End
  else
  if (Trim(edInformant.Text)='') then
    Begin
      WebApplication.ShowMessage('กรุณาป้อน ผู้แจ้ง') ;
    End
  else
  if (dslDueDate.Date < Trunc(Now)) then
    Begin
      WebApplication.ShowMessage('ใส่วันที่ไม่ถูกต้อง') ;
    End
  else
  if (Not qCheckEmp.IsEmpty) and (slcustomer.ItemIndex<=0) then
    begin
      WebApplication.ShowMessage('กรุณาเลือกลูกค้า') ;
    end
  else
  if (Not qCheckEmp.IsEmpty) and (slJobEmp.ItemIndex<=0) then
    begin
      WebApplication.ShowMessage('กรุณาเลือกพนักงานรับผิดชอบ') ;
    end
  else
    WebApplication.ShowConfirm('ยืนยัน','MyConfirmCallback', Title,'Yes', 'No');
end;

Procedure tfrjobservice.saveJobService;
Var SaveOk : Boolean ;
    Pic1    : TMemoryStream ;
    Pic2    : TMemoryStream ;
    Pic3    : TMemoryStream ;
    Pic4    : TMemoryStream ;
    Pic5    : TMemoryStream ;
    Pic6    : TMemoryStream ;
    Pic7    : TMemoryStream ;
    Pic8    : TMemoryStream ;
    URL_Customer        : string;
    URL_SBC             : string;
    JobTime             : String;
    JobDueDate          : String;
    RandomKey           : String;
    MessageToCusTomer   : String;
    MessageToSBC        : String;
    MessageToEmployee   : String;
    myJobTime : TDateTime;
begin
  qSaveJobService.Close;
  saveok:=False;
  UserSession.DB.StartTransaction;
  Try
    //first Query for save
    RandomKey:=MakeRandomString(88,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');

    qSaveJobService.ParamByName('Jobdate').AsDateTime := dslDateSelect.Date;
    qSaveJobService.ParamByName('JobTime').AsString   := formatdatetime('HH:MM', StrToTime(lbtimeShow.caption)) ;;

    qJobStatusId.Close;
    qJobStatusId.ParamByName('Description').AsString :=  Trim(slJobStatus.Text); //vJobStatus.FieldByName('Idjobstatus').AsInteger;
    qJobStatusId.open;

    qCustomerId.close;
    qCustomerId.ParamByName('id').AsInteger  :=  vCustomer.FieldByName('Idcustomer').AsInteger;
    qCustomerId.Open;

    qEmployeeID.Close;
    qEmployeeID.ParamByName('id').AsInteger  := vJobEmp.FieldByName('idjobemp').AsInteger;
    qEmployeeID.Open;

    if not qCheckCustomer.IsEmpty then
      begin

        qSaveJobService.ParamByName('Customer').AsInteger    := usersession.ActiveCustomerID ;
        qSaveJobService.ParamByName('JobStatus').AsInteger   := qJobStatus.FieldByName('Id').AsInteger ;//vJobStatus.FieldByName('IdJobStatus').AsInteger ;
        qSaveJobService.ParamByName('JobType').AsInteger     := vJobType.FieldByName('IdJobType').AsInteger ;
        qSaveJobService.ParamByName('JobEmployee').isnull ;
        qSaveJobService.ParamByName('JobDueDate').AsDateTime := qSeverdate.FieldByName('ServerDueDate').AsDateTime;
        qSaveJobService.ParamByName('JobDueTime').AsString   := '10:00' ;
        qSaveJobService.ParamByName('HrCost').AsFloat        := 0.5 ;
        qSaveJobService.ParamByName('Urgent').AsString       := 'N' ;

      end
    else if not qCheckEmp.IsEmpty then
      begin

        qSaveJobService.ParamByName('Customer').AsInteger    := vCustomer.FieldByName('IdCustomer').AsInteger;
        qSaveJobService.ParamByName('JobStatus').AsInteger   := qJobStatus.FieldByName('Id').AsInteger ;//vJobStatus.FieldByName('IdJobStatus').AsInteger;
        qSaveJobService.ParamByName('JobType').AsInteger     := vJobType.FieldByName('IdJobType').AsInteger;
        qSaveJobService.ParamByName('JobEmployee').AsInteger := vJobEmp.FieldByName('IdJobEmp').AsInteger;
        qSaveJobService.ParamByName('JobDueDate').AsDateTime := dslDueDate.Date ;
        qSaveJobService.ParamByName('JobDueTime').AsString   := formatdatetime('HH:MM',StrToTime(edDueTime.Text)) ;
        if (edHrCost.Text = '') then
          qSaveJobService.ParamByName('HrCost').AsFloat := 0.5
        else
          qSaveJobService.ParamByName('HrCost').AsFloat := StrToFloat(formatdatetime('H.MM',(edHrCost.AsDateTime)));
        if (cbUrgent.Checked = True) then
          qSaveJobService.ParamByName('Urgent').AsString := 'Y'
        else
          qSaveJobService.ParamByName('Urgent').AsString := 'N' ;

      end;


    //      Call Other Query

    qSaveJobService.ParamByName('CusAttn').AsString   := Trim(edInformant.Text) ;
    qSaveJobService.ParamByName('JobTitle').AsString  := Trim(edproblem.Text) ;
    qSaveJobService.ParamByName('JobDetail').AsString := Trim(mmDetail.Text) ;
    qSaveJobService.ParamByName('JobClose').AsString  := qJobStatusID.FieldByName('Finished').AsString ;
    qSaveJobService.ParamByName('RandomKey').AsString := RandomKey ;


    //  img

    Pic1 := TMemoryStream.Create ;
    Pic1.Position := 0 ;
    imgSl1.Picture.SaveToStream(pic1);
    Pic1.Position := 0 ;


    Pic2 := TMemoryStream.Create ;
    Pic2.Position := 0 ;
    imgSl2.Picture.SaveToStream(pic2);
    Pic2.Position := 0 ;

    Pic3 := TMemoryStream.Create ;
    Pic3.Position := 0 ;
    imgSl3.Picture.SaveToStream(pic3);
    Pic3.Position := 0 ;

    Pic4 := TMemoryStream.Create ;
    Pic4.Position := 0 ;
    imgSl4.Picture.SaveToStream(pic4);
    Pic4.Position := 0 ;

    Pic5 := TMemoryStream.Create ;
    Pic5.Position := 0 ;
    imgSl5.Picture.SaveToStream(pic5);
    Pic5.Position := 0 ;

    Pic6 := TMemoryStream.Create ;
    Pic6.Position := 0 ;
    imgSl6.Picture.SaveToStream(pic6);
    Pic6.Position := 0 ;

    Pic7 := TMemoryStream.Create ;
    Pic7.Position := 0 ;
    imgSl7.Picture.SaveToStream(pic7);
    Pic7.Position := 0 ;

    Pic8 := TMemoryStream.Create ;
    Pic8.Position := 0 ;
    imgSl8.Picture.SaveToStream(pic8);
    Pic8.Position := 0 ;

    if not havepic1 then
    qSaveJobService.ParamByName('Image1').IsNull
    else
    qSaveJobService.ParamByName('Image1').LoadFromStream(Pic1,ftBlob) ;

    if not havepic2 then
    qSaveJobService.ParamByName('Image2').IsNull
    else
    qSaveJobService.ParamByName('Image2').LoadFromStream(Pic2,ftBlob) ;

    if not havepic3 then
    qSaveJobService.ParamByName('Image3').IsNull
    else
    qSaveJobService.ParamByName('Image3').LoadFromStream(Pic3,ftBlob) ;

    if not havepic4 then
    qSaveJobService.ParamByName('Image4').IsNull
    else
    qSaveJobService.ParamByName('Image4').LoadFromStream(Pic4,ftBlob) ;

    if not havepic5 then
    qSaveJobService.ParamByName('Image5').IsNull
    else
    qSaveJobService.ParamByName('Image5').LoadFromStream(Pic5,ftBlob) ;

    if not havepic6 then
    qSaveJobService.ParamByName('Image6').IsNull
    else
    qSaveJobService.ParamByName('Image6').LoadFromStream(Pic6,ftBlob) ;

    if not havepic7 then
    qSaveJobService.ParamByName('Image7').IsNull
    else
    qSaveJobService.ParamByName('Image7').LoadFromStream(Pic7,ftBlob) ;

    if not havepic8 then
    qSaveJobService.ParamByName('Image8').IsNull
    else
    qSaveJobService.ParamByName('Image8').LoadFromStream(Pic8,ftBlob) ;


    pic1.Free ;
    pic2.Free ;
    pic3.Free ;
    pic4.Free ;
    pic5.Free ;
    pic6.Free ;
    pic7.Free ;
    pic8.Free ;

    //  end loop img

    qSaveJobService.ExecSQL;
    JobTime := qSaveJobService.ParamByName('JobTime').AsString;

    UserSession.DB.Commit;
    SaveOK := True;
  Except on E : Exception do
    begin
      UserSession.db.Rollback;
      SaveOk := False;
      WebApplication.ShowMessage('จัดเก็บข้อมูลผิดพลาด : '+E.Message);
    end;
  End;
  if (SaveOK) then
    begin
        //Line Notify
      if (Not qCheckCustomer.IsEmpty) then
        begin
          //Customer แจ้ง
          qSaveJobService.Close;
          qSaveJobService.SQL.Clear;
          qSaveJobService.SQL.Append ('Select * From JobService ');
          qSaveJobService.SQL.Append ('where RandomKey ='''+RandomKey+'''');
//          qSaveJobService.SQL.Append (' and JobTime ='''+JobTime+'''');
//          qSaveJobService.SQL.Append (' and Customer ='+Inttostr(UserSession.ActiveCustomerID));
//          qSaveJobService.SQL.Append (' and JobTitle =N'''+ Trim(edProblem.Text)+'''');
          qSaveJobService.Open;

          //To Customer
          MessageToCusTomer := 'เลขรับเรื่อง'+
                              IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                              'วันที่'+DateTimeToStr(dslDateSelect.Date)+'เวลา'+JobTime+
                              ' '+edProblem.Text+' (รอพิจารณา) '+
                              ' '+ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                              qSaveJobService.FieldByName('RandomKey').AsString);

//          UserSession.SendLine(Trim(qCheckCustomer.FieldByName('LineGroupToken').AsString),MessageToCusTomer);

          //To SBC
          MessageToSBC := qCheckCustomer.FieldByName('Code').Asstring+
                          ' #'+IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                          ' '+DateTimeToStr(dslDateSelect.Date)+' '+JobTime+' '+edProblem.Text+
                          ' '+ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                          qSaveJobService.FieldByName('RandomKey').AsString);
//          UserSession.SendLine('WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn',MessageToSBC);
        end
      else if (Not qCheckEmp.IsEmpty) then
        begin
          //¾¹§.á¨é§
          qSaveJobService.Close;
          qSaveJobService.SQL.Clear;
          qSaveJobService.SQL.Append ('Select * From JobService ');
          qSaveJobService.SQL.Append ('where RandomKey ='''+RandomKey+'''');
//          qSaveJobService.SQL.Append (' and JobTime ='''+JobTime+'''');
//          qSaveJobService.SQL.Append (' and Customer ='+Inttostr(qCustomerID.FieldByName('Id').AsInteger));
//          qSaveJobService.SQL.Append (' and JobTitle =N'''+ Trim(edTitle.Text)+'''');
          qSaveJobService.Open;

          if (dslDueDate.Text = '') or (dslDueDate.Text = '30/12/1899') then
            begin
              JobDueDate := '';
            end
          else
            begin
              JobDueDate := '  กำหนดส่ง '+
              DateTimeToStr(qSaveJobService.FieldByName('JobDueDate').AsDateTime);
            end;


          if (cbNotAlert.Checked = True) then
            begin
              //To SBC
              MessageToSBC := qCustomerID.FieldByName('Code').AsString+
                  ' #'+IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                  ' '+DateTimeToStr(dslDateSelect.Date)+' '+JobTime+' '+edProblem.Text+JobDueDate+
                  ', '+qSaveJobService.FieldByName('JobDueTime').AsString+' '+
                  '('+slJobEmp.Text+' รับผิดชอบ)'+
                  ' '+ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                  qSaveJobService.FieldByName('RandomKey').AsString);
              //For Cop
//              UserSession.SendLine('WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn',MessageToSBC);
              //ForTest
              //UserSession.SendLine('IQOQz5sAjZT56RUpg6TiYOMzmiXwM4v5af3qvVE7a2f',MessageToSBC);
              if (qEmployeeID.FieldByName('LineToken').AsString <> '') or
                 (qEmployeeID.FieldByName('LineToken').Value <> '') then
                begin
                  //To Employee
                  MessageToEmployee := qCustomerID.FieldByName('Code').AsString+
                      ' #'+IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                      ' '+DateTimeToStr(dslDateSelect.Date)+' '+JobTime+' '+edProblem.Text+JobDueDate+
                      ', '+qSaveJobService.FieldByName('JobDueTime').AsString+
                      ' ('+qCheckEmp.FieldByName('Code').Asstring+' '+
                      '->'+slJobEmp.Text+'รับผิดชอบ)'+
                      ' '+
                      ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                      qSaveJobService.FieldByName('RandomKey').AsString);

//                  UserSession.SendLine(Trim(qEmployeeID.FieldByName('LineToken').AsString),MessageToEmployee);
                end;
            end
          else
            begin
              //To Customer
              MessageToCusTomer := 'เลขรับเรื่อง'+
                                  IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                                  ' วันที่ '+DateTimeToStr(dslDateSelect.Date)+' '+JobTime+
                                  ' '+edProblem.Text+' '+slJobStatus.Text+' '+
                                  ' '+ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                                  qSaveJobService.FieldByName('RandomKey').AsString);
//              UserSession.SendLine(Trim(qCustomerID.FieldByName('LineGroupToken').AsString),MessageToCusTomer);

              //To SBC
              MessageToSBC := qCustomerID.FieldByName('Code').AsString+
                  ' #'+IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                  ' '+DateTimeToStr(dslDateSelect.Date)+' '+JobTime+' '+edProblem.Text+JobDueDate+
                  ', '+qSaveJobService.FieldByName('JobDueTime').AsString+' '+
                  '('+slJobEmp.Text+' รับผิดชอบ)'+
                  ' '+ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                  qSaveJobService.FieldByName('RandomKey').AsString);
              //For Cop
//              UserSession.SendLine('WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn',MessageToSBC);
              //ForTest
              //UserSession.SendLine('IQOQz5sAjZT56RUpg6TiYOMzmiXwM4v5af3qvVE7a2f',MessageToSBC);

              if (qEmployeeID.FieldByName('LineToken').AsString <> '') or
                 (qEmployeeID.FieldByName('LineToken').Value <> '') then
                begin
                  //To Employee
                  MessageToEmployee := qCustomerID.FieldByName('Code').AsString+
                      ' #'+IntToStr(qSaveJobService.FieldByName('Id').AsInteger)+
                      ' '+DateTimeToStr(dslDateSelect.Date)+' '+JobTime+' '+edProblem.Text+JobDueDate+
                      ', '+qSaveJobService.FieldByName('JobDueTime').AsString+
                      ' ('+qCheckEmp.FieldByName('Code').Asstring+' '+
                      '->'+slJobEmp.Text+' รับผิดชอบ)'+
                      ' '+ShortURL('https://job.sbcservice.com:8888'+'/m?JobId='+
                      qSaveJobService.FieldByName('RandomKey').AsString);
//                  UserSession.SendLine(Trim(qEmployeeID.FieldByName('LineToken').AsString),MessageToEmployee);
                end;
            end;
        end;
       //End Line Notify

      btBackClick(Self) ;
    end;
end;

end.
