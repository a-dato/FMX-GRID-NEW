unit FMX.DataControl.Static.Impl;

interface

uses
  System_,
  System.ComponentModel,
  System.Collections.Generic,
  System.Collections,
  System.JSON,

  FMX.Controls,
  FMX.DataControl.Static.Intf,
  FMX.DataControl.ScrollableRowControl.Impl,

  ADato.Collections.Specialized, System.Collections.Specialized, FMX.StdCtrls,
  FMX.DataControl.ScrollableRowControl.Intf, System.Classes, System.SysUtils,
  FMX.Layouts;

type
  TDCColumnSortAndFilter = class(TObservableObject, IDCColumnSortAndFilter)
  private
    _showSortMenu: Boolean;
    _showFilterMenu: Boolean;
    _sortType: TSortType;

    function  get_ShowFilterMenu: Boolean;
    procedure set_ShowFilterMenu(const Value: Boolean);
    function  get_ShowSortMenu: Boolean;
    procedure set_ShowSortMenu(const Value: Boolean);
    function  get_SortType: TSortType;
    procedure set_SortType(const Value: TSortType);

    function Clone: IDCColumnSortAndFilter; virtual;

  public
    procedure Assign(const Source: IBaseInterface); reintroduce; overload; virtual;

  published
    property Sort: TSortType read get_SortType write set_SortType;
    property ShowSortMenu: Boolean read get_ShowSortMenu write set_ShowSortMenu;
    property ShowFilterMenu: Boolean read get_ShowFilterMenu write set_ShowFilterMenu;
  end;

  TDCColumnWidthSettings = class(TObservableObject, IDCColumnWidthSettings)
  private
    _width: Single;
    _widthMin: Single;
    _widthMax: Single;
    _widthType: TDCColumnWidthType;

    function  get_Width: Single;
    procedure set_Width(const Value: Single);
    function  get_WidthMin: Single;
    procedure set_WidthMin(const Value: Single);
    function  get_WidthMax: Single;
    procedure set_WidthMax(const Value: Single);
    function  get_WidthType: TDCColumnWidthType;
    procedure set_WidthType(const Value: TDCColumnWidthType);

    function Clone: IDCColumnWidthSettings; virtual;

  public
    constructor Create; reintroduce;

    procedure Assign(const Source: IBaseInterface); reintroduce; overload; virtual;

  published
    property WidthType: TDCColumnWidthType read get_WidthType write set_WidthType;
    property Width: Single read get_Width write set_Width;
    property WidthMin: Single read get_WidthMin write set_WidthMin;
    property WidthMax: Single read get_WidthMax write set_WidthMax;

  end;

  TDCColumnSubControlSettings = class(TObservableObject, IDCColumnSubControlSettings)
  private
    _subPropertyName: CString;
    _subInfoControlClass: TInfoControlClass;

    function  get_SubPropertyName: CString;
    procedure set_SubPropertyName(const Value: CString);
    function  get_SubInfoControlClass: TInfoControlClass;
    procedure set_SubInfoControlClass(const Value: TInfoControlClass);


    function Clone: IDCColumnSubControlSettings; virtual;

  public
    procedure Assign(const Source: IBaseInterface); reintroduce; overload; virtual;

  published
    property SubPropertyName: CString read get_SubPropertyName write set_SubPropertyName;
    property SubInfoControlClass: TInfoControlClass read get_SubInfoControlClass write set_SubInfoControlClass;

  end;

  TDCColumnHierarchy = class(TObservableObject, IDCColumnHierarchy)
  private
    _showHierarchy: Boolean;
    _indent: Single;

    function  get_ShowHierarchy: Boolean;
    procedure set_ShowHierarchy(const Value: Boolean);
    function  get_Indent: Single;
    procedure set_Indent(const Value: Single);

    function Clone: IDCColumnHierarchy; virtual;

  public
    procedure Assign(const Source: IBaseInterface); reintroduce; overload; virtual;

  published
    property ShowHierarchy: Boolean read get_ShowHierarchy write set_ShowHierarchy;
    property Indent: Single read get_Indent write set_Indent;
  end;

  TDCColumnVisualisation = class(TObservableObject, IDCColumnVisualisation)
  private
    _visible: Boolean;
    _frozen: Boolean;
    _readOnly: Boolean;
    _selectable: Boolean;
    _allowHide: Boolean;
    _format: CString;

    _onVisibilityChanged: TProc;

    function  get_Visible: Boolean;
    procedure set_Visible(const Value: Boolean);
    function  get_Frozen: Boolean;
    procedure set_Frozen(const Value: Boolean);
    function  get_ReadOnly: Boolean;
    procedure set_ReadOnly(const Value: Boolean);
    procedure set_Selectable(Value : Boolean);
    function  get_Selectable: Boolean;
    function  get_AllowHide: Boolean;
    procedure set_AllowHide(const Value: Boolean);
    function  get_Format: CString;
    procedure set_Format(const Value: CString);

    function Clone: IDCColumnVisualisation; virtual;
  public
    constructor Create(const OnVisiblityChanged: TProc); reintroduce;

    procedure Assign(const Source: IBaseInterface); reintroduce; overload; virtual;

  published
    property Visible: Boolean read get_Visible write set_Visible;
    property Frozen: Boolean read get_Frozen write set_Frozen;
    property ReadOnly: Boolean read get_ReadOnly write set_ReadOnly;
    property Selectable: Boolean read get_Selectable write set_Selectable;
    property AllowHide: Boolean read get_AllowHide write set_AllowHide;
    property Format: CString read get_Format write set_Format;

  end;

  TDCTreeColumn = class(TObservableObject, IDCTreeColumn)
  private
    _treeControl: IColumnControl;

//    _index: Integer;
    _caption: CString;
    _propertyName: CString;
    _tag: CObject;

    _infoControlClass: TInfoControlClass;


    _format         : CString;
    _formatProvider : IFormatProvider;

    _cachedType: &Type;
    _cachedProp: _PropertyInfo;

    _widthSettings: IDCColumnWidthSettings;
    _sortAndFilter: IDCColumnSortAndFilter;
    _subControlSettings: IDCColumnSubControlSettings;
    _visualisation: IDCColumnVisualisation;
    _hierarchy: IDCColumnHierarchy;

    function  get_TreeControl: IColumnControl;
    procedure set_TreeControl(const Value: IColumnControl);

//    function  get_Index: Integer;
//    procedure set_Index(Value: Integer);
    function  get_Caption: CString;
    procedure set_Caption(const Value: CString);
    function  get_PropertyName: CString;
    procedure set_PropertyName(const Value: CString);
    function  get_Tag: CObject;
    procedure set_Tag(const Value: CObject);

    function  get_Visible: Boolean;
    function  get_Frozen: Boolean;
    function  get_ReadOnly: Boolean;
    function  get_AllowHide: Boolean;
    function  get_ShowSortMenu: Boolean;
    function  get_ShowFilterMenu: Boolean;
    function  get_SortType: TSortType;
    function  get_Selectable: Boolean;
    function  get_ShowHierarchy: Boolean;
    function  get_Indent: Single;
    function  get_InfoControlClass: TInfoControlClass;
    procedure set_InfoControlClass(const Value: TInfoControlClass);
    function  get_SubPropertyName: CString;
    function  get_SubInfoControlClass: TInfoControlClass;

    function  get_Width: Single;
    function  get_WidthMin: Single;
    function  get_WidthMax: Single;
    function  get_WidthType: TDCColumnWidthType;

    function  get_Format: CString;
    function  get_FormatProvider: IFormatProvider;
    procedure set_FormatProvider(const Value: IFormatProvider);


    function  get_SortAndFilter: IDCColumnSortAndFilter;
    procedure set_SortAndFilter(const Value: IDCColumnSortAndFilter);
    function  get_WidthSettings: IDCColumnWidthSettings;
    procedure set_WidthSettings(const Value: IDCColumnWidthSettings);
    function  get_SubControlSettings: IDCColumnSubControlSettings;
    procedure set_SubControlSettings(const Value: IDCColumnSubControlSettings);
    function  get_Visualisation: IDCColumnVisualisation;
    procedure set_Visualisation(const Value: IDCColumnVisualisation);
    function  get_Hierarchy: IDCColumnHierarchy;
    procedure set_Hierarchy(const Value: IDCColumnHierarchy);

    procedure OnVisibilityChanged;

  public
    constructor Create; override;

    function  Clone: IDCTreeColumn;
    function  IsCheckBoxColumn: Boolean; virtual;

    function  GetCellValue(const Cell: IDCTreeCell; const PropName: CString): CObject;
    function  GetDefaultCellData(const Cell: IDCTreeCell; const CellValue: CObject; FormatApplied: Boolean): CObject; virtual;

    // width settings
    property WidthType: TDCColumnWidthType read get_WidthType;
    property Width: Single read get_Width;
    property WidthMin: Single read get_WidthMin;
    property WidthMax: Single read get_WidthMax;

    // user actions
    property AllowHide: Boolean read get_AllowHide;
    property ShowSortMenu: Boolean read get_ShowSortMenu;
    property ShowFilterMenu: Boolean read get_ShowFilterMenu;
    property SortType: TSortType read get_SortType;

    property SubPropertyName: CString read get_SubPropertyName;
    property SubInfoControlClass: TInfoControlClass read get_SubInfoControlClass;

    property Visible: Boolean read get_Visible;
    property Frozen: Boolean read get_Frozen;
    property ReadOnly: Boolean read get_ReadOnly;
    property Selectable: Boolean read get_Selectable;
    property ShowHierarchy: Boolean read get_ShowHierarchy;
    property Indent: Single read get_Indent;
    property Format: CString read get_Format;

  published
//    property Index: Integer read get_Index write set_Index;
    property Caption: CString read get_Caption write set_Caption;
    property Tag: CObject read get_Tag write set_Tag;
    property PropertyName: CString read get_PropertyName write set_PropertyName;
    property InfoControlClass: TInfoControlClass read get_InfoControlClass write set_InfoControlClass;

    property WidthSettings: IDCColumnWidthSettings read get_WidthSettings write set_WidthSettings;
    property Visualisation: IDCColumnVisualisation read get_Visualisation write set_Visualisation;
    property SortAndFilter: IDCColumnSortAndFilter read get_SortAndFilter write set_SortAndFilter;
    property SubControlSettings: IDCColumnSubControlSettings read get_SubControlSettings write set_SubControlSettings;
    property Hierarchy: IDCColumnHierarchy read get_Hierarchy write set_Hierarchy;

//    property FormatProvider: IFormatProvider read get_FormatProvider write set_FormatProvider;
  end;

  TDCTreeCheckboxColumn = class(TDCTreeColumn, IDCTreeCheckboxColumn)
  public
    constructor Create; override;

    function  IsCheckBoxColumn: Boolean; override;
    function  GetDefaultCellData(const Cell: IDCTreeCell; const CellValue: CObject; FormatApplied: Boolean): CObject; override;
  end;

  TDCTreeColumnList = class(CObservableCollectionEx<IDCTreeColumn>, IDCTreeColumnList)
  protected
    _treeControl: IColumnControl;

    function  get_TreeControl: IColumnControl;
//    procedure OnCollectionChanged(e: NotifyCollectionChangedEventArgs); override;
    function  FindIndexByCaption(const Caption: CString) : Integer;
    function  FindColumnByCaption(const Caption: CString) : IDCTreeColumn;
    function  FindColumnByPropertyName(const Name: CString) : IDCTreeColumn;
    function  FindColumnByTag(const Value: CObject) : IDCTreeColumn;

    function  ColumnLayoutToJSON(const SystemLayout: TJSONObject): TJSONObject;
    procedure RestoreColumnLayoutFromJSON(const Value: TJSONObject);

    function  Add(const Value: CObject): Integer; override;
    procedure Insert(index: Integer; const value: CObject); overload; override;

  public
    constructor Create(const Owner: IColumnControl); overload; virtual;
    constructor Create(const Owner: IColumnControl; const col: IEnumerable<IDCTreeColumn>); overload; virtual;

    property TreeControl: IColumnControl read get_TreeControl;
  end;

  TTreeLayoutColumn = class(TBaseInterfacedObject, IDCTreeLayoutColumn)
  protected
    _widthChangedByUser: Boolean;
    _column: IDCTreeColumn;
    _index: Integer;
    _left: Single;
    _width: Single;
    _HideColumnInView: Boolean;

    [weak] _activeFilter: IListFilterDescription;
    [weak] _activeSort: IListSortDescription;

    function  get_Column: IDCTreeColumn;
    function  get_Index: Integer;
    procedure set_Index(const Value: Integer);
    function  get_Left: Single;
    procedure set_Left(Value: Single);
    function  get_Width: Single;
    procedure set_Width(Value: Single);
    function  get_WidthChangedByUser: Boolean;

    function  get_ActiveFilter: IListFilterDescription;
    procedure set_ActiveFilter(const Value: IListFilterDescription);
    function  get_ActiveSort: IListSortDescription;
    procedure set_ActiveSort(const Value: IListSortDescription);
    function  get_HideColumnInView: Boolean;
    procedure set_HideColumnInView(const Value: Boolean);

    procedure CreateCellBase(const ShowVertGrid: Boolean; const Cell: IDCTreeCell);

  public
    constructor Create(const AColumn: IDCTreeColumn);

    function  CreateInfoControl(const Cell: IDCTreeCell; const ControlClassType: TInfoControlClass): TControl;

    procedure CreateCellBaseControls(const ShowVertGrid: Boolean; const Cell: IDCTreeCell);
    procedure CreateCellStyleControl(const StyleLookUp: CString; const Cell: IDCTreeCell);

    procedure UpdateCellControlsByRow(const Cell: IDCTreeCell);
    procedure UpdateCellControlsPositions(const Cell: IDCTreeCell);
  end;

  TDCTreeLayout = class(TBaseInterfacedObject, IDCTreeLayout)
  protected
    _content: TControl;
    _recalcRequired: Boolean;

    _layoutColumns: List<IDCTreeLayoutColumn>;
    _flatColumns: List<IDCTreeLayoutColumn>;
    _overflow: Single;

//    _FirstColumn    : Integer;
//    _FrozenColumns  : Integer;
//    _FlatColumns    : List<IDCTreeLayoutColumn>;
//    _owner          : TCustomTreeControl;
//    _totalWidth     : Single;
//
    function  get_LayoutColumns: List<IDCTreeLayoutColumn>;
//    function  get_FirstColumn: Integer;
//    procedure set_FirstColumn(Value: Integer);
//    function  get_FrozenColumns: Integer;
//    procedure set_FrozenColumns(Value: Integer);
    function  get_FlatColumns: List<IDCTreeLayoutColumn>;
//    function  get_TotalWidth: Single;

  public
    constructor Create(const Content: TControl; const ColumnList: IDCTreeColumnList); reintroduce;

    procedure UpdateColumnWidth(const FlatColumnIndex: Integer; const Width: Single);
    procedure RecalcColumnWidthsBasic;
    procedure RecalcColumnWidthsAutoFit;

    procedure ForceRecalc;


    function  HasFrozenColumns: Boolean;
    function  ContentOverFlow: Integer;
    function  FrozenColumnWidth: Single;
    function  RecalcRequired: Boolean;

//    constructor Create(Owner: TCustomTreeControl);
//    destructor Destroy; override;
//    procedure Reset;
//    function  FindColumnByPropertyName(const Name: CString) : Integer;
//    function  FindColumnByTag(const Tag: CObject) : Integer;
//    function  FirstSelectableColumn: Integer;
//   // function  FlatToColumnIndex(ColumnIndex: Integer) : Integer;
//   // function  ColumnToFlatIndex(ColumnIndex: Integer) : Integer;
//    function  ColumnToCellIndex(const Column: IDCTreeColumn) : Integer;
//    procedure RealignFlatColumns;
//
//    function  FixedWidth: Single;
//    procedure SetColumnWidth(const ColumnIndex: Integer; Width: Integer);
//    procedure UpdateColumnWidth(ColumnIndex: Integer;Width: Single; ColSpan: Integer);
  end;



  TDCTreeCell = class(TBaseInterfacedObject, IDCTreeCell)
//  strict private
//    const LEFT_GRID_LINE_ID = 637850; // any number
//    const HEIGHT_BORDER_OFFSET = 1.5;
//    { workaround: when we create a border with lines, row by row, there is a gap between left vertical lines between
//      the rows. It looks like vert. lines are not connected. Use this value + ACell.Control.Height + specHeightOffset.
//      We cannot just increase height of the line to connect it with the next line from the next row -
//      because next row will cover the line from upper row. That's why need to use both Y and Height + specHeightOffset.
//      -0.7 this is an optimal number, less - there is still a gap, more - pixel crawls out of a border. }
  strict private
    _control: TControl; // can be custom user control, not only TCellControl
    _infoControl: TControl;
    _subInfoControl: TControl;
    _expandButton: TButton;

    [unsafe] _row     : IDCRow;

    _data: CObject;

    [unsafe] _layoutColumn   : IDCTreeLayoutColumn;

    function  get_Column: IDCTreeColumn;
    function  get_LayoutColumn: IDCTreeLayoutColumn;
    function  get_Control: TControl;
    procedure set_Control(const Value: TControl); virtual;
    function  get_InfoControl: TControl;
    procedure set_InfoControl(const Value: TControl);
    function  get_SubInfoControl: TControl;
    procedure set_SubInfoControl(const Value: TControl);
    function  get_ExpandButton: TButton;
    procedure set_ExpandButton(const Value: TButton);
    function  get_HideCellInView: Boolean;
    procedure set_HideCellInView(const Value: Boolean);

//    function  get_ColSpan: Byte;
//    procedure set_ColSpan(const Value: Byte);
    function  get_Data: CObject; virtual;
    procedure set_Data(const Value: CObject); virtual;
    function  get_Row: IDCRow;
    function  get_Index: Integer;

  public
    constructor Create(const ARow: IDCRow; const LayoutColumn: IDCTreeLayoutColumn);
    destructor Destroy; override;

    function  IsHeaderCell: Boolean; virtual;

    property Column: IDCTreeColumn read get_Column;
    property Row: IDCRow read get_Row;
    property Control: TControl read get_Control write set_Control;

//    property BackgroundColor: TAlphaColor read get_BackgroundColor write set_BackgroundColor;
    property HideCellInView: Boolean read get_HideCellInView write set_HideCellInView;
  end;

  THeaderCell = class(TDCTreeCell, IHeaderCell)
  protected
    _sortControl: TControl;
    _filterControl: TControl;

    function  get_SortControl: TControl;
    procedure set_SortControl(const Value: TControl);
    function  get_FilterControl: TControl;
    procedure set_FilterControl(const Value: TControl);

  public
    function  IsHeaderCell: Boolean; override;
  end;

  TDCTreeRow = class(TDCRow, IDCTreeRow)
  private
    _cells: Dictionary<Integer, IDCTreeCell>;
    _contentCellSizes: Dictionary<Integer, Single>;

    _frozenColumnRowControl: TControl;
    _nonFrozenColumnRowControl: TControl;

    function  get_Cells: Dictionary<Integer, IDCTreeCell>;
    function  get_ContentCellSizes: Dictionary<Integer, Single>;
    function  get_FrozenColumnRowControl: TControl;
    procedure set_FrozenColumnRowControl(const Value: TControl);
    function  get_NonFrozenColumnRowControl: TControl;
    procedure set_NonFrozenColumnRowControl(const Value: TControl);
  public
    destructor Destroy; override;

    procedure ResetCells;
  end;

  TTreeSelectionInfo = class(TRowSelectionInfo, ITreeSelectionInfo)
  private
    _lastSelectedFlatColumn: Integer;
    _selectedFlatColumns: List<Integer>;

    function  get_SelectedFlatColumn: Integer;
    procedure set_SelectedFlatColumn(const Value: Integer);
    function  get_SelectedFlatColumns: List<Integer>;

  protected
    function  CreateInstance: IRowSelectionInfo; override;
    function  Clone: IRowSelectionInfo; override;

  public
    constructor Create; reintroduce;

    procedure ClearMultiSelections; override;
  end;


  TDataControlWaitForRepaintInfo = class(TWaitForRepaintInfo, IDataControlWaitForRepaintInfo)
  private
    _viewStateFlags: TTreeViewStateFlags;
    _changedColumns: Dictionary<IDCTreeColumn, NotifyCollectionChangedAction>;
    _cellSizeUpdates: Dictionary<Integer {FlatColumnIndex}, Single>;

    function  get_ViewStateFlags: TTreeViewStateFlags;
    procedure set_ViewStateFlags(const Value: TTreeViewStateFlags);

    function  get_CellSizeUpdates: Dictionary<Integer {FlatColumnIndex}, Single>;
    procedure set_CellSizeUpdates(const Value: Dictionary<Integer {FlatColumnIndex}, Single>);

  public
    procedure ColumnsChanged;

    property ViewStateFlags: TTreeViewStateFlags read get_ViewStateFlags;
    property CellSizeUpdates: Dictionary<Integer {FlatColumnIndex}, Single> read get_CellSizeUpdates write set_CellSizeUpdates;
  end;

//  TCellSelectionInfo = class(TSelectionInfo, ICellSelectionInfo)
//  private
//    _columnIndexes: List<Integer>;
//    _lastSelectedCellColumnIndex: Integer;
//
//  protected
//    function  CreateInstance: ISelectionInfo; override;
//    function  Clone: ISelectionInfo; override;
//    procedure UpdateLastSelection(const DataIndex, ViewListIndex: Integer; const DataItem: CObject; const VirtualYPosition: Single); override;
//
//    function  CopyColumnIndexes: List<Integer>;
//  public
//    procedure ClearAllSelections; override;
//
//    function  CellIsSelected(const ColumnIndex: Integer): Boolean;
//    procedure AddCellSelection(const ColumnIndex: Integer);
//    procedure RemoveCellSelection(const ColumnIndex: Integer);
//    function  SelectedCellCount: Integer;
//
//    function  LastSelectedColumnIndex: Integer;
//  end;


implementation

uses
  FMX.DataControl.ControlClasses, FMX.ActnList,
  ADato.Data.DataModel.intf, System.Types, FMX.Types, System.Math, FMX.Objects,
  FMX.Graphics, FMX.ControlCalculations, System.UITypes;

{ TDCTreeColumnList }

constructor TDCTreeColumnList.Create(const Owner: IColumnControl);
begin
  inherited Create;
  SaveTypeData := True;
  _treeControl := Owner;
end;

constructor TDCTreeColumnList.Create(const Owner: IColumnControl; const col: IEnumerable<IDCTreeColumn>);
begin
  inherited Create;
  for var c in col do
    Add(c);

  SaveTypeData := True;
  _treeControl := Owner;
end;

function TDCTreeColumnList.FindColumnByCaption(const Caption: CString): IDCTreeColumn;
var
  i: Integer;
begin
  i := FindIndexByCaption(Caption);
  if i <> -1 then
    Exit(Self[i]);

  Exit(nil);
end;

function TDCTreeColumnList.FindColumnByPropertyName(const Name: CString): IDCTreeColumn;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
  begin
    if CString.Equals(Self[i].PropertyName, Name) then
      Exit(Self[i]);
  end;

  Result := nil;
end;

function TDCTreeColumnList.FindColumnByTag(const Value: CObject): IDCTreeColumn;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
  begin
    if CObject.Equals(Self[i].Tag, Value) then
      Exit(Self[i]);
  end;

  Result := nil;
end;

function TDCTreeColumnList.FindIndexByCaption(const Caption: CString): Integer;
var
  i: Integer;
begin
  for i := 0 to Self.Count - 1 do
  begin
    if CString.Equals(Self[i].Caption, Caption) then
      Exit(i);
  end;

  Result := -1;
end;

function TDCTreeColumnList.get_TreeControl: IColumnControl;
begin
  Result := _treeControl;
end;

function TDCTreeColumnList.Add(const Value: CObject): Integer;
begin
  Result := inherited;
  Value.AsType<TDCTreeColumn>.set_treeControl(_treeControl);
end;

procedure TDCTreeColumnList.Insert(index: Integer; const value: CObject);
begin
  inherited;
  Value.AsType<TDCTreeColumn>.set_treeControl(_treeControl);
end;

function TDCTreeColumnList.ColumnLayoutToJSON(const SystemLayout: TJSONObject): TJSONObject;
var
  arr: TJSONArray;
  co: TJSONObject;
  column: IDCTreeColumn;
  i: Integer;
  jo: TJSONObject;
begin
  jo := TJSONObject.Create;
  arr := TJSONArray.Create;

  for i := 0 to Count - 1 do
  begin
    column := Self[i];

    if CString.IsNullOrEmpty(column.Caption) then
      continue;

    co := TJSONObject.Create;

    co.AddPair('Property', CStringToString(column.PropertyName));
    co.AddPair('Caption', CStringToString(column.Caption));
    if column.Visible or column.Frozen then
      co.AddPair('Visible', TJSONTrue.Create) else
      co.AddPair('Visible', TJSONFalse.Create);
    if column.ReadOnly then
      co.AddPair('ReadOnly', TJSONTrue.Create) else
      co.AddPair('ReadOnly', TJSONFalse.Create);
    if column is TDCTreeCheckboxColumn then
      co.AddPair('Checkbox', TJSONTrue.Create) else
      co.AddPair('Checkbox', TJSONFalse.Create);
    co.AddPair('Index', TJSONNumber.Create(Self.IndexOf(column)));

    if (column.Tag <> nil) and not CString.IsNullOrEmpty(column.Tag.ToString) then
      co.AddPair('Tag', column.Tag.ToString);

    arr.AddElement(co);
  end;

  jo.AddPair('columns', arr);
  Exit(jo);
end;

procedure TDCTreeColumnList.RestoreColumnLayoutFromJSON(const Value: TJSONObject);
var
  arr: TJSONArray;
  caption: string;
  checkbox: Boolean;
  col: TJSONObject;
  column: IDCTreeColumn;
  tag_string: string;
  index: Integer;
  jv: TJSONValue;
  n: Integer;
  propertyname: string;
  visible: Boolean;
  w: Integer;
  readonly: Boolean;

  procedure AddColumnToProjectControl;
  begin
    if checkbox then
      column := TDCTreeCheckboxColumn.Create else
      column := TDCTreeColumn.Create;

    column.TreeControl := _treeControl;
    column.Caption := caption;
    column.PropertyName := StringToCString(propertyname);
    column.Visualisation.ReadOnly := readonly;
    column.SortAndFilter.ShowSortMenu := True;
    column.SortAndFilter.ShowFilterMenu := True;
    column.SortAndFilter.Sort := TSortType.CellData;
    column.Tag := StringToCString(tag_string);

    Insert(Index, column);
  end;

begin
  if (Value <> nil) and Value.TryGetValue<TJSONArray>('columns', arr) then
  begin
    for jv in arr do
    begin
      col := jv as TJSONObject;

      if not col.TryGetValue<string>('Caption', caption) then continue;
      if not col.TryGetValue<string>('Property', propertyName) then propertyName := '';
      if not col.TryGetValue<Boolean>('Visible', visible) then visible := False;
      if not col.TryGetValue<Boolean>('ReadOnly', readonly) then readonly := True;
      if not col.TryGetValue<Integer>('Width', w) then w := -1;
      if not col.TryGetValue<Boolean>('Checkbox', checkbox) then checkbox := False;
      if not col.TryGetValue<Integer>('Index', index) then index := -1;
      if not col.TryGetValue<string>('Tag', tag_string) then tag_string := '';

      n := FindIndexByCaption(caption);
      if n = -1 then
      begin
        if visible then
          AddColumnToProjectControl else
          continue;
      end
      else
      begin
        column := Self[n];
        visible := visible or not column.AllowHide;
        column.Visualisation.Visible := visible;
        if visible and (index >= 0) and (index <> n) then
        begin
          RemoveAt(n);
          index := CMath.Min(index, Count);
          Insert(index, column);
        end;
      end;
    end;
  end;
end;

{ TDCTreeColumn }

function TDCTreeColumn.Clone: IDCTreeColumn;
begin
  Result := TDCTreeColumn.Create;

  Result.TreeControl := _treeControl;
  Result.caption := _caption;
  Result.propertyName := _propertyName;
  Result.tag := _tag;

  Result.SortAndFilter := _SortAndFilter.Clone;
  Result.WidthSettings := _WidthSettings.Clone;
  Result.SubControlSettings := _SubControlSettings.Clone;
  Result.Visualisation := _Visualisation.Clone;
  Result.Hierarchy := _Hierarchy.Clone;

  Result.InfoControlClass := _infoControlClass;

  Result.Visualisation.Format := _format;
  Result.formatProvider := _formatProvider;
end;

constructor TDCTreeColumn.Create;
begin
  inherited Create;

  _infoControlClass := TInfoControlClass.Text;

  _widthSettings := TDCColumnWidthSettings.Create;
  _sortAndFilter := TDCColumnSortAndFilter.Create;
  _subControlSettings := TDCColumnSubControlSettings.Create;
  _visualisation := TDCColumnVisualisation.Create(OnVisibilityChanged);
  _hierarchy := TDCColumnHierarchy.Create;
end;

function TDCTreeColumn.get_AllowHide: Boolean;
begin
  Result := _visualisation.AllowHide;
end;

function TDCTreeColumn.get_Caption: CString;
begin
  Result := _caption;
end;

function TDCTreeColumn.get_Format: CString;
begin
  Result := _visualisation.Format;
end;

function TDCTreeColumn.get_FormatProvider: IFormatProvider;
begin
  Result := _formatProvider;
end;

function TDCTreeColumn.get_Frozen: Boolean;
begin
  Result := _visualisation.Frozen;
end;

function TDCTreeColumn.get_Hierarchy: IDCColumnHierarchy;
begin
  Result := _hierarchy;
end;

function TDCTreeColumn.get_Indent: Single;
begin
  Result := _hierarchy.Indent;
end;

function TDCTreeColumn.get_InfoControlClass: TInfoControlClass;
begin
  Result := _infoControlClass;
end;

function TDCTreeColumn.get_PropertyName: CString;
begin
  Result := _propertyName;
end;

function TDCTreeColumn.get_ReadOnly: Boolean;
begin
  Result := _visualisation.ReadOnly;
end;

function TDCTreeColumn.get_Selectable: Boolean;
begin
  Result := _visualisation.Selectable;
end;

function TDCTreeColumn.get_ShowFilterMenu: Boolean;
begin
  Result := _SortAndFilter.ShowFilterMenu;
end;

function TDCTreeColumn.get_ShowHierarchy: Boolean;
begin
  Result := _hierarchy.ShowHierarchy;
end;

function TDCTreeColumn.get_ShowSortMenu: Boolean;
begin
  Result := _SortAndFilter.ShowSortMenu;
end;

function TDCTreeColumn.get_SortType: TSortType;
begin
  Result := _SortAndFilter.Sort;
end;

function TDCTreeColumn.get_SubControlSettings: IDCColumnSubControlSettings;
begin
  Result := _subControlSettings;
end;

function TDCTreeColumn.get_SubInfoControlClass: TInfoControlClass;
begin
  Result := _subControlSettings.SubInfoControlClass;
end;

function TDCTreeColumn.get_SubPropertyName: CString;
begin
  Result := _subControlSettings.SubPropertyName;
end;

function TDCTreeColumn.get_Tag: CObject;
begin
  Result := _tag;
end;

function TDCTreeColumn.get_TreeControl: IColumnControl;
begin
  Result := _treeControl;
end;

function TDCTreeColumn.get_SortAndFilter: IDCColumnSortAndFilter;
begin
  Result := _SortAndFilter;
end;

function TDCTreeColumn.get_Visible: Boolean;
begin
  Result := _visualisation.Visible;
end;

function TDCTreeColumn.get_Visualisation: IDCColumnVisualisation;
begin
  Result := _visualisation;
end;

function TDCTreeColumn.get_Width: Single;
begin
  Result := _widthSettings.Width;
end;

function TDCTreeColumn.get_WidthMax: Single;
begin
  Result := _widthSettings.WidthMax;
end;

function TDCTreeColumn.get_WidthMin: Single;
begin
  Result := _widthSettings.WidthMin;
end;

function TDCTreeColumn.get_WidthSettings: IDCColumnWidthSettings;
begin
  Result := _widthSettings;
end;

function TDCTreeColumn.get_WidthType: TDCColumnWidthType;
begin
  Result := _widthSettings.WidthType;
end;

function TDCTreeColumn.IsCheckBoxColumn: Boolean;
begin
  Result := False;
end;

procedure TDCTreeColumn.OnVisibilityChanged;
begin
  if _treeControl <> nil then
    _treeControl.ColumnVisibilityChanged(Self);
end;

function TDCTreeColumn.GetDefaultCellData(const Cell: IDCTreeCell; const CellValue: CObject; FormatApplied: Boolean): CObject;
begin
  Result := CellValue;
  if not FormatApplied and (Result <> nil) then
  begin
    if Result.GetType.IsDateTime and CDateTime(Result).Equals(CDateTime.MinValue) then
      Result := nil

    else if not CString.IsNullOrEmpty(_format) or (_formatProvider <> nil) then
    begin
      var formatSpec: CString;
      if not CString.IsNullOrEmpty(_format) then
        formatSpec := CString.Concat('{0:', _format, '}') else
        formatSpec := '{0}';

      Result := CString.Format(_FormatProvider, formatSpec, [Result]);
    end;
  end;
end;

function TDCTreeColumn.GetCellValue(const Cell: IDCTreeCell; const PropName: CString): CObject;
begin
//  // Just in case properties have not been initialized
//  InitializeColumnPropertiesFromColumns;

  if CString.IsNullOrEmpty(PropName) then
    Exit(nil)
  else if CString.Equals(PropName, COLUMN_SHOW_DEFAULT_OBJECT_TEXT) then
    Exit(Cell.Row.DataItem);

  if Cell.Row.DataItem.IsOfType<IDataRowView> then
  begin
    var drv := Cell.Row.DataItem.AsType<IDataRowView>;
    Result := drv.DataView.DataModel.GetPropertyValue(PropName, drv.Row);
  end
  else begin
    var dataItem: CObject := Cell.Row.DataItem;
    if (_cachedType <> dataItem.GetType) or (_cachedProp.Name <> PropName {sub prop name}) then
    begin
      _cachedType := dataItem.GetType;
      _cachedProp := _cachedType.PropertyByName(PropName);
    end;

    Result := _cachedProp.GetValue(dataItem, [])
  end;
end;

procedure TDCTreeColumn.set_Caption(const Value: CString);
begin
  _caption := Value;
end;

procedure TDCTreeColumn.set_FormatProvider(const Value: IFormatProvider);
begin
  _formatProvider := Value;
end;

procedure TDCTreeColumn.set_Hierarchy(const Value: IDCColumnHierarchy);
begin
  _hierarchy := Value;
end;

procedure TDCTreeColumn.set_InfoControlClass(const Value: TInfoControlClass);
begin
  _infoControlClass := Value;
end;

procedure TDCTreeColumn.set_PropertyName(const Value: CString);
begin
  _propertyName := Value;
end;

procedure TDCTreeColumn.set_SortAndFilter(const Value: IDCColumnSortAndFilter);
begin
  _sortAndFilter := Value;
end;

procedure TDCTreeColumn.set_SubControlSettings(const Value: IDCColumnSubControlSettings);
begin
  _subControlSettings := Value;
end;

procedure TDCTreeColumn.set_Tag(const Value: CObject);
begin
  _tag := Value;
end;

procedure TDCTreeColumn.set_TreeControl(const Value: IColumnControl);
begin
  _treeControl := Value;
end;

procedure TDCTreeColumn.set_Visualisation(const Value: IDCColumnVisualisation);
begin
  _visualisation := Value;
end;

procedure TDCTreeColumn.set_WidthSettings(const Value: IDCColumnWidthSettings);
begin
  _widthSettings := Value;
end;

{ TDataControlWaitForRepaintInfo }

procedure TDataControlWaitForRepaintInfo.ColumnsChanged;
begin
  _viewStateFlags := _viewStateFlags + [TTreeViewState.ColumnsChanged];

  if _owner.IsInitialized then
    _owner.RefreshControl;
end;

function TDataControlWaitForRepaintInfo.get_CellSizeUpdates: Dictionary<Integer, Single>;
begin
  Result := _cellSizeUpdates;
end;

function TDataControlWaitForRepaintInfo.get_ViewStateFlags: TTreeViewStateFlags;
begin
  Result := _viewStateFlags;
end;

procedure TDataControlWaitForRepaintInfo.set_CellSizeUpdates(const Value: Dictionary<Integer, Single>);
begin
  _cellSizeUpdates := Value;
  _viewStateFlags := _viewStateFlags + [TTreeViewState.ColumnSizeChanged];
end;

procedure TDataControlWaitForRepaintInfo.set_ViewStateFlags(const Value: TTreeViewStateFlags);
begin
  _viewStateFlags := Value;
  if _owner.IsInitialized then
    _owner.RefreshControl;
end;

{ TTreeLayoutColumn }

constructor TTreeLayoutColumn.Create(const AColumn: IDCTreeColumn);
begin
  inherited Create;
  _column := AColumn;
  _HideColumnInView := not AColumn.Visible;
end;

procedure TTreeLayoutColumn.UpdateCellControlsByRow(const Cell: IDCTreeCell);
begin
  if Cell.IsHeaderCell then
  begin
    var headerCell := Cell as IHeaderCell;
    if (_activeFilter <> nil) and (headerCell.FilterControl = nil) then
    begin
      headerCell.FilterControl := ScrollableRowControl_DefaultButtonClass.Create(Cell.Control);
      headerCell.FilterControl.Align := TAlignLayout.None;
      headerCell.FilterControl.Width := CELL_MIN_INDENT;
      headerCell.FilterControl.Height := CELL_MIN_INDENT;
      headerCell.FilterControl.HitTest := False;
      Cell.Control.AddObject(headerCell.FilterControl);
    end
    else if (_activeFilter = nil) and (headerCell.FilterControl <> nil) then
    begin
      headerCell.FilterControl.Free;
      headerCell.FilterControl := nil;
    end;

    if (_activeSort <> nil) and (headerCell.SortControl = nil) then
    begin
      headerCell.SortControl := ScrollableRowControl_DefaultButtonClass.Create(Cell.Control);
      headerCell.SortControl.Align := TAlignLayout.None;
      headerCell.SortControl.Width := CELL_MIN_INDENT;
      headerCell.SortControl.Height := CELL_MIN_INDENT;
      headerCell.SortControl.HitTest := False;
      Cell.Control.AddObject(headerCell.SortControl);
    end
    else if (_activeSort = nil) and (headerCell.SortControl <> nil) then
    begin
      headerCell.SortControl.Free;
      headerCell.SortControl := nil;
    end;

    if headerCell.FilterControl <> nil then
      headerCell.FilterControl.Tag := Cell.Row.ViewListIndex;

    if headerCell.SortControl <> nil then
      headerCell.SortControl.Tag := Cell.Row.ViewListIndex;
  end
  else if Cell.Column.ShowHierarchy and Cell.Row.HasChildren then
  begin
    if Cell.ExpandButton = nil then
    begin
      Cell.ExpandButton := ScrollableRowControl_DefaultButtonClass.Create(Cell.Control);
      Cell.ExpandButton.Align := TAlignLayout.None;
      Cell.ExpandButton.Width := CELL_MIN_INDENT;
      Cell.ExpandButton.Height := CELL_MIN_INDENT;
      Cell.Control.AddObject(Cell.ExpandButton);
    end;

    Cell.ExpandButton.Tag := Cell.Row.ViewListIndex;
  end
  else if cell.ExpandButton <> nil then
  begin
    cell.ExpandButton.Free;
    cell.ExpandButton := nil;
  end;
end;

procedure TTreeLayoutColumn.UpdateCellControlsPositions(const Cell: IDCTreeCell);
begin
  Assert(not _HideColumnInView);

  Cell.HideCellInView := False;
  Cell.Control.Width := get_Width;
  Cell.Control.Height := Cell.Row.Control.Height;
  Cell.Control.Position.Y := 0;

  var spaceUsed := 0.0;

  if Cell.IsHeaderCell then
  begin
    var headerCell := Cell as IHeaderCell;
    var startYPos := Cell.Control.Width - CELL_MIN_INDENT;

    if headerCell.FilterControl <> nil then
    begin
      headerCell.FilterControl.Position.Y := 10;
      headerCell.FilterControl.Position.X := startYPos;
      headerCell.FilterControl.Width := 10;
      headerCell.FilterControl.Height := 10;

      startYPos := startYPos - CELL_MIN_INDENT;
    end;
    if headerCell.SortControl <> nil then
    begin
      headerCell.SortControl.Position.Y := 10;
      headerCell.SortControl.Position.X := startYPos;
      headerCell.SortControl.Width := 10;
      headerCell.SortControl.Height := 10;
    end;
  end
  else begin
    var indentPerLevel := CMath.Max(Cell.Column.Indent, CELL_MIN_INDENT) + CELL_CONTENT_MARGIN;
    if Cell.ExpandButton <> nil then
    begin
      cell.ExpandButton.Position.Y := CELL_CONTENT_MARGIN;
      cell.ExpandButton.Position.X := CELL_CONTENT_MARGIN;

      spaceUsed := cell.ExpandButton.Position.X + cell.ExpandButton.Width;
    end
    else if Cell.Column.ShowHierarchy then
      spaceUsed := indentPerLevel * cell.Row.ParentCount {can be 0};
  end;

  var textCtrlHeight := (Cell.Row.Control.Height - (2*CELL_CONTENT_MARGIN));
  var validSub := (Cell.SubInfoControl <> nil) and Cell.SubInfoControl.Visible;
  if validSub and (Cell.Column.SubInfoControlClass = TInfoControlClass.Text) then
    validSub := (Cell.SubInfoControl as TText).Text <> string.Empty;

  if validSub then
  begin
    textCtrlHeight := textCtrlHeight / 2;

    Cell.SubInfoControl.Width := get_Width - spaceUsed - (2*CELL_CONTENT_MARGIN);
    Cell.SubInfoControl.Height := textCtrlHeight;
    Cell.SubInfoControl.Position.Y := CELL_CONTENT_MARGIN + textCtrlHeight;
    Cell.SubInfoControl.Position.X := spaceUsed + CELL_CONTENT_MARGIN;
  end;

  if Cell.InfoControl <> nil then
  begin
    Cell.InfoControl.Width := get_Width - spaceUsed - (2*CELL_CONTENT_MARGIN);
    Cell.InfoControl.Height := textCtrlHeight;
    Cell.InfoControl.Position.Y := CELL_CONTENT_MARGIN;
    Cell.InfoControl.Position.X := spaceUsed + CELL_CONTENT_MARGIN;
  end;
end;

function TTreeLayoutColumn.CreateInfoControl(const Cell: IDCTreeCell; const ControlClassType: TInfoControlClass): TControl;
begin
  case ControlClassType of
    Unexploited:
      Result := nil;

    Text: begin
      var txt := ScrollableRowControl_DefaultTextClass.Create(Cell.Control);
      txt.HorzTextAlign := TTextAlign.Leading;
      txt.VertTextAlign := TTextAlign.Center;
      txt.HitTest := False;
      txt.Align := TAlignLayout.None;
      txt.WordWrap := False;

      Result := txt;
    end;

    CheckBox: begin
      var check := ScrollableRowControl_DefaultCheckboxClass.Create(Cell.Control);
      check.Align := TAlignLayout.None;
      Result := check;
    end;

    Button: begin
      var check := ScrollableRowControl_DefaultButtonClass.Create(Cell.Control);
      check.Align := TAlignLayout.None;
      Result := check;
    end;
  end;
end;

procedure TTreeLayoutColumn.CreateCellBase(const ShowVertGrid: Boolean; const Cell: IDCTreeCell);
begin
  // in case user assigns cell control in CellLoading the tree allows that
  if Cell.Control = nil then
  begin
    // if special controls are loaded into the cell, then always create a TLayout as base control
    // otherwise the TText can be the baseControl
    if ShowVertGrid then
    begin
      var rect := ScrollableRowControl_DefaultRectangleClass.Create(Cell.Row.Control);
  //    rect.Fill.Kind := TBrushKind.None;
      rect.Fill.Color := TAlphaColors.Orange;

      if _index = 0 then
        rect.Sides := [TSide.Left, TSide.Right] else
        rect.Sides := [TSide.Right];

  //    if Cell.IsHeaderCell then
  //      rect.Sides := rect.Sides + [TSide.Top, TSide.Bottom];

      Cell.Control := rect;
    end else
      Cell.Control := TLayout.Create(Cell.Row.Control);

    Cell.Control.HitTest := False;
  end;

  Cell.Control.Align := TAlignLayout.None;
end;

procedure TTreeLayoutColumn.CreateCellBaseControls(const ShowVertGrid: Boolean; const Cell: IDCTreeCell);
begin
  CreateCellBase(ShowVertGrid, Cell);

  var ctrl: TControl;
  if Cell.IsHeaderCell then
    ctrl := CreateInfoControl(Cell, TInfoControlClass.Text) else
    ctrl := CreateInfoControl(Cell, Cell.Column.InfoControlClass);

  if ctrl <> nil then
  begin
    Cell.Control.AddObject(ctrl);
    Cell.InfoControl := ctrl;

    if not Cell.IsHeaderCell and (Cell.Column.SubInfoControlClass <> TInfoControlClass.Unexploited) then
    begin
      var subCtrl := CreateInfoControl(Cell, Cell.Column.SubInfoControlClass);
      Cell.Control.AddObject(subCtrl);
      Cell.SubInfoControl := subCtrl;

//      // reposition controls for two texts below each other
//      if Cell.Column.InfoControlClass = TInfoControlClass.Text then
//        (ctrl as TText).VertTextAlign := TTextAlign.Trailing;
//      if Cell.Column.SubInfoControlClass = TInfoControlClass.Text then
//        (subCtrl as TText).VertTextAlign := TTextAlign.Leading;
    end;
  end;
end;

procedure TTreeLayoutColumn.CreateCellStyleControl(const StyleLookUp: CString; const Cell: IDCTreeCell);
begin
  CreateCellBase(False, Cell);

  var ctrl: TControl;
  if Cell.IsHeaderCell then
    ctrl := CreateInfoControl(Cell, TInfoControlClass.Text)
  else begin
    Assert((Cell.Column.InfoControlClass = TInfoControlClass.Unexploited) and (Cell.Column.SubInfoControlClass = TInfoControlClass.Unexploited),
       'Column (Sub)InfoControlClass must be "Unexploited" to assign StyleLookUp');

    var styledControl: TStyledControl;
    if Cell.InfoControl = nil then
    begin
      styledControl := TStyledControl.Create(Cell.Control);
      styledControl.Align := TAlignLayout.Client;
      styledControl.HitTest := False;
      Cell.InfoControl := styledControl;
      Cell.Control.AddObject(styledControl);
    end else
      styledControl := Cell.InfoControl as TStyledControl;

    styledControl.StyleLookup := StyleLookUp;
  end;
end;

function TTreeLayoutColumn.get_ActiveFilter: IListFilterDescription;
begin
  Result := _activeFilter;
end;

function TTreeLayoutColumn.get_ActiveSort: IListSortDescription;
begin
  Result := _activeSort;
end;

function TTreeLayoutColumn.get_Column: IDCTreeColumn;
begin
  Result := _column;
end;

function TTreeLayoutColumn.get_HideColumnInView: Boolean;
begin
  Result := _HideColumnInView;
end;

function TTreeLayoutColumn.get_Index: Integer;
begin
  Result := _index;
end;

function TTreeLayoutColumn.get_Left: Single;
begin
  Result := _left;
end;

function TTreeLayoutColumn.get_Width: Single;
begin
  Result := _width;
end;

function TTreeLayoutColumn.get_WidthChangedByUser: Boolean;
begin
  Result := _widthChangedByUser;
end;

procedure TTreeLayoutColumn.set_ActiveFilter(const Value: IListFilterDescription);
begin
  _activeFilter := Value;
end;

procedure TTreeLayoutColumn.set_ActiveSort(const Value: IListSortDescription);
begin
  _activeSort := Value;
end;

procedure TTreeLayoutColumn.set_HideColumnInView(const Value: Boolean);
begin
  _HideColumnInView := Value;
end;

procedure TTreeLayoutColumn.set_Index(const Value: Integer);
begin
  _index := Value;
end;

procedure TTreeLayoutColumn.set_Left(Value: Single);
begin
  _left := Value;
end;

procedure TTreeLayoutColumn.set_Width(Value: Single);
begin
  _width := Value;
end;

{ TDCTreeLayout }

constructor TDCTreeLayout.Create(const Content: TControl; const ColumnList: IDCTreeColumnList);
begin
  inherited Create;

  _content := Content;
  _layoutColumns := CList<IDCTreeLayoutColumn>.Create;
  for var clmn in ColumnList do
  begin
    var lyColumn: IDCTreeLayoutColumn := TTreeLayoutColumn.Create(clmn);
    _layoutColumns.Add(lyColumn);
  end;

  _recalcRequired := True;
end;

function TDCTreeLayout.FrozenColumnWidth: Single;
begin
  RecalcColumnWidthsBasic;

  Result := 0.0;
  for var clmn in _flatColumns do
  begin
    // frozen columns are the first columns in the list
    if not clmn.Column.Frozen then
      Exit;

    Result := Result + clmn.Width;
  end;
end;

function TDCTreeLayout.get_FlatColumns: List<IDCTreeLayoutColumn>;
begin
  if (_flatColumns = nil) and (_layoutColumns <> nil) then
  begin
    _flatColumns := CList<IDCTreeLayoutColumn>.Create;
    var layoutColumnIndex := 0;

    for var round := 0 to 1 do
      for var layoutColumn in _layoutColumns do
      begin
        if ((round = 1) = layoutColumn.Column.Frozen) then
        begin
          if not layoutColumn.HideColumnInView then
            _flatColumns.Add(layoutColumn);

          layoutColumn.Index := layoutColumnIndex;
          inc(layoutColumnIndex);
        end;
      end;
  end;

  Result := _flatColumns;
end;

function TDCTreeLayout.get_LayoutColumns: List<IDCTreeLayoutColumn>;
begin
  Result := _layoutColumns;
end;

function TDCTreeLayout.HasFrozenColumns: Boolean;
begin
  if _layoutColumns <> nil then
    for var clmn in _layoutColumns do
      if clmn.Column.Frozen and not clmn.HideColumnInView then
        Exit(True);

  Result := False;
end;

function TDCTreeLayout.ContentOverFlow: Integer;
begin
  RecalcColumnWidthsBasic;

  var totalWidth := 0.0;
  for var layoutClmn in _flatColumns do
    totalWidth := totalWidth + layoutClmn.Width;

  if _content.Width < totalWidth then
    Result := Round(totalWidth - _content.Width) else
    Result := 0;
end;

procedure TDCTreeLayout.RecalcColumnWidthsBasic;
var
  layoutClmn: IDCTreeLayoutColumn;
begin
  if not _recalcRequired then
    Exit;

  _recalcRequired := False;

  // make sure we get all layout columns, even in case of AutoFitColumns (because they can become visible again)
  for var lyColumn in _layoutColumns do
    lyColumn.HideColumnInView := not lyColumn.Column.Visible;

  // reset _flatColumns and update indexes
  _flatColumns := nil;
  get_FlatColumns;

  var percMinWidthInPixels := 0.0;
  var totalPercCount: Single := 0;
  var fullPercentageNumber := 100.0;

  var columnsToCalculate: List<Integer> := CList<Integer>.Create;
  for layoutClmn in get_FlatColumns do
    columnsToCalculate.Add(layoutClmn.Index);

  var totalWidth := _content.Width;
  var widthLeft := totalWidth;

  for var round := 1 to 3 do
    for var ix := columnsToCalculate.Count - 1 downto 0 do
    begin
      layoutClmn := _layoutColumns[columnsToCalculate[ix]];

      if round = 1 then
      begin
        if layoutClmn.Column.WidthType = TDCColumnWidthType.Pixel then
          layoutClmn.Width := layoutClmn.Column.Width;

        // pixel columns and columns resized by users
        if (layoutClmn.Column.WidthType = TDCColumnWidthType.Pixel) or layoutClmn.WidthChangedByUser then
        begin
          widthLeft := widthLeft - layoutClmn.Width;
          columnsToCalculate.RemoveAt(ix);
        end

        // align to content columns
        else if layoutClmn.Column.WidthType = TDCColumnWidthType.AlignToContent then
        begin
          // width already set
          layoutClmn.Width := CMath.Max(layoutClmn.Width, layoutClmn.Column.WidthMin);
          if layoutClmn.Column.WidthMax > 0 then
            layoutClmn.Width := CMath.Min(layoutClmn.Width, layoutClmn.Column.WidthMax);

          widthLeft := widthLeft - layoutClmn.Width;
          columnsToCalculate.RemoveAt(ix);
        end

        else if (layoutClmn.Column.WidthType = TDCColumnWidthType.Percentage) then
          totalPercCount := totalPercCount + layoutClmn.Column.Width;
      end

      else if round in [2,3] then
      begin
        if (layoutClmn.Column.WidthType = TDCColumnWidthType.Percentage) and ((layoutClmn.Column.WidthMin > 0) = (round = 2)) then
        begin
          var w: Single;
          if totalPercCount > fullPercentageNumber then
            w := widthLeft / (fullPercentageNumber / (layoutClmn.Column.Width * (fullPercentageNumber / totalPercCount))) else
            w := widthLeft / (fullPercentageNumber / layoutClmn.Column.Width);

          if (w < layoutClmn.Column.WidthMin) then
            w := layoutClmn.Column.WidthMin
          else if (layoutClmn.Column.WidthMax > 0) and (w > layoutClmn.Column.WidthMax) then
            w := layoutClmn.Column.WidthMax;

          layoutClmn.Width := w;
          totalPercCount := totalPercCount - layoutClmn.Column.Width;
          fullPercentageNumber := fullPercentageNumber - layoutClmn.Column.Width;
          widthLeft := widthLeft - w;

          columnsToCalculate.RemoveAt(ix);
        end;
      end;
    end;

  assert(columnsToCalculate.Count = 0);

  var startXPosition: Double := 0;
  for layoutClmn in _flatColumns do
  begin
    layoutClmn.Left := startXPosition;
    startXPosition := startXPosition + layoutClmn.Width;
  end;
end;

procedure TDCTreeLayout.RecalcColumnWidthsAutoFit;
begin
  // calculate ALL layoutcolumns that are visible by default
  if _recalcRequired then
    RecalcColumnWidthsBasic;

  var layoutClmn: IDCTreeLayoutColumn;

  // at this point get_FlatCOlumns contains also columns that are out of view

  // step 1: hide all columns that do not fit on the right
  var minimumTotalWidth := 0.0;
  for layoutClmn in get_FlatColumns do
  begin
    var minColumnWidth: Single;
    case layoutClmn.Column.WidthType of
      Percentage:
        minColumnWidth := layoutClmn.Column.WidthMin;
      else
        minColumnWidth := layoutClmn.Width;
    end;

    if minimumTotalWidth + minColumnWidth > _content.Width then
    begin
      layoutClmn.HideColumnInView := True;
      Continue;
    end;

    minimumTotalWidth := minimumTotalWidth + minColumnWidth;
  end;

  var widthLeft := _content.Width - minimumTotalWidth;
  Assert(widthLeft >= 0);

  // reset _flatColumns and update indexes
  _flatColumns := nil;
  get_FlatColumns;

  // step 2: expand columns to make all columns fit perfectly in view
  var autoFitWidthType := TDCColumnWidthType.Pixel;
  for layoutClmn in get_FlatColumns do
  begin
    case layoutClmn.Column.WidthType of
      Percentage:
          autoFitWidthType := TDCColumnWidthType.Percentage;
      AlignToContent:
        if (autoFitWidthType = TDCColumnWidthType.Pixel) then
          autoFitWidthType := TDCColumnWidthType.AlignToContent;
    end;
  end;

  var totalAutoFitColumnCount := 0;
  for layoutClmn in get_FlatColumns do
    if layoutClmn.Column.WidthType = autoFitWidthType then
      inc(totalAutoFitColumnCount);

  for var flatClmn in _flatColumns do
    if flatClmn.Column.WidthType = autoFitWidthType then
    begin
      var extraWidthPerColumn := widthLeft / totalAutoFitColumnCount;

      // percentageColumns are set back to minimum width
      if autoFitWidthType = TDCColumnWidthType.Percentage then
        flatClmn.Width := flatClmn.Column.WidthMin + extraWidthPerColumn else
        flatClmn.Width := flatClmn.Width + extraWidthPerColumn;

      widthLeft := widthLeft - extraWidthPerColumn;
      dec(totalAutoFitColumnCount);
    end;

  var startXPosition: Double := 0;
  for layoutClmn in _flatColumns do
  begin
    layoutClmn.Left := startXPosition;
    startXPosition := startXPosition + layoutClmn.Width;
  end;
end;

function TDCTreeLayout.RecalcRequired: Boolean;
begin
  Result := _recalcRequired;
end;

procedure TDCTreeLayout.ForceRecalc;
begin
  _recalcRequired := True;
end;

procedure TDCTreeLayout.UpdateColumnWidth(const FlatColumnIndex: Integer; const Width: Single);
begin
  var flatClmn := get_FlatColumns[FlatColumnIndex];

  if not SameValue(flatClmn.Width, Width) then
  begin
    flatClmn.Width := CMath.Max(Width, flatClmn.Column.WidthMin);
    if flatClmn.Column.WidthMax > 0 then
      flatClmn.Width := CMath.Min(Width, flatClmn.Column.WidthMax);

    _recalcRequired := True;
  end;
end;

{ TDCTreeCell }

constructor TDCTreeCell.Create(const ARow: IDCRow; const LayoutColumn: IDCTreeLayoutColumn);
begin
  inherited Create;
  _row := ARow;
  _layoutColumn := LayoutColumn;
end;

destructor TDCTreeCell.Destroy;
begin

  inherited;
end;

function TDCTreeCell.get_Column: IDCTreeColumn;
begin
  Result := _layoutColumn.Column;
end;

function TDCTreeCell.get_Control: TControl;
begin
  Result := _control;
end;

function TDCTreeCell.get_Data: CObject;
begin
  Result := _data;
end;

function TDCTreeCell.get_ExpandButton: TButton;
begin
  Result := _expandButton;
end;

function TDCTreeCell.get_HideCellInView: Boolean;
begin
  Result := _control.Visible;
end;

function TDCTreeCell.get_Index: Integer;
begin
  Result := _layoutColumn.Index;
end;

//function TDCTreeCell.get_Index: Integer;
//begin
//  Result := _index;
//end;

function TDCTreeCell.get_InfoControl: TControl;
begin
  Result := _infoControl;
end;

function TDCTreeCell.get_LayoutColumn: IDCTreeLayoutColumn;
begin
  Result := _layoutColumn;
end;

function TDCTreeCell.get_Row: IDCRow;
begin
  Result := _row;
end;

function TDCTreeCell.get_SubInfoControl: TControl;
begin
  Result := _subInfoControl;
end;

function TDCTreeCell.IsHeaderCell: Boolean;
begin
  Result := False;
end;

procedure TDCTreeCell.set_Control(const Value: TControl);
begin
  if _control <> nil then
    FreeAndNil(_control);

  _control := Value;
end;

procedure TDCTreeCell.set_Data(const Value: CObject);
begin
  _data := Value;
end;

procedure TDCTreeCell.set_ExpandButton(const Value: TButton);
begin
  _expandButton := Value;
end;

procedure TDCTreeCell.set_HideCellInView(const Value: Boolean);
begin
  _control.Visible := not Value;
end;

procedure TDCTreeCell.set_InfoControl(const Value: TControl);
begin
  _infoControl := Value;
end;

procedure TDCTreeCell.set_SubInfoControl(const Value: TControl);
begin
  _subInfoControl := Value;
end;

{ TDCTreeRow }

destructor TDCTreeRow.Destroy;
begin
//  FreeAndNil(_frozenColumnRowControl);
//  FreeAndNil(_nonFrozenColumnRowControl);

  inherited;
end;

function TDCTreeRow.get_Cells: Dictionary<Integer, IDCTreeCell>;
begin
  if _cells = nil then
    _cells := CDictionary<Integer, IDCTreeCell>.Create;

  Result := _cells;
end;

function TDCTreeRow.get_ContentCellSizes: Dictionary<Integer, Single>;
begin
  if _contentCellSizes = nil then
    _contentCellSizes := CDictionary<Integer, Single>.Create;

  Result := _contentCellSizes;

end;

function TDCTreeRow.get_FrozenColumnRowControl: TControl;
begin
  Result := _frozenColumnRowControl;
end;

function TDCTreeRow.get_NonFrozenColumnRowControl: TControl;
begin
  Result := _nonFrozenColumnRowControl;
end;

procedure TDCTreeRow.ResetCells;
begin
  _cells := nil;
end;

procedure TDCTreeRow.set_FrozenColumnRowControl(const Value: TControl);
begin
  _frozenColumnRowControl := Value;
end;

procedure TDCTreeRow.set_NonFrozenColumnRowControl(const Value: TControl);
begin
  _nonFrozenColumnRowControl := Value;
end;

//{ TCellSelectionInfo }
//
//procedure TCellSelectionInfo.AddCellSelection(const ColumnIndex: Integer);
//begin
//  if _columnIndexes = nil then
//    _columnIndexes := CList<Integer>.Create;
//
//  _columnIndexes.Add(ColumnIndex);
//  _lastSelectedCellColumnIndex := ColumnIndex;
//end;
//
//function TCellSelectionInfo.CellIsSelected(const ColumnIndex: Integer): Boolean;
//begin
//  Result := (_columnIndexes <> nil) and _columnIndexes.Contains(ColumnIndex);
//end;
//
//procedure TCellSelectionInfo.ClearAllSelections;
//begin
//  inherited;
//  _columnIndexes := nil;
//end;
//
//function TCellSelectionInfo.Clone: ISelectionInfo;
//begin
//  Result := inherited;
//
//  var cellSelectionInfo := (Result as ICellSelectionInfo);
//  if _columnIndexes <> nil then
//    for var index in _columnIndexes do
//      cellSelectionInfo.AddCellSelection(index);
//end;
//
//function TCellSelectionInfo.CopyColumnIndexes: List<Integer>;
//begin
//  if _columnIndexes <> nil then
//    Result := CList<Integer>.Create(_columnIndexes) else
//    Result := nil;
//end;
//
//function TCellSelectionInfo.CreateInstance: ISelectionInfo;
//begin
//  Result := TCellSelectionInfo.Create;
//end;
//
//function TCellSelectionInfo.LastSelectedColumnIndex: Integer;
//begin
//  Result := _lastSelectedCellColumnIndex;
//end;
//
//procedure TCellSelectionInfo.RemoveCellSelection(const ColumnIndex: Integer);
//begin
//  _columnIndexes.Remove(ColumnIndex);
//end;
//
//function TCellSelectionInfo.SelectedCellCount: Integer;
//begin
//  if _columnIndexes <> nil then
//    Result := _columnIndexes.Count else
//    Result := 0;
//end;
//
//procedure TCellSelectionInfo.UpdateLastSelection(const DataIndex, ViewListIndex: Integer; const DataItem: CObject; const VirtualYPosition: Single);
//begin
//  inherited;
//
//  var selInfo: ISelectionInfo;
//  if _multiSelection.TryGetValue(DataIndex, selInfo) then
//    _columnIndexes := (selInfo as ICellSelectionInfo).CopyColumnIndexes
//  else if _columnIndexes <> nil then
//    _columnIndexes.Clear;
//end;

{ THeaderCell }

function THeaderCell.get_FilterControl: TControl;
begin
  Result := _filterControl;
end;

function THeaderCell.get_SortControl: TControl;
begin
  Result := _sortControl;
end;

function THeaderCell.IsHeaderCell: Boolean;
begin
  Result := True;
end;

procedure THeaderCell.set_FilterControl(const Value: TControl);
begin
  _filterControl := Value;
end;

procedure THeaderCell.set_SortControl(const Value: TControl);
begin
  _sortControl := Value;
end;

{ TTreeSelectionInfo }

procedure TTreeSelectionInfo.ClearMultiSelections;
begin
  inherited;
  if _selectedFlatColumns <> nil then
    _selectedFlatColumns.Clear;
end;

function TTreeSelectionInfo.Clone: IRowSelectionInfo;
begin
  Result := inherited Clone;
  (Result as ITreeSelectionInfo).SelectedFlatColumn := _lastSelectedFlatColumn;
end;

constructor TTreeSelectionInfo.Create;
begin
  inherited;
  _selectedFlatColumns := CList<Integer>.Create;
  _lastSelectedFlatColumn := 0;
end;

function TTreeSelectionInfo.CreateInstance: IRowSelectionInfo;
begin
  Result := TTreeSelectionInfo.Create;
end;

function TTreeSelectionInfo.get_SelectedFlatColumn: Integer;
begin
  Result := _lastSelectedFlatColumn;
end;

function TTreeSelectionInfo.get_SelectedFlatColumns: List<Integer>;
begin
  Result := _selectedFlatColumns;
end;

procedure TTreeSelectionInfo.set_SelectedFlatColumn(const Value: Integer);
begin
  _lastSelectedFlatColumn := Value;
  DoSelectionInfoChanged;
end;

{ TDCTreeCheckboxColumn }

constructor TDCTreeCheckboxColumn.Create;
begin
  inherited;

  _infoControlClass := TInfoControlClass.CheckBox;
end;

function TDCTreeCheckboxColumn.GetDefaultCellData(const Cell: IDCTreeCell; const CellValue: CObject; FormatApplied: Boolean): CObject;
begin
  var bool: Boolean;
  if (CellValue = nil) or not CellValue.TryAsType<Boolean>(bool) then
    bool := False;

  Result := bool;
end;

function TDCTreeCheckboxColumn.IsCheckBoxColumn: Boolean;
begin
  Result := True;
end;

{ TDCColumnSortAndFilter }

procedure TDCColumnSortAndFilter.Assign(const Source: IBaseInterface);
var
  _src: IDCColumnSortAndFilter;

begin
  if Interfaces.Supports(Source, IDCColumnSortAndFilter, _src) then
  begin
    _showFilterMenu := _src.ShowFilterMenu;
    _showSortMenu := _src.ShowSortMenu;
    _sortType := _src.Sort;
  end;
end;

function TDCColumnSortAndFilter.Clone: IDCColumnSortAndFilter;
begin
  var clone := TDCColumnSortAndFilter.Create;
  Result := clone;
  clone.Assign(Self);
end;

function TDCColumnSortAndFilter.get_ShowFilterMenu: Boolean;
begin
  Result := _showFilterMenu;
end;

function TDCColumnSortAndFilter.get_ShowSortMenu: Boolean;
begin
  Result := _showSortMenu;
end;

function TDCColumnSortAndFilter.get_SortType: TSortType;
begin
  Result := _sortType;
end;

procedure TDCColumnSortAndFilter.set_ShowFilterMenu(const Value: Boolean);
begin
  _showFilterMenu := Value;
end;

procedure TDCColumnSortAndFilter.set_ShowSortMenu(const Value: Boolean);
begin
  _showSortMenu := Value;
end;

procedure TDCColumnSortAndFilter.set_SortType(const Value: TSortType);
begin
  _sortType := Value;
end;

{ TDCColumnWidthSettings }

procedure TDCColumnWidthSettings.Assign(const Source: IBaseInterface);
var
  _src: IDCColumnWidthSettings;

begin
  if Interfaces.Supports(Source, IDCColumnWidthSettings, _src) then
  begin
    _width := _src.Width;
    _widthMin := _src.WidthMin;
    _widthMax := _src.WidthMax;
    _widthType := _src.WidthType;
  end;
end;

function TDCColumnWidthSettings.Clone: IDCColumnWidthSettings;
begin
  var clone := TDCColumnWidthSettings.Create;
  Result := clone;
  clone.Assign(Self);
end;

constructor TDCColumnWidthSettings.Create;
begin
  inherited Create;

  _widthType := TDCColumnWidthType.AlignToContent;
  _widthMin := 20;
  _widthMax := 400;
end;

function TDCColumnWidthSettings.get_Width: Single;
begin
  Result := _width;
end;

function TDCColumnWidthSettings.get_WidthMax: Single;
begin
  if _widthType <> TDCColumnWidthType.Pixel then
    Result := _widthMax else
    Result := _width;

  Result := CMath.Max(Result, 0);
end;

function TDCColumnWidthSettings.get_WidthMin: Single;
begin
  if _widthType <> TDCColumnWidthType.Pixel then
    Result := _widthMin else
    Result := _width;

  Result := CMath.Max(Result, 0);
end;

function TDCColumnWidthSettings.get_WidthType: TDCColumnWidthType;
begin
  Result := _widthType;
end;

procedure TDCColumnWidthSettings.set_Width(const Value: Single);
begin
  _width := Value;
end;

procedure TDCColumnWidthSettings.set_WidthMax(const Value: Single);
begin
  _widthMax := Value;
end;

procedure TDCColumnWidthSettings.set_WidthMin(const Value: Single);
begin
  _widthMin := Value;
end;

procedure TDCColumnWidthSettings.set_WidthType(const Value: TDCColumnWidthType);
begin
  _widthType := Value;
end;

{ TDCColumnSubControlSettings }

procedure TDCColumnSubControlSettings.Assign(const Source: IBaseInterface);
var
  _src: IDCColumnSubControlSettings;

begin
  if Interfaces.Supports(Source, IDCColumnSubControlSettings, _src) then
  begin
    _subPropertyName := _src.SubPropertyName;
    _subInfoControlClass := _src.SubInfoControlClass;
  end;
end;

function TDCColumnSubControlSettings.Clone: IDCColumnSubControlSettings;
begin
  var clone := TDCColumnSubControlSettings.Create;
  Result := clone;
  clone.Assign(Self);
end;

function TDCColumnSubControlSettings.get_SubInfoControlClass: TInfoControlClass;
begin
  Result := _subInfoControlClass;
end;

function TDCColumnSubControlSettings.get_SubPropertyName: CString;
begin
  Result := _subPropertyName;
end;

procedure TDCColumnSubControlSettings.set_SubInfoControlClass(const Value: TInfoControlClass);
begin
  _subInfoControlClass := Value;
end;

procedure TDCColumnSubControlSettings.set_SubPropertyName(const Value: CString);
begin
  _subPropertyName := Value;
end;

{ TDCColumnHierarchy }

procedure TDCColumnHierarchy.Assign(const Source: IBaseInterface);
var
  _src: IDCColumnHierarchy;

begin
  if Interfaces.Supports(Source, IDCColumnHierarchy, _src) then
  begin
    _showHierarchy := _src.ShowHierarchy;
    _indent := _src.Indent;
  end;
end;

function TDCColumnHierarchy.Clone: IDCColumnHierarchy;
begin
  var clone := TDCColumnHierarchy.Create;
  Result := clone;
  clone.Assign(Self);
end;

function TDCColumnHierarchy.get_Indent: Single;
begin
  Result := _indent;
end;

function TDCColumnHierarchy.get_ShowHierarchy: Boolean;
begin
  Result := _showHierarchy;
end;

procedure TDCColumnHierarchy.set_Indent(const Value: Single);
begin
  _indent := Value;
end;

procedure TDCColumnHierarchy.set_ShowHierarchy(const Value: Boolean);
begin
  _showHierarchy := Value;
end;

{ TDCColumnVisualisation }

procedure TDCColumnVisualisation.Assign(const Source: IBaseInterface);
var
  _src: IDCColumnVisualisation;

begin
  if Interfaces.Supports(Source, IDCColumnVisualisation, _src) then
  begin
    _visible := _src.Visible;
    _frozen := _src.Frozen;
    _readOnly := _src.ReadOnly;
    _selectable := _src.Selectable;
    _allowHide := _src.AllowHide;
    _format := _src.Format;
  end;
end;

function TDCColumnVisualisation.Clone: IDCColumnVisualisation;
begin
  var clone := TDCColumnVisualisation.Create(_onVisibilityChanged);
  Result := clone;
  clone.Assign(Self);
end;

constructor TDCColumnVisualisation.Create(const OnVisiblityChanged: TProc);
begin
  inherited Create;

  _visible := True;
  _selectable := True;

  _onVisibilityChanged := OnVisiblityChanged;
end;

function TDCColumnVisualisation.get_Format: CString;
begin
  Result := _format;
end;

function TDCColumnVisualisation.get_Frozen: Boolean;
begin
  Result := _frozen;
end;

function TDCColumnVisualisation.get_ReadOnly: Boolean;
begin
  Result := _readOnly;
end;

function TDCColumnVisualisation.get_Selectable: Boolean;
begin
  Result := _selectable;
end;

function TDCColumnVisualisation.get_Visible: Boolean;
begin
  Result := _visible;
end;

function TDCColumnVisualisation.get_AllowHide: Boolean;
begin
  Result := _allowHide;
end;

procedure TDCColumnVisualisation.set_Format(const Value: CString);
begin
  _format := Value;
end;

procedure TDCColumnVisualisation.set_Frozen(const Value: Boolean);
begin
  _frozen := Value;
end;

procedure TDCColumnVisualisation.set_ReadOnly(const Value: Boolean);
begin
  _readOnly := Value;
end;

procedure TDCColumnVisualisation.set_Selectable(Value: Boolean);
begin
  _selectable := Value;
end;

procedure TDCColumnVisualisation.set_AllowHide(const Value: Boolean);
begin
  _allowHide := Value;
end;

procedure TDCColumnVisualisation.set_Visible(const Value: Boolean);
begin
  if _visible <> Value then
  begin
    _visible := Value;
    _onVisibilityChanged();
  end;
end;

end.
