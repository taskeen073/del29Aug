unit uScheduledetail;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompEdit, Data.DB, MemDS, DBAccess, Uni;

type
  Tfrscheduledetail = class(TIWAppForm)
    scheduleback: TIWButton;
    UniQuery1: TUniQuery;
    IWEdit1: TIWEdit;
    IWEdit2: TIWEdit;
    qfndcus: TUniQuery;
    procedure schedulebackClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, uSchedule, UserSessionUnit;


procedure Tfrscheduledetail.IWAppFormCreate(Sender: TObject);
begin

if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;
  UniQuery1.Close;
  UniQuery1.ParamByName('id').AsInteger :=UserSession.jobid ;
  uniquery1.Open;
          IWEdit1.text:=UniQuery1.FieldByName('customer').AsString;
          qfndcus.Close;
          qfndcus.ParamByName('id').AsInteger:=UniQuery1.FieldByName('customer').AsInteger;
          qfndcus.Open;
          IWEdit2.Text:=qfndcus.FieldByName('name').AsString;
end;

procedure Tfrscheduledetail.schedulebackClick(Sender: TObject);
begin
  Release;
end;

end.
