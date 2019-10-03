program yearprogress;

uses
  Vcl.Forms,
  YearProgressForm in 'YearProgressForm.pas' {YearProgressForm1},
  AboutProgram in 'AboutProgram.pas' {AboutProgram1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TYearProgressForm1, YearProgressForm1);
  Application.CreateForm(TAboutProgram1, AboutProgram1);
  Application.Run;
end.
