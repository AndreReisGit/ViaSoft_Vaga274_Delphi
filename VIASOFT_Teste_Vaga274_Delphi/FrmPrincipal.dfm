object Frm_Principal: TFrm_Principal
  Left = 0
  Top = 0
  Caption = 'Sistema de Pedidos CONSTRUSHOW'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 216
    Top = 80
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object mi_Itens: TMenuItem
        Caption = 'Itens'
        OnClick = mi_ItensClick
      end
      object mi_PedidoItens: TMenuItem
        Caption = 'Pedido Itens'
        OnClick = mi_PedidoItensClick
      end
    end
    object Pesquisas: TMenuItem
      Caption = 'Pesquisas'
      object mi_Pedidos: TMenuItem
        Caption = 'Pedidos'
        OnClick = mi_PedidosClick
      end
    end
    object Sair: TMenuItem
      Caption = 'Sair'
      OnClick = SairClick
    end
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=db_teste'
      'User_Name=andre'
      'Password=123456'
      'RowsetSize=20'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False'
      'Decimal Separator=.')
    Left = 288
    Top = 88
  end
end
