unit UFMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ExtDlgs;

type
  TFLightDetection = class(TForm)
    ImgOrigin : TImage;
    ImgProcessed : TImage;
    BProcessImage : TButton;
    OpenPictureDialog1 : TOpenPictureDialog;
    procedure BProcessImageClick(Sender : TObject);
    procedure FormCanResize(Sender : TObject; var NewWidth, NewHeight : Integer; var Resize : Boolean);
    procedure FormActivate(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLightDetection : TFLightDetection;

implementation

{$R *.dfm}

uses
  UColorImages, UGrayScaleImages, UPixelConvert;

procedure TFLightDetection.BProcessImageClick(Sender : TObject);
const
  tN = 25;
var
  Img : TCColorImage;
  gs, ti : TCGrayscaleImage;
  i, j, k, l, q, sall, sh : word;
  hist : UGrayScaleImages.tH;
begin
  if not OpenPictureDialog1.Execute then
    exit;
  ImgOrigin.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  Img := TCColorImage.Create;
  ti := TCGrayscaleImage.Create;
  Img.LoadFromFile(OpenPictureDialog1.FileName);

  gs := Img.ConvertToGrayscale;

  i := 1;
  j := 1;
  ti.Height := tN;
  ti.Width := tN;
  while i + 2 * tN < Img.Height do
  begin
    j := 1;
    while j + 2 * tN < Img.Width do
    begin
      for k := 0 to tN do
        for l := 0 to tN do
          ti.Pixels[k, l] := gs.Pixels[i + k, j + l];
      hist := ti.HistogramVal;
      sall := 0;
      sh := 0;
      for q := 0 to 255 do
        sall := sall + hist[q];
      for q := 200 to 255 do
        sh := sh + hist[q];

      if sh / sall >= 0.8 then
      begin
        for k := 1 to tN do
          for l := 1 to tN do
            Img.Pixels[i + k, j + l].FullColor := clRed;
      end;

      j := j + tN div 2;
    end;
    i := i + tN div 2;
    Img.SaveToFile(ExtractFilePath(OpenPictureDialog1.FileName) + '\LD' + ExtractFileName(OpenPictureDialog1.FileName));
  end;

  ImgProcessed.Picture.Bitmap.Assign(Img.SaveToBitMap);
  Img.Free;
end;

procedure TFLightDetection.FormActivate(Sender : TObject);
begin
  ImgOrigin.Canvas.Pen.Color := clBlack;
  ImgOrigin.Canvas.Pen.Style := psSolid;
  ImgOrigin.Canvas.Brush.Color := clWhite;
  ImgOrigin.Canvas.Brush.Style := bsSolid;
  ImgOrigin.Canvas.Rectangle(0, 0, ImgOrigin.Width, ImgOrigin.Height);
  ImgProcessed.Canvas.Pen.Color := clBlack;
  ImgProcessed.Canvas.Pen.Style := psSolid;
  ImgProcessed.Canvas.Brush.Color := clWhite;
  ImgProcessed.Canvas.Brush.Style := bsSolid;
  ImgProcessed.Canvas.Rectangle(0, 0, ImgProcessed.Width, ImgProcessed.Height);
end;

procedure TFLightDetection.FormCanResize(Sender : TObject; var NewWidth, NewHeight : Integer; var Resize : Boolean);
begin
  Resize := false;
end;

end.
