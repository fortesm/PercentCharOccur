unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Character,   Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ComCtrls, RegularExpressions;

type
  TFrmMain = class(TForm)
    Memo: TMemo;
    BtCarregaArq: TButton;
    OpenDialog: TOpenDialog;
    BtLerChars: TButton;
    LbPath: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure BtCarregaArqClick(Sender: TObject);
    procedure BtLerCharsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.BtCarregaArqClick(Sender: TObject);
begin
  if OpenDialog.Execute then
    LbPath.Caption :=  Opendialog.FileName;
end;

procedure TFrmMain.BtLerCharsClick(Sender: TObject);
    function CountChar(const s: string; const c: char): integer;
    begin
       Result:= TRegEx.Matches(s, c, [roIgnoreCase]).Count
    end;

var  Arquivo : TextFile;
     Linha   : string;
     c: Char;
     Cont, I : integer;
     Percent : Extended;
     A : array[1..26] of integer;
     Al: array['a'..'z'] of string;

Const
    L : array[1..26] of char =
    ( 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
      'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'  );

begin
  Cont := 0;
  if FileExists(LbPath.Caption) then
  begin
     AssignFile(Arquivo, LbPath.Caption);
     FileMode := fmOpenRead;
     Reset(Arquivo);

     ZeroMemory(@A[1],length(A));
     While not Eof(Arquivo) do  // Lê o conteúdo do texto
     begin
        ReadLn(Arquivo, Linha);
        for I := Low(A) to High(A) do
            A[i] := A[i]  + CountChar(Linha, L[i]);

        for c in Linha do
           if not c.IsWhiteSpace and c.isLetter then  // Precisa de System.Character na clausula uses Delphi 10 sydney para cima
              inc(Cont);                              // CASO SEU DELPHI SEJA ANTIGO SUBSTITUIR o Helper c.isWhiteSpace POR  IsWhiteSpace(c)
     end;                                             // E c.IsLetter  POR isLetter(c)
     Memo.Clear;
     Memo.Lines.Add('Total de Caracteres sem acentos e sem espaço: '+ IntToStr(Cont) + ' Caracteres');
     Memo.Lines.Add('');

     for I := Low(A) to High(A) do
      begin
         Memo.Lines.Add('Total de ocorrências da letra ' + L[i] + ' : ' + IntToStr(  A[i] ));
         Percent := A[i] * 100 / Cont;
         Memo.Lines.Add('Porcentagem de ocorrências da letra ' + L[i] + ' : ' + formatfloat('##0.00', Percent ) + '%');
         Memo.Lines.Add('');
      end;
     Memo.SelStart := 0;
     Memo.SelLength := 1;
     CloseFile(Arquivo);
  end
  else ShowMessage ('Arquivo Não Encontrado!');
end;

end.
