object Frm_Cad_Ped_Itens: TFrm_Cad_Ped_Itens
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Pedido de Itens'
  ClientHeight = 468
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 163
    Width = 71
    Height = 13
    Caption = 'ID Pedido Item'
  end
  object Label2: TLabel
    Left = 80
    Top = 27
    Width = 68
    Height = 13
    Caption = 'ID Pedido Cab'
  end
  object Label3: TLabel
    Left = 23
    Top = 216
    Width = 36
    Height = 13
    Caption = 'ID Item'
  end
  object Label4: TLabel
    Left = 80
    Top = 59
    Width = 64
    Height = 13
    Caption = 'Data Emissao'
  end
  object Label5: TLabel
    Left = 80
    Top = 91
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label6: TLabel
    Left = 80
    Top = 123
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label7: TLabel
    Left = 141
    Top = 216
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label8: TLabel
    Left = 253
    Top = 216
    Width = 38
    Height = 13
    Caption = 'Vlr. Unit'
  end
  object Label9: TLabel
    Left = 385
    Top = 216
    Width = 43
    Height = 13
    Caption = 'Vlr. Total'
  end
  object edt_IDPEDIDOCAB: TEdit
    Left = 168
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object msk_DTEMISSAO: TMaskEdit
    Left = 168
    Top = 56
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object edt_NUMERO: TEdit
    Left = 168
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edt_CLIENTE: TEdit
    Left = 168
    Top = 120
    Width = 377
    Height = 21
    MaxLength = 100
    TabOrder = 3
  end
  object edt_IDPEDIDOITEM: TEdit
    Left = 168
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object btn_gravar: TBitBtn
    Left = 275
    Top = 420
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 5
    OnClick = btn_gravarClick
  end
  object btn_sair: TBitBtn
    Left = 526
    Top = 420
    Width = 75
    Height = 25
    Caption = 'Sair'
    ModalResult = 1
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 23
    Top = 279
    Width = 578
    Height = 120
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'ID Item'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Quantidade'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vlr Unit'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Vlr Total'
        Width = 118
        Visible = True
      end>
  end
  object btn_inserir: TBitBtn
    Left = 526
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Inserir +'
    TabOrder = 8
    OnClick = btn_inserirClick
  end
  object edt_IDITEM: TEdit
    Left = 22
    Top = 232
    Width = 97
    Height = 21
    TabOrder = 9
  end
  object edt_QUANTIDADE: TEdit
    Left = 141
    Top = 232
    Width = 97
    Height = 21
    TabOrder = 10
  end
  object edt_VALORUNIT: TEdit
    Left = 253
    Top = 232
    Width = 97
    Height = 21
    TabOrder = 11
    OnExit = edt_VALORUNITExit
  end
  object edt_VALORTOTAL: TEdit
    Left = 386
    Top = 232
    Width = 97
    Height = 21
    Color = clScrollBar
    ReadOnly = True
    TabOrder = 12
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 136
    Top = 320
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 232
    Top = 320
  end
  object FDQuery1: TFDQuery
    ConnectionName = 'DBDEMOS'
    SQL.Strings = (
      'SELECT I.IDITEM, I.DESCITEM'
      'FROM ITEM I ')
    Left = 416
    Top = 320
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 328
    Top = 320
  end
  object q_aux: TFDQuery
    Left = 536
    Top = 296
  end
end
