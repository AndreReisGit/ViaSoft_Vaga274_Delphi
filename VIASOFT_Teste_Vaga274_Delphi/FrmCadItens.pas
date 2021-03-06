unit FrmCadItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.FMTBcd,
  Data.SqlExpr, Data.DB, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFrm_cad_itens = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btn_gravar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_sair: TBitBtn;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    dbe_IDITEM: TDBEdit;
    dbe_DESCITEM: TDBEdit;
    btn_prox: TBitBtn;
    btn_ant: TBitBtn;
    q_aux: TFDQuery;
    procedure btn_proxClick(Sender: TObject);
    procedure btn_antClick(Sender: TObject);
    procedure dbe_IDITEMChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_cad_itens: TFrm_cad_itens;

implementation

{$R *.dfm}

uses FrmPrincipal;

procedure TFrm_cad_itens.btn_antClick(Sender: TObject);
begin
  ClientDataSet1.Prior;
end;

procedure TFrm_cad_itens.btn_excluirClick(Sender: TObject);
begin
  if dbe_IDITEM.Text <> '' then
    begin
    q_aux.Close;
    q_aux.SQL.Clear;
    q_aux.SQL.Text := 'DELETE FROM ITEM WHERE IDITEM = ' + dbe_IDITEM.Text;
    q_aux.ExecSQL;
    ShowMessage('Item exclu?do');
    end;
end;

procedure TFrm_cad_itens.btn_gravarClick(Sender: TObject);
begin
  if dbe_DESCITEM.Text = '' then
    begin
    ShowMessage('A descri??o do Item deve ser informada');
    dbe_DESCITEM.SetFocus;
    Abort
    end;


  q_aux.Close;
  q_aux.SQL.Clear;
  if dbe_IDITEM.Text <> '' then
    begin
    q_aux.SQL.Text := 'UPDATE ITEM SET DESCITEM = ' + dbe_DESCITEM.Text + 'WHERE IDITEM = ' + dbe_IDITEM.Text;
    q_aux.ExecSQL;
    ShowMessage('Item alterado');
    end
  else
    begin
    q_aux.SQL.Text := 'INSERT INTO ITEM (IDITEM, DESCITEM) VALUES ( ' + dbe_IDITEM.Text + ', ' + dbe_DESCITEM.Text + ' )';
    q_aux.ExecSQL;
    ShowMessage('Item inclu?do');
    end;
end;

procedure TFrm_cad_itens.btn_proxClick(Sender: TObject);
begin
  ClientDataSet1.Next;
end;

procedure TFrm_cad_itens.dbe_IDITEMChange(Sender: TObject);
begin
  ClientDataSet1.Filtered := True;
  ClientDataSet1.Filter := 'IDITEM = ' + dbe_IDITEM.Text;
  ClientDataSet1.Filtered := False;
end;

procedure TFrm_cad_itens.FormShow(Sender: TObject);
begin
  FDQuery1.Open;
  ClientDataSet1.Open;
end;

end.
