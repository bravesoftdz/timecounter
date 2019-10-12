program Yearpr;

uses
  Forms,
  Mainfm in 'MAINFM.PAS' {MainForm1},
  Statsfm in 'STATSFM.PAS' {StatisticsForm},
  Aboutpro in 'ABOUTPRO.PAS' {AboutProgram};

{$R *.RES}

begin
  Application.Title := 'DMIT Computers YearProgress';
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TStatisticsForm, StatisticsForm);
  Application.CreateForm(TAboutProgram, AboutProgram);
  Application.Run;
end.
