object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 581
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object LbPath: TLabel
    Left = 8
    Top = 81
    Width = 3
    Height = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 38
    Top = 5
    Width = 510
    Height = 21
    Caption = 
      'Comece clicando no bot'#227'o carregar arquivo e escolha o arquivo tx' +
      't'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 38
    Top = 25
    Width = 569
    Height = 21
    Caption = 
      'O arquivo de texto se encontra na pasta dos fontes nomeado exerc' +
      'icio1.txt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo: TMemo
    Left = 8
    Top = 104
    Width = 612
    Height = 469
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BtCarregaArq: TButton
    Left = 8
    Top = 50
    Width = 121
    Height = 25
    Caption = 'Carregar Arquivo'
    TabOrder = 1
    OnClick = BtCarregaArqClick
  end
  object BtLerChars: TButton
    Left = 486
    Top = 52
    Width = 121
    Height = 25
    Caption = 'Ler Caracteres'
    TabOrder = 2
    OnClick = BtLerCharsClick
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'Txt'
    Filter = 'Arquivos de Texto|*.txt'
    Title = 'Abrir Arquivo'
    Left = 400
    Top = 49
  end
end
