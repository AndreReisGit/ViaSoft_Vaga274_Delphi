unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DBXOracle, Data.DB,
  Data.SqlExpr;

type
  TFrm_Principal = class(TForm)
    MainMenu: TMainMenu;
    Cadastros: TMenuItem;
    mi_Itens: TMenuItem;
    mi_PedidoItens: TMenuItem;
    Pesquisas: TMenuItem;
    mi_Pedidos: TMenuItem;
    Sair: TMenuItem;
    SQLConnection: TSQLConnection;
    procedure SairClick(Sender: TObject);
    procedure mi_ItensClick(Sender: TObject);
    procedure mi_PedidoItensClick(Sender: TObject);
    procedure mi_PedidosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.dfm}

uses FrmCadItens, FrmCadPedItens, FrmPesqPedItens;

procedure TFrm_Principal.mi_ItensClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrm_cad_itens, Frm_cad_itens);
    Frm_cad_itens.ShowModal;
  finally
    FreeAndNil(Frm_cad_itens);
  end;
end;

procedure TFrm_Principal.mi_PedidoItensClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrm_Cad_Ped_Itens, Frm_Cad_Ped_Itens);
    Frm_Cad_Ped_Itens.ShowModal;
  finally
    FreeAndNil(Frm_Cad_Ped_Itens);
  end;
end;

procedure TFrm_Principal.mi_PedidosClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrm_pesq_ped_itens, Frm_pesq_ped_itens);
    Frm_pesq_ped_itens.ShowModal;
  finally
    FreeAndNil(Frm_pesq_ped_itens);
  end;
end;

procedure TFrm_Principal.SairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
