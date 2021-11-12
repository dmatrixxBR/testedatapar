unit datapar.simulaFinanc;

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
  datapar.model.simulaFinanc,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Grids;

type
  TfrmSimulacao = class(TfrmModeloSimula)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimulacao: TfrmSimulacao;

implementation

{$R *.dfm}

end.
