{$I ..\..\dn4d\Source\Adato.inc}

unit ADato.ObjectModel.List.Tracking.intf;

interface

uses
  System_,
  ADato.ObjectModel.List.intf,
  System.Collections.Generic,
  ADato.ObjectModel.intf, ADato.InsertPosition;

type
  TObjectListChangeType = (Changed, Added, Removed);
  IObjectListModelChangeTracking = interface;

  {$IFDEF DELPHI}
  AskForApplyEventHandlerProc = procedure(const Sender: IObjectListModelChangeTracking; var AllowApply: Boolean) of object;

  AskForApplyEventHandler = interface(IDelegate)
    procedure Add(Value: AskForApplyEventHandlerProc);
    function  Contains(Value: AskForApplyEventHandlerProc) : Boolean;
    procedure Remove(value: AskForApplyEventHandlerProc);
    procedure Invoke(const Sender: IObjectListModelChangeTracking; var AllowApply: Boolean);
  end;

  AskForApplyEventDelegate = class(Delegate, AskForApplyEventHandler)
  protected
    procedure Add(Value: AskForApplyEventHandlerProc);
    function  Contains(Value: AskForApplyEventHandlerProc) : Boolean;
    procedure Remove(value: AskForApplyEventHandlerProc);
    procedure Invoke(const Sender: IObjectListModelChangeTracking; var AllowApply: Boolean);
  end;
  {$ELSE}
  AskForApplyEventHandler = public delegate(const Sender: IObjectListModelChangeTracking; var AllowApply: Boolean);
  {$ENDIF}

  IAddingNew = interface(IBaseInterface)
    ['{67286028-BC82-4738-B80E-18E3CBCBA686}']
    function CreateInstance: CObject;
  end;

  IChangedSupport = interface(IBaseInterface)
    ['{EE4A8BDA-16EE-4281-9C86-06675DCAEB89}']
    function get_Changed: Boolean;

    property Changed: Boolean read get_Changed;
  end;

  IEditState = interface(IBaseInterface)
    ['{E64C221B-1C01-412D-A048-07B1C1DBF4C0}']
    function  get_IsChanged: Boolean;
    function  get_IsEdit: Boolean;
    function  get_IsNew: Boolean;
    function  get_IsEditOrNew: Boolean;

    property IsChanged: Boolean read get_isChanged;
    property IsEdit: Boolean read get_IsEdit;
    property IsNew: Boolean read get_IsNew;
    property IsEditOrNew: Boolean read get_IsEditOrNew;
  end;

  IEditableModel = interface(IBaseInterface)
    ['{23545838-1360-4F0E-BD26-1F07F25B9A37}']
    function  AddNew(Index: Integer; Position: InsertPosition) : Boolean;
    procedure BeginEdit(ItemIndex: Integer);
    procedure CancelEdit;
    procedure EndEdit;
    procedure Remove;{$IFDEF DEBUG}overload;{$ENDIF}

//    {$IFDEF DEBUG}
    // KV: Should be part of IEditableListObject??
//    procedure Remove(Item: CObject);overload;
//    {$ENDIF}

    function CanAdd : Boolean;
    function CanEdit : Boolean;
    function CanRemove : Boolean;
  end;

  IEditableListObject = interface(IBaseInterface)
    ['{7CD78A03-4C56-4953-A5DE-3AC4D09E2278}']
    procedure AddNew(const item: CObject; Index: Integer; Position: InsertPosition);
    procedure BeginEdit(Index: Integer);
    procedure EndEdit;
    procedure CancelEdit;
  end;

  IListItemChanged = interface(IBaseInterface)
    ['{C759EDBE-9732-4C1D-A54E-8B1A55579BBE}']
    procedure AddingNew(const Value: CObject; var Index: Integer; Position: InsertPosition);
    procedure Added(const Value: CObject; const Index: Integer);
    procedure Removed(const Value: CObject; const Index: Integer);
    procedure BeginEdit(const Item: CObject);
    procedure CancelEdit(const Item: CObject);
    procedure EndEdit(const Item: CObject);
  end;

  IObjectListModelChangeTracking = interface(IObjectListModelContextStorage)
    ['{909AA97F-A9C7-4578-ACC9-D345BB6D48E9}']
    {$IFDEF DELPHI}
    function  get_OnAskForApply: AskForApplyEventHandler;
    {$ENDIF}
    function  get_HasChangedItems: Boolean;
    function  get_ChangedItems: Dictionary<CObject, TObjectListChangeType>;
    function  get_OnItemChanged: IList<IListItemChanged>;
    procedure set_StoreChangedItems(const Value: Boolean);

    procedure NotifyAddingNew(const Context: IObjectModelContext; var Index: Integer; Position: InsertPosition);
    procedure NotifyCancelEdit(const Context: IObjectModelContext; const OriginalObject: CObject);
    procedure NotifyBeginEdit(const Context: IObjectModelContext);
    procedure NotifyEndEdit(const Context: IObjectModelContext; const OriginalObject: CObject; Index: Integer; Position: InsertPosition);
    procedure NotifyRemoved(const Item: CObject; const Index: Integer);

    function RetrieveUpdatedItems: Dictionary<CObject, TObjectListChangeType>;

    property HasChangedItems: Boolean read get_HasChangedItems;
    property ChangedItems: Dictionary<CObject, TObjectListChangeType> read get_ChangedItems;
    property OnItemChanged: IList<IListItemChanged> read get_OnItemChanged;
    property StoreChangedItems: Boolean write set_StoreChangedItems;

    {$IFDEF DELPHI}
    property OnAskForApply: AskForApplyEventHandler read get_OnAskForApply;
    {$ELSE}
    event OnAskForApply: AskForApplyEventHandler;
    {$ENDIF}
  end;

implementation

{ AskForApplyEventDelegate }

{$IFDEF DELPHI}
procedure AskForApplyEventDelegate.Add(Value: AskForApplyEventHandlerProc);
begin
  inherited Add(TMethod(Value));
end;

function AskForApplyEventDelegate.Contains(Value: AskForApplyEventHandlerProc): Boolean;
begin
  Result := inherited Contains(TMethod(Value));
end;

procedure AskForApplyEventDelegate.Invoke(const Sender: IObjectListModelChangeTracking; var AllowApply: Boolean);
var
  cnt: Integer;

begin
  AllowApply := True;

  cnt := 0;
  while cnt < _events.Count do
  begin
    AskForApplyEventHandlerProc(_events[cnt]^)(Sender, {var} AllowApply);
    inc(cnt);

    if not AllowApply then
      Exit;
  end;
end;

procedure AskForApplyEventDelegate.Remove(value: AskForApplyEventHandlerProc);
begin
  inherited Remove(TMethod(Value));
end;
{$ENDIF}

end.
