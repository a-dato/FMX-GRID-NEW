{$I ..\..\dn4d\Source\Adato.inc}

unit ADato.TraceEvents.intf;

interface

uses
  {$IFDEF DELPHI}
  System.Classes, 
  System.SysUtils,
  {$ENDIF}
  System_;

const
  CCPM = 'CCPM';
  JIRA = 'JIRA';
  EXTERNAL_SOURCE = 'EXTERNAL_SOURCE';
  GANTTDM = 'GANTTDM';
  CHAINS = 'CHAINS';

type
  TLevel = (Normal, Verbose, ExtraVerbose);

  IEventTracer = interface
    ['{4BC8E544-161B-418A-AB6F-6F8FCEA44F27}']
    function  IsActive(const AGroup: string; const ALevel: TLevel = TLevel.Normal): Boolean;

    function  GetHasException: Boolean;
    procedure SetHasException(const Value: Boolean);
    function  GetFilename: string;
    function  GetGroups: TStringList;
    function  GetLevel: TLevel;
    procedure SetLevel(const Value: TLevel);
    function  GetSupportBeginEndTrace: Boolean;
    procedure SetSupportBeginEndTrace(const Value: Boolean);
    function  get_UseCsvFormatting: Boolean;
    procedure set_UseCsvFormatting(const Value: Boolean);
    function  GetWriteToStdOut: Boolean;
    procedure SetWriteToStdOut(const Value: Boolean);

    function  BeginTrace(const AGroup: string; const AFilename: string) : Boolean;
    procedure TraceToFile(const AMessage: string); overload;
    procedure TraceToFile(const Func: TFunc<string>); overload;
    procedure EndTrace(const AFilename: string);

    procedure TraceMessage(const Group: string; const AMessage: string; const Level: TLevel = TLevel.Normal); overload;
    procedure TraceMessage(const Group: string; const Func: TFunc<string>; const Level: TLevel = TLevel.Normal); overload;
    procedure TraceMessageParts(const Group: string; const MessagesFunc: TFunc<CObject.ObjectArray>; const Level: TLevel = TLevel.Normal);
    procedure TraceException(const Group: string; const Func: TFunc<string>; const Level: TLevel = TLevel.Normal); overload;
    procedure StopTracing(CleanupTempFile: Boolean);

    function  StartTimer(const Group: string; const TimerID: string; const Level: TLevel = TLevel.Normal) : Boolean;
    procedure StopTimer(const Group: string; const TimerID: string);

    property UseCsvFormatting: Boolean read get_UseCsvFormatting write set_UseCsvFormatting;
    property HasException: Boolean read GetHasException write SetHasException;
    property Filename: string read GetFilename;
    property Groups: TStringList read GetGroups;
    property Level: TLevel read GetLevel write SetLevel;
    property WriteToStdOut: Boolean read GetWriteToStdOut write SetWriteToStdOut;
    property SupportBeginEndTrace: Boolean read GetSupportBeginEndTrace write SetSupportBeginEndTrace;
  end;

  TEmptyEventTracer = class(TInterfacedObject, IEventTracer)
  protected
    class var _WriteToStdOut: Boolean; // System wide property
    class var _SupportBeginEndTrace: Boolean;
    class var _UseCsvFormatting: Boolean;

    var _HasException: Boolean;

    function  FormatTraceMessage(const Group, AMessage: string) : string; virtual;
    procedure TraceMessageInternal(const Group: string; const AMessage: string; const Level: TLevel); virtual;

    function  IsActive(const AGroup: string; const ALevel: TLevel = TLevel.Normal): Boolean; virtual;

    function  GetHasException: Boolean; virtual;
    procedure SetHasException(const Value: Boolean); virtual;
    function  GetFilename: string; virtual;
    function  GetGroups: TStringList;  virtual;
    function  GetLevel: TLevel; virtual;
    procedure SetLevel(const Value: TLevel); virtual;
    function  GetSupportBeginEndTrace: Boolean; virtual;
    procedure SetSupportBeginEndTrace(const Value: Boolean); virtual;
    function  get_UseCsvFormatting: Boolean; virtual;
    procedure set_UseCsvFormatting(const Value: Boolean); virtual;
    function  GetWriteToStdOut: Boolean;
    procedure SetWriteToStdOut(const Value: Boolean);

    function  BeginTrace(const AGroup: string; const AFilename: string) : Boolean; virtual;
    procedure TraceToFile(const AMessage: string); overload; virtual;
    procedure TraceToFile(const Func: TFunc<string>); overload; virtual;
    procedure EndTrace(const AFilename: string); virtual;

    procedure TraceMessage(const Group: string; const AMessage: string; const Level: TLevel); overload;
    procedure TraceMessage(const Group: string; const Func: TFunc<string>; const Level: TLevel = TLevel.Normal); overload;
    procedure TraceMessageParts(const Group: string; const MessagesFunc: TFunc<CObject.ObjectArray>; const Level: TLevel = TLevel.Normal);
    procedure TraceException(const Group: string; const Func: TFunc<string>; const Level: TLevel = TLevel.Normal); overload;

    procedure StopTracing(CleanupTempFile: Boolean); virtual;

    function  StartTimer(const Group: string; const TimerID: string; const Level: TLevel = TLevel.Normal) : Boolean; virtual;
    procedure StopTimer(const Group: string; const TimerID: string); virtual;
  end;

  function PointerToString(P: Pointer) : string;

var
  EventTracer: IEventTracer;

implementation


function PointerToString(P: Pointer) : string;
begin
  Result := string.Format('$%p', [P]);
end;

{ TEmptyEventTracer }

function TEmptyEventTracer.BeginTrace(const AGroup: string; const AFilename: string) : Boolean;
begin
  Result := False;
end;

procedure TEmptyEventTracer.EndTrace(const AFilename: string);
begin

end;

function TEmptyEventTracer.FormatTraceMessage(const Group, AMessage: string): string;
begin
  //Formatting description when not CSV:
  //{0,12} -> HH:mm:ss.fff should always be 12 charchters
  //{0,25} -> 25 charchters for the group
  //{1}    -> Message

  if _UseCsvFormatting then
    Result := CString.Format('{0},{1},{2}', [CDateTime.Now.ToString('HH:mm:ss.fff').ToString, Group, AMessage]) else
    Result := CString.Format('{0,-12} {1,-25}:{2}', [CDateTime.Now.ToString('HH:mm:ss.fff').ToString, Group, AMessage]);
end;

function TEmptyEventTracer.GetFilename: string;
begin

end;

function TEmptyEventTracer.GetGroups: TStringList;
begin
  Result := nil;
end;

function TEmptyEventTracer.GetHasException: Boolean;
begin
  Result := _HasException;
end;

function TEmptyEventTracer.GetLevel: TLevel;
begin
  Result := TLevel.Normal;
end;

function TEmptyEventTracer.GetSupportBeginEndTrace: Boolean;
begin
  Result := _SupportBeginEndTrace;
end;

procedure TEmptyEventTracer.SetSupportBeginEndTrace(const Value: Boolean);
begin
  _SupportBeginEndTrace := Value;
end;

function TEmptyEventTracer.GetWriteToStdOut: Boolean;
begin
  Result := _WriteToStdOut;
end;

function TEmptyEventTracer.get_UseCsvFormatting: Boolean;
begin
  Result := _UseCsvFormatting;
end;

function TEmptyEventTracer.IsActive(const AGroup: string; const ALevel: TLevel): Boolean;
begin
  Result := _WriteToStdOut;
end;

procedure TEmptyEventTracer.SetHasException(const Value: Boolean);
begin
  _HasException := _HasException or Value;
end;

procedure TEmptyEventTracer.SetLevel(const Value: TLevel);
begin

end;

procedure TEmptyEventTracer.SetWriteToStdOut(const Value: Boolean);
begin
  _WriteToStdOut := Value;
end;

procedure TEmptyEventTracer.set_UseCsvFormatting(const Value: Boolean);
begin
  _UseCsvFormatting := Value;
end;

procedure TEmptyEventTracer.TraceMessageInternal(const Group: string; const AMessage: string; const Level: TLevel);
begin
  if _WriteToStdOut then
    WriteLn(FormatTraceMessage(Group, AMessage));
end;

procedure TEmptyEventTracer.TraceMessage(const Group, AMessage: string; const Level: TLevel);
begin
  if IsActive(Group, Level) then
    TraceMessageInternal(Group, AMessage, Level);
end;

procedure TEmptyEventTracer.TraceMessageParts(const Group: string; const MessagesFunc: TFunc<CObject.ObjectArray>; const Level: TLevel);
begin
  var Messages := MessagesFunc();
  var AMessage := '';
  var i: Integer;
  for i := Low(Messages) to High(Messages) do
  begin
    AMessage := AMessage.PadRight(i*25) + Messages[i].ToString();
  end;

  TraceMessage(Group, AMessage, Level);
end;

procedure TEmptyEventTracer.TraceMessage(const Group: string; const Func: TFunc<string>; const Level: TLevel);
begin
  if IsActive(Group, Level) then
    TraceMessageInternal(Group, Func(), Level);
end;

procedure TEmptyEventTracer.TraceException(const Group: string; const Func: TFunc<string>; const Level: TLevel = TLevel.Normal);
begin
  _HasException := True;
  if IsActive(Group, Level) then
    TraceMessageInternal(Group, Func(), Level);
end;

procedure TEmptyEventTracer.TraceToFile(const AMessage: string);
begin

end;

procedure TEmptyEventTracer.TraceToFile(const Func: TFunc<string>);
begin

end;

procedure TEmptyEventTracer.StopTracing(CleanupTempFile: Boolean);
begin

end;

function TEmptyEventTracer.StartTimer(const Group: string; const TimerID: string; const Level: TLevel = TLevel.Normal) : Boolean;
begin
  Result := False;
end;

procedure TEmptyEventTracer.StopTimer(const Group: string; const TimerID: string);
begin

end;

initialization
  EventTracer := TEmptyEventTracer.Create;

finalization
  EventTracer.StopTracing(not EventTracer.HasException);

end.
