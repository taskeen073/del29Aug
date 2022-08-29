unit uSchedule;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompListbox, IWCompGrids, IWDBGrids, IWCompButton, IWCompLabel,
  Vcl.Imaging.pngimage, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Data.DB, DBAccess, Uni, MemDS, IWTMSCtrls,
  IWDBTMSCtrls, IWDBStdCtrls, VirtualTable, IWTMSCal, Vcl.Dialogs;

type
  Tfrschedule = class(TIWAppForm)
    btBack: TIWImage;
    btSearch: TIWImage;
    lbEmployee: TIWLabel;
    lbMonth: TIWLabel;
    lbYear: TIWLabel;
    lbNameSchedule: TIWLabel;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    DisplayGrid: TIWDBGrid;
    slEmployee: TIWDBLookupComboBox;
    edMonth: TIWEdit;
    edYear: TIWEdit;
    qsrc: TUniQuery;
    dsrc: TUniDataSource;
    qemp: TUniQuery;
    uniemp: TUniDataSource;
    btExport: TIWButton;
    SaveDialog1: TFileSaveDialog;
    procedure btBackClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure btExportClick(Sender: TObject);
    procedure IWDBGrid1Columns1AsyncClick(Sender: TObject;
      EventParams: TStringList; const AData: string);

  public
  i : Integer;
  procedure runexport;

  end;

implementation

{$R *.dfm}

uses uMenu, ServerController, UserSessionUnit, uStasusdetail, uScheduledetail;


procedure TfrSchedule.RunExport ;
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
 savedialog1.FileName := 'schedule('+FormatDateTime('yyyy-dd-mm_hh-nn-ss' ,(Now))+').csv';
 Mytext :=TStringlist.Create;
 try
  Str := '';
    for i:= 0 to DisplayGrid.Columns.Count-1 do
      begin
        Str := Str+TIWDBGridColumn(DisplayGrid.Columns.Items[i]).Title.Text+',';
      end;

    Delete(Str,Length(Str),1);
   mytext.Add(str);
   Mytext.savetofile('wwwroot\schedule\'+savedialog1.FileName,tencoding.UTF8);


    qsrc.DisableControls;
    qsrc.First;
    while (Not qsrc.Eof) do
      begin
        Row := '';
        for i:= 0 to DisplayGrid.Columns.Count-1 do
          begin
            Name := TIWDBGridColumn(DisplayGrid.Columns.Items[i]).DataField;
            Row  := Row+stringreplace(Trim(qsrc.FieldByName(Name).AsString)
                  ,',',' ',[rfReplaceAll, rfIgnoreCase])+',';
          end;

        Delete(Row,Length(Row),1);
     mytext.Add(row);
      Mytext.savetofile('wwwroot\schedule\'+savedialog1.FileName,tencoding.UTF8);
       qsrc.Next;
      end;
    qsrc.EnableControls;
    URL := 'http://127.0.0.1:8888'+'wwwroot'+'/schedule/'+SaveDialog1.FileName+'.csv';
    AddToInitProc('window.open(''' + URL + ''', '''', '''');');

 finally
  mytext.Free;
 end;
 end;

procedure Tfrschedule.btExportClick(Sender: TObject);
begin
runexport();
end;

procedure Tfrschedule.IWAppFormCreate(Sender: TObject);
var y,m,d:word;
begin
  DecodeDate(NOW,y,m,d);
  edYear.asinteger:=y;
  edMonth.asinteger:=m;

  layoutmgr.Enabled:=true;

if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;

  qemp.Close;
  qemp.open;
  DisplayGrid.Visible := True;

end;

procedure Tfrschedule.IWDBGrid1Columns1AsyncClick(Sender: TObject;
  EventParams: TStringList; const AData: string);
begin
  UserSession.jobid:=(strtoint(aData));
  Tfrscheduledetail.Create(self).Show;
end;

procedure Tfrschedule.btBackClick(Sender: TObject);
begin
  release;
end;

procedure Tfrschedule.btSearchClick(Sender: TObject);
begin
  qsrc.Close;
    qsrc.ParamByName('Month').AsInteger :=strtoint(edMonth.text) ;
    qsrc.ParamByName('Year').AsInteger := strtoint(edYear.text) ;
    qsrc.ParamByName('Employee').AsString := slEmployee.text ;
  qsrc.Open ;
end;
end.