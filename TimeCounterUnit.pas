unit TimeCounterUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, DateUtils, IniFiles;

type
  TTimeCounter = class(TForm)
    Panel8: TPanel;
    Label3: TLabel;
    Panel9: TPanel;
    Image9: TImage;
    Panel10: TPanel;
    Image10: TImage;
    CheckedRadioButton1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    UncheckedRadioButton2: TImage;
    Label4: TLabel;
    UncheckedRadioButton1: TImage;
    CheckedRadioButton2: TImage;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Label12: TLabel;
    Timer1: TTimer;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    DateTimePicker2: TDateTimePicker;
    Image1: TImage;
    procedure Label12Click(Sender: TObject);
    procedure UncheckedRadioButton1Click(Sender: TObject);
    procedure CheckedRadioButton1Click(Sender: TObject);
    procedure CheckedRadioButton2Click(Sender: TObject);
    procedure UncheckedRadioButton2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Label3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TimeCounter: TTimeCounter;

implementation

{$R *.dfm}

procedure TTimeCounter.CheckedRadioButton1Click(Sender: TObject);
begin
UncheckedRadioButton1.Visible:=True;
CheckedRadioButton1.Visible:=False;
end;

procedure TTimeCounter.CheckedRadioButton2Click(Sender: TObject);
begin
UncheckedRadioButton2.Visible:=True;
CheckedRadioButton2.Visible:=False;
end;

procedure TTimeCounter.DateTimePicker1Change(Sender: TObject);
var date1, date2: TDateTime;
time1: TTime;
datetime3, date3: Integer;
time3: integer;
time4: string;
Day, Month, Year: Word;
Hour, Minute, Second, Millisecond: Word;
Hour2, Minute2, Second2, Millisecond2: string;
Ini:TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
  DateTimePicker2.Date:=DateTimePicker1.Date;
  DateTimePicker1.Time:=DateTimePicker2.Time;


  time1 := time();
  date1 := Now;
  datetime3 := MilliSecondOfTheYear(Now);
  date2 := DateTimePicker1.DateTime;
  DecodeDate(Date1 - Date2, Year, Month, Day);
  DecodeTime(Date1 - Date2, Hour, Minute, Second, Millisecond);
  date3 := MilliSecondOfTheYear(DateTimePicker2.DateTime);
  time3 := MilliSecondsBetween(Now, DateTimePicker1.DateTime);
  time4:=FloatToStr(time3);
  if Hour < 10 then Hour2 := '0' + IntToStr(Hour) else Hour2 := IntToStr(Hour);
  if Minute < 10 then Minute2 := '0' + IntToStr(Minute) else Minute2 := IntToStr(Minute);
  if Second < 10 then Second2 := '0' + IntToStr(Second) else Second2 := IntToStr(Second);
  if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(MilliSecond);
  if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
  if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
      if CheckedRadioButton2.Visible=True then
  begin
  if date1 > date2 then
  begin
  Timer1.Enabled:=False;
  if (Ini.ReadString('Main','Language','')='1') then MessageDlg('Вы должны ввести дату и время не раньше ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0) else MessageDlg('You must enter the date and time no earlier ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0);
  DateTimePicker1.Date:=date();
  end;
  exit;
  end;
   if CheckedRadioButton1.Visible=True then
   begin
  if date1 < date2 then
  begin
  Timer1.Enabled:=False;
  if (Ini.ReadString('Main','Language','')='1') then MessageDlg('Вы должны ввести дату и время не позднее ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0) else MessageDlg('You must enter the date and time no later ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0);
    DateTimePicker1.Date:=date();
  exit;
  end;
  end;
end;



procedure TTimeCounter.Label12Click(Sender: TObject);
var date1, date2: TDateTime;
time1: TTime;
datetime3, date3: Integer;
time3: integer;
time4: string;
Day, Month, Year: Word;
Hour, Minute, Second, Millisecond: Word;
Hour2, Minute2, Second2, Millisecond2: string;
Ini:TIniFile;
begin
  Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
  DateTimePicker2.Date:=DateTimePicker1.Date;
  DateTimePicker1.Time:=DateTimePicker2.Time;

  time1 := time();
  date1 := Now;
  datetime3 := MilliSecondOfTheYear(Now);
  date2 := DateTimePicker1.DateTime;
  DecodeDate(Date1 - Date2, Year, Month, Day);
  DecodeTime(Date1 - Date2, Hour, Minute, Second, Millisecond);
  date3 := MilliSecondOfTheYear(DateTimePicker2.DateTime);
  time3 := MilliSecondsBetween(Now, DateTimePicker1.DateTime);
  time4:=FloatToStr(time3);
  if Hour < 10 then Hour2 := '0' + IntToStr(Hour) else Hour2 := IntToStr(Hour);
  if Minute < 10 then Minute2 := '0' + IntToStr(Minute) else Minute2 := IntToStr(Minute);
  if Second < 10 then Second2 := '0' + IntToStr(Second) else Second2 := IntToStr(Second);
  if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(MilliSecond);
  if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
  if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
  Label6.Caption:=IntToStr(DaysBetween(date1, date2)) + ':' + Hour2 + ':' + Minute2 + ':' + Second2 + ' ' + Millisecond2;
  Timer1.Enabled:=True;
      if CheckedRadioButton2.Visible=True then
  begin
  if date1 > date2 then
  begin
  Timer1.Enabled:=False;
    if (Ini.ReadString('Main','Language','')='1') then MessageDlg('Вы должны ввести дату и время не раньше ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0) else MessageDlg('You must enter the date and time no earlier ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0);
  DateTimePicker1.Date:=date();
  end;
  exit;
  end;
   if CheckedRadioButton1.Visible=True then
   begin
  if date1 < date2 then
  begin
  Timer1.Enabled:=False;
  if (Ini.ReadString('Main','Language','')='1') then MessageDlg('Вы должны ввести дату и время не позднее ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0) else MessageDlg('You must enter the date and time no later ' + DateToStr(date1) + ' ' + TimeToStr(time1) + '.', mtError, [mbOK], 0);
    DateTimePicker1.Date:=date();
  exit;
  end;
  end;
end;

procedure TTimeCounter.Label3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 Perform(WM_SysCommand,$F012,0);
end;

procedure TTimeCounter.Panel10Click(Sender: TObject);
begin
TimeCounter.WindowState:=wsMinimized;
end;

procedure TTimeCounter.Panel8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 Perform(WM_SysCommand,$F012,0);
end;

procedure TTimeCounter.Panel9Click(Sender: TObject);
begin
TimeCounter.Close;
end;


procedure TTimeCounter.Timer1Timer(Sender: TObject);
var date1, date2: TDateTime;
time1: TTime;
datetime3, date3: Integer;
time3: integer;
time4: string;
Day, Month, Year: Word;
Hour, Minute, Second, Millisecond: Word;
Hour2, Minute2, Second2, Millisecond2: string;
begin
   DateTimePicker2.Date:=DateTimePicker1.Date;
  DateTimePicker1.Time:=DateTimePicker2.Time;


  time1 := time();
  date1 := Now;
  datetime3 := MilliSecondOfTheYear(Now);
  date2 := DateTimePicker1.DateTime;
  DecodeDate(Date1 - Date2, Year, Month, Day);
  DecodeTime(Date1 - Date2, Hour, Minute, Second, Millisecond);
  date3 := MilliSecondOfTheYear(DateTimePicker2.DateTime);
  time3 := MilliSecondsBetween(Now, DateTimePicker1.DateTime);
  time4:=FloatToStr(time3);
  if Hour < 10 then Hour2 := '0' + IntToStr(Hour) else Hour2 := IntToStr(Hour);
  if Minute < 10 then Minute2 := '0' + IntToStr(Minute) else Minute2 := IntToStr(Minute);
  if Second < 10 then Second2 := '0' + IntToStr(Second) else Second2 := IntToStr(Second);
  if MilliSecond < 10 then MilliSecond2 := '00' + IntToStr(MilliSecond);
  if (MilliSecond >= 10) and (MilliSecond < 100) then MilliSecond2 := '0' + IntToStr(MilliSecond);
  if MilliSecond >= 100 then MilliSecond2 := IntToStr(MilliSecond);
  Label6.Caption:=IntToStr(DaysBetween(date1, date2)) + ':' + Hour2 + ':' + Minute2 + ':' + Second2 + '  ' + Millisecond2;
  Label11.Caption:=DateTimeToStr(date2) + ' - ' + DateTimeToStr(date1);

end;

procedure TTimeCounter.UncheckedRadioButton1Click(Sender: TObject);
begin
UncheckedRadioButton1.Visible:=False;
UncheckedRadioButton2.Visible:=True;
CheckedRadioButton1.Visible:=True;
CheckedRadioButton2.Visible:=False;
end;

procedure TTimeCounter.UncheckedRadioButton2Click(Sender: TObject);
begin
UncheckedRadioButton2.Visible:=False;
UncheckedRadioButton1.Visible:=True;
CheckedRadioButton2.Visible:=True;
CheckedRadioButton1.Visible:=False;
end;

end.
