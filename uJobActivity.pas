unit uJobActivity;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompFileUploader, IWCompMemo, IWCompEdit, IWCompCheckbox, IWControl,
  IWTMSCal, IWCompListbox, IWDBStdCtrls, IWCompLabel, IWCompExtCtrls,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWCompButton,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, Data.DB, DBAccess, Uni, MemDS,
  IWCompGrids, IWDBGrids, Vcl.Imaging.pngimage, IWCompText;

type
  TfrJobActivity = class(TIWAppForm)
    btPause: TIWButton;
    btBack: TIWImage;
    lbShowDue: TIWLabel;
    lbShowDueTime: TIWLabel;
    lbShowId: TIWLabel;
    lbCustomer: TIWLabel;
    lbDate: TIWLabel;
    edDate: TTIWDateSelector;
    cbUrgent: TIWCheckBox;
    lbHrCost: TIWLabel;
    edHrCost: TIWEdit;
    btSaveUrgent: TIWButton;
    lbProblem: TIWLabel;
    edTitle: TIWEdit;
    edInformant: TIWEdit;
    lbInformant: TIWLabel;
    lbDetail: TIWLabel;
    mmDetail: TIWMemo;
    btSaveDetail: TIWButton;
    lbImage: TIWLabel;
    imgSl1: TIWImage;
    btUploadImage1: TIWFileUploader;
    imgSl5: TIWImage;
    btUploadImage5: TIWFileUploader;
    btSavePicture: TIWButton;
    imgSl2: TIWImage;
    btUploadImage2: TIWFileUploader;
    imgSl6: TIWImage;
    btUploadImage6: TIWFileUploader;
    imgSl3: TIWImage;
    btUploadImage3: TIWFileUploader;
    imgSl7: TIWImage;
    btUploadImage7: TIWFileUploader;
    imgSl4: TIWImage;
    btUploadImage4: TIWFileUploader;
    imgSl8: TIWImage;
    btUploadImage8: TIWFileUploader;
    lbJobType: TIWLabel;
    lbJobStatus: TIWLabel;
    lbJobEmployee: TIWLabel;
    lbDueDate: TIWLabel;
    edDueDate: TTIWDateSelector;
    lbDueTime: TIWLabel;
    edDueTime: TIWEdit;
    btSaveDuedate: TIWButton;
    lbComment: TIWLabel;
    mmComment: TIWMemo;
    cbInternal: TIWCheckBox;
    btSaveComment: TIWButton;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    slJobType: TIWComboBox;
    slJobstatus: TIWComboBox;
    slJobEmployee: TIWComboBox;
    qJobTypeID: TUniQuery;
    qJobStatusID: TUniQuery;
    qCheckCustomer: TUniQuery;
    qCheckEmployee: TUniQuery;
    qEmployeeID: TUniQuery;
    qCustomerID: TUniQuery;
    qSelectTokenSBC: TUniQuery;
    qUseTime: TUniQuery;
    qSelectPause: TUniQuery;
    qJobService: TUniQuery;
    dJobService: TUniDataSource;
    qCustomer: TUniQuery;
    qJobStatus: TUniQuery;
    qJobType: TUniQuery;
    qEmployee: TUniQuery;
    qSaveComment: TUniQuery;
    qServerDate: TUniQuery;
    IWLabel1: TIWLabel;
    slCustomer: TIWComboBox;
    qSelectComment: TUniQuery;
    dSelectComment: TUniDataSource;
    DisplayGridJobActivity: TIWDBGrid;
    qUpdateUrgent: TUniQuery;
    qUpdateJobTSED: TUniQuery;
    qUpdateDetail: TUniQuery;
    qUpdateImg: TUniQuery;
    btClearImg1: TIWButton;
    btClearImg2: TIWButton;
    btClearImg3: TIWButton;
    btClearImg4: TIWButton;
    btClearImg5: TIWButton;
    btClearImg6: TIWButton;
    btClearImg7: TIWButton;
    btClearImg8: TIWButton;
    qInsertActivity: TUniQuery;
    IWButton1: TIWButton;
    qSelectAllJobService: TUniQuery;
    procedure btBackClick(Sender: TObject);
    procedure IWAppFormShow(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    Procedure CreatComment;
    procedure btClearImg1AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg2AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg3AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg4AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg5AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg6AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg7AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btClearImg8AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btUploadImage1AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage2AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage3AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage4AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage5AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage6AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage7AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage8AsyncUploadCompleted(Sender: TObject; var DestPath,
      FileName: string; var SaveFile, Overwrite: Boolean);
    procedure btUploadImage1AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage2AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage3AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage4AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage5AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage6AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage7AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btUploadImage8AsyncUploadSuccess(Sender: TObject;
      EventParams: TStringList);
    procedure btSaveUrgentAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btSaveDuedateAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure btSavePictureAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure btSaveDetailAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btSaveCommentAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure btPauseAsyncClick(Sender: TObject; EventParams: TStringList);


  public
    Hour : String ;
    Day  : String ;
    Pause: String ;
    MessageToCusTomer   : String ;
    MessageToSBC        : String ;
    MessageToEmployee   : String ;
    havepic1:Boolean;
    havepic2:Boolean;
    havepic3:Boolean;
    havepic4:Boolean;
    havepic5:Boolean;
    havepic6:Boolean;
    havepic7:Boolean;
    havepic8:Boolean;
    keepemp:string;
    checkemp:boolean;
    keepjoptype:string;
    keepobstatus:string;
    keepduedate:string;
    keepduetime:string;
    saveis:string;
    textRemark:string;
    con:boolean;
    linettest:string;
    TextPause:string;
    MessageCap:string;


    procedure forrefresh;
    procedure UpdateUrgentAndHrCost;
    procedure UpdateDetail;
    procedure UpdateImg;
    procedure UpdatePause;
    Procedure UpdatejobTSED;
    Procedure InsertComment;
    procedure MypromptCallback(EventParams: TstringList);
    procedure MyConfirmCallback(EventParams: TStringList);

  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit, uUtilitys;
      var js,id:string;
      

procedure TfrJobActivity.forrefresh;
    begin
       btPause.Refresh;
       btPause.RefreshAsyncRender;
       CreatComment;
       DisplayGridJobActivity.RefreshAsyncRender;
      JS:= 'SubmitClick("'+ID+'","",false);';
      WebApplication.CallBackResponse.AddJavaScriptToExecute('<![CDATA['+JS+']]>');
    end;



procedure TfrJobActivity.MypromptCallback(EventParams: TstringList);
 var response:boolean;
      inputvalue:string;
      selectbutton:string;
      msg:string;
      msgType:Tiwnotifytype;
 begin

  Response := SameText(EventParams.Values['RetValue'], 'True');
  inputvalue:=EventParams.Values['InputStr'];
    if not response then
      begin
      WebApplication.ShowNotification('ยกเลิกการบันทึก หยุดงาน  ',ntError);
      end
    else  if (EventParams.Values['InputStr'].IsEmpty)  then
       begin
        WebApplication.ShowPrompt(' หมายเหตุหยุดการทำงาน :  ',  'MyPromptCallback', 'กรุณาป้อนหมายเหตุหยุดการทำงาน', '');
       end
    else if not (EventParams.Values['InputStr'].IsEmpty) then
      begin
        textRemark:=inputvalue;
        UpdatePause;
      end
    end;


procedure TfrJobActivity.InsertComment;
 var saveok:boolean;
begin
      qServerDate.Close;
      qServerDate.Open;
      MessageCap:='  '+btSaveComment.Caption+' ';
      saveok:=false;
      UserSession.DB.StartTransaction;
      try
        qSaveComment.Close;
        qSaveComment.ParamByName('jobservice').AsInteger:=UserSession.jobid;
        qSaveComment.ParamByName('JobActType').AsString   :=  'M' ;//M= Message Comment
        qSaveComment.ParamByName('JobActDate').AsDatetime := qServerDate.FieldByName('ServerDate').AsDateTime ;
        qSaveComment.ParamByName('JobActTime').AsString   := formatdatetime('HH:MM',(qServerDate.FieldByName('ServerDateTime').AsDateTime)) ;
        qSaveComment.ParamByName('JobComment').AsString   := Trim(mmComment.Text) ;
        if (Not qCheckCustomer.IsEmpty) then
        begin
          qSaveComment.ParamByName('JobActBy').AsString   := qCheckCustomer.FieldByName('Code').AsString;
        end
        else if (Not qCheckEmployee.IsEmpty) then
        begin
          qSaveComment.ParamByName('JobActBy').AsString   := qCheckEmployee.FieldByName('Code').AsString ;
        end;
        if (cbInternal.Checked = True) then
        begin
          qSaveComment.ParamByName('Internal').AsString   := 'Y'   ;
        end
        else
        begin
          qSaveComment.ParamByName('Internal').AsString   := 'N';
        end;
          qSaveComment.ExecSQL;
          UserSession.Db.Commit;
          saveok:=true;
        Except on E: Exception do
        begin
          saveok:=false;
          UserSession.DB.Rollback;
          WebApplication.ShowMessage(' '+MessageCap+'   จัดเก็บข้อมูลผิดพลาด :' +E.Message);
        end;

      end;
      if (SaveOk) then
    begin
      qSelectAllJobService.Close;
      qSelectAllJobService.ParamByName('id').AsInteger:=UserSession.jobid;
      qSelectAllJobService.Open;

      if (Not qCheckCustomer.IsEmpty) then
        begin
          //To SBC
          MessageToSBC := qCheckCustomer.FieldByName('Code').Asstring+
                          ' #'+IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                          ' '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                          ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                          ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+
                          ' '+qCheckCustomer.FieldByName('Code').Asstring+' '+
                          'แสดงความคิดเห็น : '+mmComment.Text+
                          ' '+
                          ShortURL(usersession.MainURL+'/m?JobId='+
                          qSelectAllJobService.FieldByName('RandomKey').AsString) ;
          UserSession.sendline(
//          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
          linettest
          ,MessageToSBC);
        end
      else if (Not qCheckEmployee.IsEmpty) then
        begin
          qSelectTokenSBC.Close ;
          qSelectTokenSBC.Open  ;

          qCustomerID.Close ;
          qCustomerID.ParamByName('Id').AsInteger := qSelectAllJobService.FieldByName('Customer').AsInteger  ;
          qCustomerID.Open ;

          if (cbInternal.Checked = True) then
            begin
              //To SBC
              MessageToSBC := qCustomerID.FieldByName('Code').Asstring+
                              ' #'+IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                              ' '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                              ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                              ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+
                              ' '+qCheckEmployee.FieldByName('Code').Asstring+' '+
                              'แสดงความคิดเห็น : '+mmComment.Text+
                              ' '+
                              ShortURL(usersession.MainURL+'/m?JobId='+
                              qSelectAllJobService.FieldByName('RandomKey').AsString);
//              UserSession.sendline(Trim(qSelectTokenSBC.FieldByName('LineGroupToken').AsString),MessageToSBC);
            UserSession.sendline(
//          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
          linettest
          ,MessageToSBC);
            end
          else
            begin
              //To Customer
              MessageToCusTomer := 'เลขรับเรื่อง #'+
                                  IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                                  '  วันที่ '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                                  ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                                  ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+' ('+slJobStatus.Text+') '+
                                  ' SBC   '+
//                                  qCheckEmployee.FieldByName('Code').Asstring+' '+
                                  'แสดงความคิดเห็น : '+mmComment.Text+
                                  ' '+
                                  ShortURL(usersession.MainURL+'/m?JobId='+
                                  qSelectAllJobService.FieldByName('RandomKey').AsString);

//              UserSession.sendline(Trim(qCustomerID.FieldByName('LineGroupToken').AsString),MessageToCusTomer);
            UserSession.sendline(
//          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
          linettest
          ,MessageToCusTomer);
            end;
        end;
            WebApplication.ShowNotification('บันทึกสำเร็จ'+MessageCap,ntSuccess);
            mmComment.Clear;
            mmComment.SetFocus;
            forrefresh;
    end;
end;

procedure TfrJobActivity.UpdatePause;
var saveok:boolean;
   begin

    MessageCap:='  '+btPause.Caption+' ';
    qServerDate.Close;
    qServerDate.Open;
    saveok:=false;
    UserSession.DB.StartTransaction;

   try
        qInsertActivity.Close;
        qInsertActivity.ParamByName('Jobservice').AsInteger:=UserSession.jobid;

      if (btPause.Caption = 'หยุดทำงาน') then
        begin
            Pause:='P';
//            WebApplication.ShowMessage('This Your  Message Is  :'+textRemark);
        end
      else
        begin
            textRemark:=btPause.Caption;
//            WebApplication.ShowMessage(Pause);            //Pause Is G
            Pause:='G';
        end;

      qInsertActivity.ParamByName('JobActType').AsString   :=  Pause ;//P=Pause/G=Go

      qInsertActivity.ParamByName('JobActDate').AsDatetime := qServerDate.FieldByName('ServerDate').AsDateTime ;

      qInsertActivity.ParamByName('JobActTime').AsString   := formatdatetime('HH:MM',(qServerDate.FieldByName('ServerDateTime').AsDateTime)) ;

    if sametext(Pause , 'P') then
      begin
        qInsertActivity.ParamByName('JobComment').AsString := 'หยุดการทำงาน หมายเหตุ : '+textRemark;
      end
    else if sametext(Pause , 'G') then
      begin
        qInsertActivity.ParamByName('JobComment').AsString := 'ทำงานต่อ' ;
      end;
    if (Not qCheckCustomer.IsEmpty) then
      begin
        qInsertActivity.ParamByName('JobActBy').AsString := qCheckCustomer.FieldByName('Code').AsString;
      end
    else if (Not qCheckEmployee.IsEmpty) then
      begin
        qInsertActivity.ParamByName('JobActBy').AsString := qCheckEmployee.FieldByName('Code').AsString ;

      end;

        qInsertActivity.ParamByName('Internal').AsString := 'Y' ;

        qInsertActivity.ExecSQL;
        UserSession.DB.Commit;
        saveok:=true;
     ;
    except on E:Exception do
       begin
         saveok:=false;
         WebApplication.ShowMessage(' '+MessageCap+'   จัดเก็บข้อมูลผิดพลาด :' +E.Message);
         end;
      end;

   if saveok then
      begin

         qSelectAllJobService.Close;
         qSelectAllJobService.ParamByName('id').AsInteger:=UserSession.jobid;
         qSelectAllJobService.Open;

      if (Not qCheckEmployee.IsEmpty) then
        begin
          qSelectTokenSBC.Close ;
          qSelectTokenSBC.Open  ;

          if sametext('P',Pause) then
            begin
              btPause.Caption:='ทำงานต่อ';
              TextPause := 'PAUSE' ;

            end
          else if sametext('G',Pause) then
            begin
              btPause.Caption := 'หยุดทำงาน' ;
              TextPause := 'CONTINUE' ;

            end;


             MessageToSBC := qCheckEmployee.FieldByName('Code').Asstring+
                          ' '+TextPause+' งาน'+
                          ' #'+IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                          ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+'    '+TextRemark;
//          SendLine(Trim(qSelectTokenSBC.FieldByName('LineGroupToken').AsString),MessageToSBC);

             UserSession.sendline(
  //          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
            linettest
            ,MessageToSBC);

        end;
          WebApplication.ShowNotification('บันทึกสำเร็จ  '+MessageCap,ntSuccess);
          forrefresh;
      end;
end;

procedure TfrJobActivity.UpdatejobTSED;
var saveok:boolean;

  begin
    MessageCap:='  '+btSaveDuedate.Caption+' ';
    qServerDate.Close;
    qServerDate.Open;
    saveok:=false;
    UserSession.DB.StartTransaction;

  try
    qUpdateJobTSED.Close;
    qUpdateJobTSED.ParamByName('jobid').AsInteger:=UserSession.jobid;

    qJobStatusID.Close;
    qJobStatusID.ParamByName('Description').AsString:=slJobstatus.Text;
    qJobStatusID.Open;

    qJobTypeID.Close;
    qJobTypeID.ParamByName('Description').AsString:=slJobType.Text;
    qJobTypeID.Open;

    qEmployeeID.Close;
    qEmployeeID.ParamByName('code').AsString:=slJobEmployee.Text;
    qEmployeeID.Open;


    qUpdateJobTSED.ParamByName('JobStatus').AsInteger:=qJobStatusID.FieldByName('id').AsInteger;
    qUpdateJobTSED.ParamByName('JobClose').AsString:=qJobStatusID.FieldByName('finished').AsString;
    qUpdateJobTSED.ParamByName('JobEmployee').AsInteger:=qEmployeeID.FieldByName('id').AsInteger;
    qUpdateJobTSED.ParamByName('JobType').AsInteger:=qJobTypeID.FieldByName('id').AsInteger;
    qUpdateJobTSED.ParamByName('JobDueDate').AsDate:=edDueDate.Date;
    qUpdateJobTSED.ParamByName('JobDueTime').AsString:=(FormatDateTime('hh:nn',(edDueTime.AsDateTime)));
    qUpdateJobTSED.ExecSQL;

    if not  sametext(slJobEmployee.Text,keepemp) then
        begin
            qInsertActivity.Close;
            qInsertActivity.ParamByName('JobService').AsInteger := UserSession.JobId ;
            qInsertActivity.ParamByName('JobActType').AsString :=  'R' ;//R=Response Change
            qInsertActivity.ParamByName('JobActDate').AsDatetime := qServerDate.FieldByName('ServerDate').AsDateTime ;
            qInsertActivity.ParamByName('JobActTime').AsString := formatdatetime('HH:MM',(qServerDate.FieldByName('ServerDateTime').AsDateTime)) ;
            qInsertActivity.ParamByName('JobComment').AsString := 'เปลี่ยนผู้ดำเนินการเป็น '+slJobEmployee.Text ;

            if (Not qCheckCustomer.IsEmpty) then
              qInsertActivity.ParamByName('JobActBy').AsString := qCheckCustomer.FieldByName('Code').AsString
            else if (Not qCheckEmployee.IsEmpty) then
              qInsertActivity.ParamByName('JobActBy').AsString := qCheckEmployee.FieldByName('Code').AsString ;

            qInsertActivity.ParamByName('Internal').AsString := 'N' ;
            qInsertActivity.ExecSQL;
        end;

      if ((not SameText(FormatDateTime('dd/MM/yyyy',edDueDate.Date),keepduedate)) or (not SameText(formatdatetime('HH:mm',edDueTime.AsDateTime),keepduetime))) then
          begin

            qInsertActivity.Close;
            qInsertActivity.ParamByName('JobService').AsInteger  := UserSession.JobId ;
            qInsertActivity.ParamByName('JobActType').AsString   :=  'D' ;//D=Change Due
            qInsertActivity.ParamByName('JobActDate').AsDatetime := qServerDate.FieldByName('ServerDate').AsDateTime ;
            qInsertActivity.ParamByName('JobActTime').AsString   := formatdatetime('HH:MM',(qServerDate.FieldByName('ServerDateTime').AsDateTime)) ;
            qInsertActivity.ParamByName('JobComment').AsString   := 'เปลี่ยนกำหนดส่งเป็นวันที่ '+DateToStr(edDueDate.Date)+' '+formatdatetime('HH:MM',StrToTime(edDueTime.Text)) ;

            if (Not qCheckCustomer.IsEmpty) then
              begin
                qInsertActivity.ParamByName('JobActBy').AsString := qCheckCustomer.FieldByName('Code').AsString
              end
            else if (Not qCheckEmployee.IsEmpty) then
              begin
                qInsertActivity.ParamByName('JobActBy').AsString := qCheckEmployee.FieldByName('Code').AsString ;
              end;

            qInsertActivity.ParamByName('Internal').AsString := 'N' ;

            qInsertActivity.ExecSQL;

          end;

      if not  sametext(slJobstatus.Text,keepobstatus) then
          begin
                  btPause.Visible:=false;
                  qInsertActivity.Close;
                  qInsertActivity.ParamByName('JobService').AsInteger := UserSession.JobId ;
              if (qJobStatusID.FieldByName('Code').AsString = '01') then
                 begin
                  qInsertActivity.ParamByName('JobActType').AsString :=  'X' ; //X จาก รอพิจารณา-->รอดำเนินการ
                  qInsertActivity.ParamByName('JobComment').AsString := 'รอดำเนินการ' ;
                end;
              if (qJobStatusID.FieldByName('Code').AsString = '04') then
                begin
                  qInsertActivity.ParamByName('JobActType').AsString :=  'S' ; //S=Start
                  qInsertActivity.ParamByName('JobComment').AsString := 'กำลังดำเนินการ' ;
                  btPause.Visible:=true;
                end;
              if (qJobStatusID.FieldByName('Code').AsString = '05') then
                begin
                  qInsertActivity.ParamByName('JobActType').AsString :=  'W' ;//W=Wait
                  qInsertActivity.ParamByName('JobComment').AsString := 'รอข้อมูลจากลูกค้า' ;
                end;
              if (qJobStatusID.FieldByName('Code').AsString = '06') then
                begin
                  qInsertActivity.ParamByName('JobActType').AsString :=  'F' ;//F=Finish
                  qInsertActivity.ParamByName('JobComment').AsString := 'เสร็จรอส่ง' ;
                end;
              if (qJobStatusID.FieldByName('Code').AsString = '07') then
                begin
                  qInsertActivity.ParamByName('JobActType').AsString :=  'A' ;//A=Abolish
                  qInsertActivity.ParamByName('JobComment').AsString := 'ยกเลิก' ;
                end;
              if (qJobStatusID.FieldByName('Code').AsString = '08') then
                begin
                  qInsertActivity.ParamByName('JobActType').AsString :=  'C' ;//C=Close
                  qInsertActivity.ParamByName('JobComment').AsString := 'เสร็จเรียบร้อย' ;
                end;
              qInsertActivity.ParamByName('JobActDate').AsDatetime := qServerDate.FieldByName('ServerDate').AsDateTime ;
              qInsertActivity.ParamByName('JobActTime').AsString := formatdatetime('HH:MM',(qServerDate.FieldByName('ServerDateTime').AsDateTime)) ;

              if (Not qCheckCustomer.IsEmpty) then
                qInsertActivity.ParamByName('JobActBy').AsString := qCheckCustomer.FieldByName('Code').AsString
              else if (Not qCheckEmployee.IsEmpty) then
                qInsertActivity.ParamByName('JobActBy').AsString := qCheckEmployee.FieldByName('Code').AsString ;

              qInsertActivity.ParamByName('Internal').AsString := 'N' ;
              qInsertActivity.ExecSQL;
          end;


      UserSession.Db.Commit;
      saveok:=true;
  except on E : Exception do
      begin
         saveok:=false;
         UserSession.DB.Rollback;
         WebApplication.ShowMessage(' '+MessageCap+'   จัดเก็บข้อมูลผิดพลาด :' +E.Message);
      end;

  end;
    if saveok then
      begin
      //datetimedue
        if ((not SameText(FormatDateTime('dd/MM/yyyy',edDueDate.Date),keepduedate)) or (not SameText(formatdatetime('HH:mm',edDueTime.AsDateTime),keepduetime))) then
          begin
             if (Not qCheckEmployee.IsEmpty) then
            begin
              qSelectAllJobService.Close;
              qSelectAllJobService.ParamByName('id').AsInteger:=UserSession.jobid;
              qSelectAllJobService.Open;

              qCustomerID.Close ;
              qCustomerID.ParamByName('Id').AsInteger := qSelectAllJobService.FieldByName('Customer').AsInteger  ;
              qCustomerID.Open ;
              //Line Notify
              //To Customer
              MessageToCusTomer := 'เลขรับเรื่อง #'+
                                  IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                                  '  วันที่ '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                                  ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                                  ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+' ('+slJobStatus.Text+') '+
                                  ' กำหนดส่ง '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDueDate').AsDateTime)+
                                  ', '+qSelectAllJobService.FieldByName('JobDueTime').AsString+
                                  ' '+
                                  ShortURL(usersession.MainURL+'/m?JobId='+
                                  qSelectAllJobService.FieldByName('RandomKey').AsString);

//              SendLine(Trim(qCustomerID.FieldByName('LineGroupToken').AsString),MessageToCusTomer);
          UserSession.sendline(
//          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
          linettest
          ,MessageToCusTomer);
          
              //End Line Notify
            end;
              end;



//    status
      if not  sametext(slJobstatus.Text,keepobstatus) then
          begin
          
              if (Not qCheckEmployee.IsEmpty) then
            begin

              qSelectAllJobService.Close;
              qSelectAllJobService.ParamByName('id').AsInteger:=UserSession.jobid;
              qSelectAllJobService.Open;

              qCustomerID.Close ;
              qCustomerID.ParamByName('Id').AsInteger := qSelectAllJobService.FieldByName('Customer').AsInteger  ;
              qCustomerID.Open ;
       
              //Line Notify
              //To Customer
              MessageToCusTomer := 'เลขรับเรื่อง #'+
                                  IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                                  '  วันที่ '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                                  ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                                  ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+' ('+slJobStatus.Text+') '+
                                  ' '+
                                  ShortURL(usersession.MainURL+'/m?JobId='+
                                  qSelectAllJobService.FieldByName('RandomKey').AsString);
                              
//              SendLine(Trim(qCustomerID.FieldByName('LineGroupToken').AsString),MessageToCusTomer);
            UserSession.sendline(
  //          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
            linettest
            ,MessageToCusTomer);
              //End Line Notify
            end;   
          end;

      if not  sametext(slJobEmployee.Text,keepemp) then
          begin
              if (Not qCheckEmployee.IsEmpty) then
            begin
                  qSelectAllJobService.Close;
                  qSelectAllJobService.ParamByName('id').AsInteger:=UserSession.jobid;
                  qSelectAllJobService.Open;

                  qCustomerID.Close ;
                  qCustomerID.ParamByName('Id').AsInteger := qSelectAllJobService.FieldByName('Customer').AsInteger  ;
                  qCustomerID.Open ;

              //To SBC
              MessageToSBC := qCustomerID.FieldByName('Code').Asstring+
                              ' #'+IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                              ' '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                              ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                              ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+
                              ' ('+qCheckEmployee.FieldByName('Code').Asstring+' '+
                              '->'+slJobEmployee.Text+' รับผิดชอบ)'+
                              ' '+
                              ShortURL(usersession.MainURL+'/m?JobId='+
                              qSelectAllJobService.FieldByName('RandomKey').AsString);
    //          SendLine('WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn',MessageToSBC);
                UserSession.sendline(
      //          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
                linettest
                ,MessageToSBC);

              if (qEmployeeID.FieldByName('LineToken').AsString <> '') or
                 (qEmployeeID.FieldByName('LineToken').IsNull) then
                begin
                  //To Employee
                  MessageToEmployee := qCustomerID.FieldByName('Code').Asstring+
                                  ' #'+IntToStr(qSelectAllJobService.FieldByName('Id').AsInteger)+
                                  ' '+DateTimeToStr(qSelectAllJobService.FieldByName('JobDate').AsDateTime)+
                                  ' '+qSelectAllJobService.FieldByName('JobTime').AsString+
                                  ' '+qSelectAllJobService.FieldByName('JobTitle').AsString+
                                  ' ('+qCheckEmployee.FieldByName('Code').Asstring+' '+
                                  '->'+slJobEmployee.Text+' รับผิดชอบ)'+
                                  ' '+
                                  ShortURL(usersession.MainURL+'/m?JobId='+
                                  qSelectAllJobService.FieldByName('RandomKey').AsString);
    //              SendLine(Trim(qEmployeeID.FieldByName('LineToken').AsString),MessageToEmployee);
                UserSession.sendline(
      //          'WAUFTFpGY4rV2oW4q8WdOw2qaBf63BfxBEoPTsVvvyn'
                linettest
                ,MessageToEmployee);
                end;
              end;
            end;
            keepobstatus:=slJobstatus.Text;
            keepemp:=slJobEmployee.Text;
            keepjoptype:=slJobType.Text;
            keepduedate:=FormatDateTime('dd/MM/yyyy',edDueDate.Date);
            keepduetime:=formatdatetime('HH:mm',edDueTime.AsDateTime);
            forrefresh;
            btSaveDuedate.SetFocus;
            WebApplication.ShowNotification('บันทึกสำเร็จ  '+MessageCap,ntSuccess);

      end;

           
end;

procedure TfrJobActivity.UpdateImg;
var SaveOk : Boolean ;
    Pic1    : TMemoryStream ;
    Pic2    : TMemoryStream ;
    Pic3    : TMemoryStream ;
    Pic4    : TMemoryStream ;
    Pic5    : TMemoryStream ;
    Pic6    : TMemoryStream ;
    Pic7    : TMemoryStream ;
    Pic8    : TMemoryStream ;
begin

  MessageCap:='  '+btSavePicture.Caption+' ';
  qUpdateImg.Close;
  saveok:=False;
  UserSession.DB.StartTransaction;
  try

    qUpdateImg.ParamByName('jobid').AsInteger:=UserSession.jobid;

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
    qUpdateImg.ParamByName('Image1').IsNull
    else
    qUpdateImg.ParamByName('Image1').LoadFromStream(Pic1,ftBlob) ;

    if not havepic2 then
    qUpdateImg.ParamByName('Image2').IsNull
    else
    qUpdateImg.ParamByName('Image2').LoadFromStream(Pic2,ftBlob) ;

    if not havepic3 then
    qUpdateImg.ParamByName('Image3').IsNull
    else
    qUpdateImg.ParamByName('Image3').LoadFromStream(Pic3,ftBlob) ;

    if not havepic4 then
    qUpdateImg.ParamByName('Image4').IsNull
    else
    qUpdateImg.ParamByName('Image4').LoadFromStream(Pic4,ftBlob) ;

    if not havepic5 then
    qUpdateImg.ParamByName('Image5').IsNull
    else
    qUpdateImg.ParamByName('Image5').LoadFromStream(Pic5,ftBlob) ;

    if not havepic6 then
    qUpdateImg.ParamByName('Image6').IsNull
    else
    qUpdateImg.ParamByName('Image6').LoadFromStream(Pic6,ftBlob) ;

    if not havepic7 then
    qUpdateImg.ParamByName('Image7').IsNull
    else
    qUpdateImg.ParamByName('Image7').LoadFromStream(Pic7,ftBlob) ;

    if not havepic8 then
    qUpdateImg.ParamByName('Image8').IsNull
    else
    qUpdateImg.ParamByName('Image8').LoadFromStream(Pic8,ftBlob) ;


    pic1.Free ;
    pic2.Free ;
    pic3.Free ;
    pic4.Free ;
    pic5.Free ;
    pic6.Free ;
    pic7.Free ;
    pic8.Free ;

    qUpdateImg.ExecSQL;
    UserSession.Db.Commit;
    SaveOk:=true;

  Except on E : Exception do
    begin
      UserSession.db.Rollback;
      SaveOk := False;
      WebApplication.ShowMessage(' '+MessageCap+'   จัดเก็บข้อมูลผิดพลาด :' +E.Message);
    end;

  end;

  if saveok then
    begin
        WebApplication.ShowNotification('บันทึกสำเร็จ  '+MessageCap,ntSuccess);
    end;

end;

procedure TfrJobActivity.Updatedetail;
Var SaveOk : Boolean ;
begin
    MessageCap:='  '+btSaveDetail.Caption+' ';
    qUpdateDetail.Close;
    SaveOk := True ;
    UserSession.Db.StartTransaction ;
  Try
    qUpdateDetail.ParamByName('jobid').AsInteger :=UserSession.jobid ;
    qUpdateDetail.ParamByName('JobTitle').AsString := Trim(edTitle.Text) ;
    qUpdateDetail.ParamByName('CusAttn').AsString := Trim(edInformant.Text) ;
    qUpdateDetail.ParamByName('JobDetail').AsString := Trim(mmDetail.Text) ;

    qUpdateDetail.ExecSQL;
    UserSession.Db.Commit;
    SaveOk:=true;
  Except on E : Exception do
    begin
      SaveOk := False ;
      UserSession.Db.Rollback ;
      WebApplication.ShowMessage(' '+MessageCap+'   จัดเก็บข้อมูลผิดพลาด :' +E.Message);
    end;

  End;

  if SaveOk then
  begin
        WebApplication.ShowNotification('บันทึกสำเร็จ  '+MessageCap,ntSuccess);
  end;

//  forrefresh;
end;


 procedure TfrJobActivity.UpdateUrgentAndHrCost;
    var saveok:boolean;
 begin

  MessageCap:='  '+btSaveUrgent.Caption+' ';
  qUpdateUrgent.Close;
  SaveOk := false ;
  UserSession.Db.StartTransaction ;
  Try
    qUpdateUrgent.ParamByName('jobid').AsInteger := UserSession.jobid;
    if (edHrCost.Text = '') then
      qUpdateUrgent.ParamByName('HrCost').AsFloat := 0
    else
      qUpdateUrgent.ParamByName('HrCost').AsFloat := StrToFloat(edHrCost.Text) ;
    if (cbUrgent.Checked) then
      qUpdateUrgent.ParamByName('Urgent').AsString := 'Y'
    else
      qUpdateUrgent.ParamByName('Urgent').AsString := 'N' ;


    qUpdateUrgent.ExecSQL;
    UserSession.Db.Commit ;
    SaveOk := True;
  Except on E : Exception do
    begin
      SaveOk := False ;
      usersession.Db.Rollback ;
      WebApplication.ShowMessage(' '+MessageCap+'   จัดเก็บข้อมูลผิดพลาด :' +E.Message);
    end;
  End;

    if saveok then
      begin
      WebApplication.ShowNotification('บันทึกสำเร็จ  '+MessageCap,ntSuccess);
      end;
//  forrefresh;
end;

procedure TfrJobActivity.btUploadImage1AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
  var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage1.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl1.Picture.LoadFromStream(MS) ;
    havepic1:=true;
  finally

    MS.Free;

  end;

 end;

procedure TfrJobActivity.MyConfirmCallback(EventParams: TStringList);
var
  Response: Boolean;
begin

   if (Not Usersession.db.Connected) then
      Begin
        Usersession.db.Open  ;
      End;

    Response := SameText(EventParams.Values['RetValue'], 'True');

  if Response then
    begin
    if SameText(saveis,'urgentandhrcost') then
      begin
        UpdateUrgentAndHrCost;
      end
    else if SameText(saveis,'UpdateDetail') then
      begin
        Updatedetail;
      end
    else if SameText(saveis,'UpdateImg') then
      begin
         UpdateImg;
      end
    else if SameText(saveis,'UpdateJobTSED') then
     begin
        UpdatejobTSED;
    end
    else if SameText(saveis,'InsertComment') then
     begin
        InsertComment;
    end
    else if SameText(saveis,'UpdatePause') then
     begin
        UpdatePause;
    end
    else
      begin
        WebApplication.ShowMessage('err');
      end;
    end;
end;


procedure TfrJobActivity.btBackClick(Sender: TObject);
begin
  Release;
end;

procedure TfrJobActivity.IWAppFormCreate(Sender: TObject);
begin
  LayoutMgr.Enabled := true;
end;

procedure TfrJobActivity.IWAppFormShow(Sender: TObject);
    var check:integer;
     ST       : String ;
     Cm       : String ;
     JT       : String ;
     EM       : String ;
     TmpIndex : Integer ;
     I        : Integer ;
     MS : TMemoryStream;
begin
    linettest:='IQOQz5sAjZT56RUpg6TiYOMzmiXwM4v5af3qvVE7a2f';
   if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;

    qJobService.Close;
    qJobService.ParamByName('id').AsInteger:=UserSession.jobid;
    qJobService.Open;

    qServerDate.Close ;
    qServerDate.Open  ;

  if (qJobService.FieldByName('JobDueTime').IsNull) then
    edDueTime.Text := '00:00'
  else
    edDueTime.Text := qJobService.FieldByName('JobDueTime').AsString;
  if (qJobService.FieldByName('Urgent').AsString = 'Y') then
    cbUrgent.Checked := True
  else
    cbUrgent.Checked := False ;

      qUseTime.Close;
      qUseTime.ParamByName('Jobservice').AsInteger := UserSession.JobId ;
      qUseTime.Open ;
      Hour := qUseTime.FieldByName('Hour').AsString ;
      Day  := qUseTime.FieldByName('Day').AsString  ;
//    IWLabel1.Caption:= Day+'  day  Hour '+ Hour;

      qCheckCustomer.close ;
      qCheckCustomer.ParamByName('Id').AsInteger := UserSession.ActiveCustomerID ;
      qCheckCustomer.Open ;

      qCheckEmployee.close ;
      qCheckEmployee.ParamByName('Id').AsInteger := UserSession.ActiveEmployeeID ;
      qCheckEmployee.Open ;

      qSelectPause.Close;
      qSelectPause.ParamByName('Jobservice').AsInteger := UserSession.JobId ;
      qSelectPause.Open ;

      edDate.date:=qJobService.FieldByName('jobdate').AsDateTime;
      edHrCost.text:= (qJobService.FieldByName('hrcost').asstring);
      edTitle.Text:= qJobService.FieldByName('jobtitle').AsString;
      edInformant.Text:=qJobService.FieldByName('cusattn').AsString;
      mmDetail.Text:=qJobService.FieldByName('jobdetail').AsString;
      edDueDate.Date:=qJobService.FieldByName('jobduedate').AsDateTime;
      edDueTime.Text:=FormatDateTime('hh:nn',(qJobService.FieldByName('jobduetime').AsDateTime));


  //Select Customer
  qCustomer.Close ;
  qCustomer.Open  ;

  TmpIndex := 0 ;
  I := -1 ;
  slCustomer.Items.Clear ;
  qCustomer.First ;
  while (Not qCustomer.Eof) do
    begin
      Inc(I) ;
      if (qJobService.FieldByName('Customer').AsInteger = qCustomer.FieldByName('Id').AsInteger) Then
        TmpIndex := I ;
      Cm := qCustomer.FieldByName('Code').AsString ;

      slCustomer.Items.Append(Cm);
      qCustomer.Next ;
    End ;
  slCustomer.ItemIndex := TmpIndex ;

  //Select JobStatus
  qJobStatus.Close ;
  qJobStatus.Open  ;

  TmpIndex := 0 ;
  I := -1 ;
  slJobStatus.Items.Clear ;
  qJobStatus.First ;
  while (Not qJobStatus.Eof) do
    begin
      Inc(I) ;
      if (qJobService.FieldByName('JobStatus').AsInteger = qJobStatus.FieldByName('Id').AsInteger) Then
        TmpIndex := I ;
      ST := qJobStatus.FieldByName('Description').AsString ;

      slJobStatus.Items.Append(ST);
      qJobStatus.Next ;
    End ;
  slJobStatus.ItemIndex := TmpIndex ;

    //Select JobType
  qJobType.Close ;
  qJobType.Open  ;

  TmpIndex := 0 ;
  I := -1 ;
  slJobType.Items.Clear ;
  qJobType.First ;
  while (Not qJobType.Eof) do
    begin
      Inc(I) ;
      if (qJobService.FieldByName('JobType').AsInteger = qJobType.FieldByName('Id').AsInteger) Then
        TmpIndex := I ;
      JT := qJobType.FieldByName('Description').AsString ;

      slJobType.Items.Append(JT);
      qJobType.Next ;
    End ;
  slJobType.ItemIndex := TmpIndex ;

  //Select Employee
  qEmployee.Close ;
  qEmployee.Open  ;

  TmpIndex := 0 ;
  I := -1 ;
  slJobEmployee.Items.Clear ;
  qEmployee.First ;
  while (Not qEmployee.Eof) do
    begin
      Inc(I) ;
      if (qJobService.FieldByName('JobEmployee').AsInteger = qEmployee.FieldByName('Id').AsInteger) Then
        TmpIndex := I ;
      EM := qEmployee.FieldByName('Code').AsString ;

      slJobEmployee.Items.Append(EM);
      qEmployee.Next ;
    End ;
  slJobEmployee.ItemIndex := TmpIndex ;

  if (Not qCheckCustomer.IsEmpty) then
    begin
      
      slJobEmployee.Visible  := False ;
      slJobType.Editable     := True ;           //readonly
      slJobStatus.Editable   := True ;           //readonly
      edDueDate.Enabled    := False ;
      edDueTime.Enabled    := False ;
      btSaveDuedate.Enabled  := False ;
      slCustomer.Enabled     := False ;
      cbInternal.Visible     := False ;
      cbUrgent.Visible       := False ;
      btSaveUrgent.Visible := False ;
      btPause.Visible        := False ;
    end
  else if (Not qCheckEmployee.IsEmpty) then
    begin
      edDate.Enabled:=false;
      edTitle.ReadOnly     := False ;
      mmDetail.Editable    := true ;   //readonly
      edInformant.ReadOnly := False ;
      btSaveDetail.Visible   := True ;
      slCustomer.Editable    := False ;   //readonly
      cbInternal.Checked     := True ;
      if (qJobService.FieldByName('JobStatus').AsInteger = 10) then
        begin
          if (qJobService.FieldByName('JobEmployee').AsInteger = UserSession.ActiveEmployeeID) Then
            btPause.Visible := True
          else
            btPause.Visible := False ;

          if (qSelectPause.FieldByName('JobActType').AsString = 'P') then
            begin
              IWLabel1.Caption:= qSelectPause.FieldByName('JobActType').AsString;
              Pause:='G';
              btPause.Caption := 'ทำงานต่อ' ;
            end
          else if (qSelectPause.FieldByName('JobActType').AsString = 'G') then
            begin
              IWLabel1.Caption:= qSelectPause.FieldByName('JobActType').AsString;
              Pause:='P';
              btPause.Caption := 'หยุดทำงาน' ;
            end;
          if (Hour < '0') then
            begin
              Hour := '0' ;
              lbshowDueTime.Visible:=true;
            end
          else
            lbshowDueTime.Visible:=true;

            lbShowDueTime.Caption :=' { '+Day+'Day '+Hour+' Hour }';
        end
      else
        btPause.Visible := False ;
    end
  else
    begin
      slJobEmployee.Visible  := False ;
      slJobType.Editable     := True ;         //readonly
      slJobStatus.Editable   := True ;
      edDueDate.Enabled    := False ;
      edDueTime.Enabled    := False ;
      btSaveDuedate.Enabled  := False ;
      mmComment.Editable     := True ;      //readonly
      btSaveComment.Enabled  := False ;
      btUploadImage1.Enabled := False ;
      btUploadImage2.Enabled := False ;
      btUploadImage3.Enabled := False ;
      btSavePicture.Visible  := False ;
      slCustomer.Enabled     := False ;
      cbInternal.Visible     := False ;
      btPause.Visible        := False ;
    end;

//  IMAGE
          if (qJobService.FieldByName('image1').IsNull) then
          begin
            imgSl1.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic1:=false;
          end
          else
            begin

              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image1') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                imgSl1.Picture.LoadFromStream(MS);
                havepic1:=True;
              finally
                // Release the stream
                MS.Free;
              end;
            end;

             if (qJobService.FieldByName('image2').IsNull) then
          begin
            imgSl2.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic2:=false;
          end
          else
            begin

              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image2') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                imgSl2.Picture.LoadFromStream(MS);
                havepic2:=true;
              finally
                // Release the stream
                MS.Free;
              end;
            end;

              if (qJobService.FieldByName('image3').IsNull) then
          begin
            imgSl3.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic3:=false;
          end
          else
            begin

              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image3') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                 imgSl3.Picture.LoadFromStream(MS);
                 havepic3:=true;
              finally
                // Release the stream
                MS.Free;
              end;
            end;

              if (qJobService.FieldByName('image4').IsNull) then
          begin
            imgSl4.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic4:=false;
          end
          else
            begin

              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image4') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                 imgSl4.Picture.LoadFromStream(MS);
                 havepic4:=true;
              finally
                // Release the stream
                MS.Free;
              end;
            end;

        if (qJobService.FieldByName('image5').IsNull) then
          begin
            imgSl5.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic5:=false;
          end
          else
            begin
              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image5') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                 imgSl5.Picture.LoadFromStream(MS);
                 havepic5:=true;
              finally
                // Release the stream
                MS.Free;
              end;
            end;

             if (qJobService.FieldByName('image6').IsNull) then
          begin
            imgSl6.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic6:=false;
          end
          else
            begin
              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image6') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                 imgSl6.Picture.LoadFromStream(MS);
                 havepic6:=true;

              finally
                // Release the stream
                MS.Free;
              end;
            end;

              if (qJobService.FieldByName('image7').IsNull) then
          begin
            imgSl7.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic7:=false;
          end
          else
            begin

              MS := TMemoryStream.Create;

              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image7') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                 imgSl7.Picture.LoadFromStream(MS);
                 havepic7:=true;

              finally
                // Release the stream
                MS.Free;
              end;
            end;

              if (qJobService.FieldByName('image8').IsNull) then
          begin
            imgSl8.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
            havepic8:=false;
          end
          else
            begin

              MS := TMemoryStream.Create;
              try
                ms.position:=0;
                // Save the file content to that stream
                with qJobService.FieldByName('image8') as tblobfield do
                  savetostream(ms);

                MS.Position := 0;
                 imgSl8.Picture.LoadFromStream(MS);
                 havepic8:=true;

              finally
                // Release the stream
                MS.Free;
              end;
            end;

        lbShowid.Caption:='# '+inttostr(UserSession.jobid);

        keepemp:=slJobEmployee.Text;
        keepjoptype:=slJobType.Text;
        keepobstatus:=slJobstatus.Text;
        keepduedate:=FormatDateTime('dd/MM/yyyy',qJobService.FieldByName('jobduedate').AsDateTime);
        keepduetime:=qJobService.FieldByName('JobDueTime').AsString;

        WebApplication.RegisterCallBack('MyConfirmCallback', MyConfirmCallback);
        WebApplication.RegisterCallBack('MypromptCallback', MypromptCallback);

        CreatComment ;

end;


procedure TfrJobActivity.btClearImg1AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic1 := False;
  imgSl1.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl1.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg2AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic2 := False;
  imgSl2.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl2.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg3AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic3 := False;
  imgSl3.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl3.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg4AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic4 := False;
  imgSl4.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl4.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg5AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic5 := False;
  imgSl5.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl5.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg6AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic6 := False;
  imgSl6.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl6.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg7AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic7 := False;
  imgSl7.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl7.RefreshAsyncRender;
end;

procedure TfrJobActivity.btClearImg8AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  havepic8 := False;
  imgSl8.Picture.LoadFromFile('images\IconMat-Black\NoPic.png');
  imgSl8.RefreshAsyncRender;
end;

procedure TfrJobActivity.btPauseAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  saveis:='UpdatePause';
  if (btPause.Caption = 'หยุดทำงาน') then
   begin
    WebApplication.ShowPrompt(' หมายเหตุหยุดการทำงาน : ',  'MyPromptCallback', 'กรุณาป้อนหมายเหตุหยุดการทำงาน', '');
   end
   else
   begin
    WebApplication.ShowConfirm('ยืนยัน  ' + btPause.Caption,'MyConfirmCallback', Title,'Yes', 'No');
   end;
end;

procedure TfrJobActivity.btSaveCommentAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  saveis:='InsertComment';
WebApplication.ShowConfirm('ยืนยัน  ' + '  SaveComment','MyConfirmCallback', Title,'Yes', 'No');
end;

procedure TfrJobActivity.btSaveDetailAsyncClick(Sender: TObject;
  EventParams: TStringList);
 var js,id:string;
begin
 saveis:='UpdateDetail';
 WebApplication.ShowConfirm('ยืนยัน  ' + btSaveDetail.Caption,'MyConfirmCallback', Title,'Yes', 'No');
 end;

procedure TfrJobActivity.btSaveDuedateAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
 saveis:='UpdateJobTSED';
 WebApplication.ShowConfirm('ยืนยัน  '+btSaveDuedate.Caption,'MyConfirmCallback', Title,'Yes', 'No');

end;

procedure TfrJobActivity.btSavePictureAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
 saveis:='UpdateImg';
 WebApplication.ShowConfirm('ยืนยัน  '+btSavePicture.Caption,'MyConfirmCallback', Title,'Yes', 'No');
end;

procedure TfrJobActivity.btSaveUrgentAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
 saveis:='urgentandhrcost';
 WebApplication.ShowConfirm('ยืนยัน  '+btSaveUrgent.Caption,'MyConfirmCallback', Title,'Yes', 'No');
end;

procedure TfrJobActivity.btUploadImage1AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl1.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage2AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage2.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl2.Picture.LoadFromStream(MS) ;
    havepic2:=true;
  finally

    MS.Free;

  end;
end;


procedure TfrJobActivity.btUploadImage2AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl2.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage3AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage3.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl3.Picture.LoadFromStream(MS) ;
    havepic3:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobActivity.btUploadImage3AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl3.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage4AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage4.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl4.Picture.LoadFromStream(MS) ;
    havepic4:=true;
  finally

    MS.Free;

  end;
end;


procedure TfrJobActivity.btUploadImage4AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl4.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage5AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage5.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl5.Picture.LoadFromStream(MS) ;
    havepic5:=true;
  finally

    MS.Free;

  end;
end;


procedure TfrJobActivity.btUploadImage5AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl5.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage6AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage6.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl6.Picture.LoadFromStream(MS) ;
    havepic6:=true;
  finally

    MS.Free;

  end;
end;


procedure TfrJobActivity.btUploadImage6AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl6.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage7AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage7.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl7.Picture.LoadFromStream(MS) ;
    havepic7:=true;
  finally

    MS.Free;

  end;
end;

procedure TfrJobActivity.btUploadImage7AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl7.RefreshAsyncRender;
end;

procedure TfrJobActivity.btUploadImage8AsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
var
  MS: TMemoryStream;
begin

  MS := TMemoryStream.Create;
  try
    btUploadImage8.SaveToStream(FileName, MS);

    SaveFile := False;

    MS.Position := 0;

    imgSl8.Picture.LoadFromStream(MS) ;
    havepic8:=true;
  finally

    MS.Free;

  end;
end;


procedure TfrJobActivity.btUploadImage8AsyncUploadSuccess(Sender: TObject;
  EventParams: TStringList);
begin
  imgSl8.RefreshAsyncRender;
end;

procedure TfrJobActivity.CreatComment ;
var JS,id:string;

  begin
  
  if (Not qCheckCustomer.IsEmpty) then
    begin

      qSelectComment.Close;
      qSelectComment.ParamByName('JobService').AsInteger := UserSession.JobId ;
      qSelectComment.ParamByName('InternalN').AsString := 'N' ;
      qSelectComment.ParamByName('InternalY').AsString := 'N' ;
      qSelectComment.Open;

    end
  else if (Not qCheckEmployee.IsEmpty) then
    begin

      qSelectComment.Close;
      qSelectComment.ParamByName('JobService').AsInteger := UserSession.JobId ;
      qSelectComment.ParamByName('InternalN').AsString := 'N' ;
      qSelectComment.ParamByName('InternalY').AsString := 'Y' ;
      qSelectComment.Open;


    end
  else
    begin

      qSelectComment.Close;
      qSelectComment.ParamByName('JobService').AsInteger := UserSession.JobId ;
      qSelectComment.ParamByName('InternalN').AsString := 'N' ;
      qSelectComment.ParamByName('InternalY').AsString := 'N' ;
      qSelectComment.Open;


    end;
  end;

end.
