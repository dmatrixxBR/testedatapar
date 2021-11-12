unit datapar.classes.financiamento;



interface

uses
      System.Generics.Collections,
      system.SysUtils;

type TParcela = class
{$M+}{$TYPEINFO ON}
private
    FMontante: double;
    FPeriodo     : Integer;
    FJuros   : double;
    FPrincipal : double;
    FAcumulado : double;
    procedure SetPrincipal(const Value: double);
    procedure SetJuros(const Value: double);
    procedure SetPeriodo(const Value: Integer);
    procedure SetMontante(const Value: double);
    procedure SetAcumulado(const Value: double);

published
  property Principal  : double read FPrincipal write SetPrincipal;
  property Acumulado  : double read FAcumulado write SetAcumulado;
  property Juros      : double read FJuros write SetJuros;
  property Montante   : double read FMontante write SetMontante;
  property Periodo    : Integer read FPeriodo write SetPeriodo;



end;


type TFinanciamento = class

private

    FPrincipal : double;
    FTaxaJuros     : double;
    FPeriodo   : Integer;
    FParcelas: TObjectList<TParcela>;
    procedure SetPrincipal(const Value: double);
    procedure SetJuros(const Value: double);
    procedure SetPeriodo(const Value: Integer);


public

    constructor Create;
    destructor Destroy; override;
    property Principal  : double read FPrincipal write SetPrincipal;
    property TaxaJuros      : double read FTaxaJuros write SetJuros;
    property Periodo    : Integer read FPeriodo write SetPeriodo;
    property Parcelas   : TObjectList<TParcela> read FParcelas write FParcelas;



end;



implementation


{ TParcela }
{$region 'Parcela' }
procedure TParcela.SetPrincipal(const Value: double);
begin
  FPrincipal := Value;
end;

procedure TParcela.SetJuros(const Value: double);
begin
  FJuros := Value;
end;

procedure TParcela.SetPeriodo(const Value: Integer);
begin
  FPeriodo := Value;
end;

procedure TParcela.SetMontante(const Value: double);
begin
  FMontante := Value;
end;

procedure TParcela.SetAcumulado(const Value: double);
begin
  FAcumulado := Value;
end;
{$endregion}

{ TFinanciamento }

{$region 'Financiamento'}



constructor TFinanciamento.Create;
begin
  FParcelas := TObjectList<TParcela>.Create;
end;

destructor TFinanciamento.Destroy;
begin
  FreeAndNil(Fparcelas);
  inherited;
end;

procedure TFinanciamento.SetPrincipal(const Value: double);
begin
  FPrincipal := Value;
end;

procedure TFinanciamento.SetJuros(const Value: double);
begin
  FTaxaJuros := Value;
end;

procedure TFinanciamento.SetPeriodo(const Value: Integer);
begin
  FPeriodo := Value;
end;


{$endregion}

end.
