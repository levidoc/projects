program pj_need;

uses
  Forms,
  need in 'need.pas' {Form1},
  menu in 'menu.pas' {frmMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
