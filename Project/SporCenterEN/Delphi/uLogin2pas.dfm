object FrmLogin2: TFrmLogin2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'User Register'
  ClientHeight = 436
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlWrapper: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 436
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 37
      Width = 52
      Height = 13
      Caption = 'User Name'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 14
      Top = 65
      Width = 46
      Height = 13
      Caption = 'Password'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 87
      Top = 34
      Width = 200
      Height = 21
      DataField = 'username'
      DataSource = D_Connection.DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 87
      Top = 61
      Width = 200
      Height = 21
      DataField = 'userpass'
      DataSource = D_Connection.DataSource1
      PasswordChar = '*'
      TabOrder = 1
    end
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 391
      Width = 314
      Height = 44
      DataSource = D_Connection.DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Align = alBottom
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 316
    Top = 0
    Width = 256
    Height = 436
    Align = alRight
    DataSource = D_Connection.DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'username'
        Width = 200
        Visible = True
      end>
  end
end
