object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 360
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object SkAnimatedImage1: TSkAnimatedImage
    Left = 8
    Top = 8
    Width = 345
    Height = 305
    PopupMenu = PopupMenu1
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 319
    Width = 121
    Height = 25
    Caption = 'Carregar IMG'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object PopupMenu1: TPopupMenu
    Left = 400
    Top = 208
    object Copiar1: TMenuItem
      Caption = 'Copiar'
      OnClick = Copiar1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 400
    Top = 112
  end
end
