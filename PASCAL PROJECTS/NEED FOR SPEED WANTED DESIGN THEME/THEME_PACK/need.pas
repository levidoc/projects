unit need;

interface

uses
  Windows, Messages,math, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, pngimage, menu;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lblUser: TLabel;
    lblPassword: TLabel;
    Image2: TImage;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel4: TPanel;
    Image4: TImage;
    Panel5: TPanel;
    Image3: TImage;
    Label9: TLabel;
    Timer3: TTimer;
    Timer4: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sword:char;
  spassword,sDetails:String;
  sresulet:String;
  K,i,j:integer;
  blProceed:Boolean;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  sDetails:='HARDY MAZIBELI';
  j:=0;
  i:=0;
  Timer1.Enabled:=true;
  sresulet:='';
  Timer2.Enabled:=true;
  lblPassword.Caption:='';
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  blProceed:=false;
  sDetails:=' HARDY MAZIBELI';
  j:=0;
  i:=0;
  Timer1.Enabled:=true;
  sresulet:='';
  Timer2.Enabled:=true;
  lblPassword.Caption:='';


end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  blProceed:=false;
  sDetails:=' HARDY MAZIBELI';
  j:=0;
  i:=0;
  Timer1.Enabled:=true;
  sresulet:='';
  Timer2.Enabled:=true;
  lblPassword.Caption:='';

end;

procedure TForm1.Label7Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
  blProceed:=false;
  sDetails:=' HARDY MAZIBELI';
  j:=0;
  i:=0;
  Timer1.Enabled:=true;
  sresulet:='';
  Timer2.Enabled:=true;
  lblPassword.Caption:='';


end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
sChar:char;
iran,k:integer;
sOutput:String;

begin
if Timer1.Enabled=true then
 begin

  if j<=Length(sDetails) then
  begin
  sChar:=sdetails[j];
  k:=ord(schar);
    iran:=RandomRange(k-7,k+1);
   if iran<>k then
   begin

    sword:=char(iran);
    lblUser.Caption:=sresulet+sword;

   end
   else
   begin
   inc(j);
   sresulet:=sresulet+sDetails[j];
   lblUser.Caption:=sresulet;
   end;

  end
  else
  begin
  blProceed:=true;
  Timer1.Enabled:=false;
  end;
 end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
slen:integer;
begin

 if timer2.Enabled=true then
 begin

 spassword:=' ***********';
 slen:=Length(spassword);
 if i<=slen then
 begin
 if ODD(I) then
 BEGIN
   Label6.Caption:='SIGNING IN \..';
 END
 ELSE
 BEGIN
   Label6.Caption:='SIGNING IN ../';
 END;
 inc(i);
 lblPassword.Caption:=lblPassword.Caption+spassword[i];

 end
 else
 BEGIN
 Label6.Caption:='SIGNING IN';
 Timer2.Enabled:=false;

 END;
 end;

end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
INC(K);
if (ODD(K)=TRUE) then
  BEGIN
    Label9.Caption:='ANALYSING DATABASE -- LV3';
    Label9.Font.Color:=clGreen;
  END
  ELSE
  BEGIN
    Label9.Caption:='CODENAME: LEVIDOC-PROJECT';
    Label9.Font.Color:=clWhite;
  END;
end;

procedure TForm1.Timer4Timer(Sender: TObject);
begin
if timer4.Enabled=true then
  begin
   if blProceed=true then
   begin
    frmMenu.Show;
    blProceed:=false;
    Timer4.Enabled:=false;
   end
  end;
end;

end.
