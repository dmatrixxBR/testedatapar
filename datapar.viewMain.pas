unit datapar.viewMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.ImageList,
  Vcl.ImgList,
  System.Actions,
  Vcl.ActnList,
  Vcl.ComCtrls,
  Vcl.ToolWin,
  Vcl.Menus;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Financiamento1: TMenuItem;
    Simular1: TMenuItem;
    Sair1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    actSimulaFinanciamento: TAction;
    actFecharForm: TAction;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    procedure actFecharFormExecute(Sender: TObject);
    procedure actSimulaFinanciamentoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}
  uses datapar.simulaFinanc;

procedure TfrmMain.actFecharFormExecute(Sender: TObject);
begin
FrmMain.Close;
end;

procedure TfrmMain.actSimulaFinanciamentoExecute(Sender: TObject);
var
  FormFinanciamento: TForm;
begin
  FormFinanciamento := TfrmSimulacao.Create(Application);
end;

end.
