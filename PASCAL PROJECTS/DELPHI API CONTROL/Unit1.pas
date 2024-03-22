unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdAuthentication, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, Vcl.ComCtrls,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL;

type
  TForm1 = class(TForm)
    IdHTTP1: TIdHTTP;
    Button1: TButton;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Edit1: TEdit;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  link_url,response:string;
begin
  try
    link_url := Edit1.text;
    //link_url := InputBox('Insert The URL','','');
    response:= IdHTTP1.Get(link_url);
    RichEdit1.Clear;
    RichEdit1.Text := response;
  except
    on E: Exception do
    ShowMessage('Error: '+E.Message);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IdHTTP1.Request.ContentType := 'application/json';
  IdHTTP1.HandleRedirects := True;

  RichEdit1.Clear;
end;

end.
