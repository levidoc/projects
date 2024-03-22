unit menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, jpeg;

type
  TfrmMenu = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel4: TPanel;
    Label11: TLabel;
    Panel5: TPanel;
    Image3: TImage;
    Panel6: TPanel;
    Label12: TLabel;
    Panel7: TPanel;
    Image4: TImage;
    Label13: TLabel;
    Label14: TLabel;
    tmrEncoding: TTimer;
    Label10: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    Label17: TLabel;
    Image2: TImage;
    Label18: TLabel;
    Image5: TImage;
    Label19: TLabel;
    Image7: TImage;
    Label21: TLabel;
    Image8: TImage;
    Image9: TImage;
    Label22: TLabel;
    Image6: TImage;
    procedure Panel1Click(Sender: TObject);
    procedure tmrEncodingTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;
  J,k:integer;

implementation

{$R *.dfm}

procedure TfrmMenu.Image4Click(Sender: TObject);
begin
frmMenu.Close;
end;

procedure TfrmMenu.Label12Click(Sender: TObject);
begin
frmMenu.Close;
end;

procedure TfrmMenu.Panel1Click(Sender: TObject);
begin
close;
end;

procedure TfrmMenu.Panel6Click(Sender: TObject);
begin
frmMenu.CLOSE;
end;

procedure TfrmMenu.Timer1Timer(Sender: TObject);
begin
  INC(J);
  Label4.Caption:='SPYWARE ACTIVE: '+IntToStr(RANDOM(J));
  Label6.Caption:='MALWARE ACTIVE: '+IntToStr(Random(J));
  Label7.Caption:='ADWARE ACTIVE: '+IntToStr(Random(J));
  Label10.Caption:='PASSWORDS OBTAINED: '+IntToStr(Random(J));
  if ODD(J) then
  BEGIN
    Label15.Caption:='COOKIES ENABLED';
    Label16.Caption:='ACTIVE TROJANS: '+IntToStr(J);
  END
  ELSE
  BEGIN
    Label15.Caption:='COOKIES LOST';
    Label16.Caption:='SIGNAL LOST'
  END;
end;

procedure TfrmMenu.tmrEncodingTimer(Sender: TObject);
begin
  inc(k);
  if J>30 then
  BEGIN
    J:=1;
  END;
  if odd(k) then
   begin
     Label8.Caption:='DDOS STATUS: ENCODING';
     Label8.Font.Color:=clBlack;
     Label14.Font.Color:=clWhite;
     Label14.Caption:='CASE FILE: LV-0975-REWO'
   end
   else
   begin
     Label8.Caption:='DDOS STATUS: ACTIVE';
     Label8.Font.Color:=clWhite;
     Label14.Caption:='HACKING INSTRUMENT';
     Label14.Font.Color:=clGreen;
   end;
end;

end.
