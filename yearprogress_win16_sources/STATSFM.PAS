unit Statsfm;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Gauges;

type
  TStatisticsForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    YearProgressBar1: TGauge;
    MonthProgressBar: TGauge;
    WeekProgressBar: TGauge;
    DayProgressBar: TGauge;
    CloseButton: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatisticsForm: TStatisticsForm;

implementation

{$R *.DFM}

procedure TStatisticsForm.CloseButtonClick(Sender: TObject);
begin
StatisticsForm.Close;
end;

end.
