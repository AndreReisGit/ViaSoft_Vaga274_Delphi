object Frm_pesq_ped_itens: TFrm_pesq_ped_itens
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pesquisa Pedido de Itens'
  ClientHeight = 514
  ClientWidth = 968
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 968
    Height = 129
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -16
    ExplicitTop = -5
    object Label1: TLabel
      Left = 88
      Top = 29
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label2: TLabel
      Left = 88
      Top = 57
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 88
      Top = 87
      Width = 72
      Height = 13
      Caption = 'Item espec'#237'fico'
    end
    object Label4: TLabel
      Left = 257
      Top = 23
      Width = 8
      Height = 13
      Caption = #224
    end
    object edt_cliente: TEdit
      Left = 167
      Top = 53
      Width = 425
      Height = 21
      TabOrder = 2
    end
    object btn_pesq: TBitBtn
      Left = 632
      Top = 82
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btn_pesqClick
    end
    object edt_dsc_item: TEdit
      Left = 167
      Top = 85
      Width = 425
      Height = 21
      TabOrder = 3
    end
    object msk_Inicio: TMaskEdit
      Left = 167
      Top = 20
      Width = 74
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object msk_fim: TMaskEdit
      Left = 271
      Top = 20
      Width = 69
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 461
    Width = 968
    Height = 53
    Align = alBottom
    TabOrder = 1
    object btn_sair: TBitBtn
      Left = 472
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sair'
      ModalResult = 1
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 129
    Width = 968
    Height = 332
    Align = alClient
    TabOrder = 2
    object dbg_itens: TDBGrid
      Left = 1
      Top = 1
      Width = 966
      Height = 330
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = 'IDPEDIDOITEM'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'IDPEDIDOCAB'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'IDTEM'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'DESCITEM'
          Width = 338
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'QUANTIDADE'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'VLR. UNIT'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = 'VLR. TOT'
          Width = 110
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 360
    Top = 281
  end
  object FDQuery1: TFDQuery
    ConnectionName = 'DBDEMOS'
    SQL.Strings = (
      
        'SELECT PC.IDPEDIDOITEM, PC.IDPEDIDOCAB, PC.IDITEM, I.DESCITEM, P' +
        'C.QUANTIDADE, PC.VALORUNIT, PC.VALORTOTAL'
      'FROM PEDIDOITEM PI, PEDIDOCAB PC, ITEM I'
      'WHERE 1 = 1 '
      'AND PI.IDPEDIDOCAB = PC.IDPEDIDOCAB'
      'AND PI.IDITEM = I.IDITEM'
      'AND PC.IDPEDIDOCAB = NVL(:IDPEDIDOCAB, IDPEDIDOCAB)'
      
        'AND PC.DTEMISSAO between NVL(:DTEMISSAO_I, DTEMISSAO) and NVL(:D' +
        'TEMISSAO_F, DTEMISSAO)'
      'AND PC.CLIENTE LIKE NVL(:CLIENTE, CLIENTE)'
      'ORDER BY I.IDITEM ')
    Left = 432
    Top = 281
    ParamData = <
      item
        Name = 'IDPEDIDOCAB'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DTEMISSAO_I'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DTEMISSAO_F'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'CLIENTE'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
