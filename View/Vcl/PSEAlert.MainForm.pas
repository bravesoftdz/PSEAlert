unit PSEAlert.MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList, System.UITypes, IOUtils, Vcl.Samples.Spin,
  PSE.Data.Model, Vcl.AppEvnts, Vcl.Buttons, System.Actions,
  Vcl.ActnList;

type
  TfrmMain = class(TForm)
    PageControl: TPageControl;
    tabWatchList: TTabSheet;
    tabIndeces: TTabSheet;
    tabAlerts: TTabSheet;
    StatusBar1: TStatusBar;
    scrollMyStocks: TScrollBox;
    tabAbout: TTabSheet;
    scrollIndeces: TScrollBox;
    ApplicationEvents1: TApplicationEvents;
    cmbAddStock: TComboBox;
    ImageList2: TImageList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList: TActionList;
    actRefresh: TAction;
    actAdd: TAction;
    btnAddStock: TButton;
    btnSort: TSpeedButton;
    actSortAsc: TAction;
    actSortDesc: TAction;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  JclDebug,
  PSEAlert.View.ExceptionDialog;


procedure TfrmMain.ApplicationEvents1Exception(Sender: TObject; E: Exception);
{$IFNDEF DEBUG}
var
  frm: TfrmException;
{$ENDIF}
begin
  MessageDlg(E.Message, mtError, [mbOk], 0);
{$IFNDEF DEBUG}
  frm := TfrmException.Create(nil);
  try
    JclDebug.JclStackTrackingOptions := [stStack, stRawMode];
    JclLastExceptStackListToStrings(frm.memException.Lines,true,true,true,true);
    frm.ShowModal;
  finally
    frm.Free;
  end;
{$ENDIF}

end;

initialization
  Include(JclStackTrackingOptions, stStack);
  // Enable raw mode (default mode uses stack frames which aren't always generated by the compiler)
  Include(JclStackTrackingOptions, stRawMode);
  // Disable stack tracking in dynamically loaded modules (it makes stack tracking code a bit faster)
  Include(JclStackTrackingOptions, stStaticModuleList);

  JclStartExceptionTracking;

finalization
  JclStopExceptionTracking;


end.
