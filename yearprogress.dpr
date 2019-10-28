program yearprogress;

{$R *.dres}

uses
  Vcl.Forms,
  YearProgressForm in 'YearProgressForm.pas' {YearProgressForm1},
  AboutProgram in 'AboutProgram.pas' {AboutProgram1},
  TimeCounterUnit in 'TimeCounterUnit.pas' {TimeCounter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TYearProgressForm1, YearProgressForm1);
  Application.CreateForm(TAboutProgram1, AboutProgram1);
  Application.CreateForm(TTimeCounter, TimeCounter);
  Application.Run;
end.
