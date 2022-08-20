object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TelegPult - communicate with your remote PC through Telegram Bot'
  ClientHeight = 681
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Consolas'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 530
    Width = 856
    Height = 151
    Align = alClient
    BorderStyle = bsNone
    Color = 14277119
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Log of interaction with Telegram Bot')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitLeft = -40
    ExplicitTop = 554
    ExplicitHeight = 214
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 856
    Height = 123
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    object Label4: TLabel
      Left = 1
      Top = 1
      Width = 854
      Height = 13
      Align = alTop
      Caption = 'Telegram Bot setup'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 108
    end
    object Label1: TLabel
      Left = 13
      Top = 59
      Width = 372
      Height = 13
      Caption = 'Insert User Id (from whom the response into Bot will be sent):'
    end
    object Label2: TLabel
      Left = 13
      Top = 21
      Width = 132
      Height = 13
      Caption = 'Insert Bot Token here:'
    end
    object Label3: TLabel
      Left = 205
      Top = 78
      Width = 138
      Height = 13
      Caption = 'Polling interval (sec):'
    end
    object EdtTokenBot: TEdit
      Left = 13
      Top = 34
      Width = 396
      Height = 21
      Color = clSilver
      TabOrder = 0
    end
    object EdtUserId: TEdit
      Left = 13
      Top = 72
      Width = 167
      Height = 21
      Color = clSilver
      TabOrder = 1
    end
    object polling: TSpinEdit
      Left = 349
      Top = 69
      Width = 57
      Height = 22
      MaxValue = 30
      MinValue = 1
      TabOrder = 2
      Value = 5
    end
    object CBautosettings: TCheckBox
      Left = 16
      Top = 97
      Width = 244
      Height = 17
      Caption = 'Autosave seetings on exit from the app'
      TabOrder = 3
    end
    object Button2: TButton
      Left = 466
      Top = 20
      Width = 110
      Height = 80
      Caption = 'CLICK HERE to start processing  Bot commands'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      WordWrap = True
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 123
    Width = 856
    Height = 366
    Align = alTop
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 2
    object Label6: TLabel
      Left = 1
      Top = 1
      Width = 854
      Height = 13
      Align = alTop
      Caption = 'Main Bot commands processed by this application'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 282
    end
    object Panel3: TPanel
      Left = 1
      Top = 149
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 14
      ExplicitWidth = 803
      object Label7: TLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Caption = 'Screenshot command '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label8: TLabel
        Left = 61
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label5: TLabel
        Left = 236
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Send the screenshot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label15: TLabel
        Left = 296
        Top = 1
        Width = 424
        Height = 25
        Align = alClient
        WordWrap = True
        ExplicitLeft = 362
        ExplicitWidth = 6
        ExplicitHeight = 13
      end
      object ScreenshotCommand: TEdit
        Left = 157
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 151
        ExplicitTop = 5
      end
      object SScheckbox: TCheckBox
        Left = 296
        Top = 1
        Width = 424
        Height = 25
        Align = alClient
        Caption = 'Plus a tagline with current time'
        TabOrder = 1
        WordWrap = True
        ExplicitLeft = 297
        ExplicitTop = 2
        ExplicitWidth = 557
      end
      object TestScreenshot: TButton
        Left = 720
        Top = 1
        Width = 133
        Height = 25
        Align = alRight
        Caption = 'Test Screenshot take'
        TabOrder = 2
        OnClick = TestScreenshotClick
        ExplicitLeft = 721
        ExplicitTop = 2
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 14
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 803
      object Label9: TLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Caption = 'Text message'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object Label10: TLabel
        Left = 61
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 73
        ExplicitHeight = 26
      end
      object Label11: TLabel
        Left = 236
        Top = 1
        Width = 114
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Send the following mesaage:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 248
        ExplicitHeight = 26
      end
      object TextMessageCommand: TEdit
        Left = 157
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 193
        ExplicitHeight = 21
      end
      object TextMsg: TEdit
        Left = 350
        Top = 1
        Width = 370
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'Hello world!'
        ExplicitLeft = 344
        ExplicitTop = -4
      end
      object BtnSendMsg: TButton
        Left = 720
        Top = 1
        Width = 133
        Height = 25
        Align = alRight
        Caption = 'Test Text message'
        TabOrder = 2
        OnClick = BtnSendMsgClick
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 41
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitTop = 14
      ExplicitWidth = 803
      object Label12: TLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Caption = 'Help command '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object Label13: TLabel
        Left = 61
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 79
        ExplicitHeight = 26
      end
      object Label14: TLabel
        Left = 236
        Top = 1
        Width = 108
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Send the list of available commands'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 254
        ExplicitHeight = 26
      end
      object HelpCommand: TEdit
        Left = 157
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 193
        ExplicitHeight = 21
      end
      object testHelpClick: TButton
        Left = 720
        Top = 1
        Width = 133
        Height = 25
        Align = alRight
        Caption = 'Test Help message'
        TabOrder = 1
        OnClick = testHelpClickClick
        ExplicitLeft = 726
        ExplicitTop = 5
      end
      object CheckBoxListCommands: TCheckBox
        Left = 344
        Top = 1
        Width = 376
        Height = 25
        Align = alClient
        Caption = 'Automatically send list of commands after Bot connected'
        TabOrder = 2
        WordWrap = True
        ExplicitLeft = 380
        ExplicitWidth = 340
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 95
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ExplicitTop = 14
      ExplicitWidth = 803
      object Label16: TLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Caption = 'File Read command '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object Label17: TLabel
        Left = 61
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label18: TLabel
        Left = 236
        Top = 1
        Width = 229
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Read first 4kbytes of the file and send it to Bot: :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 224
      end
      object FileReadName: TLabel
        Left = 465
        Top = 1
        Width = 180
        Height = 25
        Align = alClient
        WordWrap = True
        ExplicitLeft = 447
        ExplicitTop = 5
        ExplicitWidth = 192
      end
      object FileReadCommand: TEdit
        Left = 157
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 169
        ExplicitHeight = 21
      end
      object BtnReadFile: TButton
        Left = 720
        Top = 1
        Width = 133
        Height = 25
        Align = alRight
        Caption = 'Test FileRead command'
        TabOrder = 1
        OnClick = BtnReadFileClick
      end
      object Button7: TButton
        Left = 645
        Top = 1
        Width = 75
        Height = 25
        Align = alRight
        Caption = 'Open...'
        TabOrder = 2
        OnClick = Button7Click
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 68
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      ExplicitTop = 14
      ExplicitWidth = 803
      object Label20: TLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Caption = 'File Send command '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label21: TLabel
        Left = 61
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label22: TLabel
        Left = 236
        Top = 1
        Width = 114
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Send the following file:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitHeight = 26
      end
      object FileSendName: TLabel
        Left = 350
        Top = 1
        Width = 295
        Height = 25
        Align = alClient
        WordWrap = True
        ExplicitTop = 5
        ExplicitWidth = 428
      end
      object FileSendCommand: TEdit
        Left = 157
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 163
        ExplicitTop = 5
      end
      object Button9: TButton
        Left = 645
        Top = 1
        Width = 75
        Height = 25
        Align = alRight
        Caption = 'Open...'
        TabOrder = 1
        OnClick = Button9Click
      end
      object BtnSendFile: TButton
        Left = 720
        Top = 1
        Width = 133
        Height = 25
        Align = alRight
        Caption = 'Test SendFile command'
        TabOrder = 2
        OnClick = BtnSendFileClick
      end
    end
    object Panel8: TPanel
      Left = 1
      Top = 122
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ExplicitTop = 14
      ExplicitWidth = 803
      object Label24: TLabel
        Left = 1
        Top = 1
        Width = 60
        Height = 25
        Align = alLeft
        Caption = 'Shutdown command '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object Label25: TLabel
        Left = 61
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 55
        ExplicitHeight = 26
      end
      object Label26: TLabel
        Left = 236
        Top = 1
        Width = 252
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Shutdown the PC where this app is launched'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 230
        ExplicitTop = -3
      end
      object Label27: TLabel
        Left = 488
        Top = 1
        Width = 365
        Height = 25
        Align = alClient
        WordWrap = True
        ExplicitLeft = 482
        ExplicitWidth = 6
        ExplicitHeight = 13
      end
      object ShutdownCommand: TEdit
        Left = 157
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 163
        ExplicitTop = -3
      end
    end
    object Panel11: TPanel
      Left = 1
      Top = 338
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label28: TLabel
        Left = 98
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Caption = 'Button6 label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label29: TLabel
        Left = 296
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Button6 URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object B6label: TEdit
        Left = 157
        Top = 1
        Width = 139
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 194
      end
      object B6URL: TEdit
        Left = 355
        Top = 1
        Width = 498
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'Instructions how to use the TelegPult app:'
        ExplicitLeft = 361
        ExplicitTop = 5
      end
      object B6checkbox: TCheckBox
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Align = alLeft
        Caption = 'Button6'
        TabOrder = 2
        ExplicitLeft = -5
        ExplicitTop = -3
      end
    end
    object Panel12: TPanel
      Left = 1
      Top = 311
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label31: TLabel
        Left = 98
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Caption = 'Button5 Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label32: TLabel
        Left = 302
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Button5 URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object B5label: TEdit
        Left = 157
        Top = 1
        Width = 145
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 194
      end
      object B5URL: TEdit
        Left = 361
        Top = 1
        Width = 492
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'Instructions how to use the TelegPult app:'
        ExplicitTop = -3
      end
      object B5checkbox: TCheckBox
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Align = alLeft
        Caption = 'Button5'
        TabOrder = 2
        ExplicitLeft = -5
        ExplicitTop = 5
      end
    end
    object Panel13: TPanel
      Left = 1
      Top = 284
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label34: TLabel
        Left = 98
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Caption = 'Button4 label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitLeft = 92
        ExplicitTop = -3
      end
      object Label35: TLabel
        Left = 296
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Button4 URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object B4label: TEdit
        Left = 157
        Top = 1
        Width = 139
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 194
      end
      object B4URL: TEdit
        Left = 355
        Top = 1
        Width = 498
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'Instructions how to use the TelegPult app:'
      end
      object B4checkbox: TCheckBox
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Align = alLeft
        Caption = 'Button4'
        TabOrder = 2
        ExplicitLeft = -5
        ExplicitTop = -3
      end
    end
    object Panel14: TPanel
      Left = 1
      Top = 257
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label37: TLabel
        Left = 98
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Caption = 'Button3 Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label38: TLabel
        Left = 302
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Button3 URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object B3label: TEdit
        Left = 157
        Top = 1
        Width = 145
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 151
        ExplicitTop = 5
      end
      object B3URL: TEdit
        Left = 361
        Top = 1
        Width = 492
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'Instructions how to use the TelegPult app:'
        ExplicitLeft = 416
        ExplicitWidth = 304
        ExplicitHeight = 21
      end
      object B3checkbox: TCheckBox
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Align = alLeft
        Caption = 'Button3'
        TabOrder = 2
        ExplicitLeft = -36
        ExplicitTop = -3
      end
    end
    object Panel15: TPanel
      Left = 1
      Top = 230
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label40: TLabel
        Left = 98
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Caption = 'Button2 Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label41: TLabel
        Left = 296
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Button2 URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object B2label: TEdit
        Left = 157
        Top = 1
        Width = 139
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'in Russian'
        ExplicitLeft = 194
      end
      object B2URL: TEdit
        Left = 355
        Top = 1
        Width = 498
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 
          'https://a.u9.by/%D0%9F%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD' +
          '%D0%B8%D0%B5-TelegPult-%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%B' +
          'A%D1%86%D0%B8%D1%8F/'
        ExplicitTop = 5
      end
      object B2checkbox: TCheckBox
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Align = alLeft
        Caption = 'Button2'
        Checked = True
        State = cbChecked
        TabOrder = 2
        ExplicitLeft = -5
        ExplicitTop = 5
      end
    end
    object Panel16: TPanel
      Left = 1
      Top = 203
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label43: TLabel
        Left = 98
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Caption = 'Button1 Label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label44: TLabel
        Left = 302
        Top = 1
        Width = 59
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Button1 URL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object B1label: TEdit
        Left = 157
        Top = 1
        Width = 145
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'in English'
        ExplicitLeft = 151
        ExplicitTop = -3
      end
      object B1URL: TEdit
        Left = 361
        Top = 1
        Width = 492
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'https://a.u9.by/TelegPult-app-English/'
        ExplicitLeft = 416
        ExplicitWidth = 304
        ExplicitHeight = 21
      end
      object B1checkbox: TCheckBox
        Left = 1
        Top = 1
        Width = 97
        Height = 25
        Align = alLeft
        Caption = 'Button1'
        Checked = True
        State = cbChecked
        TabOrder = 2
        ExplicitLeft = -5
        ExplicitTop = -3
      end
    end
    object Panel17: TPanel
      Left = 1
      Top = 176
      Width = 854
      Height = 27
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      ExplicitLeft = 0
      ExplicitTop = 279
      object Label45: TLabel
        Left = 1
        Top = 1
        Width = 48
        Height = 25
        Align = alLeft
        Caption = 'Buttons command '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlight
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label46: TLabel
        Left = 49
        Top = 1
        Width = 96
        Height = 25
        Align = alLeft
        Caption = 'When user sends command:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitHeight = 26
      end
      object Label47: TLabel
        Left = 224
        Top = 1
        Width = 192
        Height = 25
        Align = alLeft
        Alignment = taCenter
        Caption = 'Send the following  caption and list of buttons'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Consolas'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitHeight = 26
      end
      object ButtonCommand: TEdit
        Left = 145
        Top = 1
        Width = 79
        Height = 25
        Align = alLeft
        TabOrder = 0
        Text = 'empty'
        ExplicitLeft = 139
        ExplicitTop = -3
      end
      object ButtonsMessage: TEdit
        Left = 416
        Top = 1
        Width = 304
        Height = 25
        Align = alClient
        TabOrder = 1
        Text = 'Instructions how to use the TelegPult app:'
        ExplicitLeft = 410
        ExplicitTop = 5
      end
      object Button13: TButton
        Left = 720
        Top = 1
        Width = 133
        Height = 25
        Align = alRight
        Caption = 'Test Buttons command'
        TabOrder = 2
        OnClick = BtnSendWithButtonsClick
      end
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 489
    Width = 856
    Height = 41
    Align = alTop
    Caption = 'Panel9'
    TabOrder = 3
    Visible = False
    ExplicitLeft = 664
    ExplicitTop = 464
    ExplicitWidth = 185
    object Label23: TLabel
      Left = 16
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Unused'
    end
    object Button1: TButton
      Left = 245
      Top = 16
      Width = 95
      Height = 25
      Caption = 'GetUpdates'
      TabOrder = 0
      OnClick = Button1Click
    end
    object BtnSendLocation: TButton
      Left = 466
      Top = 16
      Width = 95
      Height = 25
      Caption = 'SendLocation'
      TabOrder = 1
      OnClick = BtnSendLocationClick
    end
    object btnSendPhoto: TButton
      Left = 346
      Top = 16
      Width = 114
      Height = 25
      Caption = 'SendPhoto'
      TabOrder = 2
      OnClick = BtnSendPhotoClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 672
    Top = 25
  end
end
