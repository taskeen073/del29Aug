unit uReport;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWControl,
  IWTMSCal, IWCompCheckbox, IWCompGrids, IWDBGrids, IWCompListbox, IWDBStdCtrls,
  IWCompRadioButton, IWCompEdit, IWCompLabel, Vcl.Imaging.pngimage,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWCompExtCtrls, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, Data.DB, MemDS, DBAccess, Uni,
  IWCompButton;

type
  TfrReport = class(TIWAppForm)
    btBack: TIWImage;
    lbTitle: TIWLabel;
    lbNameUser: TIWLabel;
    edSearch: TIWEdit;
    btSearch: TIWImage;
    rdAllJobType: TIWRadioButton;
    rdJobType: TIWRadioButton;
    rdNoUrgent: TIWRadioButton;
    lbDate: TIWLabel;
    cbAllDate: TIWCheckBox;
    lbBeginDate: TIWLabel;
    lbEndDate: TIWLabel;
    lbDueDate: TIWLabel;
    cbAllDueDate: TIWCheckBox;
    lbDateDelivery: TIWLabel;
    lbStatus: TIWLabel;
    cbAllStatus: TIWCheckBox;
    cbStatusP: TIWCheckBox;
    cbStatusW: TIWCheckBox;
    cbStatusS: TIWCheckBox;
    cbStatusWC: TIWCheckBox;
    cbStatusC: TIWCheckBox;
    cbStatusFW: TIWCheckBox;
    cbStatusO: TIWCheckBox;
    cbStatusA: TIWCheckBox;
    lbConsider: TIWLabel;
    lbPending: TIWLabel;
    lbInProgress: TIWLabel;
    lbCustomerInformation: TIWLabel;
    lbDelivery: TIWLabel;
    lbFinish: TIWLabel;
    lbCancle: TIWLabel;
    lbApprove: TIWLabel;
    lbOverdue: TIWLabel;
    btDownUp: TIWImage;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    qEmployeeID: TUniQuery;
    qSelectEmployee: TUniQuery;
    qColor: TUniQuery;
    qJobService: TUniQuery;
    qCheckCustomer: TUniQuery;
    qCheckEmployee: TUniQuery;
    qSelectJobType: TUniQuery;
    qJobTypeID: TUniQuery;
    edBeginDate: TTIWDateSelector;
    edEndDate: TTIWDateSelector;
    edDueDate: TTIWDateSelector;
    displayGridReport: TIWGrid;
    slJobEmployee: TIWComboBox;
    slJobType: TIWComboBox;
    IWLabel1: TIWLabel;
    rdAllUrgent: TIWRadioButton;
    rdUrgent: TIWRadioButton;
    rdAll: TIWRadioButton;
    rdMyJob: TIWRadioButton;
    rdEmployee: TIWRadioButton;
    djobservice: TUniDataSource;
    qseverdate: TUniQuery;
    IWLabel2: TIWLabel;
    procedure btBackClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormShow(Sender: TObject);
    procedure rbAllJob1AsyncClick(Sender: TObject; EventParams: TStringList);
    procedure btDownUpAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure cbStatusPAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusWAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusSAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusWCAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusFWAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusCAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusAAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure cbStatusOChange(Sender: TObject);
    procedure cbAllStatusAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure rdAllAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure rdMyJobAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure rdEmployeeAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure rdAllJobTypeAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure rdJobTypeAsyncClick(Sender: TObject;
      EventParams: TStringList);

    procedure displayGridReportRenderCell(ACell: TIWGridCell; const ARow,
      AColumn: Integer);
    procedure btSearchClick(Sender: TObject);
    procedure edBeginDateAsyncDayChange(Sender: TObject;
      EventParams: TStringList);
    procedure edDueDateAsyncDayChange(Sender: TObject;
      EventParams: TStringList);
    procedure displayGridReportCellClick(ASender: TObject; const ARow,
      AColumn: Integer);
  public
  mark:boolean;
  emp,JT:string;
  TmpIndex,i:integer;
  tempcolor:string;

  procedure SearchJobService;
  end;

implementation

{$R *.dfm}

uses uMenu, ServerController, UserSessionUnit, uJobActivity;


procedure TfrReport.btBackClick(Sender: TObject);
begin
  Release;
end;

procedure TfrReport.btDownUpAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if mark then
    begin
      mark:=false;
      btDownUp.Picture.LoadFromFile('images\IconMat-Black\down.png');
    end
    else
    begin
      mark:=true;
      btDownUp.Picture.LoadFromFile('images\IconMat-Black\up.png');
    end;
end;

procedure TfrReport.btSearchClick(Sender: TObject);
begin
  SearchJobService;
end;

procedure TfrReport.cbAllStatusAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  cbAllStatus.Checked              :=true;
  cbStatusP.Checked                :=false;
  cbStatusW.Checked                :=false;
  cbStatusS.Checked                :=false;
  cbStatusWC.Checked               :=false;
  cbStatusC.Checked                :=false;
  cbStatusFW.Checked               :=false;
  cbStatusA.Checked                :=false;
  cbStatusO.Checked                :=false;
  // SearchJobService;
end;

procedure TfrReport.cbStatusOChange(Sender: TObject);
begin
 if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
     (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
     (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
     (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;
  // SearchJobService;
end;

procedure TfrReport.cbStatusAAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
 if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;
  // SearchJobService;
end;

procedure TfrReport.cbStatusPAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;

  //  SearchJobService;
end;

procedure TfrReport.cbStatusWCAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;

  // SearchJobService;
end;

procedure TfrReport.cbStatusFWAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;

  // SearchJobService;
end;

procedure TfrReport.cbStatusCAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;

  // SearchJobService;
end;

procedure TfrReport.cbStatusSAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
    begin
      cbAllStatus.Checked := True ;
    end
  else
    cbAllStatus.Checked := False ;
  // SearchJobService;
end;

procedure TfrReport.cbStatusWAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
 if ((cbStatusP.Checked = False) and (cbStatusW.Checked = False)  and
      (cbStatusS.Checked = False) and (cbStatusWC.Checked = False) and
      (cbStatusFW.Checked = False)and (cbStatusC.Checked = False)  and
      (cbStatusA.Checked = False) and (cbStatusO.Checked = False)) then
  begin
       cbAllStatus.Checked := True ;
     end
  else
       cbAllStatus.Checked := False ;

    //    SearchJobService;
end;

procedure TfrReport.displayGridReportCellClick(ASender: TObject; const ARow,
  AColumn: Integer);
  var strjobid:string;
begin

  if (AColumn=4) and (ARow>=0) then
    begin
      strjobid:= displayGridReport.Cell[Arow,AColumn].Text;
      Delete(strjobid,1,1);
      UserSession.jobid:=StrToInt(strjobid);
       TfrJobActivity.Create(self).Show;
    end;


end;

procedure TfrReport.displayGridReportRenderCell(ACell: TIWGridCell; const ARow,
  AColumn: Integer);
begin
with acell do
  begin
    if (ARow>0) and (ARow<displayGridReport.RowCount-1) then
      begin
        bgcolor:= StringToIWColor(displayGridReport.Cell[ARow, 13].Text);
      end;
  end;
end;

procedure TfrReport.edBeginDateAsyncDayChange(Sender: TObject;
  EventParams: TStringList);
begin
  cbAllDate.Checked:=false;
end;

procedure TfrReport.edDueDateAsyncDayChange(Sender: TObject;
  EventParams: TStringList);
begin
  cbAllDueDate.Checked:=false;
end;

procedure TfrReport.IWAppFormCreate(Sender: TObject);
begin
  mark := false;
  lbNameUser.Caption := '('+UserSession.ActiveEmployeeCode+')';
end;

procedure TfrReport.IWAppFormShow(Sender: TObject);
begin
  LayoutMgr.Enabled := true;

  if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;

    qseverdate.Close;
    qseverdate.Open;

    edBeginDate.Date  := qSeverDate.FieldByName('ServerDate').AsDateTime;
    edEndDate.Date    := qSeverDate.FieldByName('ServerDate').AsDateTime;
    edDueDate.Date    := qSeverDate.FieldByName('ServerDate').AsDateTime;

  qSelectEmployee.Close ;
  qSelectEmployee.Open  ;
  TmpIndex := 0 ;
  I := -1 ;
  slJobEmployee.Items.Clear ;
  qSelectEmployee.First ;
  while (Not qSelectEmployee.Eof) do
    begin
      Inc(I) ;
        emp := qSelectEmployee.FieldByName('Code').AsString ;
        slJobEmployee.Items.Append(emp);
        qSelectEmployee.Next ;
    End;
  slJobEmployee.ItemIndex:=0;

    qSelectJobType.Close ;
    qSelectJobType.Open  ;
    TmpIndex := 0 ;
    I := -1 ;
    slJobType.Items.Clear ;
    qSelectJobType.First ;
  while (Not qSelectJobType.Eof) do
    begin
      Inc(I) ;
        JT := qSelectJobType.FieldByName('Description').AsString ;
        slJobType.Items.Append(JT);
        qSelectJobType.Next ;
    End;
     slJobType.ItemIndex:=0 ;

  qCheckCustomer.close ;
  qCheckCustomer.ParamByName('Id').AsInteger := UserSession.ActiveCustomerID ;
  qCheckCustomer.Open ;

  qCheckEmployee.close ;
  qCheckEmployee.ParamByName('Id').AsInteger := UserSession.ActiveEmployeeID ;
  qCheckEmployee.Open ;

   SearchJobService;
end;

procedure TfrReport.rdAllAsyncClick(Sender: TObject; EventParams: TStringList);
begin
    if rdAll.Checked = true then
    slJobEmployee.Enabled:=False;

    btSearchClick(self.btSearch);
end;

procedure TfrReport.rbAllJob1AsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
    // SearchJobService;
end;

procedure TfrReport.rdAllJobTypeAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if rdAllJobType.Checked = true then
  slJobType.Enabled := False;

//  btSearchClick(self.btSearch);
end;

procedure TfrReport.rdMyJobAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if rdMyJob.Checked = true then
  slJobEmployee.Enabled:=False;

//   SearchJobService;
end;

procedure TfrReport.rdEmployeeAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
    if (rdEmployee.Checked) then
    begin
    slJobEmployee.Enabled:=True;
    end;
    // SearchJobService;
end;

procedure TfrReport.rdJobTypeAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
    if (rdJobType.Checked) then
    begin
    slJobType.Enabled := true;
    end;
    // SearchJobService;
end;

procedure tfrReport.SearchJobService ;
     var hd,q,z:integer;
     sumC,sumHr:Double;
     w,jid:string;
begin
  displayGridReport.Hide;
  q := 0;

  qEmployeeID.Close ;
  qEmployeeID.ParamByName('Code').AsString := slJobEmployee.Text  ;
  qEmployeeID.Open ;

  qJobTypeID.Close ;
  qJobTypeID.ParamByName('Description').AsString := slJobType.Text  ;
  qJobTypeID.Open ;

  IWLabel1.Caption := inttostr(qJobTypeID.FieldByName('id').AsInteger);

  qJobService.Close ;
  if (cbAllDate.Checked) then
    begin
      qJobService.ParamByName('AllDate').AsString := '***ALL***';
    end
  else
    begin
      qJobService.ParamByName('AllDate').AsString := '';
      qJobService.ParamByName('BeginDate').AsDateTime := edBeginDate.Date ;
      qJobService.ParamByName('EndDate').AsDateTime   := edEndDate.Date ;
    end;
  if (cbAllStatus.Checked = True) then
    begin
      qJobService.ParamByName('JobStatus').AsString   := '***ALL***'  ;
      qJobService.ParamByName('JobStatusW').AsString   := '' ;
      qJobService.ParamByName('JobStatusS').AsString   := '' ;
      qJobService.ParamByName('JobStatusWC').AsString  := '' ;
      qJobService.ParamByName('JobStatusFW').AsString  := '' ;
      qJobService.ParamByName('JobStatusC').AsString   := '' ;
      qJobService.ParamByName('JobStatusA').AsString   := '' ;
    end
  else
    begin
      qJobService.ParamByName('JobStatus').AsString := '';
      if (cbStatusP.Checked = True) then
        qJobService.ParamByName('JobStatusP').AsString   := '00'
      else
        qJobService.ParamByName('JobStatusP').AsString := '';
      if (cbStatusW.Checked = True) then
        qJobService.ParamByName('JobStatusW').AsString   := '01'
      else
        qJobService.ParamByName('JobStatusW').AsString := '';
      if (cbStatusO.Checked = True) then
        qJobService.ParamByName('JobStatusO').AsString   := '02'
      else
        qJobService.ParamByName('JobStatusO').AsString := '';
      if (cbStatusS.Checked = True) then
        qJobService.ParamByName('JobStatusS').AsString   := '04'
      else
        qJobService.ParamByName('JobStatusS').IsNull;
      if (cbStatusWC.Checked = True) then
        qJobService.ParamByName('JobStatusWC').AsString  := '05'
      else
        qJobService.ParamByName('JobStatusWC').AsString := '';
      if (cbStatusFW.Checked = True) then
        qJobService.ParamByName('JobStatusFW').AsString  := '06'
      else
        qJobService.ParamByName('JobStatusFW').AsString := '';
      if (cbStatusC.Checked = True) then
        qJobService.ParamByName('JobStatusC').AsString   := '08'
      else
        qJobService.ParamByName('JobStatusC').AsString := '';
      if (cbStatusA.Checked = True) then
        qJobService.ParamByName('JobStatusA').AsString   := '07'
      else
        qJobService.ParamByName('JobStatusA').AsString := '';
    end;
  if (Not qCheckCustomer.IsEmpty) then
    begin

      qJobService.ParamByName('Customer').AsInteger   := UserSession.ActiveCustomerID ;
      qJobService.ParamByName('Employee').AsInteger   := 0 ;
      qJobService.ParamByName('JobType').AsInteger    := 0 ;
      qJobService.ParamByName('Urgent').AsString      := '***ALL***' ;
    end
  else if (Not qCheckEmployee.IsEmpty) then
    begin

      qJobService.ParamByName('Customer').AsInteger     := 0 ;
      if (rdMyJob.Checked = True) then
        qJobService.ParamByName('Employee').AsInteger   := UserSession.ActiveEmployeeID
      else if (rdEmployee.Checked = True) then
        qJobService.ParamByName('Employee').AsInteger   := qEmployeeID.FieldByName('Id').AsInteger
      else
        qJobService.ParamByName('Employee').AsInteger   := 0 ;


      if (rdAllJobType.Checked = True) then
        qJobService.ParamByName('JobType').AsInteger    := 0
      else
        qJobService.ParamByName('JobType').AsInteger    := qJobTypeID.FieldByName('Id').AsInteger;

      if (rdUrgent.Checked = True) then
        qJobService.ParamByName('Urgent').AsString   := 'Y'
      else if (rdNoUrgent.Checked = True) then
        qJobService.ParamByName('Urgent').AsString   := 'N'
      else
        qJobService.ParamByName('Urgent').AsString   := '***ALL***' ;

    end;
  if (cbAllDueDate.Checked = True) then
    begin
      qJobService.ParamByName('AllDueDate').AsString := '***ALL***';
    end
  else
    begin
      qJobService.ParamByName('AllDueDate').AsString := '';
      qJobService.ParamByName('JobDueDate').AsDateTime := edDueDate.Date ;
    end;
  qJobService.ParamByName('Search').AsString := '%'+Trim(edSearch.text)+'%' ;
  qJobService.Open  ;

  if not qjobservice.IsEmpty then
    begin
      DisplayGridReport.Clear ;
      DisplayGridReport.ColumnCount := qJobService.FieldCount-9;
      DisplayGridReport.RowCount    := 1 ;
      with displayGridReport do
        begin

             // Loop Header
              for hd := 0 to qJobService.FieldCount-10 do
                begin
                  with Cell[0, hd] do
                    begin
                      Text  := qJobService.Fields[hd].FieldName;
                      if (qJobService.Fields[hd].FieldName = 'ColorStatus') then
                        begin
                          Visible := False;
                        end;
                    end;
                end;
             //Loop Detail
             qJobService.DisableControls;
              qJobService.First;
              sumC:=0;
              SumHr:=0;

          while (Not qJobService.Eof) do
            begin
              displayGridReport.RowCount := displayGridReport.RowCount + 1 ;
              for hd := 0 to qJobService.FieldCount-10 do
                begin
                  with Cell[displayGridReport.RowCount-1,hd] do
                    begin
                    if qJobService.Fields[hd].IsNull then
                      begin
                        text:= '';
                      end
                    else
                      begin
                        Text := qJobService.Fields[hd].Value;
                      end;

                     if sametext('เลขที่Job',qJobService.Fields[hd].FieldName) then
                        begin
                          Clickable:=true;
                        end;

                      if sametext('มูลค่างาน',qJobService.Fields[hd].FieldName) then
                        begin
                          Alignment := taRightJustify;
                          sumc:=sumc+StrToFloat(text);
                        end;

                      if sametext('ควรทำ(ชม.)',qJobService.Fields[hd].FieldName) then
                       begin
                         Alignment := taRightJustify;
                         sumHr:=SumHr+StrToFloat(text);
                       end;

                      if (qJobService.Fields[hd].FieldName = 'ColorStatus') then
                        begin
                          Visible := False;
                        end;

                    end;

                end;

              qJobService.Next ;

             end;
          qJobService.First;
          qJobService.EnableControls;

          displayGridReport.RowCount := displayGridReport.RowCount + 1 ;
          //Footer
          for z := 0 to qJobService.FieldCount-10 do
            begin
              with Cell[displayGridReport.RowCount-1,z] do
                begin
                  if (SameText('มูลค่างาน',qJobService.Fields[z].FieldName)) then
                  begin
                    Text      := FloatToStr(SumC);
                    Alignment := taRightJustify;
                  end;
                  if (SameText('ควรทำ(ชม.)',qJobService.Fields[z].FieldName)) then
                  begin
                    Text      := FloatToStr(sumHr);
                    Alignment := taRightJustify;
                  end;

                end;
            end;
       end;
       displayGridReport.Show;
       displayGridReport.RefreshAsyncRender;
    end;
end;


end.
