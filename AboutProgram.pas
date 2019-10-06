unit AboutProgram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, StrUtils, Registry, ActiveX, ComObj, ShellApi;


type
  TAboutProgram1 = class(TForm)
    StaticText2: TStaticText;
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
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Label7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  AboutProgram1: TAboutProgram1;


implementation

{$R *.dfm}

uses YearProgressForm;

procedure TAboutProgram1.Button1Click(Sender: TObject);
begin
AboutProgram1.Close;
YearProgressForm1.Enabled:=True;
YearProgressForm1.Show;
end;


procedure TAboutProgram1.FormActivate(Sender: TObject);
 var winver: string;
begin
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

end.
