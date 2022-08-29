unit uMessageDigest;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompExtCtrls,
  IWCompEdit, Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompGrids, IWDBGrids, Data.DB, DBAccess, Uni, MemDS,
  Vcl.Imaging.pngimage, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML, IWCompLabel,
  IWCompListbox;

type
  Tfrmessagediagest = class(TIWAppForm)
    DisplayGrid: TIWDBGrid;
    edInputMessage: TIWEdit;
    btSearch: TIWImage;
    qmessage: TUniQuery;
    unimessage: TUniDataSource;
    btBack: TIWImage;
    btAdd: TIWImage;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    lbMessageDigest: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure btAddClick(Sender: TObject);
    procedure btBackClick(Sender: TObject);
    procedure IWDBGrid1Columns0AsyncClick(Sender: TObject;
      EventParams: TStringList; const AData: string);
    procedure btSearchClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, UserSessionUnit, uMenu, uMessageDeatail;

procedure Tfrmessagediagest.IWAppFormCreate(Sender: TObject);
begin
if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End ;
    btSearchClick(self);
    qmessage.Close;
    qmessage.open;
    layoutmgr.Enabled:=true;

end;

procedure Tfrmessagediagest.btBackClick(Sender: TObject);
begin
  Release;
end;

procedure Tfrmessagediagest.btSearchClick(Sender: TObject);
begin
  qmessage.Close;
  qmessage.ParamByName('mess').AsString := '%'+edInputmessage.text+'%' ;
  qmessage.open;

end;

procedure Tfrmessagediagest.IWDBGrid1Columns0AsyncClick(Sender: TObject;
  EventParams: TStringList; const AData: string);
begin
  usersession.areyouupdate:=1;
  UserSession.messageid:=strtoint(adata);
  Release;
  tfrmessagedetail.create(self).show;
end;

procedure Tfrmessagediagest.btAddClick(Sender: TObject);
begin
  usersession.areyouupdate:=0;
  Release;
  tfrmessagedetail.create(self).show;
end;
end.
