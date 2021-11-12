unit untModelSimula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

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
    procedure edtCapitalChange(Sender: TObject);
    procedure edtCapitalExit(Sender: TObject);
    procedure edtJurosExit(Sender: TObject);
  private
    { Private declarations }
    function validaValor(Campo: TEdit):Boolean;
  public
    { Public declarations }
  end;

var
  frmModeloSimula: TfrmModeloSimula;

implementation

{$R *.dfm}

procedure TfrmModeloSimula.edtCapitalChange(Sender: TObject);
begin
btCalcular.Enabled := (trim(edtCapital.Text) <> '' )and
                      (trim(edtJuros.Text) <> '')   and
                      (trim(edtMeses.Text) <> '');
end;

procedure TfrmModeloSimula.edtCapitalExit(Sender: TObject);
begin
validaValor(edtCapital);
end;

procedure TfrmModeloSimula.edtJurosExit(Sender: TObject);
begin
validaValor(edtJuros);
end;

function TfrmModeloSimula.validaValor(Campo: TEdit): Boolean;
var
     TextOnEdit: UnicodeString;
      Value: Currency;
begin

   TextOnEdit := Campo.Text;

     if TryStrToCurr(TextOnEdit, Value) then
       Begin
           Campo.Text := FormatFloat('#.##', Value)
       End
     else
       Begin
           Campo.Text := '0,00';

       End;
   result := Campo.Text <> '0,00';

end;

end.
