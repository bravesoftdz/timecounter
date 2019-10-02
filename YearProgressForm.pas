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
    TodayDateLabel: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Label4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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

procedure TYearProgressForm1.FormCreate(Sender: TObject);
var OnePercent: extended;
CurrPercent: extended;
month: string;
begin
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
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
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
CurrPercent: extended;
month: string;
begin
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
YearProgressBar.Position:=StrToInt(FloatToStr(CurrPercent));
OnePercentLabel.Caption:='Январь ' + FloatToStr(YearOf(Now));
HundredPercentLabel.Caption:='Декабрь ' + FloatToStr(YearOf(Now));
end;

end.
