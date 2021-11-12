unit datapar.model.simulaFinanc;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Uitypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Grids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  datapar.Classes.financiamento,
  datapar.controller.financiamento;

type
  TfrmModeloSimula = class(TForm)
    edtMeses: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    btCalcular: TButton;
    edtJuros: TEdit;
    edtCapital: TEdit;
    stBar: TStatusBar;
    procedure edtCapitalChange(Sender: TObject);
    procedure edtCapitalExit(Sender: TObject);
    procedure edtJurosExit(Sender: TObject);
    procedure edtCapitalEnter(Sender: TObject);
    procedure edtMesesExit(Sender: TObject);
    procedure edtJurosEnter(Sender: TObject);
    procedure edtMesesEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCalcularClick(Sender: TObject);
    procedure edtCapitalKeyPress(Sender: TObject; var Key: Char);
    procedure edtJurosKeyPress(Sender: TObject; var Key: Char);
    procedure edtMesesKeyPress(Sender: TObject; var Key: Char);
    procedure edtCapitalMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtJurosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtMesesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    function validaValor(Campo: TEdit): Boolean;
    procedure limpabar;
    procedure iniciaValores;
  public
    { Public declarations }
  end;

var
  frmModeloSimula: TfrmModeloSimula;
  financiamento: TFinanciamento;
  Controle: TControllerFinanciamento;

implementation

{$R *.dfm}

procedure TfrmModeloSimula.btCalcularClick(Sender: TObject);
begin
  try

    financiamento.Principal := strToFloat(edtCapital.Text);
    financiamento.TaxaJuros := strToFloat(edtJuros.Text);
    financiamento.Periodo := strToInt(edtMeses.Text);

    Controle.CalculaJuros(financiamento);

    Controle.List(financiamento, StringGrid1);
  except
    On E: Exception do
    Begin
      messageDlg('Erro no procedimento - ' + E.Message, mtError, [mbOk], 0)
    End;

  end;

end;

procedure TfrmModeloSimula.edtCapitalChange(Sender: TObject);
begin
  btCalcular.Enabled := (trim(edtCapital.Text) <> '0.00') and
    (trim(edtCapital.Text) <> '') and (trim(edtJuros.Text) <> '0.00') and
    (trim(edtJuros.Text) <> '') and (trim(edtMeses.Text) <> '0') and
    (trim(edtMeses.Text) <> '');
end;

procedure TfrmModeloSimula.edtCapitalEnter(Sender: TObject);
begin
  stBar.Panels[0].Text :=
    'digite o valor desejado para contratar. O separador decimal ' +
    'deverá ser a vírgula. ';
end;

procedure TfrmModeloSimula.edtCapitalExit(Sender: TObject);
begin
  validaValor(edtCapital);
end;

procedure TfrmModeloSimula.edtCapitalKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
    edtJuros.SetFocus;

end;

procedure TfrmModeloSimula.edtCapitalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  stBar.Panels[0].Text :=
    'digite o valor desejado para contratar. O separador decimal ' +
    'deverá ser a vírgula. ';
end;

procedure TfrmModeloSimula.edtJurosEnter(Sender: TObject);
begin
  stBar.Panels[0].Text :=
    'digite o valor do juros a calcular. O separador decimal ' +
    'deverá ser a vírgula. Valor de juros deve ser positivo.';
end;

procedure TfrmModeloSimula.edtJurosExit(Sender: TObject);
begin
  validaValor(edtJuros);
end;

procedure TfrmModeloSimula.edtJurosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
    edtMeses.SetFocus;

end;

procedure TfrmModeloSimula.edtJurosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
stBar.Panels[0].Text :=
    'digite o valor do juros a calcular. O separador decimal ' +
    'deverá ser a vírgula. Valor de juros deve ser positivo.';
end;

procedure TfrmModeloSimula.edtMesesEnter(Sender: TObject);
begin
  stBar.Panels[0].Text :=
    'digite o número de Períodos para o cálculo do empréstimo.';
end;

procedure TfrmModeloSimula.edtMesesExit(Sender: TObject);
begin
  limpabar;
end;

procedure TfrmModeloSimula.edtMesesKeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(13) then btCalcular.SetFocus;

end;

procedure TfrmModeloSimula.edtMesesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
stBar.Panels[0].Text :=
    'digite o número de Períodos para o cálculo do empréstimo.';
end;

procedure TfrmModeloSimula.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  self := nil;
end;

procedure TfrmModeloSimula.FormCreate(Sender: TObject);
begin
  iniciaValores;
end;

procedure TfrmModeloSimula.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  limpabar;
end;

procedure TfrmModeloSimula.iniciaValores;
begin
  Controle := TControllerFinanciamento.Create;
  financiamento := TFinanciamento.Create;
  Controle.model := financiamento;

  edtCapital.Text := '0,00';
  edtJuros.Text := '0,00';
  edtMeses.Text := '0';
end;

procedure TfrmModeloSimula.limpabar;
begin
  stBar.Panels[0].Text := '';
end;

function TfrmModeloSimula.validaValor(Campo: TEdit): Boolean;
var
  TextOnEdit: UnicodeString;
  Value: Currency;
begin
  // result:=false;
  limpabar;
  TextOnEdit := Campo.Text;

  if TryStrToCurr(TextOnEdit, Value) then
  Begin
    Campo.Text := Format('%8.2f', [Value]);
    if Value < 0 then
    Begin
      showmessage('Valor deve ser positivo!');
      Campo.Text := '0,00';
    End;

  End
  else
  Begin
    Campo.Text := '0,00';

  End;

  result := trim(Campo.Text) <> '0,00';

end;

end.
