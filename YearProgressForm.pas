unit YearProgressForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, DateUtils, Vcl.ComCtrls, Vcl.Grids, Vcl.Samples.Calendar, Math;

type
  TYearProgressForm1 = class(TForm)
    Panel2: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    Image7: TImage;
    Panel4: TPanel;
    Image6: TImage;
    Timer1: TTimer;
    Label1: TLabel;
    DaysCountLabel: TLabel;
    Label2: TLabel;
    YearProgressBar: TProgressBar;
    OnePercentLabel: TLabel;
    HundredPercentLabel: TLabel;
    Image1: TImage;
    Image2: TImage;
    Calendar1: TCalendar;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    Panel6: TPanel;
    TodayDateLabel: TLabel;
    Image4: TImage;
    Image3: TImage;
    Timer2: TTimer;
    Timer3: TTimer;
    Panel1: TPanel;
    YearNameLabel: TLabel;
    MonthNameLabel: TLabel;
    WeekNameLabel: TLabel;
    DaysCountLabel2: TLabel;
    WeekPercentsLabel: TLabel;
    MonthPercentsLabel: TLabel;
    DayNameLabel: TLabel;
    DayPercentsLabel: TLabel;
    YearProgressBar2: TProgressBar;
    MonthProgressBar: TProgressBar;
    WeekProgressBar: TProgressBar;
    CloseButton2: TButton;
    Panel5: TPanel;
    DayProgressBar: TProgressBar;
    DayProgressBar2: TProgressBar;
    DayTimePercentsLabel: TLabel;
    DayTimeNameLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Label4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image3Click(Sender: TObject);
    procedure CloseButton2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YearProgressForm1: TYearProgressForm1;
  currdate: string;
  DateTime: TDateTime;

implementation

{$R *.dfm}

uses AboutProgram;

procedure TYearProgressForm1.CloseButton2Click(Sender: TObject);
begin
Timer3.Enabled:=True;
Image3.Visible:=True;
end;

procedure TYearProgressForm1.FormCreate(Sender: TObject);
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
CurrentMinDenominator: Currency;
CurrentHDenominator: Currency;
minutes: string;
month: string;
daytime: string;
LDayOfWeekName: string;
begin
try
AddFontResource('fonts\Roboto-Regular.ttf');
AddFontResource('fonts\Roboto-Bold.ttf');
AddFontResource('fonts\Roboto-Thin.ttf');
Label4.Font.Name:='Roboto';
TodayDateLabel.Font.Name:='Roboto';
Calendar1.Font.Name:='Roboto';
Label1.Font.Name:='Roboto';
Label2.Font.Name:='Roboto';
DaysCountLabel.Font.Name:='Roboto';
Label3.Font.Name:='Roboto';
RadioButton1.Font.Name:='Roboto';
RadioButton2.Font.Name:='Roboto';
OnePercentLabel.Font.Name:='Roboto';
HundredPercentLabel.Font.Name:='Roboto';
YearNameLabel.Font.Name:='Roboto';
MonthNameLabel.Font.Name:='Roboto';
WeekNameLabel.Font.Name:='Roboto';
CloseButton2.Font.Name:='Roboto';
Panel2.Font.Name:='Roboto';
Panel5.Font.Name:='Roboto';
DaysCountLabel2.Font.Name:='Roboto';
DayTimeNameLabel.Font.Name:='Roboto';
DayTimePercentsLabel.Font.Name:='Roboto';
MonthPercentsLabel.Font.Name:='Roboto';
WeekPercentsLabel.Font.Name:='Roboto';
DayNameLabel.Font.Name:='Roboto';
DayPercentsLabel.Font.Name:='Roboto';
except

end;
OneMPercent:=DaysInMonth(Now) / 100;
OnePercent:=3.65;
OneDPercent:= 0.24;
OneHour := 60;
OneDay:=24;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) >= 10 then minutes:=IntToStr(MinuteOf(Now));
CurrMPercent2:=RoundTo((DayOfTheMonth(Now) + CurrentHDenominator) / OneMPercent, -1);
CurrPercent:=Round(((DayOfTheYear(Now) - 1) + CurrentHDenominator) / OnePercent);
CurrPercent2:=RoundTo(((DayOfTheYear(Now) - 1) + CurrentHDenominator) / OnePercent, -1);
CurrDPercent:=Round((HourOf(Now) + CurrentMinDenominator) / OneDPercent);
CurrDPercent2:=RoundTo((HourOf(Now) + CurrentMinDenominator) / OneDPercent, -1);
CurrMPercent:=Round(((DayOfTheMonth(Now) - 1) + CurrentHDenominator) / OneMPercent);
CurrMPercent2:=RoundTo(((DayOfTheMonth(Now) - 1 ) + CurrentHDenominator) / OneMPercent, -1);
OneWPercent:=0.07;
CurrWPercent:=Round(((DayOfWeek(Now) - 1) + CurrentHDenominator) / OneWPercent);
CurrWPercent2:=RoundTo(((DayOfWeek(Now) - 1) + CurrentHDenominator) / OneWPercent, -1);
if HourOf(Now)< 6 then
begin
  daytime:='Ночное время';
  DayProgressBar2.Min:=0;
  DayProgressBar2.Max:=6;
  DayProgressBar2.Position:=HourOf(Now);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((HourOf(Now) + CurrentMinDenominator) / 0.06, -1)) + '%';
end else
begin
 if (HourOf(Now) < 12) and (HourOf(Now) > 6) then
begin
  daytime:='Утреннее время';
  DayProgressBar2.Min:=6;
  DayProgressBar2.Max:=12;
  DayProgressBar2.Position:=HourOf(Now);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo(((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06, -1)) + '%';
end;
 if (HourOf(Now) < 18) and (HourOf(Now) > 12) then
begin
  daytime:='Дневное время';
  DayProgressBar2.Min:=12;
  DayProgressBar2.Max:=18;
  DayProgressBar2.Position:=HourOf(Now);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo(((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06, -1)) + '%';
end;
 if (HourOf(Now) <= 23) and (HourOf(Now) > 18) then
begin
  daytime:='Вечернее время';
  DayProgressBar2.Min:=18;
  DayProgressBar2.Max:=StrToInt(FloatToStr(23));
  DayProgressBar2.Position:=HourOf(Now);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo(((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06, -1)) + '%';
end;
end;
if DayOfWeek(Now) = 1 then
LDayOfWeekName := 'Воскресенье' else
begin
  if DayOfWeek(Now) = 2 then
  LDayOfWeekName := 'Понедельник';
  if DayOfWeek(Now) = 3 then
  LDayOfWeekName := 'Вторник';
  if DayOfWeek(Now) = 4 then
  LDayOfWeekName := 'Среда';
  if DayOfWeek(Now) = 5 then
  LDayOfWeekName := 'Четверг';
  if DayOfWeek(Now) = 6 then
  LDayOfWeekName := 'Пятница';
  if DayOfWeek(Now) = 7 then
  LDayOfWeekName := 'Суббота';
end;
if MonthOfTheYear(Now) = 1 then
month:=' ЯНВАРЯ ' else
begin
if MonthOfTheYear(Now) = 2 then
month:=' ФЕВРАЛЯ ';
if MonthOfTheYear(Now) = 3 then
month:=' МАРТА ';
if MonthOfTheYear(Now) = 4 then
month:=' АПРЕЛЯ ';
if MonthOfTheYear(Now) = 5 then
month:=' МАЯ ';
if MonthOfTheYear(Now) = 6 then
month:=' ИЮНЯ ';
if MonthOfTheYear(Now) = 7 then
month:=' ИЮЛЯ ';
if MonthOfTheYear(Now) = 8 then
month:=' АВГУСТА ';
if MonthOfTheYear(Now) = 9 then
month:=' СЕНТЯБРЯ ';
if MonthOfTheYear(Now) = 10 then
month:=' ОКТЯБРЯ ';
if MonthOfTheYear(Now) = 11 then
month:=' НОЯБРЯ ';
if MonthOfTheYear(Now) = 12 then
month:=' ДЕКАБРЯ ';
end;

currdate:=IntToStr(DayOf(Date)) + month + IntToStr(YearOf(Now)) + ' ГОДА';
TodayDateLabel.Caption:='  СЕГОДНЯ ' + currdate;
if RadioButton1.Checked=True then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end;
DaysCountLabel2.Caption:=FloatToStr(CurrPercent2) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' дн.';
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent2) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' дн.';
WeekPercentsLabel.Caption:=FloatToStr(CurrWPercent2) + '% / ' + LDayOfWeekName;
MonthProgressBar.Position:=StrToInt(FloatToStr(CurrMPercent));
WeekProgressBar.Position:=StrToInt(FloatToStr(CurrWPercent));
YearProgressBar2.Position:=StrToInt(FloatToStr(CurrPercent));
DayProgressBar.Position:=StrToInt(FloatToStr(CurrDPercent));
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;

procedure TYearProgressForm1.Image3Click(Sender: TObject);
begin
Image3.Visible:=False;
Panel1.Visible:=True;
Timer2.Enabled:=True;
end;

procedure TYearProgressForm1.Image4Click(Sender: TObject);
begin
YearProgressForm1.Enabled:=False;
AboutProgram1.Show;
end;

procedure TYearProgressForm1.Label4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 Perform(WM_SysCommand,$F012,0);
end;

procedure TYearProgressForm1.Panel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 Perform(WM_SysCommand,$F012,0);
end;

procedure TYearProgressForm1.Panel3Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TYearProgressForm1.Panel4Click(Sender: TObject);
begin
YearProgressForm1.WindowState:=wsMinimized;
end;

procedure TYearProgressForm1.Timer1Timer(Sender: TObject);
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
CurrentMinDenominator: Currency;
CurrentHDenominator: Currency;
daytime: string;
minutes: string;
month: string;
LDayOfWeekName: string;
begin
OneMPercent:=DaysInMonth(Now) / 100;
OnePercent:=3.65;
OneDPercent:= 0.24;
OneHour := 60;
OneDay:=24;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) >= 10 then minutes:=IntToStr(MinuteOf(Now));
CurrMPercent2:=RoundTo((DayOfTheMonth(Now) + CurrentHDenominator) / OneMPercent, -1);
CurrPercent:=Round(((DayOfTheYear(Now) - 1) + CurrentHDenominator) / OnePercent);
CurrPercent2:=RoundTo(((DayOfTheYear(Now) - 1) + CurrentHDenominator) / OnePercent, -1);
CurrDPercent:=Round((HourOf(Now) + CurrentMinDenominator) / OneDPercent);
CurrDPercent2:=RoundTo((HourOf(Now) + CurrentMinDenominator) / OneDPercent, -1);
CurrMPercent:=Round(((DayOfTheMonth(Now) - 1) + CurrentHDenominator) / OneMPercent);
CurrMPercent2:=RoundTo(((DayOfTheMonth(Now) - 1 ) + CurrentHDenominator) / OneMPercent, -1);
OneWPercent:=0.07;
CurrWPercent:=Round(((DayOfWeek(Now) - 1) + CurrentHDenominator) / OneWPercent);
CurrWPercent2:=RoundTo(((DayOfWeek(Now) - 1) + CurrentHDenominator) / OneWPercent, -1);
if HourOf(Now)< 6 then
begin
  daytime:='Ночное время';
  DayProgressBar2.Min:=0;
  DayProgressBar2.Max:=6;
  DayProgressBar2.Position:=HourOf(Now);
  DayProgressBar2.Position:=Round(StrToInt(FloatToStr(HourOf(Now) + CurrentMinDenominator)));
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((HourOf(Now) + CurrentMinDenominator) / 0.06, -1)) + '%';
end else
begin
 if (HourOf(Now)< 12) and (HourOf(Now) > 6) then
begin
  daytime:='Утреннее время';
  DayProgressBar2.Min:=6;
  DayProgressBar2.Max:=12;
  DayProgressBar2.Position:=HourOf(Now);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo(((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06, -1)) + '%';
end;
 if (HourOf(Now)< 18) and (HourOf(Now) > 12) then
begin
  daytime:='Дневное время';
  DayProgressBar2.Min:=12;
  DayProgressBar2.Max:=18;
  DayProgressBar2.Position:=HourOf(Now);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo(((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06, -1)) + '%';
end;
 if (HourOf(Now)<= 23) and (HourOf(Now) > 18) then
begin
  daytime:='Вечернее время';
  DayProgressBar2.Min:=18;
  DayProgressBar2.Max:=StrToInt(FloatToStr(23.9999));
  DayProgressBar2.Position:=HourOf(Now);
  DayProgressBar2.Position:=Round(StrToInt(FloatToStr(HourOf(Now) + CurrentMinDenominator)));
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo(((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06, -1)) + '%';
end;
end;
if DayOfWeek(Now) = 1 then
LDayOfWeekName := 'Воскресенье' else
begin
  if DayOfWeek(Now) = 2 then
  LDayOfWeekName := 'Понедельник';
  if DayOfWeek(Now) = 3 then
  LDayOfWeekName := 'Вторник';
  if DayOfWeek(Now) = 4 then
  LDayOfWeekName := 'Среда';
  if DayOfWeek(Now) = 5 then
  LDayOfWeekName := 'Четверг';
  if DayOfWeek(Now) = 6 then
  LDayOfWeekName := 'Пятница';
  if DayOfWeek(Now) = 7 then
  LDayOfWeekName := 'Суббота';
end;
if MonthOfTheYear(Now) = 1 then
month:=' ЯНВАРЯ ' else
begin
if MonthOfTheYear(Now) = 2 then
month:=' ФЕВРАЛЯ ';
if MonthOfTheYear(Now) = 3 then
month:=' МАРТА ';
if MonthOfTheYear(Now) = 4 then
month:=' АПРЕЛЯ ';
if MonthOfTheYear(Now) = 5 then
month:=' МАЯ ';
if MonthOfTheYear(Now) = 6 then
month:=' ИЮНЯ ';
if MonthOfTheYear(Now) = 7 then
month:=' ИЮЛЯ ';
if MonthOfTheYear(Now) = 8 then
month:=' АВГУСТА ';
if MonthOfTheYear(Now) = 9 then
month:=' СЕНТЯБРЯ ';
if MonthOfTheYear(Now) = 10 then
month:=' ОКТЯБРЯ ';
if MonthOfTheYear(Now) = 11 then
month:=' НОЯБРЯ ';
if MonthOfTheYear(Now) = 12 then
month:=' ДЕКАБРЯ ';
end;

currdate:=IntToStr(DayOf(Date)) + month + IntToStr(YearOf(Now)) + ' ГОДА';
TodayDateLabel.Caption:='  СЕГОДНЯ ' + currdate;
if RadioButton1.Checked=True then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end;
DaysCountLabel2.Caption:=FloatToStr(CurrPercent2) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' дн.';
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent2) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' дн.';
WeekPercentsLabel.Caption:=FloatToStr(CurrWPercent2) + '% / ' + LDayOfWeekName;
MonthProgressBar.Position:=StrToInt(FloatToStr(CurrMPercent));
WeekProgressBar.Position:=StrToInt(FloatToStr(CurrWPercent));
YearProgressBar2.Position:=StrToInt(FloatToStr(CurrPercent));
DayProgressBar.Position:=StrToInt(FloatToStr(CurrDPercent));
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;

procedure TYearProgressForm1.Timer2Timer(Sender: TObject);
var startheight: integer;
begin
 if Panel1.Height<=217 then
 begin
 YearProgressForm1.Enabled:=False;
 startheight:=Panel1.Height;
 Panel1.Height:=Panel1.Height + 6;
 end else
 begin
 Timer2.Enabled:=False;
 YearProgressForm1.Enabled:=True;
 end;
end;

procedure TYearProgressForm1.Timer3Timer(Sender: TObject);
begin
  if Panel1.Height > 0 then
 begin
 YearProgressForm1.Enabled:=False;
 Panel1.Height:=Panel1.Height - 8;
 end else begin
 Timer3.Enabled:=False;
 YearProgressForm1.Enabled:=True;
 end;
end;

end.
