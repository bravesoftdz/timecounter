unit AboutProgram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, StrUtils, Registry, ActiveX, ComObj, ShellApi;


type
  TAboutProgram1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Panel2: TPanel;
    Label7: TLabel;
    Panel3: TPanel;
    Image7: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image3: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Image4: TImage;
    Image5: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Label7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  AboutProgram1: TAboutProgram1;


implementation

{$R *.dfm}

uses YearProgressForm, IniFiles;

procedure TAboutProgram1.Button1Click(Sender: TObject);
begin
AboutProgram1.Close;
YearProgressForm1.Enabled:=True;
YearProgressForm1.Show;
end;


procedure TAboutProgram1.FormActivate(Sender: TObject);
 var winver: string;
 Ini: TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if (Ini.ReadString('Main','Language','')='2') then
begin
  Label7.Caption:='About DMIT Computers Time Counter';
  Label1.Caption:='This program is based on a '+#39+'Year Progress'+#39+' project, created by Fillip Hracek in 2015, and has been successfully ported to the Pascal and JavaScript programming languages.';
  Label3.Caption:='DMIT Computers Time Counter for Windows';
  Label4.Caption:='Program Version 1.5.0 (November 2019)';
  Label2.Caption:='Go to the site of the original project';
end else
begin
  Label7.Caption:='О программе DMIT Computers Time Counter';
  Label1.Caption:='Эта программа создана на основе проекта Year Progress, созданного Filip Hracek в 2015 году, и успешно портирована на языках программирования Pascal и JavaScript.';
  Label3.Caption:='Счетчик времени DMIT Computers';
  Label4.Caption:='Версия программы 1.5.0 (ноябрь 2019)';
  Label2.Caption:='Перейти на сайт оригинального проекта';
end;
   if CheckWin32Version(10, 0) then
     winver:='Windows 10 (NT 10.0)'
     else
   if CheckWin32Version(6, 3) then
     winver:='Windows 8.1 (NT 6.3)'
   else
   if CheckWin32Version(6, 2) then
      winver:='Windows 8 (NT 6.2)'
   else
   if CheckWin32Version(6, 1) then
      winver:='Windows 7 (NT 6.1)'
   else
   if CheckWin32Version(6, 0) then
     winver:='Windows Vista (NT 6.0)'
   else
   if CheckWin32Version(5, 1) then
     winver:='Windows XP (NT 5.1)'
   else
   if CheckWin32Version(5, 0) then
     winver:='Windows 2000 (NT 5.0)'
   else
   if CheckWin32Version(4, 0) then
     winver:='Windows NT 4.0 Workstation/Server';
end;

procedure TAboutProgram1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
YearProgressForm1.Enabled:=True;
YearProgressForm1.Show;
end;

procedure TAboutProgram1.FormCreate(Sender: TObject);
 var Ini: TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if (Ini.ReadString('Main','Language','')='2') then
begin
  Label7.Caption:='About DMIT Computers Time Counter';
  Label1.Caption:='This program is based on a '+#39+'Year Progress'+#39+' project, created by Fillip Hracek in 2015, and has been successfully ported to the Pascal and JavaScript programming languages.';
  Label3.Caption:='DMIT Computers Time Counter for Windows';
  Label4.Caption:='Program Version 1.5.0 (November 2019)';
  Label2.Caption:='Go to the site of the original project';
end else
begin
  Label7.Caption:='О программе DMIT Computers Time Counter';
  Label1.Caption:='Эта программа создана на основе проекта Year Progress, созданного Filip Hracek в 2015 году, и успешно портирована на языках программирования Pascal и JavaScript.';
  Label3.Caption:='Счетчик времени DMIT Computers';
  Label4.Caption:='Версия программы 1.5.0 (ноябрь 2019)';
  Label2.Caption:='Перейти на сайт оригинального проекта';
end;

end;

procedure TAboutProgram1.Image4Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('http://vk.com/dmitcompgroup/'), nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutProgram1.Image5Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('http://discord.gg/FfZ7ZzT'), nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutProgram1.Label2Click(Sender: TObject);
begin
 ShellExecute(0, 'open', PChar('http://progressbarserver.appspot.com/'), nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutProgram1.Label7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 AboutProgram1.perform(WM_SysCommand,$F012,0);
end;


procedure TAboutProgram1.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 ReleaseCapture;
 AboutProgram1.perform(WM_SysCommand,$F012,0);
end;

procedure TAboutProgram1.Panel3Click(Sender: TObject);
begin
AboutProgram1.Close;
YearProgressForm1.Enabled:=True;
YearProgressForm1.Show;
end;

procedure TAboutProgram1.Timer1Timer(Sender: TObject);
 var Ini: TIniFile;
begin
Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings\settings.ini');
if (Ini.ReadString('Main','Language','')='2') then
begin
  Label7.Caption:='About DMIT Computers Time Counter';
  Label1.Caption:='This program is based on a '+#39+'Year Progress'+#39+' project, created by Fillip Hracek in 2015, and has been successfully ported to the Pascal and JavaScript programming languages.';
  Label3.Caption:='DMIT Computers Time Counter for Windows';
  Label4.Caption:='Program Version 1.5.0 (November 2019)';
  Label2.Caption:='Go to the site of the original project';
end else
begin
  Label7.Caption:='О программе DMIT Computers Time Counter';
  Label1.Caption:='Эта программа создана на основе проекта Year Progress, созданного Filip Hracek в 2015 году, и успешно портирована на языках программирования Pascal и JavaScript.';
  Label3.Caption:='Счетчик времени DMIT Computers';
  Label4.Caption:='Версия программы 1.5.0 (ноябрь 2019)';
  Label2.Caption:='Перейти на сайт оригинального проекта';
end;

end;

end.
