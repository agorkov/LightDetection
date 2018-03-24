object FLightDetection: TFLightDetection
  Left = 0
  Top = 0
  Caption = #1054#1073#1085#1072#1088#1091#1078#1077#1085#1080#1077' '#1079#1072#1089#1074#1077#1090#1086#1074
  ClientHeight = 342
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object ImgOrigin: TImage
    Left = 8
    Top = 8
    Width = 369
    Height = 297
    Center = True
    Proportional = True
    Stretch = True
  end
  object ImgProcessed: TImage
    Left = 383
    Top = 8
    Width = 369
    Height = 297
    Center = True
    Proportional = True
    Stretch = True
  end
  object BProcessImage: TButton
    Left = 8
    Top = 311
    Width = 744
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1080' '#1086#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
    TabOrder = 0
    OnClick = BProcessImageClick
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 48
    Top = 24
  end
end
