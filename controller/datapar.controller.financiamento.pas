unit datapar.controller.financiamento;

interface

uses
  datapar.classes.financiamento,
  Vcl.Grids, Dialogs,
  system.sysUtils,
  system.Math;

type
  TControllerFinanciamento = class
  private
    FModel: TFinanciamento;
    procedure SetModel(const Value: TFinanciamento);
    procedure ajustaCabecalho(Grid: TStringGrid);
    procedure montaRodape(i: Integer; pagamento: Double; Acumulado: Double;
      Grid: TStringGrid; vFinanciamento: TFinanciamento);
  public
    procedure New;
    function List(vFinanciamento: TFinanciamento; Grid: TStringGrid): Boolean;
    property Model: TFinanciamento read FModel write SetModel;
    class procedure CalculaJuros(var vFinanciamento: TFinanciamento);
  end;

implementation

uses
  system.Generics.Collections;

{ TControllerFinanciamento }

class procedure TControllerFinanciamento.CalculaJuros(var vFinanciamento
  : TFinanciamento);
var
  i: Integer;
  aux, valorMontante, taxaJuros, valorJuros, valorPrincipal: Double;
begin

  aux := 0;
  valorPrincipal := vFinanciamento.Principal;
  taxaJuros := vFinanciamento.taxaJuros;
  vFinanciamento.Parcelas.Clear;

  for i := 0 to vFinanciamento.Periodo do
  begin

    valorMontante := valorPrincipal * power((1 + (taxaJuros / 100)), i);
    valorJuros := valorMontante - valorPrincipal - aux;

    aux := aux + valorJuros;

    vFinanciamento.Parcelas.Add(TParcela.Create);
    vFinanciamento.Parcelas[i].Periodo := i;
    vFinanciamento.Parcelas[i].Principal := valorPrincipal;
    vFinanciamento.Parcelas[i].Juros := valorJuros;
    vFinanciamento.Parcelas[i].Montante := valorMontante;
    vFinanciamento.Parcelas[i].Acumulado := aux;


  end;

end;

procedure TControllerFinanciamento.montaRodape(i: Integer; pagamento: Double;
  Acumulado: Double; Grid: TStringGrid; vFinanciamento: TFinanciamento);
begin
  Grid.RowCount := Grid.RowCount + 1;
  Grid.Cells[1, i + 1] := 'TOTAIS';
  Grid.Cells[2, i + 1] := format('%8.2m', [Acumulado]);
  Grid.Cells[3, i + 1] := format('%8.2m', [vFinanciamento.Principal]);
  Grid.Cells[4, i + 1] := format('%8.2m', [pagamento]);
  Grid.Cells[5, i + 1] := '';
end;

procedure TControllerFinanciamento.ajustaCabecalho(Grid: TStringGrid);
begin
  Grid.Cells[1, 0] := 'Periodo';
  Grid.ColWidths[1] := 100;
  Grid.Cells[2, 0] := 'Juros';
  Grid.ColWidths[2] := 100;
  Grid.Cells[3, 0] := 'Amortização';
  Grid.ColWidths[3] := 130;
  Grid.Cells[4, 0] := 'Pagamento';
  Grid.ColWidths[4] := 100;
  Grid.Cells[5, 0] := 'Saldo Devedor';
  Grid.ColWidths[5] := 100;
end;

function TControllerFinanciamento.List(vFinanciamento: TFinanciamento;
  Grid: TStringGrid): Boolean;
var
  i: Integer;
  pagamento, Acumulado: Double;
begin

  result := false;
  i := 0;
  pagamento := 0;
  Acumulado := 0;

  repeat

    Grid.RowCount := Grid.RowCount + 1;
    if (i = 0) then
    Begin
      ajustaCabecalho(Grid);
      Grid.Cells[1, i + 1] := intToStr(vFinanciamento.Parcelas[i].Periodo);
      Grid.Cells[2, i + 1] :=
        format('%8.2m', [vFinanciamento.Parcelas[i].Juros]);
      Grid.Cells[3, i + 1] := 'R$ 0,00';
      Grid.Cells[4, i + 1] := 'R$ 0,00';
      Grid.Cells[5, i + 1] :=
        format('%8.2m', [(vFinanciamento.Parcelas[i].Principal)]);
    End
    else if (i = FModel.Parcelas.Count - 1) then
    Begin
      Grid.Cells[1, i + 1] := intToStr(vFinanciamento.Parcelas[i].Periodo);
      Grid.Cells[2, i + 1] :=
        format('%8.2m', [vFinanciamento.Parcelas[i].Juros]);
      Grid.Cells[3, i + 1] :=
        format('%8.2m', [vFinanciamento.Parcelas[i].Principal]);
      Grid.Cells[4, i + 1] :=
        format('%8.2m',
        [(vFinanciamento.Parcelas[i].Principal + vFinanciamento.Parcelas[i]
        .Acumulado)]);
      Grid.Cells[5, i + 1] := 'R$ 0,00';
      pagamento := vFinanciamento.Parcelas[i].Principal +
        vFinanciamento.Parcelas[i].Acumulado;
      Acumulado := vFinanciamento.Parcelas[i].Acumulado;
    end
    else
    Begin
      Grid.Cells[1, i + 1] := intToStr(vFinanciamento.Parcelas[i].Periodo);
      Grid.Cells[2, i + 1] :=
        format('%8.2m', [vFinanciamento.Parcelas[i].Juros]);
      Grid.Cells[3, i + 1] := '';
      Grid.Cells[4, i + 1] := '';
      Grid.Cells[5, i + 1] :=
        format('%8.2m',
        [(vFinanciamento.Parcelas[i].Principal + vFinanciamento.Parcelas[i]
        .Acumulado)]);
    End;

    inc(i);
  until i = vFinanciamento.Parcelas.Count;
  montaRodape(i, pagamento, Acumulado, Grid, vFinanciamento);

End;

procedure TControllerFinanciamento.New;
begin
  FModel := TFinanciamento.Create;
end;

procedure TControllerFinanciamento.SetModel(const Value: TFinanciamento);
begin
  FModel := Value;
end;

end.
