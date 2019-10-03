unit YearProgressForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, DateUtils, Vcl.ComCtrls, Vcl.Grids, Vcl.Samples.Calendar;

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
    Panel1: TPanel;
    YearProgressBar2: TProgressBar;
    YearNameLabel: TLabel;
    MonthNameLabel: TLabel;
    MonthProgressBar: TProgressBar;
    WeekNameLabel: TLabel;
    WeekProgressBar: TProgressBar;
    CloseButton2: TButton;
    Panel5: TPanel;
    DaysCountLabel2: TLabel;
    WeekPercentsLabel: TLabel;
    MonthPercentsLabel: TLabel;
    Panel6: TPanel;
    TodayDateLabel: TLabel;
    Image4: TImage;
    Image3: TImage;
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
Panel1.Visible:=False;
Image3.Visible:=True;
end;

procedure TYearProgressForm1.FormCreate(Sender: TObject);
var OnePercent: extended;
CurrPercent: extended;
month: string;
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
MonthPercentsLabel.Font.Name:='Roboto';
WeekPercentsLabel.Font.Name:='Roboto';
except

end;
OnePercent:=3.65;
CurrPercent:=Round(DayOfTheYear(Now) / OnePercent);
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
YearProgressBar2.Position:=StrToInt(FloatToStr(CurrPercent));
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;

procedure TYearProgressForm1.Image3Click(Sender: TObject);
begin
Image3.Visible:=False;
Panel1.Visible:=True;
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
OneMPercent: extended;
OneWPercent: extended;
CurrPercent: extended;
CurrMPercent: extended;
CurrWPercent: extended;
month: string;
LDayOfWeekName: string;
begin
OnePercent:=3.65;
CurrPercent:=Round(DayOfTheYear(Now) / OnePercent);
OneMPercent:=DaysInMonth(Now) / 100;
CurrMPercent:=Round(DayOfTheMonth(Now) / OneMPercent);
OneWPercent:=0.07;
CurrWPercent:=Round(DayOfWeek(Now) / OneWPercent);
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
DaysCountLabel2.Caption:=FloatToStr(CurrPercent) + '% / ' + FloatToStr(DayOfTheYear(Now)) + ' дн.';
MonthPercentsLabel.Caption:=FloatToStr(CurrMPercent) + '% / ' + FloatToStr(DayOfTheMonth(Now)) + ' дн.';
WeekPercentsLabel.Caption:=FloatToStr(CurrWPercent) + '% / ' + LDayOfWeekName;
MonthProgressBar.Position:=StrToInt(FloatToStr(CurrMPercent));
WeekProgressBar.Position:=StrToInt(FloatToStr(CurrWPercent));
YearProgressBar2.Position:=StrToInt(FloatToStr(CurrPercent));
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;

end.
