unit FrmPesqPedItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Data.FMTBcd,
  Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask;

type
  TFrm_pesq_ped_itens = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    btn_sair: TBitBtn;
    dbg_itens: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_cliente: TEdit;
    btn_pesq: TBitBtn;
    edt_dsc_item: TEdit;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    Label4: TLabel;
    msk_Inicio: TMaskEdit;
    msk_fim: TMaskEdit;
    procedure btn_pesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pesq_ped_itens: TFrm_pesq_ped_itens;

implementation

{$R *.dfm}

procedure TFrm_pesq_ped_itens.btn_pesqClick(Sender: TObject);
begin
  if FDQuery1.Active then FDQuery1.Close;

  if (msk_inicio.EditText <> '') and (msk_fim.EditText <> '') then
    begin
    FDQuery1.ParamByName('DTEMISSAO_I').AsDate := StrToDate(msk_inicio.Text);
    FDQuery1.ParamByName('DTEMISSAO_F').AsDate := StrToDate(msk_fim.Text);
    end
  else
    begin
    FDQuery1.ParamByName('DTEMISSAO_I').Clear;
    FDQuery1.ParamByName('DTEMISSAO_F').Clear;
    end;

  if Trim(edt_cliente.Text) <> '' then
    FDQuery1.ParamByName('CLIENTE').AsString := '''%' + Trim(edt_cliente.Text) + '%'''
  else
    FDQuery1.ParamByName('CLIENTE').Clear;

  FDQuery1.Open;

  if not FDQuery1.IsEmpty then
    FDQuery1.Locate('DESCITEM', edt_dsc_item.Text, [])
  else
    ShowMessage('Refa?a a Pesquisa. Nenhum registro encontrado');
end;

end.
