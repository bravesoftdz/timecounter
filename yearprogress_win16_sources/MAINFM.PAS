unit Mainfm;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, Gauges, StdCtrls, Grids, Calendar, CalSamp, StatsFm, YearPr, AboutPro;

type
  TMainForm1 = class(TForm)
    Calendar1: TCalendar;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    YearProgressBar: TGauge;
    Timer1: TTimer;
    TodayPanel: TPanel;
    TodayLabel: TLabel;
    ShowStatisticsButton: TButton;
    Label3: TLabel;
    Button1: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure ShowStatisticsButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

{$R *.DFM}

procedure TMainForm1.Timer1Timer(Sender: TObject);
var OnePercent: extended;
OneDPercent: extended;
OneMPercent: extended;
OneWPercent: extended;
CurrPercent: extended;
CurrPercent2: extended;
CurrMPercent: extended;
CurrMPercent2: extended;
CurrWPercent: extended;
CurrWPercent2: extended;
CurrDPercent: extended;
CurrDPercent2: extended;
OneHour: extended;
OneDay: extended;
CurrentMinDenominator: real;
CurrentMinDenominator2: real;
CurrentMinDenominator3: real;
CurrentHDenominator2: real;
CurrentHDenominator: real;
CurrentSDenominator: real;
CurrentSDenominator2: real;
CurrentSDenominator3: real;
CurrentSDenominator4: real;
daytime: string;
minutes: string;
LDayOfWeekName: string;
Year, Month, Day1: Word;
Hour, Minute, Second, Milli: Word;
Day: Integer;
Days1: Integer;
MonthName: string;
begin
DecodeDate(Date, Year, Month, Day1);
DecodeTime(Time, Hour, Minute, Second, Milli);
if Hour >=10 then
Minutes:=IntToStr(Hour) else Minutes:='0' + IntToStr(Hour);
if DayOfWeek(Now) = 1 then
LDayOfWeekName:= 'Воскресенье';
if DayOfWeek(Now) = 2 then
LDayOfWeekName:= 'Понедельник';
if DayOfWeek(Now) = 3 then
LDayOfWeekName:= 'Вторник';
if DayOfWeek(Now) = 4 then
LDayOfWeekName:= 'Среда';
if DayOfWeek(Now) = 5 then
LDayOfWeekName:= 'Четверг';
if DayOfWeek(Now) = 6 then
LDayOfWeekName:= 'Пятница';
if DayOfWeek(Now) = 7 then
LDayOfWeekName:= 'Суббота';
if Month = 1 then
begin
Days1:= 31;
day:=0 + Day1;
MonthName:=' января ';
end;
if Month = 2 then
begin
Days1:= 28;
day:=31 + Day1;
MonthName:=' февраля ';
end;
if Month = 3 then
begin
Days1:= 31;
day:=59 + Day1;
MonthName:=' марта ';
end;
if Month = 4 then
begin
Days1:= 30;
day:=90 + Day1;
MonthName:=' апреля ';
end;
if Month = 5 then
begin
Days1:= 31;
day:=120 + Day1;
MonthName:=' мая ';
end;
if Month = 6 then
begin
Days1:= 30;
day:=151 + Day1;
MonthName:=' июня ';
end;
if Month = 7 then
begin
Days1:= 31;
day:=181 + Day1;
MonthName:=' июля ';
end;
if Month = 8 then
begin
Days1:= 31;
day:=212 + Day1;
MonthName:=' августа ';
end;
if Month = 9 then
begin
Days1:= 30;
day:=243 + Day1;
MonthName:=' сентября ';
end;
if Month = 10 then
begin
Days1:= 31;
day:=273 + Day1;
MonthName:=' октября ';
end;
if Month = 11 then
begin
Days1:= 30;
day:=304 + Day1;
MonthName:=' ноября ';
end;
if Month = 12 then
begin
Days1:= 31;
day:=334 + Day1;
MonthName:=' декабря ';
end;
if Minute >= 10 then
minutes:=IntToStr(Minute) else minutes:='0' + IntToStr(minute);
OneDPercent:=0.24;
OneWPercent:=0.07;
OneMPercent:=Days1 / 100;
OnePercent:=3.65;
Label4.Caption:='Январь ' + IntToStr(Year);
Label5.Caption:='Декабрь ' + IntToStr(Year);
YearProgressBar.Progress:=Day;
StatisticsForm.Label5.Caption:=IntToStr(Round(Day / OnePercent) - 1) + '% / ' + IntToStr(Day) + ' дн.';
StatisticsForm.Label6.Caption:=IntToStr(Round(Day1 / OneMPercent) - 1) + '% / ' + IntToStr(Day1) + ' дн.';
StatisticsForm.Label7.Caption:=IntToStr(Round(DayOfWeek(Now) / OneWPercent) - 1) + '% / ' + LDayOfWeekName;
StatisticsForm.Label8.Caption:=IntToStr(Round(Hour / OneDPercent)) + '% / ' + IntToStr(Hour) + ':' + Minutes;
StatisticsForm.MonthProgressBar.Progress:=Day1;
Label2.Caption:=IntToStr(Day);
TodayLabel.Caption:='Сегодня ' + IntToStr(Day1) + MonthName + IntToStr(Year) + ' года';
StatisticsForm.MonthProgressBar.MaxValue:=Days1;
StatisticsForm.MonthProgressBar.Progress:=Day1;
StatisticsForm.WeekProgressBar.MaxValue:=7;
StatisticsForm.WeekProgressBar.Progress:=DayOfWeek(Now);
StatisticsForm.DayProgressBar.Progress:=StrToInt(FloatToStr(Hour));
if MainForm1.WindowState=wsMinimized then MainForm1.Caption:='YearProgress | ' + IntToStr(Round(Day / OnePercent)) + '%'
else MainForm1.Caption:='Годовая протяженность DMIT Computers (Win16)';
end;

procedure TMainForm1.ShowStatisticsButtonClick(Sender: TObject);
begin
StatisticsForm.Show;
end;


procedure TMainForm1.Button1Click(Sender: TObject);
begin
AboutProgram.Show;
end;

procedure TMainForm1.FormCreate(Sender: TObject);
var OnePercent: extended;
OneDPercent: extended;
OneMPercent: extended;
OneWPercent: extended;
CurrPercent: extended;
CurrPercent2: extended;
CurrMPercent: extended;
CurrMPercent2: extended;
CurrWPercent: extended;
CurrWPercent2: extended;
CurrDPercent: extended;
CurrDPercent2: extended;
OneHour: extended;
OneDay: extended;
CurrentMinDenominator: real;
CurrentMinDenominator2: real;
CurrentMinDenominator3: real;
CurrentHDenominator2: real;
CurrentHDenominator: real;
CurrentSDenominator: real;
CurrentSDenominator2: real;
CurrentSDenominator3: real;
CurrentSDenominator4: real;
daytime: string;
minutes: string;
LDayOfWeekName: string;
Year, Month, Day1: Word;
Hour, Minute, Second, Milli: Word;
Day: Integer;
Days1: Integer;
MonthName: string;
begin
DecodeDate(Date, Year, Month, Day1);
DecodeTime(Time, Hour, Minute, Second, Milli);
if Hour >=10 then
Minutes:=IntToStr(Hour) else Minutes:='0' + IntToStr(Hour);
if DayOfWeek(Now) = 1 then
LDayOfWeekName:= 'Воскресенье';
if DayOfWeek(Now) = 2 then
LDayOfWeekName:= 'Понедельник';
if DayOfWeek(Now) = 3 then
LDayOfWeekName:= 'Вторник';
if DayOfWeek(Now) = 4 then
LDayOfWeekName:= 'Среда';
if DayOfWeek(Now) = 5 then
LDayOfWeekName:= 'Четверг';
if DayOfWeek(Now) = 6 then
LDayOfWeekName:= 'Пятница';
if DayOfWeek(Now) = 7 then
LDayOfWeekName:= 'Суббота';
if Month = 1 then
begin
Days1:= 31;
day:=0 + Day1;
MonthName:=' января ';
end;
if Month = 2 then
begin
Days1:= 28;
day:=31 + Day1;
MonthName:=' февраля ';
end;
if Month = 3 then
begin
Days1:= 31;
day:=59 + Day1;
MonthName:=' марта ';
end;
if Month = 4 then
begin
Days1:= 30;
day:=90 + Day1;
MonthName:=' апреля ';
end;
if Month = 5 then
begin
Days1:= 31;
day:=120 + Day1;
MonthName:=' мая ';
end;
if Month = 6 then
begin
Days1:= 30;
day:=151 + Day1;
MonthName:=' июня ';
end;
if Month = 7 then
begin
Days1:= 31;
day:=181 + Day1;
MonthName:=' июля ';
end;
if Month = 8 then
begin
Days1:= 31;
day:=212 + Day1;
MonthName:=' августа ';
end;
if Month = 9 then
begin
Days1:= 30;
day:=243 + Day1;
MonthName:=' сентября ';
end;
if Month = 10 then
begin
Days1:= 31;
day:=273 + Day1;
MonthName:=' октября ';
end;
if Month = 11 then
begin
Days1:= 30;
day:=304 + Day1;
MonthName:=' ноября ';
end;
if Month = 12 then
begin
Days1:= 31;
day:=334 + Day1;
MonthName:=' декабря ';
end;
if Minute >= 10 then
minutes:=IntToStr(Minute) else minutes:='0' + IntToStr(minute);
OneDPercent:=0.24;
OneWPercent:=0.07;
OneMPercent:=Days1 / 100;
OnePercent:=3.65;
Label4.Caption:='Январь ' + IntToStr(Year);
Label5.Caption:='Декабрь ' + IntToStr(Year);
TodayLabel.Caption:='Сегодня ' + IntToStr(Day1) + MonthName + IntToStr(Year) + ' года';
end;

end.
