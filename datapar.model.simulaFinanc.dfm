object frmModeloSimula: TfrmModeloSimula
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Simula'#231#227'o de Empr'#233'stimo Datapar '
  ClientHeight = 339
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseMove = FormMouseMove
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
    Width = 80
    Height = 13
    Caption = 'Nro. de Per'#237'odos'
  end
  object edtMeses: TEdit
    Left = 336
    Top = 40
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    OnChange = edtCapitalChange
    OnEnter = edtMesesEnter
    OnExit = edtMesesExit
    OnKeyPress = edtMesesKeyPress
    OnMouseMove = edtMesesMouseMove
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 75
    Width = 625
    Height = 223
    BorderStyle = bsNone
    ColCount = 6
    RowCount = 1
    FixedRows = 0
    TabOrder = 4
  end
  object btCalcular: TButton
    Left = 487
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Calcular'
    Enabled = False
    TabOrder = 3
    OnClick = btCalcularClick
  end
  object edtJuros: TEdit
    Left = 192
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = edtCapitalChange
    OnEnter = edtJurosEnter
    OnExit = edtJurosExit
    OnKeyPress = edtJurosKeyPress
    OnMouseMove = edtJurosMouseMove
  end
  object edtCapital: TEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edtCapitalChange
    OnEnter = edtCapitalEnter
    OnExit = edtCapitalExit
    OnKeyPress = edtCapitalKeyPress
    OnMouseMove = edtCapitalMouseMove
  end
  object stBar: TStatusBar
    Left = 0
    Top = 312
    Width = 652
    Height = 27
    Panels = <
      item
        Width = 50
      end>
    ExplicitTop = 248
    ExplicitWidth = 591
  end
end
