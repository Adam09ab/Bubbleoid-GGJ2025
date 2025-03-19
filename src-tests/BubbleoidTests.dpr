program BubbleoidTests;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uStarFieldData in '..\src\uStarFieldData.pas',
  uConfig in 'uConfig.pas',
  uLog in 'uLog.pas';

{$R *.res}

procedure HandleException(Sender: TObject; E: Exception);
begin
  Log('Unhandled exception: ' + E.Message);
  Application.ShowException(E); // Optionally display the error to the user
end;

begin
  Application.OnException := HandleException;
  Log('Application starting');
  LoadConfig('config.ini');
  Log('Configuration loaded');
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Log('Main form created');
  Application.Run;
  SaveConfig('config.ini');
  Log('Configuration saved');
  Log('Application closed');
end.
