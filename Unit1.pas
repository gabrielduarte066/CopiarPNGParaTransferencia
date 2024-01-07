unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Skia, Vcl.Menus, Vcl.Skia,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    SkAnimatedImage1: TSkAnimatedImage;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    procedure Copiar1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure CopiarPNGParaAreaTransferencia(const bytes: TBytes);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Clipbrd,PNGImage;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   if OpenDialog1.Execute then
      SkAnimatedImage1.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.Copiar1Click(Sender: TObject);
begin
    CopiarPNGParaAreaTransferencia(SkAnimatedImage1.Source.Data);

end;


procedure TForm1.CopiarPNGParaAreaTransferencia(const bytes: TBytes);
var
  PNGImage: TPngImage;
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    Stream.WriteBuffer(bytes[0], Length(bytes));

    PNGImage := TPngImage.Create;
    try
      Stream.Position := 0;
      PNGImage.LoadFromStream(Stream);

      Clipboard.Open;
      try
        Clipboard.Assign(PNGImage);
      finally
        Clipboard.Close;
      end;
    finally
      PNGImage.Free;
    end;
  finally
    Stream.Free;
  end;
end;


end.
