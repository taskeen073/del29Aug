unit uFAQ;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompGrids, IWDBGrids, IWCompLabel, Vcl.Imaging.pngimage, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, Data.DB, VirtualTable, MemDS,
  DBAccess, Uni;

type
  Tfrfaq = class(TIWAppForm)
    imgBack: TIWImage;
    imgAdd: TIWImage;
    imgFaqSrc: TIWImage;
    lbNameFaq: TIWLabel;
    DisplayGridFaqsrc: TIWDBGrid;
    edForsrc: TIWEdit;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    qfaqsrc: TUniQuery;
    dfaqsrc: TUniDataSource;
    procedure imgBackClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure imgAddClick(Sender: TObject);
    procedure imgFaqSrcClick(Sender: TObject);
    procedure IWDBGridfaqsrcColumns2AsyncClick(Sender: TObject;
      EventParams: TStringList; const AData: string);
    procedure IWAppFormShow(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses uMenu, ServerController, UserSessionUnit, uLogin,ufAQDetail;


procedure Tfrfaq.IWAppFormCreate(Sender: TObject);
begin
layoutmgr.Enabled:=true;
if (Not Usersession.db.Connected) then
    Begin
      Usersession.db.Close ;
      Usersession.db.Open  ;
    End;
  imgFaqSrcClick(self);
end;



procedure Tfrfaq.IWAppFormShow(Sender: TObject);
begin
imgFaqSrcClick(self);
end;

procedure Tfrfaq.imgBackClick(Sender: TObject);
begin
  release;
end;

procedure Tfrfaq.IWDBGridfaqsrcColumns2AsyncClick(Sender: TObject;
  EventParams: TStringList; const AData: string);
begin
  UserSession.faqid:=strtoint(adata);
  release;
  Tfrfaqdetail.Create(self).Show;
end;

procedure Tfrfaq.imgAddClick(Sender: TObject);
begin
  UserSession.faqid:=0;
  Release;
  tfrfaqdetail.Create(self).Show;
end;

procedure Tfrfaq.imgFaqSrcClick(Sender: TObject);
begin
  qFAQsrc.Close;
  qFAQsrc.ParamByName('search').AsString := '%'+edforsrc.text+'%' ;
  qFAQsrc.Open ;
end;
end.
