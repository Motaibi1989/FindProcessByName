unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;

    procedure Button1Click(Sender: TObject);
  private

  public


  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

uses LCLIntf, JwaWindows, jwatlhelp32, MouseAndKeyInput;

function FindProcessByName(const ProcName: string): DWORD;
var
  Proc: TPROCESSENTRY32W;
  hSnap: HWND;
  Looper: BOOL;
begin

  Form1.memo1.Clear;

  Result       := 0;
  Proc.dwSize  := SizeOf(Proc);
  hSnap        := CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0);
  Looper       := Process32FirstW(hSnap, Proc);
  while Integer(Looper) <> 0 do
  begin

    //if UpperCase(ExtractFileName(string(proc.szExeFile))) = UpperCase(ProcName) then
    //begin
    //
    //  Form1.memo1.Lines.Add(UpperCase(ExtractFileName(string(proc.szExeFile))));
    //
    //  Result:=proc.th32ProcessID;
    //  Break;
    //end;

    Form1.memo1.Lines.Add(UpperCase(ExtractFileName(string(proc.szExeFile))));
    Looper := Process32NextW(hSnap, Proc);


  end;
  CloseHandle(hSnap);
end;


{
function GetProcessMainWindow(const PID: DWORD; const wFirstHandle: HWND): HWND;
var
  wHandle: HWND;
  ProcID: DWord;
begin
  Result := 0;
  wHandle := GetWindow(wFirstHandle, GW_HWNDFIRST);
  while wHandle > 0 do
  begin
    GetWindowThreadProcessID(wHandle, @ProcID);
    if (ProcID = PID) and (IsWindowVisible(wHandle)) then
    begin
      Result := wHandle;
      Break;
    end;
    wHandle := GetWindow(wHandle, GW_HWNDNEXT);
  end;
end;
}





procedure TForm1.Button1Click(Sender: TObject);
var
  PID     : DWord;
  //wHandle : THandle;
  //R       : TRect;
  //P       : TPoint;
begin
  PID     := FindProcessByName('notepad.exe');


  //if PID > 0 then
  begin
    //wHandle := GetProcessMainWindow(PID, Self.Handle);
    //if wHandle > 0 then
    //begin
      //ShowWindow(wHandle, SW_SHOWDEFAULT);
      //SetWindowPos(wHandle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
      //GetWindowRect(wHandle, R);
      //P.x := R.Left + 50;
      //P.Y := R.Top + 10;
      //MouseInput.Click(mbLeft, [], P.x, P.y);
    //end;
  end;
end;

end.

