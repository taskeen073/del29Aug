unit uStasusdetail;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompButton,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompEdit;

type
  Tfrstatusdetail = class(TIWAppForm)
    IWEdit1: TIWEdit;
    IWEdit2: TIWEdit;
    IWButton1: TIWButton;
    procedure IWButton1Click(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit, uStatus;


procedure Tfrstatusdetail.IWAppFormCreate(Sender: TObject);
begin
if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;

end;

procedure Tfrstatusdetail.IWButton1Click(Sender: TObject);
begin
Release;
  Tfrstatusdetail.Create(self).Show;
end;

end.
