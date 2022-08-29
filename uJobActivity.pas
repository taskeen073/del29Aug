unit uJobActivity;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompFileUploader, IWCompMemo, IWCompEdit, IWCompCheckbox, IWControl,
  IWTMSCal, IWCompListbox, IWDBStdCtrls, IWCompLabel, IWCompExtCtrls,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWCompButton,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, Data.DB, DBAccess, Uni, MemDS,
  IWCompGrids, IWDBGrids, Vcl.Imaging.pngimage;

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
    qSelectCusID: TUniQuery;
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
    IWDBGrid1: TIWDBGrid;
    qUpdateUrgent: TUniQuery;
    qUpdateJobType: TUniQuery;
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
    procedure btBackClick(Sender: TObject);
    procedure IWAppFormShow(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure edHrCostAsyncChange(Sender: TObject; EventParams: TStringList);
    Procedure CreatComment;
    procedure btSaveUrgentClick(Sender: TObject);
    procedure btSaveDetailClick(Sender: TObject);
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
    procedure btSavePictureClick(Sender: TObject);
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

  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit;


procedure TfrJobActivity.btBackClick(Sender: TObject);
begin
  Release;
end;

procedure TfrJobActivity.edHrCostAsyncChange(Sender: TObject;
  EventParams: TStringList);
  var f:double;
begin
//    f:=Round(edHrCost.AsFloat)    ;
//    edHrCost.AsFloat:=f;
end;

procedure TfrJobActivity.IWAppFormCreate(Sender: TObject);
begin
  LayoutMgr.Enabled := false;

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
      edTitle.ReadOnly     := False ;
      mmDetail.Editable    := False ;   //readonly
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
              btPause.Caption := '�ӧҹ���' ;
            end
          else if (qSelectPause.FieldByName('JobActType').AsString = 'G') then
            begin
              btPause.Caption := '��ش�ӧҹ' ;
            end;
          if (Hour < '0') then
            begin
              Hour := '0' ;
              lbshowDueTime.Visible:=true;
            lbShowDueTime.Caption :=' { '+Day+'Day '+Hour+' Hour }';
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
//      frMain.LoginSelect     := 2 ;             //thisASK
//      frMain.JobActivityBack := 3 ;             //thisASK
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
          end
          else
            begin

              MS := TMemoryStream.Create;
              havepic5:=false;
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
          end
          else
            begin

              MS := TMemoryStream.Create;
              havepic6:=false;
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
          end
          else
            begin

              MS := TMemoryStream.Create;
              havepic7:=false;
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
          end
          else
            begin

              MS := TMemoryStream.Create;
              havepic8:=false;
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

//            //CheckIMG
//            WebApplication.ShowMessage('p1 '+BoolToStr(havepic1));
//            WebApplication.ShowMessage('p2 '+BoolToStr(havepic2));
//            WebApplication.ShowMessage('p3 '+BoolToStr(havepic3));
//            WebApplication.ShowMessage('p4 '+BoolToStr(havepic4));
//            WebApplication.ShowMessage('p5 '+BoolToStr(havepic5));
//            WebApplication.ShowMessage('p6 '+BoolToStr(havepic6));
//            WebApplication.ShowMessage('p7 '+BoolToStr(havepic7));
//            WebApplication.ShowMessage('p8 '+BoolToStr(havepic8));


        lbShowid.Caption:='# '+inttostr(UserSession.jobid);

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

procedure TfrJobActivity.btSaveDetailClick(Sender: TObject);
Var SaveOk : Boolean ;
begin

  qUpdateDetail.Close;
  SaveOk := True ;
  UserSession.Db.StartTransaction ;
  qUpdateDetail.ParamByName('jobid').AsInteger :=UserSession.jobid ;
  Try
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

    WebApplication.ShowMessage('Message IS : '+E.Message);
    end;
  End;
end;

procedure TfrJobActivity.btSavePictureClick(Sender: TObject);
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

  qUpdateImg.Close;
  saveok:=False;
  UserSession.DB.StartTransaction;
  qUpdateImg.ParamByName('jobid').AsInteger:=UserSession.jobid;
  try
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
      WebApplication.ShowMessage('จัดเก็บข้อมูลผิดพลาด : '+E.Message);
    end;

  end;

  if saveok then
  begin
    WebApplication.ShowMessage('true');
  end
  else
  begin

    WebApplication.ShowMessage('else');
  end;

end;

procedure TfrJobActivity.btSaveUrgentClick(Sender: TObject);
Var SaveOk  : Boolean ;
begin

  qUpdateUrgent.Close;
  SaveOk := false ;
  UserSession.Db.StartTransaction ;
  qUpdateUrgent.ParamByName('jobid').AsInteger := UserSession.jobid;
  Try
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
    WebApplication.ShowMessage('�Ѵ�红����żԴ��Ҵ : '+E.Message);
    end;
  End;
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
