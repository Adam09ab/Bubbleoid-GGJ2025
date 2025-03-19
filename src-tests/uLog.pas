unit uLog;

interface

procedure Log(const Msg: string);

implementation

uses
  System.IOUtils,
  System.SysUtils;

var
  LogFile: TextFile;

procedure Log(const Msg: string);
begin
  AssignFile(LogFile, 'game.log');
  if FileExists('game.log') then
    Append(LogFile)
  else
    Rewrite(LogFile);
  try
    Writeln(LogFile, FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ' - ' + Msg);
  finally
    CloseFile(LogFile);
  end;
end;

initialization
  if FileExists('game.log') then
    DeleteFile('game.log'); // Clear log at startup (optional)

end.
