unit uConfig;

interface

type
  TConfig = record
    WindowWidth: Integer;
    WindowHeight: Integer;
    Fullscreen: Boolean;
    SoundVolume: Single;
    MusicVolume: Single;
    Language: string;
  end;

var
  Config: TConfig;

procedure LoadConfig(const FileName: string);
procedure SaveConfig(const FileName: string);

implementation

uses
  System.IniFiles;

procedure LoadConfig(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Config.WindowWidth := Ini.ReadInteger('Display', 'Width', 800);
    Config.WindowHeight := Ini.ReadInteger('Display', 'Height', 600);
    Config.Fullscreen := Ini.ReadBool('Display', 'Fullscreen', False);
    Config.SoundVolume := Ini.ReadFloat('Audio', 'SoundVolume', 1.0);
    Config.MusicVolume := Ini.ReadFloat('Audio', 'MusicVolume', 1.0);
    Config.Language := Ini.ReadString('General', 'Language', 'en');
  finally
    Ini.Free;
  end;
end;

procedure SaveConfig(const FileName: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteInteger('Display', 'Width', Config.WindowWidth);
    Ini.WriteInteger('Display', 'Height', Config.WindowHeight);
    Ini.WriteBool('Display', 'Fullscreen', Config.Fullscreen);
    Ini.WriteFloat('Audio', 'SoundVolume', Config.SoundVolume);
    Ini.WriteFloat('Audio', 'MusicVolume', Config.MusicVolume);
    Ini.WriteString('General', 'Language', Config.Language);
  finally
    Ini.Free;
  end;
end;

end.
