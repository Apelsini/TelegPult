unit uFrmMain;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uTelegramAPI, uTelegramAPI.Interfaces, uConsts,
  Vcl.StdCtrls, uClassMessageDTO, Vcl.ExtCtrls, Vcl.Buttons, System.IOUtils,
  Vcl.Samples.Spin,
    {inifiles} inifiles,  Winapi.Windows, ShellAPI,
  {getscreenshot} Vcl.Imaging.jpeg, FMX.Objects;

type
  TMain = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EdtTokenBot: TEdit;
    EdtUserId: TEdit;
    polling: TSpinEdit;
    Label3: TLabel;
    CBautosettings: TCheckBox;
    Panel2: TPanel;
    Label6: TLabel;
    Panel3: TPanel;
    Label7: TLabel;
    ScreenshotCommand: TEdit;
    Label8: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    TextMessageCommand: TEdit;
    TextMsg: TEdit;
    Panel5: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    HelpCommand: TEdit;
    testHelpClick: TButton;
    CheckBoxListCommands: TCheckBox;
    Label15: TLabel;
    OpenDialog1: TOpenDialog;
    Panel6: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    FileReadName: TLabel;
    FileReadCommand: TEdit;
    BtnReadFile: TButton;
    Button7: TButton;
    Panel7: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    FileSendName: TLabel;
    FileSendCommand: TEdit;
    Button9: TButton;
    Panel8: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ShutdownCommand: TEdit;
    SScheckbox: TCheckBox;
    TestScreenshot: TButton;
    BtnSendMsg: TButton;
    BtnSendFile: TButton;
    Panel9: TPanel;
    Button1: TButton;
    BtnSendLocation: TButton;
    btnSendPhoto: TButton;
    Label23: TLabel;
    Button2: TButton;
    Panel11: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    B6label: TEdit;
    B6URL: TEdit;
    Panel12: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    B5label: TEdit;
    B5URL: TEdit;
    Panel13: TPanel;
    Label34: TLabel;
    Label35: TLabel;
    B4label: TEdit;
    B4URL: TEdit;
    Panel14: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    B3label: TEdit;
    B3URL: TEdit;
    Panel15: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    B2label: TEdit;
    B2URL: TEdit;
    Panel16: TPanel;
    Label43: TLabel;
    Label44: TLabel;
    B1label: TEdit;
    B1URL: TEdit;
    Panel17: TPanel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    ButtonCommand: TEdit;
    ButtonsMessage: TEdit;
    Button13: TButton;
    B1checkbox: TCheckBox;
    B2checkbox: TCheckBox;
    B3checkbox: TCheckBox;
    B4checkbox: TCheckBox;
    B5checkbox: TCheckBox;
    B6checkbox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnSendFileClick(Sender: TObject);
    procedure BtnSendMsgClick(Sender: TObject);
    procedure BtnSendWithButtonsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnSendLocationClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSendPhotoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure testHelpClickClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BtnReadFileClick(Sender: TObject);
    procedure TestScreenshotClick(Sender: TObject);

  private
    { Private declarations }
    FTelegram: iTelegramAPI;
    FAsyncHttp: TThread;
    procedure OnAPIError(AExcept: Exception);
    procedure Parse(msg:string; sender:TObject);
  public
    { Public declarations }
  end;

var
  Main: TMain;
  commandlist:TStringList;
  executelist:TStringList;

implementation

{$R *.dfm}

               {ini data collection}
function DesktopLeft: Integer;
begin
  Result := GetSystemMetrics(SM_XVIRTUALSCREEN);
end;

function DesktopWidth: Integer;
begin
  Result := GetSystemMetrics(SM_CXVIRTUALSCREEN);
end;

function DesktopTop: Integer;
begin
  Result := GetSystemMetrics(SM_YVIRTUALSCREEN);
end;

function DesktopHeight: Integer;
begin
  Result := GetSystemMetrics(SM_CYVIRTUALSCREEN);
end;

procedure setpar(section,param,value:string);
   vaR Ini: TIniFile;
   begin
       Ini := TIniFile.Create( ChangeFileExt( ParamStr(0), '.INI' ) );
         try
     Ini.WriteString( section, param, value );
          finally
     Ini.Free;
         end;
   end;

function getpar(section,param:string):string;
   vaR Ini: TIniFile;
   begin
       Ini := TIniFile.Create( ChangeFileExt( paramstr(0), '.INI' ));
         try
    Result := Ini.ReadString( section, param, 'empty' );
        finally
     Ini.Free;
        end;
   end;

  {Get screenshot routine}
procedure GetScreenShot(var dest: Vcl.Graphics.TBitmap);
var
  cVCL  : Vcl.Graphics.TCanvas;
  bmpVCL: Vcl.Graphics.TBitmap;
  msBmp : TMemoryStream;
begin
  bmpVCL      := Vcl.Graphics.TBitmap.Create;
  cVCL        := Vcl.Graphics.TCanvas.Create;
  cVCL.Handle := GetDC(HWND_DESKTOP);
  try
    bmpVCL.Width := Screen.Width;
    bmpVCL.Height := Screen.Height;
    bmpVCL.Canvas.CopyRect(Rect(0, 0, Screen.Width, Screen.Height),
                           cVCL,
                           Rect(0, 0, Screen.Width, Screen.Height)
                          );
  finally
    ReleaseDC(0, cVCL.Handle);
    cVCL.Free;
  end;

  msBmp := TMemoryStream.Create;
  try
    bmpVCL.SaveToStream(msBmp);
    msBmp.Position := 0;
    dest.LoadFromStream(msBmp);
  finally
    msBmp.Free;
  end;
end;
            {get local computer name routine}
function GetLocalComputerName(
  NameType: TComputerNameFormat = ComputerNameDnsHostname): string;
var
  len: DWORD;
begin
  len:= 0;
  GetComputerNameEx(NameType, nil, len); //get length
  SetLength(Result, len - 1);
  if not GetComputerNameEx(NameType, PChar(Result), len) then RaiseLastOSError;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        commandlist.Destroy;
        executelist.Destroy;



    {setpar('bot','token',edttoken.Text);
    setpar('bot','chatid',chatid.Text);
    setpar('commands','help',helpedit.Text);
    if helpbox.IsChecked then setpar('commands','helpautosend','1');
    setpar('commands','info',helpedit.Text);
    setpar('app','left',inttostr(Main.Left));
    setpar('app','top',inttostr(Main.Top));
    setpar('commands','file',filecom.Text);
    setpar('commands','filename',filename.Text);  }
if cbautosettings.Checked then begin

     {writing app section of INI file}
  setpar('app','left', Inttostr(Main.Left));
 setpar('app','top', inttostr(Main.Top));
  if cbautosettings.Checked then setpar('app','cbautosettings','1') else setpar('app','cbautosettings','0');
    {writing bot section of INI file}
    setpar('bot','token',edttokenbot.Text);
    setpar('bot','userid',edtuserid.Text);
    setpar('bot','polling',inttostr(polling.Value));
     {reading command section of INI file}
    setpar('commands','textcommand',TextMessageCommand.Text);
    setpar('commands','textmessage',TextMsg.Text);
    setpar('commands','helpcommand',HelpCommand.Text);
    if CheckBoxListCommands.Checked then setpar('commands','helpcommandval','1') else setpar('commands','helpcommandval','0');
  setpar('commands','filesendcommand',Filesendcommand.Text);
   setpar('commands','filesendname',Filesendname.Caption);
      setpar('commands','filereadcommand',FileReadcommand.Text);
   setpar('commands','filereadname',FileReadname.Caption);
       setpar('commands','shutdowncommand',Shutdowncommand.Text);
    setpar('commands','screenshotcommand',Screenshotcommand.Text);
           if SSCheckbox.Checked then setpar('commands','sscommandval','1') else setpar('commands','sscommandval','0');
    setpar('commands','buttoncommand',Buttoncommand.Text);
    setpar('commands','buttonsmessage',ButtonsMessage.Text);
     if B1checkbox.Checked then setpar('commands','B1checkbox','1') else setpar('commands','B1checkbox','0') ;
    setpar('commands','b1label',B1label.Text);
    setpar('commands','b1url',B1URL.Text);
 if B2checkbox.Checked then setpar('commands','B2checkbox','1') else setpar('commands','B2checkbox','0') ;
    setpar('commands','b2label',B2label.Text);
    setpar('commands','b2url',B2URL.Text);
 if B3checkbox.Checked then setpar('commands','B3checkbox','1') else setpar('commands','B3checkbox','0') ;
    setpar('commands','b3label',B3label.Text);
    setpar('commands','b3url',B3URL.Text);
 if B4checkbox.Checked then setpar('commands','B4checkbox','1') else setpar('commands','B4checkbox','0') ;
    setpar('commands','b4label',B4label.Text);
    setpar('commands','b4url',B4URL.Text);
 if B5checkbox.Checked then setpar('commands','B5checkbox','1') else setpar('commands','B5checkbox','0') ;
    setpar('commands','b5label',B5label.Text);
    setpar('commands','b5url',B5URL.Text);
 if B6checkbox.Checked then setpar('commands','B6checkbox','1') else setpar('commands','B6checkbox','0') ;
    setpar('commands','b61abel',B6label.Text);
    setpar('commands','b6url',B6URL.Text);
                                      end;

end;

procedure TMain.FormCreate(Sender: TObject);
begin
  EdtTokenBot.Text := '____';

  // use the button "getUpdates" for get chats IDs(only messages sent to your bot)
  EdtUserId.Text := '___';

  FTelegram := TTelegramAPI.New();
  FTelegram
    .OnError(OnAPIError)
    .SetUserID(EdtUserId.Text)
    .SetBotToken(EdtTokenBot.Text);
     {initialize pool of commands -  it is a two stringlists, one is storing IDs and commands, second - its processing status}
  commandlist:=TStringList.Create;
  executelist:=TStringlist.Create;
     {reading app section of INI file}
  if getpar('app','left')<>'empty' then Main.Left:=strtoint(getpar('app','left'));
if getpar('app','top')<>'empty' then Main.Top:=strtoint(getpar('app','top'));
    setpar('app','top',inttostr(Main.Top));
    if getpar('app','cbautosettings')='1' then cbautosettings.Checked:=true;
    {reading bot section of INI file}
    edttokenbot.Text:=getpar('bot','token');
    edtuserid.Text:=getpar('bot','userid');
    if getpar('bot','polling')<>'empty' then polling.Value:=strtoint(getpar('bot','polling')) else polling.Value:=5;
     {reading command section of INI file}
    TextMessageCommand.Text:=getpar('commands','textcommand');
    TextMsg.Text:=getpar('commands','textmessage');
    HelpCommand.Text:=getpar('commands','helpcommand');
    if getpar('commands','helpcommandval')='1' then CheckBoxListCommands.Checked:=true;
  Filesendcommand.Text:=  getpar('commands','filesendcommand');
   Filesendname.Caption:=  getpar('commands','filesendname');
      FileReadcommand.Text:=  getpar('commands','filereadcommand');
   FileReadname.Caption:=  getpar('commands','filereadname');
       Shutdowncommand.Text:=  getpar('commands','shutdowncommand');
    Screenshotcommand.Text:=  getpar('commands','screenshotcommand');
           if getpar('commands','sscommandval')='1' then SSCheckbox.Checked:=true;
    Buttoncommand.Text:=  getpar('commands','buttoncommand');
    ButtonsMessage.Text:=  getpar('commands','buttonsmessage');
     if getpar('commands','B1checkbox')='1' then B1checkbox.Checked:=true;
    B1label.Text:=  getpar('commands','b1label');
    B1URL.Text:= getpar('commands','b1url');
     if getpar('commands','B2checkbox')='1' then B2checkbox.Checked:=true;
    B2label.Text:=  getpar('commands','b2label');
    B2URL.Text:= getpar('commands','b2url');
     if getpar('commands','B3heckbox')='1' then B3checkbox.Checked:=true;
    B3label.Text:=  getpar('commands','b3label');
    B3URL.Text:= getpar('commands','b3url');
     if getpar('commands','B4checkbox')='1' then B4checkbox.Checked:=true;
    B4label.Text:=  getpar('commands','b4label');
    B4URL.Text:= getpar('commands','b4url');
     if getpar('commands','B5checkbox')='1' then B5checkbox.Checked:=true;
    B5label.Text:=  getpar('commands','b5label');
    B5URL.Text:= getpar('commands','b5url');
     if getpar('commands','B6checkbox')='1' then B6checkbox.Checked:=true;
    B6label.Text:=  getpar('commands','b6label');
    B6URL.Text:= getpar('commands','b6url');
   {initialize commands if they're empty}
  if TextMessageCommand.Text='empty' then TextMessageCommand.Text:='/text';
  if  HelpCommand.Text='empty' then  HelpCommand.Text:='/help';
  if Filesendcommand.Text='empty' then Filesendcommand.Text:='/filesend';
  if FileReadcommand.Text='empty' then FileReadcommand.Text:='/fileread';
  if Shutdowncommand.Text='empty' then Shutdowncommand.Text:='/shutdown';
   if Screenshotcommand.Text='empty' then Screenshotcommand.Text:='/screenshot';
   if ButtonCommand.Text='empty' then begin
   ButtonCommand.Text:='/buttons';
   buttonsMessage.Text:='Instructions how to use the TelegPult app:';
   B1checkbox.Checked:=true;
   B1label.Text:='in English';
   B1URL.Text:='https://a.u9.by/TelegPult-app-English/';
   B2checkbox.Checked:=true;
   B2label.Text:='in Russian';
   B2URL.Text:='https://a.u9.by/%D0%9F%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5-TelegPult-%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D1%8F/';
                                     end;



end;

procedure TMain.BtnReadFileClick(Sender: TObject);
 var iFileHandle: Integer;
  iFileLength: Integer;
  iBytesRead: Integer;
  minimum:integer;
  Buffer: PAnsiChar;
  i: Integer;
  output:string;
begin
if FileReadName.Caption<>'' then begin

    try
      iFileHandle := System.SysUtils.FileOpen(FileReadName.Caption, fmOpenRead);
      iFileLength := System.SysUtils.FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);
      Buffer := System.AllocMem(iFileLength + 1);
      iBytesRead := System.SysUtils.FileRead(iFileHandle, Buffer^, iFileLength);
      FileClose(iFileHandle);
      if (ifilelength-1)<4094 then minimum:=ifilelength-1 else minimum:=4094;
      for i := 0 to minimum do  output:=output+Buffer[i];
    finally
      FreeMem(Buffer);
    end;
  FTelegram.SendMsg(output);
  Memo1.Text := FTelegram.GetResult();
                                end;

end;

procedure TMain.BtnSendFileClick(Sender: TObject);
begin
if FileSendName.Caption<>'' then FTelegram.SendFile(FileSendName.Caption);
  Memo1.Text := FTelegram.GetResult();
end;

procedure TMain.BtnSendMsgClick(Sender: TObject);
begin
  FTelegram.SendMsg(TextMsg.Text);

  Memo1.Text := FTelegram.GetResult();
end;

procedure TMain.BtnSendWithButtonsClick(Sender: TObject);
var
  pButtons: TTelegramButtons;
begin
  pButtons := TTelegramButtons.Create;
  with pButtons do
  begin
    if b1checkbox.Checked then Add(B1label.Text, B1URL.text);
     if b2checkbox.Checked then Add(B2label.Text, B2URL.text);
         if b3checkbox.Checked then Add(B3label.Text, B3URL.text);
             if b4checkbox.Checked then Add(B4label.Text, B4URL.text);
                 if b5checkbox.Checked then Add(B5label.Text, B5URL.text);
                     if b6checkbox.Checked then Add(B6label.Text, B6URL.text);
      end;

  FTelegram.SendMsgWithButtons(ButtonsMessage.Text, pButtons);
end;

procedure TMain.Button1Click(Sender: TObject);
var
  pChatList: TChatMessageDTOList;
  pChat: TChatMessageDTO;
begin
  pChatList := TChatMessageDTOList.Create;
  pChat := TChatMessageDTO.Create;

  FTelegram.GetUpdates(pChatList);

  for pChat in pChatList do
    ShowMessage(pChat.Message.Text + ' - ' + pChat.Message.From.Id.ToString);
end;

procedure TMain.Parse(msg:string; sender:TObject);
begin
if msg=TextMessageCommand.Text then BtnSendMsgclick(sender);
if msg=HelpCommand.Text then TestHelpClickClick(sender);
if msg=FileSendCommand.Text then BtnSendFileClick(sender);
if msg=FileReadCommand.Text then BtnreadFileClick(sender);
if msg=Shutdowncommand.Text then  ShellExecute(0, nil,'shutdown',' -s -t 00','', SW_SHOWNORMAL);
if msg=Screenshotcommand.Text then TestScreenshotClick(sender);
if msg=ButtonCommand.Text then BtnSendwithButtonsClick(sender);

end;

procedure TMain.Button2Click(Sender: TObject);
begin
  FTelegram.SetBotToken(EdtTokenBot.Text);
  FTelegram.SetUserID(EdtUserId.Text);
   if CheckBoxListCommands.Checked then   testhelpclickclick(sender);

  if not Assigned(FAsyncHttp) then
  begin
    FAsyncHttp := TThread.CreateAnonymousThread(
      procedure
      var
        pChatList: TChatMessageDTOList;
      begin
        pChatList := TChatMessageDTOList.Create;

        while True do
        begin
          pChatList.Clear;

          FTelegram.GetUpdates(pChatList);

          FAsyncHttp.Synchronize(FAsyncHttp,
            procedure
            var
              pChat: TChatMessageDTO;
              var ix:integer;
            begin
              Memo1.Lines.Clear;
              Memo1.Lines.Add('- updated on -' + TimeToStr(Now()));

              for pChat in pChatList do begin
                Memo1.Lines.Add(pChat.Message.Text);
                //ParsedLastCommand:=false;
                //Parse(pChat.Message.Text);
                                        end;
                 //catching the last message only
                memo1.Lines.Add('search for last command index in the pool of commands is='+inttostr(commandlist.IndexOf(Inttostr(pChat.Message.Message_Id)+pChat.Message.Text)));
                if (commandlist.IndexOf(Inttostr(pChat.Message.Message_Id)+pChat.Message.Text)<0)
                then begin
                commandlist.Add(Inttostr(pChat.Message.Message_Id)+pChat.Message.Text);
                executelist.Add('not_processed');
                 memo1.Lines.Add('the command '+Inttostr(pChat.Message.Message_Id)+pChat.Message.Text+' not_processed');
                      end
                else if executelist.Strings[commandlist.IndexOf(Inttostr(pChat.Message.Message_Id)+pChat.Message.Text)]='not_processed'
                then begin
                Parse(pChat.Message.Text, sender);
                executelist.Strings[commandlist.IndexOf(Inttostr(pChat.Message.Message_Id)+pChat.Message.Text)]:='processed';
                memo1.Lines.Add('the command '+Inttostr(pChat.Message.Message_Id)+pChat.Message.Text+' is processed');
                     end;
                memo1.Lines.Add('--pool of commands--');
                for ix:=0 to commandlist.Count-1 do
                memo1.Lines.Add(commandlist.Strings[ix]+'-'+executelist.Strings[ix]);

              Memo1.Lines.Add('-');
            end);

          FAsyncHttp.Sleep(polling.Value*1000);
        end;

      end);

    FAsyncHttp.Start();
  end;
end;

procedure TMain.TestScreenshotClick(Sender: TObject);
var dest:Vcl.Graphics.TBitmap;

   today : TDateTime;
   t:TBITMAP;
 jp: TJPEGImage;
begin

dest:=Vcl.Graphics.TBitmap.Create;
 Getscreenshot(dest);
 dest.SaveToFile(application.GetNamePath+'ss.bmp');
 today := Time;

         jp := TJPEGImage.Create;
          try
    with jp do
    begin
      Assign(dest);
      jp.SaveToFile(application.GetNamePath+'ss.jpg');
      end;
  finally
    jp.Free;
  end;
     dest.Free;
FTelegram.SendPhoto(application.GetNamePath+'ss.jpg');
if sscheckbox.Checked then FTelegram.SendMsg(timetostr(today));

end;

procedure TMain.Button7Click(Sender: TObject);
begin
     if opendialog1.Execute then  FileReadname.caption:=opendialog1.FileName;

end;

procedure TMain.Button9Click(Sender: TObject);
begin
      if opendialog1.Execute then FileSendName.Caption:=opendialog1.FileName;

end;

procedure TMain.testHelpClickClick(Sender: TObject);
var usage:string;
begin
 usage := 'Usage on ' + Getlocalcomputername(ComputerNameNetBIOS) + #13#10 + //
      textMessageCommand.text+' - send predefined text message ['+TextMsg.Text+']' + #13#10 + //
      HelpCommand.Text+' - send this help information' + #13#10 + //
      FileSendCommand.Text+' - send a file (selected on local PC) in binary mode' + #13#10 + //
      FileReadCommand.TExt+' - send first 4k of the selected file as text' + #13#10 +
      ShutdownCommand.Text+' - shutdown a local PC' + #13#10 +
      ScreenshotCommand.Text+' - send a desktop screenshot of a local PC'+ #13#10 +
      ButtonCommand.Text+' - send a Telegram keyboard with buttons that links to webpages (after installation of the app contains instructions on Bot setup)';
    FTelegram.SendMsg(usage);
end;

procedure TMain.btnSendPhotoClick(Sender: TObject);     {test. not used}
begin
     FTelegram.SendPhoto('C:\Cli.jpg');
  Memo1.Text := FTelegram.GetResult();
end;

procedure TMain.BtnSendLocationClick(Sender: TObject);  {test, not used}
begin
  FTelegram.SendLocation('51.519138', '-0.129028');
end;

procedure TMain.OnAPIError(AExcept: Exception);      {test, not used}
begin
  TThread.Synchronize(TThread.Current, procedure
  begin
    MessageDlg(AExcept.Message, mtWarning, [mbOK], 0);
  end);
end;

procedure TMain.SpeedButton1Click(Sender: TObject); {not used}
begin
  FTelegram.SetBotToken(EdtTokenBot.Text);
  FTelegram.SetUserID(EdtUserId.Text);
end;

end.
