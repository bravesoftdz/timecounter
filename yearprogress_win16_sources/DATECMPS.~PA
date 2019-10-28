unit Datecmps;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Spin, StdCtrls, Grids, Calendar, ExtCtrls, IniFiles;

type
  TDateComparson = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Calendar1: TCalendar;
    Label4: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    Timer1: TTimer;
    Label11: TLabel;
    Label6: TLabel;
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DateComparson: TDateComparson;

implementation

{$R *.DFM}



procedure TDateComparson.SpinEdit1Change(Sender: TObject);
begin
Calendar1.Month:=SpinEdit1.Value;
Calendar1.Year:=SpinEdit2.Value;
end;

procedure TDateComparson.FormCreate(Sender: TObject);
begin
SpinEdit1.Value:=Calendar1.Month;
SpinEdit2.Value:=Calendar1.Year;
end;

procedure TDateComparson.SpinEdit2Change(Sender: TObject);
begin
Calendar1.Month:=SpinEdit1.Value;
Calendar1.Year:=SpinEdit2.Value;
end;

procedure TDateComparson.Button1Click(Sender: TObject);
var date1, date2, date3: TDateTime;
DateTime3, Date4, Day1, day2: integer;
Day, Month, Year: Word;
DayNow, MonthNow, YearNow: Word;
Hour, Minute, Second, Millisecond: Word;
HourNow, MinuteNow, SecondNow, MillisecondNow: Word;
Hour2, Minute2, Second2, Millisecond2, Minutes, Day3: string;
Ini:TIniFile;
begin
Ini:=TIniFile.Create('settings\settings.ini');
Date1 := Now;
Date2 := StrToDateTime(IntToStr(Calendar1.Day) + '.' + IntToStr(SpinEdit1.Value) + '.' + IntToStr(SpinEdit2.Value) + ' ' +
IntToStr(SpinEdit3.Value) + ':' + IntToStr(SpinEdit4.Value) + ':' + IntToStr(SpinEdit5.Value));
DecodeTime(Now, HourNow, MinuteNow, SecondNow, MillisecondNow);
DecodeDate(Now, YearNow, MonthNow, DayNow);
if RadioButton1.Checked=True then
begin
try
DecodeTime(Date2 - Date1, Hour, Minute, Second, Millisecond);
DecodeDate(Date2 - Date1, Year, Month, Day);
if Month = 1 then
begin
Day1:= 31;
day2:=0 + Day;
end;
if Month = 2 then
begin
Day1:= 28;
day2:=31 + Day;
end;
if Month = 3 then
begin
Day1:= 31;
day2:=59 + Day;
end;
if Month = 4 then
begin
Day1:= 30;
day2:=90 + Day;
end;
if Month = 5 then
begin
Day1:= 31;
day2:=120 + Day;
end;
if Month = 6 then
begin
Day1:= 30;
day2:=151 + Day;
end;
if Month = 7 then
begin
Day1:= 31;
day2:=181 + Day;
end;
if Month = 8 then
begin
Day1:= 31;
day2:=212 + Day;
end;
if Month = 9 then
begin
Day1:= 30;
day2:=243 + Day;
end;
if Month = 10 then
begin
Day1:= 31;
day2:=273 + Day;
end;
if Month = 11 then
begin
Day1:= 30;
day2:=304 + Day;
end;
if Month = 12 then
begin
Day1:= 31;
day2:=334 + Day;
end;
Timer1.Enabled:=True;
if Hour < 10 then Hour2:='0' + IntToStr(Hour) else Hour2:=IntToStr(Hour);
if Minute < 10 then Minute2:='0' + IntToStr(Minute) else Minute2:=IntToStr(Minute);
if Second < 10 then Second2:='0' + IntToStr(Second) else Second2:=IntToStr(Second);
if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(Millisecond);
if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
if Day < 10 then Day3:='00' + IntToStr(Day2);
if (Day >= 10) and (Day < 100) then Day3:='0' + IntToStr(Day2);
if Day >= 100 then Day3:=IntToStr(Day2);
if (DayNow = (Calendar1.Day)) or (Day3 = '0016379') or (Day3='009663') or (Year -1 = 65535) then
Label5.Caption:='0' + ':' + '000' + ':' +
Hour2 + ':' + Minute2 + ':' + Second2+ '.' + Millisecond2 else
Label5.Caption:=FloatToStr(Year - 1) + ':' + Day3 + ':' + Hour2 + ':' + Minute2 + ':' + Second2 + '.' +
Millisecond2;
except
Timer1.Enabled:=False;
if(Ini.ReadString('Main','Language','')='1') then
begin
MessageDlg('Вы должны ввести дату и время не раньше ' + DateTimeToStr(Now), mtError, [mbOk], 0);
end else MessageDlg('You must enter the date and time no earlier ' + DateTimeToStr(Now), mtError, [mbOk], 0);

end;
end
else
begin
try
DecodeTime(Date1 - Date2, Hour, Minute, Second, Millisecond);
DecodeDate(Date1 - Date2, Year, Month, Day);
if Month = 1 then
begin
Day1:= 31;
day2:=0 + Day;
end;
if Month = 2 then
begin
Day1:= 28;
day2:=31 + Day;
end;
if Month = 3 then
begin
Day1:= 31;
day2:=59 + Day;
end;
if Month = 4 then
begin
Day1:= 30;
day2:=90 + Day;
end;
if Month = 5 then
begin
Day1:= 31;
day2:=120 + Day;
end;
if Month = 6 then
begin
Day1:= 30;
day2:=151 + Day;
end;
if Month = 7 then
begin
Day1:= 31;
day2:=181 + Day;
end;
if Month = 8 then
begin
Day1:= 31;
day2:=212 + Day;
end;
if Month = 9 then
begin
Day1:= 30;
day2:=243 + Day;
end;
if Month = 10 then
begin
Day1:= 31;
day2:=273 + Day;
end;
if Month = 11 then
begin
Day1:= 30;
day2:=304 + Day;
end;
if Month = 12 then
begin
Day1:= 31;
day2:=334 + Day;
end;
Timer1.Enabled:=True;
if Hour < 10 then Hour2:='0' + IntToStr(Hour) else Hour2:=IntToStr(Hour);
if Minute < 10 then Minute2:='0' + IntToStr(Minute) else Minute2:=IntToStr(Minute);
if Second < 10 then Second2:='0' + IntToStr(Second) else Second2:=IntToStr(Second);
if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(Millisecond);
if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
if Day < 10 then Day3:='00' + IntToStr(Day2);
if (Day >= 10) and (Day < 100) then Day3:='0' + IntToStr(Day2);
if Day >= 100 then Day3:=IntToStr(Day2);
if (DayNow = (Calendar1.Day)) or (Day3 = '0016379') or (Day3='009663') then Label5.Caption:='0' + ':' + '000' + ':' +
Hour2 + ':' + Minute2 + ':' + Second2+ '.' + Millisecond2 else
Label5.Caption:=FloatToStr(Year - 1) + ':' + Day3 + ':' + Hour2 + ':' + Minute2 + ':' + Second2 + '.' +
Millisecond2;
except
Timer1.Enabled:=False;
if(Ini.ReadString('Main','Language','')='1') then
begin
MessageDlg('Вы должны ввести дату и время не позднее ' + DateTimeToStr(Now), mtError, [mbOk], 0);
end else MessageDlg('You must enter the date and time no later ' + DateTimeToStr(Now), mtError, [mbOk], 0);
end;
end;
end;

procedure TDateComparson.Timer1Timer(Sender: TObject);
var date1, date2, date3: TDateTime;
DateTime3, Date4, Day1, day2: integer;
Day, Month, Year: Word;
DayNow, MonthNow, YearNow: Word;
Hour, Minute, Second, Millisecond: Word;
HourNow, MinuteNow, SecondNow, MillisecondNow: Word;
Hour2, Minute2, Second2, Millisecond2, Minutes, Day3: string;
Ini:TIniFile;
begin
Ini:=TIniFile.Create('settings\settings.ini');
Date1 := Now;
DecodeTime(Now, HourNow, MinuteNow, SecondNow, MillisecondNow);
DecodeDate(Now, YearNow, MonthNow, DayNow);
Date2 := StrToDateTime(IntToStr(Calendar1.Day) + '.' + IntToStr(SpinEdit1.Value) + '.' + IntToStr(SpinEdit2.Value) + ' ' +
IntToStr(SpinEdit3.Value) + ':' + IntToStr(SpinEdit4.Value) + ':' + IntToStr(SpinEdit5.Value));
if RadioButton1.Checked=True then
begin
try
DecodeTime(Date2 - Date1, Hour, Minute, Second, Millisecond);
DecodeDate(Date2 - Date1, Year, Month, Day);
if Month = 1 then
begin
Day1:= 31;
day2:=0 + Day;
end;
if Month = 2 then
begin
Day1:= 28;
day2:=31 + Day;
end;
if Month = 3 then
begin
Day1:= 31;
day2:=59 + Day;
end;
if Month = 4 then
begin
Day1:= 30;
day2:=90 + Day;
end;
if Month = 5 then
begin
Day1:= 31;
day2:=120 + Day;
end;
if Month = 6 then
begin
Day1:= 30;
day2:=151 + Day;
end;
if Month = 7 then
begin
Day1:= 31;
day2:=181 + Day;
end;
if Month = 8 then
begin
Day1:= 31;
day2:=212 + Day;
end;
if Month = 9 then
begin
Day1:= 30;
day2:=243 + Day;
end;
if Month = 10 then
begin
Day1:= 31;
day2:=273 + Day;
end;
if Month = 11 then
begin
Day1:= 30;
day2:=304 + Day;
end;
if Month = 12 then
begin
Day1:= 31;
day2:=334 + Day;
end;
if Hour < 10 then Hour2:='0' + IntToStr(Hour) else Hour2:=IntToStr(Hour);
if Minute < 10 then Minute2:='0' + IntToStr(Minute) else Minute2:=IntToStr(Minute);
if Second < 10 then Second2:='0' + IntToStr(Second) else Second2:=IntToStr(Second);
if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(Millisecond);
if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
if Day < 10 then Day3:='00' + IntToStr(Day2);
if (Day >= 10) and (Day < 100) then Day3:='0' + IntToStr(Day2);
if Day >= 100 then Day3:=IntToStr(Day2);
if (DayNow = (Calendar1.Day)) or (Day3 = '0016379') or (Day3='009663') or (Year -1 = 65535) then
Label5.Caption:='0' + ':' + '000' + ':' +
Hour2 + ':' + Minute2 + ':' + Second2+ '.' + Millisecond2 else
Label5.Caption:=FloatToStr(Year - 1) + ':' + Day3 + ':' + Hour2 + ':' + Minute2 + ':' + Second2 + '.' +
Millisecond2;
except
Timer1.Enabled:=False;
exit;
end;
end
else
begin
try
DecodeTime(Date1 - Date2, Hour, Minute, Second, Millisecond);
DecodeDate(Date1 - Date2, Year, Month, Day);
if Month = 1 then
begin
Day1:= 31;
day2:=0 + Day;
end;
if Month = 2 then
begin
Day1:= 28;
day2:=31 + Day;
end;
if Month = 3 then
begin
Day1:= 31;
day2:=59 + Day;
end;
if Month = 4 then
begin
Day1:= 30;
day2:=90 + Day;
end;
if Month = 5 then
begin
Day1:= 31;
day2:=120 + Day;
end;
if Month = 6 then
begin
Day1:= 30;
day2:=151 + Day;
end;
if Month = 7 then
begin
Day1:= 31;
day2:=181 + Day;
end;
if Month = 8 then
begin
Day1:= 31;
day2:=212 + Day;
end;
if Month = 9 then
begin
Day1:= 30;
day2:=243 + Day;
end;
if Month = 10 then
begin
Day1:= 31;
day2:=273 + Day;
end;
if Month = 11 then
begin
Day1:= 30;
day2:=304 + Day;
end;
if Month = 12 then
begin
Day1:= 31;
day2:=334 + Day;
end;
if Hour < 10 then Hour2:='0' + IntToStr(Hour) else Hour2:=IntToStr(Hour);
if Minute < 10 then Minute2:='0' + IntToStr(Minute) else Minute2:=IntToStr(Minute);
if Second < 10 then Second2:='0' + IntToStr(Second) else Second2:=IntToStr(Second);
if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(Millisecond);
if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
if Day < 10 then Day3:='00' + IntToStr(Day2);
if (Day >= 10) and (Day < 100) then Day3:='0' + IntToStr(Day2);
if Day >= 100 then Day3:=IntToStr(Day2);
if (DayNow = (Calendar1.Day)) or (Day3 = '0016379') or (Day3='009663') or (Year -1 = 65535) then
Label5.Caption:='0' + ':' + '000' + ':' +
Hour2 + ':' + Minute2 + ':' + Second2+ '.' + Millisecond2 else
Label5.Caption:=FloatToStr(Year - 1) + ':' + Day3 + ':' + Hour2 + ':' + Minute2 + ':' + Second2 + '.' +
Millisecond2;
except
Timer1.Enabled:=False;
exit;
end;
end;
end;

end.
