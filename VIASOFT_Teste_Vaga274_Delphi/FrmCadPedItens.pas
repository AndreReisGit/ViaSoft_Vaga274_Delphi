unit FrmCadPedItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TFrm_Cad_Ped_Itens = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_IDPEDIDOCAB: TEdit;
    msk_DTEMISSAO: TMaskEdit;
    edt_NUMERO: TEdit;
    edt_CLIENTE: TEdit;
    edt_IDPEDIDOITEM: TEdit;
    btn_gravar: TBitBtn;
    btn_sair: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    FDQuery1: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    btn_inserir: TBitBtn;
    edt_IDITEM: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edt_QUANTIDADE: TEdit;
    edt_VALORUNIT: TEdit;
    edt_VALORTOTAL: TEdit;
    q_aux: TFDQuery;
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_gravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_VALORUNITExit(Sender: TObject);
  private
    { Private declarations }
    procedure ChecarDados;
  public
    { Public declarations }
  end;

var
  Frm_Cad_Ped_Itens: TFrm_Cad_Ped_Itens;

implementation

{$R *.dfm}

procedure TFrm_Cad_Ped_Itens.btn_gravarClick(Sender: TObject);
begin
  //Gravar Tabela Pai
  if q_aux.Active then q_aux.Close;
  q_aux.SQL.Clear;
  q_aux.SQL.Text := 'INSERT INTO PEDIDOCAB (IDPEDIDOCAB, DTEMISSAO, NUMERO, CLIENTE)' +
                    ' VALUES(:IDPEDIDOCAB, :DTEMISSAO, :NUMERO, :CLIENTE)';
  q_aux.ParamByName('IDPEDIDOCAB').AsInteger := StrToInt(edt_IDPEDIDOCAB.Text);
  q_aux.ParamByName('DTEMISSAO').AsDate := StrToDate(msk_DTEMISSAO.Text);
  q_aux.ParamByName('NUMERO').AsInteger := StrToInt(edt_NUMERO.Text);
  q_aux.ParamByName('CLIENTE').AsString := edt_CLIENTE.Text;
  q_aux.ExecSQL;

  //Gravar Tabela Filha
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
    begin
    q_aux.SQL.Clear;
    q_aux.SQL.Text := 'INSERT INTO PEDIDOITEM (IDPEDIDOITEM, IDPEDIDOCAB, IDITEM, QUANTIDADE, VALORUNIT, VALORTOTAL)' +
                      ' VALUES (:IDPEDIDOITEM, :IDPEDIDOCAB, :IDITEM, :QUANTIDADE, :VALORUNIT, :VALORTOTAL)';
    q_aux.ParamByName('IDPEDIDOITEM').AsInteger := StrToInt(edt_IDPEDIDOITEM.Text);
    q_aux.ParamByName('IDPEDIDOCAB').AsInteger := StrToInt(edt_IDPEDIDOCAB.Text);
    q_aux.ParamByName('IDITEM').AsInteger       := ClientDataSet1.FieldByName('IDITEM').AsInteger;
    q_aux.ParamByName('QUANTIDADE').AsFloat   := ClientDataSet1.FieldByName('QUANTIDADE').AsFloat;
    q_aux.ParamByName('VALORUNIT').AsFloat    := ClientDataSet1.FieldByName('VALORUNIT').AsFloat;
    q_aux.ParamByName('VALORTOTAL').AsFloat   := ClientDataSet1.FieldByName('VALORTOTAL').AsFloat;
    q_aux.ExecSQL;

    ClientDataSet1.Next;
    end;

end;

procedure TFrm_Cad_Ped_Itens.btn_inserirClick(Sender: TObject);
begin
  ChecarDados;

  if ClientDataSet1.State in [dsBrowse] then
    begin
    ClientDataSet1.Insert;
    ClientDataSet1.FieldByName('IDITEM').AsFloat     := StrToFloat(edt_IDITEM.Text);
    ClientDataSet1.FieldByName('QUANTIDADE').AsFloat := StrToFloat(edt_QUANTIDADE.Text);
    ClientDataSet1.FieldByName('VALORUNIT').AsFloat  := StrToFloat(edt_VALORUNIT.Text);
    ClientDataSet1.FieldByName('VALORTOTAL').AsFloat := StrToFloat(edt_QUANTIDADE.Text) * StrToFloat(edt_VALORUNIT.Text);
    ClientDataSet1.Post;
    end;
end;

procedure TFrm_Cad_Ped_Itens.ChecarDados;
begin
  if edt_IDPEDIDOCAB.Text = '' then
    begin
    ShowMessage('Dados incompletos');
    edt_IDPEDIDOCAB.SetFocus;
    Abort;
    end;

  if msk_DTEMISSAO.Text = '' then
    begin
    ShowMessage('Dados incompletos');
    msk_DTEMISSAO.SetFocus;
    Abort;
    end;

  if edt_NUMERO.Text = '' then
    begin
    ShowMessage('Dados incompletos');
    edt_NUMERO.SetFocus;
    Abort;
    end;

  if edt_CLIENTE.Text = '' then
    begin
    ShowMessage('Dados incompletos');
    edt_CLIENTE.SetFocus;
    Abort;
    end;

   if edt_IDPEDIDOITEM.Text = '' then
     begin
     ShowMessage('Dados incompletos');
     edt_IDPEDIDOITEM.SetFocus;
     Abort;
     end;
end;

procedure TFrm_Cad_Ped_Itens.edt_VALORUNITExit(Sender: TObject);
begin
  edt_VALORTOTAL.Text := FloatToStr((StrToFloat(edt_QUANTIDADE.Text) * StrToFloat(edt_VALORUNIT.Text)));
end;

procedure TFrm_Cad_Ped_Itens.FormShow(Sender: TObject);
begin
  FDQuery1.Open;
  ClientDataSet1.Open;
end;

end.
