program SportCenter;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {FrmLogin},
  uGenelLib in 'uGenelLib.pas',
  uD_Connection in 'uD_Connection.pas' {D_Connection: TDataModule},
  uLogin2pas in 'uLogin2pas.pas' {FrmLogin2},
  uMain in 'uMain.pas' {FrmMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Charcoal Dark Slate');
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TD_Connection, D_Connection);
  Application.Run;
end.
