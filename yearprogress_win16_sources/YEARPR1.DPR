program Yearpr1;

uses
  Forms,
  Mainfm in 'MAINFM.PAS' {MainForm1},
  Statsfm in 'STATSFM.PAS' {StatisticsForm},
  Aboutpro in 'ABOUTPRO.PAS' {AboutProgram},
  Settings in 'SETTINGS.PAS' {SettingsForm},
  Datecmps in 'DATECMPS.PAS' {DateComparson};

{$R *.RES}

begin
  Application.Title := 'DMIT Computers Time Counter';
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TStatisticsForm, StatisticsForm);
  Application.CreateForm(TAboutProgram, AboutProgram);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TDateComparson, DateComparson);
  Application.Run;
end.
