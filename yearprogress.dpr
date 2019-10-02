program yearprogress;

uses
  Vcl.Forms,
  YearProgressForm in 'YearProgressForm.pas' {YearProgressForm1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TYearProgressForm1, YearProgressForm1);
  Application.Run;
end.
