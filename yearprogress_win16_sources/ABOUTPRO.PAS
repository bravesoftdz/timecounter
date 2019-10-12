unit AboutPro;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TAboutProgram = class(TForm)
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    OKButton: TButton;
    Label5: TLabel;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutProgram: TAboutProgram;

implementation

{$R *.DFM}

procedure TAboutProgram.OKButtonClick(Sender: TObject);
begin
AboutProgram.Close;
end;


end.
