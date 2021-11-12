object frmModeloSimula: TfrmModeloSimula
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Simula'#231#227'o de Empr'#233'stimo Datapar '
  ClientHeight = 275
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 24
    Width = 68
    Height = 13
    Caption = 'Taxa de Juros'
  end
  object Label2: TLabel
    Left = 48
    Top = 24
    Width = 81
    Height = 13
    Caption = 'Capital Desejado'
  end
  object Label3: TLabel
    Left = 336
    Top = 24
    Width = 69
    Height = 13
    Caption = 'Nro. de Meses'
  end
  object edtMeses: TEdit
    Left = 336
    Top = 40
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnChange = edtCapitalChange
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 82
    Width = 575
    Height = 185
    TabOrder = 1
  end
  object btCalcular: TButton
    Left = 487
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Calcular'
    Enabled = False
    TabOrder = 2
  end
  object edtJuros: TEdit
    Left = 192
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
    OnChange = edtCapitalChange
    OnExit = edtJurosExit
  end
  object edtCapital: TEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = edtCapitalChange
    OnExit = edtCapitalExit
  end
end
