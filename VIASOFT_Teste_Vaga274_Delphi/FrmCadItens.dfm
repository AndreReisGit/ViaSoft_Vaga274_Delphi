object Frm_cad_itens: TFrm_cad_itens
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Itens'
  ClientHeight = 309
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
    Left = 131
    Top = 56
    Width = 36
    Height = 13
    Caption = 'ID Item'
  end
  object Label2: TLabel
    Left = 96
    Top = 96
    Width = 71
    Height = 13
    Caption = 'Descri'#231#227'o Item'
  end
  object btn_gravar: TBitBtn
    Left = 74
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = btn_gravarClick
  end
  object btn_excluir: TBitBtn
    Left = 162
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 1
    OnClick = btn_excluirClick
  end
  object btn_sair: TBitBtn
    Left = 554
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Sair'
    ModalResult = 1
    TabOrder = 2
  end
  object dbe_IDITEM: TDBEdit
    Left = 184
    Top = 48
    Width = 121
    Height = 21
    DataSource = DataSource1
    TabOrder = 3
    OnChange = dbe_IDITEMChange
  end
  object dbe_DESCITEM: TDBEdit
    Left = 184
    Top = 96
    Width = 313
    Height = 21
    DataSource = DataSource1
    TabOrder = 4
  end
  object btn_prox: TBitBtn
    Left = 360
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Pr'#243'ximo'
    TabOrder = 5
    OnClick = btn_proxClick
  end
  object btn_ant: TBitBtn
    Left = 448
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Anterior'
    TabOrder = 6
    OnClick = btn_antClick
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 232
    Top = 168
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 320
    Top = 176
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 152
    Top = 184
  end
  object FDQuery1: TFDQuery
    ConnectionName = 'DBDEMOS'
    SQL.Strings = (
      'SELECT I.IDITEM, I.DESCITEM'
      'FROM ITEM I ')
    Left = 400
    Top = 176
  end
  object q_aux: TFDQuery
    Left = 496
    Top = 136
  end
end
