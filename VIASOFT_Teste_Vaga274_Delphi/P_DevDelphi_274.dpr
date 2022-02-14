program P_DevDelphi_274;

uses
  Vcl.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {Frm_Principal},
  FrmCadItens in 'FrmCadItens.pas' {Frm_cad_itens},
  FrmCadPedItens in 'FrmCadPedItens.pas' {Frm_Cad_Ped_Itens},
  FrmPesqPedItens in 'FrmPesqPedItens.pas' {Frm_pesq_ped_itens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TFrm_cad_itens, Frm_cad_itens);
  Application.CreateForm(TFrm_Cad_Ped_Itens, Frm_Cad_Ped_Itens);
  Application.CreateForm(TFrm_pesq_ped_itens, Frm_pesq_ped_itens);
  Application.Run;
end.
