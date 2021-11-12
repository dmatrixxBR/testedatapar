program PrjDatapar;

uses
  Vcl.Forms,
  datapar.viewMain in 'datapar.viewMain.pas' {frmMain},
  datapar.model.simulaFinanc in 'datapar.model.simulaFinanc.pas' {frmModeloSimula},
  datapar.simulaFinanc in 'datapar.simulaFinanc.pas' {frmSimulacao},
  datapar.classes.financiamento in 'Classes\datapar.classes.financiamento.pas',
  datapar.controller.financiamento in 'controller\datapar.controller.financiamento.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
