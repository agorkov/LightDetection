program LightDetection;

uses
  Forms,
  UFMain in 'UFMain.pas' {FLightDetection},
  UBinaryImages in '..\..\ImgSharedUnits\src\UBinaryImages.pas',
  UBitMapFunctions in '..\..\ImgSharedUnits\src\UBitMapFunctions.pas',
  UColorImages in '..\..\ImgSharedUnits\src\UColorImages.pas',
  UGrayscaleImages in '..\..\ImgSharedUnits\src\UGrayscaleImages.pas',
  UPixelConvert in '..\..\ImgSharedUnits\src\UPixelConvert.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFLightDetection, FLightDetection);
  Application.Run;
end.
