unit YearProgressForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, DateUtils, Vcl.ComCtrls, Vcl.Grids, Vcl.Samples.Calendar, Math, IOUtils, Vcl.Themes,
  System.Win.TaskbarCore, Vcl.Taskbar;

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
    Panel6: TPanel;
    TodayDateLabel: TLabel;
    Image4: TImage;
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
    Timer4: TTimer;
    Timer5: TTimer;
    Image5: TImage;
    Taskbar1: TTaskbar;
    Timer6: TTimer;
    Image8: TImage;
    Image3: TImage;
    Panel7: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Switch_On: TImage;
    Switch_Off: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel8: TPanel;
    Label3: TLabel;
    Panel9: TPanel;
    Image9: TImage;
    Panel10: TPanel;
    Image10: TImage;
    Panel11: TPanel;
    Image11: TImage;
    UpDown1: TUpDown;
    Panel12: TPanel;
    NotifyText: TLabel;
    UpDown2: TUpDown;
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
    procedure Switch_OnClick(Sender: TObject);
    procedure Switch_OffClick(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
    procedure Image5Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure UpDown2ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Integer; Direction: TUpDownDirection);
    procedure FormHide(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Image8Click(Sender: TObject);
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

uses AboutProgram, IniFiles, TimeCounterUnit;


procedure TYearProgressForm1.CloseButton2Click(Sender: TObject);
begin
Timer3.Enabled:=True;
Image3.Visible:=False;
Image4.Visible:=False;
Image5.Visible:=False;
Image8.Visible:=False;
Image4.Visible:=True;
Image5.Visible:=True;
Timer4.Enabled:=True;
end;

procedure TYearProgressForm1.FormActivate(Sender: TObject);
var Ini:TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if (Ini.ReadString('Main','Language','')='2') then YearProgressForm1.Caption:='DMIT Computers Time Counter' else YearProgressForm1.Caption:='Счетчик времени DMIT Computers';
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
CurrentMinDenominator2: Currency;
CurrentMinDenominator3: Currency;
CurrentHDenominator2: Currency;
CurrentHDenominator: Currency;
CurrentSDenominator: Currency;
CurrentSDenominator2: Currency;
CurrentSDenominator3: Currency;
CurrentSDenominator4: Currency;
daytime: string;
minutes: string;
month: string;
LDayOfWeekName: string;
Ini:TIniFile;
StyleResource: string;
begin
try
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if not (Ini.ReadString('Main','Language','')='1') and not (Ini.ReadString('Main','Language','')='2') then
Ini.WriteString('Main','Language','1');
if not (Ini.ReadString('Main','ShowCalendar','')='Enabled') and not (Ini.ReadString('Main','Language','')='Disabled') then
Ini.WriteString('Main','ShowCalendar','Enabled');
if not (Ini.ReadString('Additionally','UnitTime','')='Percents') and not (Ini.ReadString('Additionally','UnitTime','')='Days') then
Ini.WriteString('Additionally','UnitTime','Percents');
if (Ini.ReadString('Main','ShowCalendar','')='Disabled') then
begin
Calendar1.Visible:=False;
Label1.Left:=207;
Label2.Left:=297;
DaysCountLabel.Left:=163;
end
else
begin
Calendar1.Visible:=True;
Label1.Left:=311;
Label2.Left:=401;
DaysCountLabel.Left:=267;
end;
StyleResource:=('styles\material.vsf');
AddFontResource('fonts\Roboto-Regular.ttf');
AddFontResource('fonts\Roboto-Bold.ttf');
AddFontResource('fonts\Roboto-Thin.ttf');
except

end;
Label4.Font.Name:='Roboto';
TodayDateLabel.Font.Name:='Roboto';
Calendar1.Font.Name:='Roboto';
Label1.Font.Name:='Roboto';
Label2.Font.Name:='Roboto';
DaysCountLabel.Font.Name:='Roboto';
Label3.Font.Name:='Roboto';
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
Label5.Font.Name:='Roboto';
Label6.Font.Name:='Roboto';
Label7.Font.Name:='Roboto';
Label8.Font.Name:='Roboto';
Label9.Font.Name:='Roboto';
Label10.Font.Name:='Roboto';
Label11.Font.Name:='Roboto';
Label12.Font.Name:='Roboto';
NotifyText.Font.Name:='Roboto';
Taskbar1.ProgressValue:=DayOfTheYear(Now);
OneMPercent:=DaysInMonth(Now) / 100;
OnePercent:=3.65;
OneDPercent:= 0.24;
OneHour := 60;
OneDay:=24;
CurrentHDenominator2:=HourOf(Now) * 0.01;
CurrentMinDenominator2:=MinuteOf(Now) * 0.01;
CurrentMinDenominator3:=MinuteOf(Now) * 0.0001;
CurrentSDenominator:=SecondOf(Now) * 0.01;
CurrentSDenominator2:=SecondOf(Now) * 0.001;
CurrentSDenominator3:=SecondOf(Now) * 0.0001;
CurrentSDenominator4:=SecondOf(Now) / OneHour;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) >= 10 then minutes:=IntToStr(MinuteOf(Now));
CurrMPercent2:=RoundTo(((DayOfTheMonth(Now) / OneMPercent) + CurrentMinDenominator2 + CurrentHDenominator + CurrentSDenominator2), -1);
CurrPercent:=Round(((DayOfTheYear(Now) - 1 + CurrentHDenominator  + (CurrentMinDenominator * 0.1)) / OnePercent));
CurrPercent2:=RoundTo((((DayOfTheYear(Now) - 1 + CurrentHDenominator + (CurrentMinDenominator * 0.1) ) / OnePercent)), -1);
CurrDPercent:=Round((HourOf(Now) + CurrentMinDenominator) / OneDPercent);
CurrDPercent2:=RoundTo((HourOf(Now) + CurrentMinDenominator) / OneDPercent, -1);
CurrMPercent:=Round((((DayOfTheMonth(Now) - 1  + (CurrentMinDenominator * 0.01)+ CurrentHDenominator + (CurrentSDenominator4 * 0.01)) / OneMPercent)));
CurrMPercent2:=RoundTo(((((DayOfTheMonth(Now) - 1  + (CurrentMinDenominator * 0.01) + CurrentHDenominator + (CurrentSDenominator4 * 0.01)) / OneMPercent))), -1);
OneWPercent:=0.07;
CurrWPercent:=Round(((DayOfWeek(Now) - 1 + (CurrentMinDenominator * 0.01) + CurrentHDenominator + (CurrentSDenominator4 * 0.01)) / OneWPercent));
CurrWPercent2:=RoundTo(((DayOfWeek(Now) + (CurrentMinDenominator * 0.01) + CurrentHDenominator + (CurrentSDenominator4 * 0.01)) - 1) / OneWPercent, -1);
if (Ini.ReadString('Main','Language','')='2') then
begin
Label3.Caption:='Settings';
Label5.Caption:='INTERFACE';
Label6.Caption:='Application Language';
Label7.Caption:='English (United States)';
Label8.Caption:='Calendar';
Label9.Caption:='Displays the monthly calendar along with today'+#39+'s date.';
Image3.Hint:='Show statistics';
Image4.Hint:='About';
Image5.Hint:='Settings';
Label12.Caption:='ADDITIONALLY';
Label11.Caption:='Show year progress in';
if Ini.ReadString('Additionally','UnitTime','')='Days' then
Label10.Caption:='Days';
if Ini.ReadString('Additionally','UnitTime','')='Percents' then
Label10.Caption:='Percents';
Label4.Caption:='DMIT Computers YearProgress';
Label1.Caption:='passed';
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='days'
end;
if HourOf(Now)< 6 then
begin
  daytime:='Night time';
  DayProgressBar2.Position:=Round(((HourOf(Now) + CurrentMinDenominator) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator)) / 0.06) + CurrentSDenominator2, -1)) + '%';
end else
begin
 if (HourOf(Now) < 12) and (HourOf(Now) >= 6) then
begin
  daytime:='Morning time';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) < 18) and (HourOf(Now) >= 12) then
begin
  daytime:='Day time';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) <= 23) and (HourOf(Now) >= 18) then
begin
  daytime:='Evening time';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
end;
if DayOfWeek(Now) = 1 then
LDayOfWeekName := 'Sunday' else
begin
  if DayOfWeek(Now) = 2 then
  LDayOfWeekName := 'Monday';
  if DayOfWeek(Now) = 3 then
  LDayOfWeekName := 'Tuesday';
  if DayOfWeek(Now) = 4 then
  LDayOfWeekName := 'Wednesday';
  if DayOfWeek(Now) = 5 then
  LDayOfWeekName := 'Thursday';
  if DayOfWeek(Now) = 6 then
  LDayOfWeekName := 'Friday';
  if DayOfWeek(Now) = 7 then
  LDayOfWeekName := 'Saturday';
end;
if MonthOfTheYear(Now) = 1 then
month:=' JANUARY ' else
begin
if MonthOfTheYear(Now) = 2 then
month:=' FEBRUARY ';
if MonthOfTheYear(Now) = 3 then
month:=' MARCH ';
if MonthOfTheYear(Now) = 4 then
month:=' APRIL ';
if MonthOfTheYear(Now) = 5 then
month:=' MAY ';
if MonthOfTheYear(Now) = 6 then
month:=' JUNE ';
if MonthOfTheYear(Now) = 7 then
month:=' JULE ';
if MonthOfTheYear(Now) = 8 then
month:=' AUGUST ';
if MonthOfTheYear(Now) = 9 then
month:=' SEPTEMBER ';
if MonthOfTheYear(Now) = 10 then
month:=' OCTOBER ';
if MonthOfTheYear(Now) = 11 then
month:=' NOVEMBER ';
if MonthOfTheYear(Now) = 12 then
month:=' DECEMBER ';
end;
currdate:=month + IntToStr(DayOf(Date)) + ', ' + IntToStr(YearOf(Now));
TodayDateLabel.Caption:='  TODAY IS' + currdate;
CloseButton2.Caption:='Close';
Panel5.Caption:='CLOSE     ';
DayNameLabel.Caption:='Day (overall progress)';
MonthNameLabel.Caption:='Month';
WeekNameLabel.Caption:='Week';
YearNameLabel.Caption:='Year';
DaysCountLabel2.Caption:=FloatToStr(CurrPercent2) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' days';
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent2) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' days';
end
else
begin
Label3.Caption:='Настройки';
Label5.Caption:='ИНТЕРФЕЙС';
Label6.Caption:='Язык программы';
Label7.Caption:='Русский (Россия)';
Label8.Caption:='Календарь';
Label9.Caption:='Отображает месячный календарь вместе с сегодняшней датой.';
Label12.Caption:='ДОПОЛНИТЕЛЬНО';
Label11.Caption:='Показывать годовую протяженность в';
if Ini.ReadString('Additionally','UnitTime','')='Days' then
Label10.Caption:='Днях';
if Ini.ReadString('Additionally','UnitTime','')='Percents' then
Label10.Caption:='Процентах';
Label4.Caption:='Счетчик времени DMIT Computers';
Label1.Caption:='прошло';
DayNameLabel.Caption:='День (общий прогресс)';
MonthNameLabel.Caption:='Месяц';
WeekNameLabel.Caption:='Неделя';
YearNameLabel.Caption:='Год';
Image3.Hint:='Показать статистику';
Image4.Hint:='О программе...';
Image5.Hint:='Настройки';
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end;
if HourOf(Now)< 6 then
begin
  daytime:='Ночное время';
  DayProgressBar2.Position:=Round(((HourOf(Now) + CurrentMinDenominator) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator)) / 0.06) + CurrentSDenominator2, -1)) + '%';
end else
begin
 if (HourOf(Now) < 12) and (HourOf(Now) >= 6) then
begin
  daytime:='Утреннее время';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) < 18) and (HourOf(Now) >= 12) then
begin
  daytime:='Дневное время';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) <= 23) and (HourOf(Now) >= 18) then
begin
  daytime:='Вечернее время';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2, -1)) + '%';
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
DaysCountLabel2.Caption:=FloatToStr(CurrPercent2) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' дн.';
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent2) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' дн.';
CloseButton2.Caption:='Закрыть';
Panel5.Caption:='ЗАКРЫТЬ    ';
end;
if Ini.ReadString('Main','Language','')='2' then
begin
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='days'
end;
OnePercentLabel.Caption:='January ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='December ' + FloatToStr(YearOf(Now));
end else begin
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end;
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
WeekPercentsLabel.Caption:=FloatToStr(CurrWPercent2) + '% / ' + LDayOfWeekName;
MonthProgressBar.Position:=StrToInt(FloatToStr(CurrMPercent));
WeekProgressBar.Position:=StrToInt(FloatToStr(CurrWPercent));
YearProgressBar2.Position:=StrToInt(FloatToStr(CurrPercent));
DayProgressBar.Position:=StrToInt(FloatToStr(CurrDPercent));
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
if (Ini.ReadString('Main','ShowCalendar','')='Disabled') then
begin
Calendar1.Visible:=False;
Label1.Left:=207;
Label2.Left:=297;
DaysCountLabel.Left:=163;
Switch_on.Visible:=False;
Switch_off.Visible:=True;
end
else
begin
Calendar1.Visible:=True;
Label1.Left:=311;
Label2.Left:=401;
DaysCountLabel.Left:=267;
Switch_on.Visible:=True;
Switch_off.Visible:=False;
end;
end;



procedure TYearProgressForm1.FormHide(Sender: TObject);
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
CurrentMinDenominator2: Currency;
CurrentMinDenominator3: Currency;
CurrentHDenominator2: Currency;
CurrentHDenominator: Currency;
CurrentSDenominator: Currency;
CurrentSDenominator2: Currency;
CurrentSDenominator3: Currency;
CurrentSDenominator4: Currency;
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
CurrentHDenominator2:=HourOf(Now) * 0.01;
CurrentMinDenominator2:=MinuteOf(Now) * 0.01;
CurrentMinDenominator3:=MinuteOf(Now) * 0.0001;
CurrentSDenominator:=SecondOf(Now) * 0.01;
CurrentSDenominator2:=SecondOf(Now) * 0.001;
CurrentSDenominator3:=SecondOf(Now) * 0.0001;
CurrentSDenominator4:=SecondOf(Now) / OneHour;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
CurrPercent:=RoundTo((((DayOfTheYear(Now) - 1 + CurrentHDenominator + (CurrentMinDenominator * 0.1) ) / OnePercent)), -1);
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) >= 10 then minutes:=IntToStr(MinuteOf(Now));
YearProgressForm1.Caption:='Y: ' + FloatToStr(CurrPercent) + '%';
end;

procedure TYearProgressForm1.FormShow(Sender: TObject);
var Ini:TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if (Ini.ReadString('Main','Language','')='2') then YearProgressForm1.Caption:='DMIT Computers Time Counter' else YearProgressForm1.Caption:='Счетчик времени DMIT Computers';
end;

procedure TYearProgressForm1.Image10Click(Sender: TObject);
begin
Panel7.Visible:=False;
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

procedure TYearProgressForm1.Image5Click(Sender: TObject);
begin
Panel7.Visible:=True;
end;

procedure TYearProgressForm1.Image8Click(Sender: TObject);
begin
TimeCounter.Show;
end;

procedure TYearProgressForm1.Label4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 Perform(WM_SysCommand,$F012,0);
end;



procedure TYearProgressForm1.Panel11Click(Sender: TObject);
begin
Panel7.Visible:=False;
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
CurrentMinDenominator2: Currency;
CurrentMinDenominator3: Currency;
CurrentHDenominator2: Currency;
CurrentHDenominator: Currency;
CurrentSDenominator: Currency;
CurrentSDenominator2: Currency;
CurrentSDenominator3: Currency;
CurrentSDenominator4: Currency;
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
CurrentHDenominator2:=HourOf(Now) * 0.01;
CurrentMinDenominator2:=MinuteOf(Now) * 0.01;
CurrentMinDenominator3:=MinuteOf(Now) * 0.0001;
CurrentSDenominator:=SecondOf(Now) * 0.01;
CurrentSDenominator2:=SecondOf(Now) * 0.001;
CurrentSDenominator3:=SecondOf(Now) * 0.0001;
CurrentSDenominator4:=SecondOf(Now) / OneHour;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
CurrPercent:=RoundTo((((DayOfTheYear(Now) - 1 + CurrentHDenominator + (CurrentMinDenominator * 0.1) ) / OnePercent)), -1);
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) >= 10 then minutes:=IntToStr(MinuteOf(Now));
YearProgressForm1.WindowState:=wsMinimized;
end;


procedure TYearProgressForm1.Switch_OffClick(Sender: TObject);
var Ini:TIniFile;
begin
try
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
Ini.WriteString('Main','ShowCalendar','Enabled');
if (Ini.ReadString('Main','ShowCalendar','')='Disabled') then
begin
Calendar1.Visible:=False;
Label1.Left:=207;
Label2.Left:=297;
DaysCountLabel.Left:=163;
end
else
begin
Calendar1.Visible:=True;
Label1.Left:=311;
Label2.Left:=401;
DaysCountLabel.Left:=267;
end;
Switch_On.Visible:=True;
Switch_Off.Visible:=False;
except
if Ini.ReadString('Main','Language','')='1' then
NotifyText.Caption:='Ошибка сохранения файла настроек.'+#13+#10+'Возможно, Вы не запустили приложение от имени администратора или файл настроек занят другими процессами.'
else
NotifyText.Caption:='Error saving settings file.'+#13+#10+'You may not have started the application as administrator or the settings file is busy by another process.';
Panel12.Visible:=True;
Timer6.Enabled:=True;
end;
end;

procedure TYearProgressForm1.Switch_OnClick(Sender: TObject);
var Ini:TIniFile;
begin
try
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
Ini.WriteString('Main','ShowCalendar','Disabled');
if (Ini.ReadString('Main','ShowCalendar','')='Disabled') then
begin
Calendar1.Visible:=False;
Label1.Left:=207;
Label2.Left:=297;
DaysCountLabel.Left:=163;
end
else
begin
Calendar1.Visible:=True;
Label1.Left:=311;
Label2.Left:=401;
DaysCountLabel.Left:=267;
end;
Switch_Off.Visible:=True;
Switch_On.Visible:=False;
except
if Ini.ReadString('Main','Language','')='1' then
NotifyText.Caption:='Ошибка сохранения файла настроек.'+#13+#10+'Возможно, Вы не запустили приложение от имени администратора или файл настроек занят другими процессами.'
else
NotifyText.Caption:='Error saving settings file.'+#13+#10+'You may not have started the application as administrator or the settings file is busy by another process.';
Panel12.Visible:=True;
Timer6.Enabled:=True;
end;
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
CurrentMinDenominator2: Currency;
CurrentMinDenominator3: Currency;
CurrentHDenominator2: Currency;
CurrentHDenominator: Currency;
CurrentSDenominator: Currency;
CurrentSDenominator2: Currency;
CurrentSDenominator3: Currency;
CurrentSDenominator4: Currency;
daytime: string;
minutes: string;
month: string;
LDayOfWeekName: string;
Ini:TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
OneMPercent:=DaysInMonth(Now) / 100;
OnePercent:=3.65;
OneDPercent:= 0.24;
OneHour := 60;
OneDay:=24;
CurrentHDenominator2:=HourOf(Now) * 0.01;
CurrentMinDenominator2:=MinuteOf(Now) * 0.01;
CurrentMinDenominator3:=MinuteOf(Now) * 0.0001;
CurrentSDenominator:=SecondOf(Now) * 0.01;
CurrentSDenominator2:=SecondOf(Now) * 0.001;
CurrentSDenominator3:=SecondOf(Now) * 0.0001;
CurrentSDenominator4:=SecondOf(Now) / OneHour;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) < 10 then minutes:= '0' + IntToStr(MinuteOf(Now));
if MinuteOf(Now) >= 10 then minutes:=IntToStr(MinuteOf(Now));
CurrMPercent2:=RoundTo(((DayOfTheMonth(Now) / OneMPercent) + CurrentMinDenominator2 + CurrentHDenominator + CurrentSDenominator2), -1);
CurrPercent:=Round(((DayOfTheYear(Now) - 1 + CurrentHDenominator  + (CurrentMinDenominator * 0.1)) / OnePercent));
CurrPercent2:=RoundTo((((DayOfTheYear(Now) - 1 + CurrentHDenominator + (CurrentMinDenominator * 0.1) ) / OnePercent)), -1);
CurrDPercent:=Round((HourOf(Now) + CurrentMinDenominator) / OneDPercent);
CurrDPercent2:=RoundTo((HourOf(Now) + CurrentMinDenominator) / OneDPercent, -1);
CurrMPercent:=Round((((DayOfTheMonth(Now) - 1  + (CurrentMinDenominator * 0.01)+ CurrentHDenominator + (CurrentSDenominator4 * 0.01)) / OneMPercent)));
CurrMPercent2:=RoundTo(((((DayOfTheMonth(Now) - 1  + (CurrentMinDenominator * 0.01) + CurrentHDenominator + (CurrentSDenominator4 * 0.01)) / OneMPercent))), -1);
OneWPercent:=0.07;
CurrWPercent:=Round(((DayOfWeek(Now) - 1 + (CurrentMinDenominator * 0.01) + CurrentHDenominator + (CurrentSDenominator4 * 0.01)) / OneWPercent));
CurrWPercent2:=RoundTo(((DayOfWeek(Now) + (CurrentMinDenominator * 0.01) + CurrentHDenominator + (CurrentSDenominator4 * 0.01)) - 1) / OneWPercent, -1);
if (Ini.ReadString('Main','Language','')='2') then
begin
Label3.Caption:='Settings';
Label5.Caption:='INTERFACE';
Label6.Caption:='Application Language';
Label7.Caption:='English (United States)';
Label8.Caption:='Calendar';
Label9.Caption:='Displays the monthly calendar along with today'+#39+'s date.';
Image3.Hint:='Show statistics';
Image4.Hint:='About';
Image5.Hint:='Settings';
Label12.Caption:='ADDITIONALLY';
Label11.Caption:='Show year progress in';
if Ini.ReadString('Additionally','UnitTime','')='Days' then
Label10.Caption:='Days';
if Ini.ReadString('Additionally','UnitTime','')='Percents' then
Label10.Caption:='Percents';
Label4.Caption:='DMIT Computers Time Counter';
Label1.Caption:='passed';
TimeCounter.Label1.Caption:='... has passed since the beginning of the specified date?';
TimeCounter.Label4.Caption:='... left until the specified date?';
TimeCounter.Label2.Caption:='How many days';
TimeCounter.Label5.Caption:='Result';
if YearProgressForm1.WindowState=wsMinimized then YearProgressForm1.Caption:='Y: ' + FloatToStr(CurrPercent2) + '%' else YearProgressForm1.Caption:='DMIT Computers Time Counter';

if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='days'
end;
if HourOf(Now)< 6 then
begin
  daytime:='Night time';
  DayProgressBar2.Position:=Round(((HourOf(Now) + CurrentMinDenominator) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator)) / 0.06) + CurrentSDenominator2, -1)) + '%';
end else
begin
 if (HourOf(Now) < 12) and (HourOf(Now) >= 6) then
begin
  daytime:='Morning time';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) < 18) and (HourOf(Now) >= 12) then
begin
  daytime:='Day time';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) <= 23) and (HourOf(Now) >= 18) then
begin
  daytime:='Evening time';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
end;
if DayOfWeek(Now) = 1 then
LDayOfWeekName := 'Sunday' else
begin
  if DayOfWeek(Now) = 2 then
  LDayOfWeekName := 'Monday';
  if DayOfWeek(Now) = 3 then
  LDayOfWeekName := 'Tuesday';
  if DayOfWeek(Now) = 4 then
  LDayOfWeekName := 'Wednesday';
  if DayOfWeek(Now) = 5 then
  LDayOfWeekName := 'Thursday';
  if DayOfWeek(Now) = 6 then
  LDayOfWeekName := 'Friday';
  if DayOfWeek(Now) = 7 then
  LDayOfWeekName := 'Saturday';
end;
if MonthOfTheYear(Now) = 1 then
month:=' JANUARY ' else
begin
if MonthOfTheYear(Now) = 2 then
month:=' FEBRUARY ';
if MonthOfTheYear(Now) = 3 then
month:=' MARCH ';
if MonthOfTheYear(Now) = 4 then
month:=' APRIL ';
if MonthOfTheYear(Now) = 5 then
month:=' MAY ';
if MonthOfTheYear(Now) = 6 then
month:=' JUNE ';
if MonthOfTheYear(Now) = 7 then
month:=' JULE ';
if MonthOfTheYear(Now) = 8 then
month:=' AUGUST ';
if MonthOfTheYear(Now) = 9 then
month:=' SEPTEMBER ';
if MonthOfTheYear(Now) = 10 then
month:=' OCTOBER ';
if MonthOfTheYear(Now) = 11 then
month:=' NOVEMBER ';
if MonthOfTheYear(Now) = 12 then
month:=' DECEMBER ';
end;
currdate:=month + IntToStr(DayOf(Date)) + ', ' + IntToStr(YearOf(Now));
TodayDateLabel.Caption:='  TODAY IS' + currdate;
CloseButton2.Caption:='Close';
Panel5.Caption:='CLOSE     ';
DayNameLabel.Caption:='Day (overall progress)';
MonthNameLabel.Caption:='Month';
WeekNameLabel.Caption:='Week';
YearNameLabel.Caption:='Year';
TimeCounter.Label7.Caption:='days';
TimeCounter.Label8.Caption:='hours';
TimeCounter.Label9.Caption:='min.';
TimeCounter.Label10.Caption:='sec.';
TimeCounter.Label13.Caption:='millisec.';
TimeCounter.Label12.Caption:='CALCULATE';
Image8.Hint:='Date comparison';
TimeCounter.Label3.Caption:='Date comparison';
TimeCounter.Label1.Caption:='... has passed since the beginning of the specified date?';
TimeCounter.Label4.Caption:='... left until the specified date?';
TimeCounter.Label2.Caption:='How may days ...';
TimeCounter.Label5.Caption:='Result';
DaysCountLabel2.Caption:=FloatToStr(CurrPercent2) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' days';
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent2) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' days';
end
else
begin
Label3.Caption:='Настройки';
Label5.Caption:='ИНТЕРФЕЙС';
Label6.Caption:='Язык программы';
Label7.Caption:='Русский (Россия)';
Label8.Caption:='Календарь';
Label9.Caption:='Отображает месячный календарь вместе с сегодняшней датой.';
Label12.Caption:='ДОПОЛНИТЕЛЬНО';
Label11.Caption:='Показывать годовую протяженность в';
if Ini.ReadString('Additionally','UnitTime','')='Days' then
Label10.Caption:='Днях';
if Ini.ReadString('Additionally','UnitTime','')='Percents' then
Label10.Caption:='Процентах';
Label1.Caption:='прошло';
DayNameLabel.Caption:='День (общий прогресс)';
MonthNameLabel.Caption:='Месяц';
WeekNameLabel.Caption:='Неделя';
YearNameLabel.Caption:='Год';
Image3.Hint:='Показать статистику';
Image4.Hint:='О программе...';
Image5.Hint:='Настройки';
TimeCounter.Label7.Caption:='дней';
TimeCounter.Label8.Caption:='часов';
TimeCounter.Label9.Caption:='минут';
TimeCounter.Label10.Caption:='секунд';
TimeCounter.Label13.Caption:='миллисек.';
Image8.Hint:='Сравнение дат';
TimeCounter.Label3.Caption:='Сравнение дат';
TimeCounter.Label1.Caption:='... прошло с начала указанной даты?';
TimeCounter.Label4.Caption:='... осталось до указанной даты?';
TimeCounter.Label2.Caption:='Сколько дней ...';
TimeCounter.Label5.Caption:='Результат';
TimeCounter.Label12.Caption:='ВЫЧИСЛИТЬ';
if YearProgressForm1.WindowState=wsMinimized then YearProgressForm1.Caption:='Y: ' + FloatToStr(CurrPercent2) + '%' else YearProgressForm1.Caption:='Счетчик времени DMIT Computers';
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end;
if HourOf(Now)< 6 then
begin
  daytime:='Ночное время';
  DayProgressBar2.Position:=Round(((HourOf(Now) + CurrentMinDenominator) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator)) / 0.06) + CurrentSDenominator2, -1)) + '%';
end else
begin
 if (HourOf(Now) < 12) and (HourOf(Now) >= 6) then
begin
  daytime:='Утреннее время';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 6) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) < 18) and (HourOf(Now) >= 12) then
begin
  daytime:='Дневное время';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 12) / 0.06) + CurrentSDenominator2, -1)) + '%';
end;
 if (HourOf(Now) <= 23) and (HourOf(Now) >= 18) then
begin
  daytime:='Вечернее время';
  DayProgressBar2.Position:=Round((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2);
  DayTimeNameLabel.Caption:=daytime;
  DayTimePercentsLabel.Caption:=FloatToStr(RoundTo((((HourOf(Now) + CurrentMinDenominator) - 18) / 0.06) + CurrentSDenominator2, -1)) + '%';
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
Taskbar1.ProgressValue:=DayOfTheYear(Now);
currdate:=IntToStr(DayOf(Date)) + month + IntToStr(YearOf(Now)) + ' ГОДА';
TodayDateLabel.Caption:='  СЕГОДНЯ ' + currdate;
DaysCountLabel2.Caption:=FloatToStr(CurrPercent2) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' дн.';
DayPercentsLabel.Caption:=FloatToStr(CurrDPercent2) + '% / ' + FloatToStr(HourOf(Now)) + ':' + minutes;
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent2) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' дн.';
CloseButton2.Caption:='Закрыть';
Panel5.Caption:='ЗАКРЫТЬ    ';
end;
WeekPercentsLabel.Caption:=FloatToStr(CurrWPercent2) + '% / ' + LDayOfWeekName;
MonthProgressBar.Position:=StrToInt(FloatToStr(CurrMPercent));
WeekProgressBar.Position:=StrToInt(FloatToStr(CurrWPercent));
YearProgressBar2.Position:=StrToInt(FloatToStr(CurrPercent));
DayProgressBar.Position:=StrToInt(FloatToStr(CurrDPercent));
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
try
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if Ini.ReadString('Main','Language','')='2' then
begin
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='days'
end;
OnePercentLabel.Caption:='January ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='December ' + FloatToStr(YearOf(Now));
end else begin
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end;
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;
except
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end;
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


procedure TYearProgressForm1.Timer4Timer(Sender: TObject);
begin
Image4.Visible:=True;
Timer4.Enabled:=False;
Timer5.Enabled:=True;
end;

procedure TYearProgressForm1.Timer5Timer(Sender: TObject);
begin
Image3.Visible:=False;
Image3.Visible:=True;
Timer5.Enabled:=False;
Image8.Visible:=True;
Image8.Visible:=False;
Image8.Visible:=True;
end;

procedure TYearProgressForm1.Timer6Timer(Sender: TObject);
begin
Panel12.Visible:=False;
Timer6.Enabled:=False;
end;

procedure TYearProgressForm1.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
  var Ini: TIniFile;
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
CurrentMinDenominator2: Currency;
CurrentMinDenominator3: Currency;
CurrentHDenominator2: Currency;
CurrentHDenominator: Currency;
CurrentSDenominator: Currency;
CurrentSDenominator2: Currency;
CurrentSDenominator3: Currency;
CurrentSDenominator4: Currency;
daytime: string;
minutes: string;
month: string;
LDayOfWeekName: string;
StyleResource: string;
begin
OneMPercent:=DaysInMonth(Now) / 100;
OnePercent:=3.65;
OneDPercent:= 0.24;
OneHour := 60;
OneDay:=24;
CurrentHDenominator2:=HourOf(Now) * 0.01;
CurrentMinDenominator2:=MinuteOf(Now) * 0.01;
CurrentMinDenominator3:=MinuteOf(Now) * 0.0001;
CurrentSDenominator:=SecondOf(Now) * 0.01;
CurrentSDenominator2:=SecondOf(Now) * 0.001;
CurrentSDenominator3:=SecondOf(Now) * 0.0001;
CurrentSDenominator4:=SecondOf(Now) / OneHour;
CurrentHDenominator:=HourOf(Now) / OneDay;
CurrentMinDenominator:=MinuteOf(Now) / OneHour;
CurrPercent:=Round(((DayOfTheYear(Now) - 1 + CurrentHDenominator  + (CurrentMinDenominator * 0.1)) / OnePercent));
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
try
if Ini.ReadString('Main','Language','')='2' then
begin
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='days'
end
end else begin
if (Ini.ReadString('Additionally','UnitTime','')='Percents') then
begin
DaysCountLabel.Caption:=FloatToStr(CurrPercent);
Label2.Caption:='%'
end
else
begin
DaysCountLabel.Caption:=FloatToStr(DayOfTheYear(Now));
Label2.Caption:='дн.'
end
end;
if UpDown1.Position=1 then
begin
Ini.WriteString('Additionally','UnitTime','Days');
if Ini.ReadString('Main','Language','')='2' then
begin
Label10.Caption:='Days';
end
else
Label10.Caption:='Днях';
end
else
begin
if Ini.ReadString('Main','Language','')='2' then
Label10.Caption:='Percents' else
Label10.Caption:='Процентах';
Ini.WriteString('Additionally','UnitTime','Percents');
end;
except
if Ini.ReadString('Main','Language','')='1' then
NotifyText.Caption:='Ошибка сохранения файла настроек.'+#13+#10+'Возможно, Вы не запустили приложение от имени администратора или файл настроек занят другими процессами.'
else
NotifyText.Caption:='Error saving settings file.'+#13+#10+'You may not have started the application as administrator or the settings file is busy by another process.';
Panel12.Visible:=True;
Timer6.Enabled:=True;
end;
end;

procedure TYearProgressForm1.UpDown2ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
  var Ini: TIniFile;
begin
try
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if UpDown2.Position=1 then
begin
Ini.WriteString('Main','Language','2');
Label3.Caption:='Settings';
Label5.Caption:='INTERFACE';
Label6.Caption:='Application Language';
Label7.Caption:='English (United States)';
Label8.Caption:='Calendar';
Label9.Caption:='Displays the monthly calendar along with today'+#39+'s date.';
Label12.Caption:='ADDITIONALLY';
Label11.Caption:='Show year progress in';
if Ini.ReadString('Additionally','UnitTime','')='Days' then
Label10.Caption:='Days';
if Ini.ReadString('Additionally','UnitTime','')='Percents' then
Label10.Caption:='Percents';
Label4.Caption:='DMIT Computers Time Counter';
Label1.Caption:='passed';
NotifyText.Caption:='Error saving settings file.'+#13+#10+'You may not have started the application as administrator or the settings file is busy by another process.';
end
else
begin
Ini.WriteString('Main','Language','1');
Label3.Caption:='Настройки';
Label5.Caption:='ИНТЕРФЕЙС';
Label6.Caption:='Язык программы';
Label7.Caption:='Русский (Россия)';
Label8.Caption:='Календарь';
Label9.Caption:='Отображает месячный календарь вместе с сегодняшней датой.';
Label12.Caption:='ДОПОЛНИТЕЛЬНО';
Label11.Caption:='Показывать годовую протяженность в';
if Ini.ReadString('Additionally','UnitTime','')='Days' then
Label10.Caption:='Днях';
if Ini.ReadString('Additionally','UnitTime','')='Percents' then
Label10.Caption:='Процентах';
Label4.Caption:='Счетчик времени DMIT Computers';
Label1.Caption:='прошло';
NotifyText.Caption:='Ошибка сохранения файла настроек.'+#13+#10+'Возможно, Вы не запустили приложение от имени администратора или файл настроек занят другими процессами.';
end;
except
if Ini.ReadString('Main','Language','')='1' then
NotifyText.Caption:='Ошибка сохранения файла настроек.'+#13+#10+'Возможно, Вы не запустили приложение от имени администратора или файл настроек занят другими процессами.'
else
NotifyText.Caption:='Error saving settings file.'+#13+#10+'You may not have started the application as administrator or the settings file is busy by another process.';
Panel12.Visible:=True;
Timer6.Enabled:=True;
end;
end;

end.
