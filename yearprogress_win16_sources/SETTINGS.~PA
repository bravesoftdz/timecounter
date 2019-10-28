unit Settings;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, IniFiles;

type
  TSettingsForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    Label8: TLabel;
    Button1: TButton;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;
  Ini: TIniFile;

implementation

{$R *.DFM}

uses
Mainfm;

procedure TSettingsForm.Button1Click(Sender: TObject);
begin
MainForm1.Enabled:=True;
SettingsForm.Close;
end;

procedure TSettingsForm.ComboBox2Change(Sender: TObject);
begin
try
Ini:=TIniFile.Create('settings\settings.ini');
if (ComboBox2.ItemIndex=1) then
begin
Label1.Caption:='INTERFACE';
Label2.Caption:='Application Language';
Label4.Caption:='Calendar';
Label5.Caption:='Displays the monthly calendar along with today'+#39+'s date.';
Label8.Caption:='ADDITIONALLY';
Label6.Caption:='Show year progress in';
ComboBox4.ItemIndex:=ComboBox1.ItemIndex;
ComboBox5.ItemIndex:=ComboBox3.ItemIndex;
ComboBox1.Visible:=False;
ComboBox4.Visible:=True;
ComboBox3.Visible:=False;
ComboBox5.Visible:=True;
SettingsForm.Caption:='Settings';
Mainfm.MainForm1.MenuButton.Caption:='Menu';

Ini.WriteString('Main','Language','2');
end else begin

Label1.Caption:='ИНТЕРФЕЙС';
Label2.Caption:='Язык программы';
Label4.Caption:='Календарь';
Label5.Caption:='Отображает месячный календарь вместе с сегодняшней датой.';
Label8.Caption:='ДОПОЛНИТЕЛЬНО';
Label6.Caption:='Показывать годовую протяженность в';
ComboBox1.ItemIndex:=ComboBox4.ItemIndex;
ComboBox3.ItemIndex:=ComboBox5.ItemIndex;
SettingsForm.Caption:='Настройки';
ComboBox1.Visible:=True;
ComboBox4.Visible:=False;
ComboBox3.Visible:=True;
ComboBox5.Visible:=False;
Ini.WriteString('Main','Language','1');
end;
except
end;
end;

procedure TSettingsForm.ComboBox4Change(Sender: TObject);
begin
Ini:=TIniFile.Create('settings\settings.ini');
if ComboBox4.ItemIndex=1 then
begin
 MainForm1.Calendar1.Visible:=False;
 MainForm1.Label2.Left:=116;
 MainForm1.Label1.Left:=152;
 MainForm1.Label3.Left:=256;
 Ini.WriteString('Main','ShowCalendar','Disabled');
end;
if ComboBox4.ItemIndex=0 then
begin
 MainForm1.Calendar1.Visible:=True;
 MainForm1.Label2.Left:=220;
 MainForm1.Label1.Left:=256;
 MainForm1.Label3.Left:=368;
 Ini.WriteString('Main','ShowCalendar','Enabled');
end;

end;

procedure TSettingsForm.ComboBox1Change(Sender: TObject);
begin
Ini:=TIniFile.Create('settings\settings.ini');
if ComboBox1.ItemIndex=1 then
begin
 MainForm1.Calendar1.Visible:=False;
 MainForm1.Label2.Left:=116;
 MainForm1.Label1.Left:=152;
 MainForm1.Label3.Left:=256;
 Ini.WriteString('Main','ShowCalendar','Disabled');
end;
if ComboBox1.ItemIndex=0 then
begin
 MainForm1.Calendar1.Visible:=True;
 MainForm1.Label2.Left:=220;
 MainForm1.Label1.Left:=256;
 MainForm1.Label3.Left:=368;
 Ini.WriteString('Main','ShowCalendar','Enabled');
end;
end;

procedure TSettingsForm.ComboBox5Change(Sender: TObject);
begin
Ini:=TIniFile.Create('settings\settings.ini');
if ComboBox5.ItemIndex=1 then
begin
 Ini.WriteString('Additionally','UnitTime','Days');
end;
if ComboBox5.ItemIndex=0 then
begin
 Ini.WriteString('Additionally','UnitTime','Percents');
end;
end;

procedure TSettingsForm.ComboBox3Change(Sender: TObject);
begin
Ini:=TIniFile.Create('settings\settings.ini');
if ComboBox3.ItemIndex=1 then
begin
 Ini.WriteString('Additionally','UnitTime','Days');
end;
if ComboBox3.ItemIndex=0 then
begin
 Ini.WriteString('Additionally','UnitTime','Percents');
end;
end;

end.
