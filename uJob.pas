unit uJob;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompButton, IWCompListbox, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, Vcl.Imaging.pngimage,
  IWCompExtCtrls;

type
  TfrJob = class(TIWAppForm)
    IWlbmess: TIWLabel;
    IWlbcus: TIWLabel;
    IWlbfaq: TIWLabel;
    IWlbmessage: TIWLabel;
    IWComboBox1: TIWComboBox;
    IWComboBox2: TIWComboBox;
    IWbtsend: TIWButton;
    IWbtclear: TIWButton;
    IWEdmess: TIWEdit;
    IWLabel1: TIWLabel;
    IWimgback: TIWImage;
  public
  end;

implementation

{$R *.dfm}


end.
