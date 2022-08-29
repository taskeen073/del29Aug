unit uStatus;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  Vcl.Imaging.pngimage, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompGrids, IWDBGrids, Data.DB, DBAccess, Uni, MemDS,
  VirtualTable, Vcl.Dialogs, IWCompLabel,
  IWCompEdit;

type
  Tfrstastusversion = class(TIWAppForm)
    btBack: TIWImage;
    btSearch: TIWButton;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    qcustomer: TUniQuery;
    DisplayGrid_o: TIWDBGrid;
    qforcon: TUniQuery;
    UniDataSource1: TUniDataSource;
    VirtualTable1: TVirtualTable;
    btExport: TIWButton;
    FileSaveDialog1: TFileSaveDialog;
    lbStatus: TIWLabel;
    DisplayGrid: TIWGrid;
    qCustomerId: TUniQuery;
    qUpdateVersion: TUniQuery;
    procedure btBackClick(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure btExportClick(Sender: TObject);
    procedure DisplayGridCellClick(ASender: TObject; const ARow,
      AColumn: Integer);
  public
  i : Integer;
  IdCustomer : Integer;
  procedure runexportforlastvertion;
  procedure UpdateNameClick(ASender: TObject);
  end;

implementation

{$R *.dfm}

uses uMenu, ServerController, UserSessionUnit;

procedure Tfrstastusversion.btBackClick(Sender: TObject);
begin
  release;
end;

procedure Tfrstastusversion.IWAppFormCreate(Sender: TObject);
begin
  btSearchClick(self);
  layoutmgr.Enabled:=true;
end;

procedure Tfrstastusversion.btSearchClick(Sender: TObject);
Var I : Integer;
begin
  if (Not UserSession.DB.Connected) then
    begin
      UserSession.DB.close;
      usersession.db.Database := 'sbcservice';
      UserSession.DB.open;
    end;

  virtualtable1.close;
  virtualtable1.open;
  virtualtable1.first;
  while (not virtualtable1.eof) do
    virtualtable1.Delete;

  qcustomer.Close;
  qcustomer.Open;
  if (not qcustomer.isempty) then
    begin
      qcustomer.First;
      while (not qcustomer.eof) do
        begin
          usersession.config.Close;
          usersession.config.server   := trim(qcustomer.FieldByName('serverip').AsString);
          usersession.config.port     := strtoint(qcustomer.FieldByName('serversqlport').AsString);
          usersession.config.database := trim(qcustomer.FieldByName('sbc_config_name').AsString);
          usersession.config.Open;
          if (usersession.config.Connected) then
            begin
              qforcon.Close;
              qforcon.Open;
              if (Not qforcon.IsEmpty) then
                begin
                  virtualtable1.Append;
                  virtualtable1.FieldByName('code').asstring        := trim(qcustomer.FieldByName('code').asstring);
                  virtualtable1.FieldByName('lastversion').asstring := trim(qforcon.FieldByName('lastversion').AsString);
                  virtualtable1.FieldByName('ConfirmEdit').AsString := '';
                  virtualtable1.FieldByName('name').asstring        := trim(qcustomer.FieldByName('name').AsString);
                  virtualtable1.FieldByName('serverip').AsString    := trim(qcustomer.FieldByName('serverip').asstring);
                  virtualtable1.FieldByName('IdCustomer').AsInteger := qcustomer.FieldByName('Id').AsInteger;
                  virtualtable1.Post;
                end;
            end;
          qcustomer.next;

        end;
      if (Not virtualtable1.IsEmpty) then
        begin
          DisplayGrid.Clear ;
          DisplayGrid.ColumnCount := virtualtable1.FieldCount;
          DisplayGrid.RowCount    := 1 ;
          with DisplayGrid do
           begin
             // Loop Header
              for I := 0 to virtualtable1.FieldCount-1 do
                begin
                  with Cell[0, I] do
                    begin
                      Text  := virtualtable1.Fields[I].FieldName;
                    end;
                end;
             //Loop Detail
              virtualtable1.First;
              while (Not virtualtable1.Eof) do
                begin
                  DisplayGrid.RowCount := DisplayGrid.RowCount + 1 ;
                  for I := 0 to virtualtable1.FieldCount-1 do
                    begin
                      with Cell[DisplayGrid.RowCount-1,I] do
                        begin
                          //Edit ที่ Field ใช้ไป(QuantityUse) Type Float ได้
                          if (SameText('lastversion',virtualtable1.Fields[I].FieldName)) then
                            begin
                              //Click เฉพาะ Column Code
                              Clickable := True;
                              Text      := virtualtable1.Fields[I].Value;
                            end
                          else
                            Text := virtualtable1.Fields[I].Value;
                        end;
                    end;

                  virtualtable1.Next ;
                end;
           end;
        end;
    end;
  btExport.Visible := False;
end;

procedure Tfrstastusversion.DisplayGridCellClick(ASender: TObject; const ARow,
  AColumn: Integer);
var
  LButton: TIWButton;
  LEdit: TIWEdit;
begin
  if AColumn = 2 then
    begin
      // Create an edit box
      LEdit := TIWEdit.Create(Self);
      // Set the cell's control property
      DisplayGrid.Cell[ARow, AColumn].Control := LEdit;
      // Get cell value
      LEdit.Text := DisplayGrid.Cell[ARow, AColumn].Text;
      // Clear the cell text because the edit will display it.
      DisplayGrid.Cell[ARow, AColumn].Text := '';

      LButton := TIWButton.Create(Self);
      DisplayGrid.Cell[ARow, 3].Control := LButton;
      // Use the tag to record which row the button is in
      LButton.Tag     := ARow;
      LButton.Caption := 'Done';
      LButton.OnClick := UpdateNameClick;
    end;
end;

//คำสั่งยืนยันการแก้ไขทำงาน
procedure Tfrstastusversion.UpdateNameClick(ASender: TObject);
var
  LButton: TIWButton;
  LEdit: TIWEdit;

  SaveOk : Boolean;
begin
  IdCustomer := 0;
  LButton := ASender as TIWButton;
  LEdit   := DisplayGrid.Cell[LButton.Tag, 2].Control as TIWEdit;
  // Update and free edit
  with DisplayGrid.Cell[LButton.Tag, 2] do
    begin
      Text    := LEdit.Text;
      IdCustomer := StrToInt(DisplayGrid.Cell[LButton.Tag, 0].Text);
      if (Text = '') and (IdCustomer > 0) then
        begin
          WebApplication.ShowMessage('กรุณาป้อน lastversion');
        end
      else                                                                                                                                if (IdCustomer > 0) then
        begin
          SaveOk := False;
          qCustomerId.Close;
          qCustomerId.ParamByName('IdCustomer').AsInteger := IdCustomer;
          qCustomerId.Open;
          if (Not qCustomerId.IsEmpty) then
            begin
              usersession.config.Close;
              usersession.config.server   := trim(qCustomerId.FieldByName('serverip').AsString);
              usersession.config.port     := strtoint(qCustomerId.FieldByName('serversqlport').AsString);
              usersession.config.database := trim(qCustomerId.FieldByName('sbc_config_name').AsString);
              usersession.config.Open;

              //WebApplication.ShowMessage(trim(qCustomerId.FieldByName('serverip').AsString));
              SaveOk := False;
              UserSession.config.StartTransaction;
              Try
                qUpdateVersion.Close;
                qUpdateVersion.SQL.Clear;
                qUpdateVersion.SQL.Text :=
                'Update softwareconfig '+
                'Set lastversion = :lastversion ';
                qUpdateVersion.ParamByName('lastversion').AsString := Trim(Text);
                qUpdateVersion.ExecSQL;

                UserSession.config.Commit;
                SaveOk := True;
              Except on E : Exception do
                begin
                  UserSession.config.Rollback;
                  SaveOk := False;
                  WebApplication.ShowMessage('Update Error : '+E.Message);
                end;
              End;
              if (SaveOk) then
                WebApplication.ShowMessage('บันทึกข้อมูลเรียบร้อย');
            end
          else
            WebApplication.ShowMessage('ไม่พบข้อมูล');
          Control := nil;
        end;
    end;
  if (LEdit.Text <> '') then
    begin
      LEdit.Free;
      // Hide button
      DisplayGrid.Cell[LButton.Tag, 1].Control := nil;
      LButton.Free;
    end;
end;

procedure Tfrstastusversion.btExportClick(Sender: TObject);
begin
  runexportforlastvertion;
end;


procedure Tfrstastusversion.runexportforlastvertion;
var txt     : TextFile;
    Str,Row,Name : string;
    i            : integer;
    PathCSV      : String;
    PathDowloads : String;
    DeleteStr    : String;
    PosPath      : Integer ;
    URL          : String;
    mytext: TStringlist;
begin
  (*
 filesavedialog1.FileName := 'statuslast('+FormatDateTime('yyyy-MM-dd_hh-nn-ss' ,(Now))+').csv';
 Mytext :=TStringlist.Create;
 try
  Str := '';
    for i:= 0 to DisplayGrid.Columns.Count-1 do
      begin
        Str := Str+TIWDBGridColumn(DisplayGrid.Columns.Items[i]).Title.Text+',';
      end;
    Delete(Str,Length(Str),1);
   mytext.Add(str);
   Mytext.savetofile('wwwroot\statuslast\'+filesavedialog1.FileName,tencoding.UTF8);
    VirtualTable1.DisableControls;
    VirtualTable1.First;
    while (Not VirtualTable1.Eof) do
      begin
        Row := '';
        for i:= 0 to DisplayGrid.Columns.Count-1 do
          begin
            Name := TIWDBGridColumn(DisplayGrid.Columns.Items[i]).DataField;
            Row  := Row+stringreplace(Trim(VirtualTable1.FieldByName(Name).AsString)
                  ,',',' ',[rfReplaceAll, rfIgnoreCase])+',';
           end;
        Delete(Row,Length(Row),1);
     mytext.Add(row);
      Mytext.savetofile('wwwroot\statuslast\'+filesavedialog1.FileName,tencoding.UTF8);
       VirtualTable1.Next;
      end;
    VirtualTable1.EnableControls;
    URL := 'http://127.0.0.1:8888'+'wwwroot'+'/statuslast/'+fileSaveDialog1.FileName+'.csv';
    AddToInitProc('window.open(''' + URL + ''', '''', '''');');
 finally
  mytext.Free;
 end;
 *)
end;


end.
