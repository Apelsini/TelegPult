
  program apiExample;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {Main},
  uTelegramAPI.Interfaces in 'Common\uTelegramAPI.Interfaces.pas',
  uTelegramAPI in 'Common\uTelegramAPI.pas',
  uConsts in 'Common\uConsts.pas',
  uClassMessageDTO in 'Common\uClassMessageDTO.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;

end.
