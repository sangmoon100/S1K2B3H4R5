unit OnTmaxCodeEdit;

interface
{$I OnDelVer.inc}
{$P+,S-,W-,R-}

uses
  SysUtils, Messages, Windows, Classes, Graphics, Menus, Controls, Forms, Dialogs,
  StdCtrls, Mask, ActnList, StdActns, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditUtils, OnStringUtils, OnCommon{$IFDEF DELPHI6}, Variants{$ENDIF},
  Clipbrd{$IFDEF DELPHI4}, ImgList{$ENDIF}, Buttons, OnEditBtnCtrl, OnCursors,
  Grids, DBGrids, OnGrDBGrid, OnFocusButton, ExtCtrls, OnInsaRes, Db,
  Tmax_DataSetText, Tmax_session;


type
  TTMaxCodeData = (data_codeno, data_codename, data_union);

  {...TTMaxCustomCodeEdit...}
  TTMaxCodeForm = class;

  TTMaxCustomCodeEdit = class(TOnCustomDropDownEdit)
  private
    FDisplayItem            : TTMaxCodeData;
    FHideEditCursor         : Boolean;
    FPopupAutoSize          : Boolean;
    FPopupClientEdge        : Boolean;
    FPopupControlAlign      : TAlign;
    FPopupControlBorderStyle: TBorderStyle;
    FPopupControlBoundsRect : TRect;
    FPopupControlParent     : TWinControl;
    FPopupControlVisible    : Boolean;
    FPopupFlatBorder        : Boolean;
    FPopupForm              : TTMaxCodeForm;
    FPopupFormBorderStyle   : TOnPopupEditFormBorderStyle;
    FPopupFormCaption       : string;
    FPopupHeight            : Integer;
    FPopupMinHeight         : Integer;
    FPopupMinWidth          : Integer;
    FPopupSizeable          : Boolean;
    FPopupWidth             : Integer;
    // 업무 리턴값..
    FQr                     : TTMaxDataSet;    
    Fcodeno                 : String;
    Fcodename               : String;
    Fcodeid                 : String;
    FSession                : TTMaxSession;
    FDBRead                 : Boolean;
    FShowModal              : Boolean;
    FOnReadEnded            : TNotifyEvent;

    procedure SetHideEditCursor(Value: Boolean);
    procedure SetPopupHeight(Value: Integer);
    procedure SetPopupMinHeight(Value: Integer);
    procedure SetPopupMinWidth(Value: Integer);
    procedure SetPopupWidth(Value: Integer);
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TMessage); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TMessage); message WM_SETFOCUS;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure CalcSize(APopupForm: TTMaxCodeForm); virtual;
    procedure DoDropDownPopupForm; virtual;
    procedure DropDown; override;
    procedure EditButtonClick; override;    
    procedure InitializePopup(APopupForm: TTMaxCodeForm); virtual;

    property HideEditCursor      : Boolean     read FHideEditCursor   write SetHideEditCursor default False;
    property PopupAutoSize       : Boolean     read FPopupAutoSize    write FPopupAutoSize default True;
    property PopupFormCaption    : string      read FPopupFormCaption write FPopupFormCaption;
    property PopupClientEdge     : Boolean     read FPopupClientEdge  write FPopupClientEdge default False;
    property PopupFlatBorder     : Boolean     read FPopupFlatBorder  write FPopupFlatBorder default True;
    property PopupHeight         : Integer     read FPopupHeight      write SetPopupHeight default 200;
    property PopupMinHeight      : Integer     read FPopupMinHeight   write SetPopupMinHeight default 100;
    property PopupMinWidth       : Integer     read FPopupMinWidth    write SetPopupMinWidth default 100;
    property PopupSizeable       : Boolean     read FPopupSizeable    write FPopupSizeable default True;
    property PopupWidth          : Integer     read FPopupWidth       write SetPopupWidth default 250;
    property PopupFormBorderStyle: TOnPopupEditFormBorderStyle        read FPopupFormBorderStyle
                                                                      write FPopupFormBorderStyle default pbsDialog;
    property Session             : TTMaxSession read FSession         write FSession;
    property DBRead              : Boolean      read FDBRead          write FDBRead;
  public
    FChangeText : String;
    FClickBtn   : Boolean;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function  IsEditClass: Boolean; override;
    function  IsFocused: Boolean; override;
    function  IsResetTextClass: Boolean; override;
    procedure PL_get_singledata;

    property DisplayItem : TTMaxCodeData read FDisplayItem  write FDisplayItem;
    property PopupForm   : TTMaxCodeForm read FPopupForm    write FPopupForm;
    property codeno      : String        read Fcodeno       write Fcodeno;
    property codename    : String        read Fcodename     write Fcodename;
    property codeid      : String        read Fcodeid       write Fcodeid;
    property ShowModal   : Boolean       read FShowModal    write FShowModal;
    property OnReadEnded : TNotifyEvent  read FOnReadEnded  write FOnReadEnded;
  end;


  TTMaxCodeForm = class(TForm)
    PA_search   : TPanel;
    BE_key      : TOnButtonEdit;
    PA_buttons  : TPanel;
    PA_grid     : TPanel;
    FB_ok       : TOnFocusButton;
    FB_cancel   : TOnFocusButton;
    QR_cod      : TTMaxDataSet;
    DataSource1 : TDataSource;
    GR_pyccode  : TOnGrDbGrid;
    procedure GR_pyccodeDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure GR_pyccodeKeyPress(Sender: TObject; var Key: Char);
    procedure GR_pyccodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure FB_okClick(Sender: TObject);
  private
    { Private declarations }
    FStart                : Boolean;
    FClientEdge           : Boolean;
    FCloseButtonRect      : TRect;
    FCloseButtonIsTracking: Boolean;
    FClosePopup           : Boolean;
    FFlatBorder           : Boolean;
    FGripRect             : TRect;
    FMouseAboveCloseButton: Boolean;
    FPopupFormBorderStyle : TOnPopupEditFormBorderStyle;
    FPopupMinHeight       : Integer;
    FPopupMinWidth        : Integer;
    FSizeable             : Boolean;
    FSizingCorner         : TOnCorner;
    FSysPanelBorder       : Integer;
    FSysPanelHeight       : Integer;
    FIsLoad               : Boolean;
    FIsClose              : Boolean;

    procedure SetClientEdge(Value: Boolean);
    procedure SetFlatBorder(Value: Boolean);
    procedure SetPopupFormBorderStyle(Value: TOnPopupEditFormBorderStyle);
    procedure SetSizeable(Value: Boolean);
    procedure WMCaptureChanged(var Message: TMessage); message WM_CAPTURECHANGED;
    procedure WMClose(var Message: TWMClose); message WM_CLOSE;
    procedure WMGetMinMaxInfo(var Message : TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCCreate(var Message: TWMNCCreate); message WM_NCCREATE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
    procedure WMSizing(var Message: TMessage); message WM_SIZING;
    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMSysKeyDown(var Message: TWMSysKeyDown); message WM_SYSKEYDOWN;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Deactivate; override;
    function  HasAsParent(APopupForm: TTMaxCodeForm): Boolean;

    property SizingCorner : TOnCorner read FSizingCorner write FSizingCorner;
  public
    { Public declarations }
    OwnerControl : TTMaxCustomCodeEdit;
    destructor Destroy; override;

    procedure CloseUp;
    procedure PL_get_code;
    procedure ShowPopup; virtual;
    property ClientEdge          : Boolean read FClientEdge     write SetClientEdge default False;
    property FlatBorder          : Boolean read FFlatBorder     write SetFlatBorder default True;
    property PopupFormBorderStyle: TOnPopupEditFormBorderStyle  read FPopupFormBorderStyle write SetPopupFormBorderStyle default pbsDialog;
    property PopupMinHeight      : Integer read FPopupMinHeight write FPopupMinHeight default 100;
    property PopupMinWidth       : Integer read FPopupMinWidth  write FPopupMinWidth default 100;
    property Sizeable            : Boolean read FSizeable       write SetSizeable default True;
  end;


 { TTMaxCodePopupEdit }
  TTMaxCodePopupEdit = class(TTMaxCustomCodeEdit)
  published
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
    property ValidChars;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property Anchors;
    property Constraints;
    property DragKind;
    property OnEndDock;
    property OnStartDock;
    property Alignment;
    property AutoSelect;
    property AutoSize;
    property CharCase;
    property MaxLength;
    property ReadOnly;
    property Text;
    // ......
    property EditDisableColor;
    property EditLabel;
    property EditStyle;
    property EditInputMode;
    property EditMask;
    // 추가항목들
    property ButtonGlyph;
    property ButtonColor;
    property ButtonWidth;
    property ButtonCaption;
    property HideEditCursor;
    property PopupAlignment;
    property PopupBorder;
    property ImmediatePopup;
    property PopupAutoSize;
    property PopupFormBorderStyle;
    property PopupFormCaption;
    property PopupClientEdge;
    property PopupFlatBorder;
    property PopupHeight;
    property PopupMinHeight;
    property PopupMinWidth;
    property PopupSizeable;
    property PopupWidth;
    // 업무용..
    property Session;
    property DisplayItem;
    property DBRead;
    property CodeID;
    property FocusPrevEdit;
    property FocusNextEdit;
    property OnReadEnded;
    property ShowModal;
    
    property OnChange;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnValidate;
    property OnCloseUp;
  end;

implementation

{$R *.DFM}

{...TTMaxCodeForm...}
destructor TTMaxCodeForm.Destroy;
begin
  inherited Destroy;
end;

procedure TTMaxCodeForm.CloseUp;
var
  Str : String;
  Acr : Boolean;
begin
  if FIsLoad then
    System.Exit;
  if FIsClose then
    System.Exit;
  FIsClose := True;

  try
    if not Assigned(OwnerControl) then
      System.Exit;
    if OwnerControl <> nil then
      begin
        OwnerControl.FActiveList := nil;
        OwnerControl.PopupForm   := nil;
        OwnerControl.FListVisible:= False;
        if OwnerControl.DisplayItem = data_codename then
          OwnerControl.Text := OwnerControl.codename
        else if OwnerControl.DisplayItem = data_union then
          OwnerControl.Text := OwnerControl.codeno + ' - ' + OwnerControl.codename
        else
          OwnerControl.Text := OwnerControl.codeno;
        if OwnerControl.codeno = '' then
          OwnerControl.Text := '';
        OwnerControl.FClickBtn := False;
        OwnerControl.DoCloseUp(Str,Acr);
      end;
  except
  end;    
  //Self.Close;
  Self.Release;
end;

procedure TTMaxCodeForm.ShowPopup;
var
  Msg     : TMsg;
  Edit    : TTMaxCustomCodeEdit;
begin
  FIsClose := False;
  if OwnerControl.ShowModal then
    ShowModal
  else
    Show;
  ModalResult := 0;
  try
    if not Self.Active then
      System.Exit;
      
    while Visible and Assigned(OwnerControl) and not Application.Terminated do
      begin
        // 마우스 다운 메세지 체킹.
        if PeekMessage(Msg, 0, WM_NCLBUTTONDOWN, WM_NCLBUTTONDOWN, PM_NOREMOVE) or
           PeekMessage(Msg, 0, WM_NCLBUTTONDBLCLK, WM_NCLBUTTONDBLCLK, PM_NOREMOVE) or
           PeekMessage(Msg, 0, WM_LBUTTONDOWN, WM_LBUTTONDOWN, PM_NOREMOVE) or
           PeekMessage(Msg, 0, WM_LBUTTONDBLCLK, WM_LBUTTONDBLCLK, PM_NOREMOVE) then
          begin
            Edit := OwnerControl;
            with Edit do
              if (Msg.hwnd = Handle) and ((ActiveButton <> -1) or FImmediatePopupStyle) then
                PeekMessage(Msg, 0, Msg.message, Msg.message, PM_REMOVE);
          end;

        // ALT+ENTER 체킹
        if PeekMessage(Msg, 0, WM_SYSKEYDOWN, WM_SYSKEYDOWN, PM_NOREMOVE) and (Msg.wParam in [VK_RETURN]) then
          PeekMessage(Msg, 0, Msg.message, Msg.message, PM_REMOVE);

        if not Application.Active then
          CloseUp;

        // ModalResult
        if ModalResult <> 0 then
          begin
            //if ModalResult = mrOK then
            CloseUp;
          end;
        Application.HandleMessage;
      end;
  except
    Application.HandleMessage;
  end;   
end;

procedure TTMaxCodeForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    begin
      if not (PopupFormBorderStyle in [pbsDialog, pbsDialogHelp]) then
        begin
          if not (ClientEdge and FlatBorder) then
            begin
              if FlatBorder then
                Style := Style or WS_BORDER
              else
                begin
                  ExStyle := ExStyle or WS_EX_WINDOWEDGE or WS_EX_DLGMODALFRAME;
                  Style   := Style or WS_THICKFRAME;
                end;
            end;
        end
      else
        begin
          if ClientEdge then
            ExStyle := ExStyle or WS_EX_CLIENTEDGE;
          if Sizeable then
            Style := Style or WS_THICKFRAME;
        end;
      WindowClass.Style := WindowClass.Style or CS_SAVEBITS;
    end;
end;

procedure TTMaxCodeForm.Deactivate;
begin
  inherited;
  CloseUp;
end;

procedure TTMaxCodeForm.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = OwnerControl then
      OwnerControl := nil;
end;

function TTMaxCodeForm.HasAsParent(APopupForm: TTMaxCodeForm): Boolean;
var
  AForm : TCustomForm;
begin
  Result := False;
  AForm  := GetParentForm(Self.OwnerControl);
  if AForm = APopupForm then
    Result := True
  else
    if AForm is TTMaxCodeForm then
      Result := TTMaxCodeForm(AForm).HasAsParent(APopupForm);
end;

procedure TTMaxCodeForm.SetClientEdge(Value: Boolean);
begin
  if FClientEdge <> Value then
    begin
      FClientEdge := Value;
      RecreateWnd;
    end;
end;

procedure TTMaxCodeForm.SetFlatBorder(Value: Boolean);
begin
  if FFlatBorder <> Value then
    begin
      FFlatBorder := Value;
      RecreateWnd;
    end;
end;

procedure TTMaxCodeForm.SetPopupFormBorderStyle(Value: TOnPopupEditFormBorderStyle);
begin
  if FPopupFormBorderStyle <> Value then
    begin
      FPopupFormBorderStyle := Value;
      if FPopupFormBorderStyle in [pbsDialog, pbsDialogHelp] then
        BorderStyle := bsDialog
      else BorderStyle := bsNone;
        if FPopupFormBorderStyle = pbsDialogHelp then
          BorderIcons := BorderIcons + [biHelp]
        else
          BorderIcons := BorderIcons - [biHelp];
      RecreateWnd;
    end;
end;

procedure TTMaxCodeForm.SetSizeable(Value: Boolean);
begin
  if FSizeable <> Value then
    begin
      FSizeable := Value;
      RecreateWnd;
    end;
end;

procedure TTMaxCodeForm.WMCaptureChanged(var Message: TMessage);
begin
  inherited;
  if FCloseButtonIsTracking then
    begin
      FCloseButtonIsTracking := False;
      FMouseAboveCloseButton := False;
      SendMessage(Handle, WM_NCPAINT, 0, 0);
    end;
end;

procedure TTMaxCodeForm.WMClose(var Message: TWMClose);
begin
  inherited;
end;

procedure TTMaxCodeForm.WMGetMinMaxInfo(var Message : TWMGetMinMaxInfo);
begin
  Message.MinMaxInfo^.ptMinTrackSize := Point(PopupMinWidth, PopupMinHeight);
  inherited;
end;

procedure TTMaxCodeForm.WMLButtonUp(var Message: TWMLButtonUp);
begin
  if FCloseButtonIsTracking then
    begin
      FCloseButtonIsTracking := False;
      ReleaseCapture;
      if FMouseAboveCloseButton then
        begin
          CloseUp;
        end;
      SendMessage(Handle, WM_NCPAINT, 0, 0);
    end;
  inherited;
end;

procedure TTMaxCodeForm.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  H : Integer;
begin
  inherited;
  if PopupFormBorderStyle in [pbsSimple, pbsSysPanel] then
    with Message.CalcSize_Params^.rgrc[0] do
      begin
        H := FSysPanelHeight;
        // Frame
        if ClientEdge then
          if FlatBorder then
            InflateRect(Message.CalcSize_Params^.rgrc[0], -3, -3)
          else
            InflateRect(Message.CalcSize_Params^.rgrc[0], -2, -2);
        // SysPanel
        if PopupFormBorderStyle = pbsSysPanel then
          if SizingCorner in [coBottomLeft, coBottomRight] then
            Dec(Bottom, H)
          else
            Inc(Top, H);
      end;
end;

procedure TTMaxCodeForm.WMNCCreate(var Message: TWMNCCreate);
var
  SysMenu  : HMENU;
  Info     : TMenuItemInfo;
  S        : array [0..1023] of Char;
  ItemExist: Boolean;
begin
  SysMenu         := GetSystemMenu(Handle, False);
  Info.cbSize     := 44; // Required
  Info.fMask      := MIIM_ID or MIIM_TYPE;
  Info.dwTypeData := @S[0];
  Info.cch        := 1024;
  ItemExist       := Sizeable and GetMenuItemInfo(SysMenu, SC_SIZE, False{MF_BYCOMMAND}, Info);
  inherited;
  DeleteMenu(SysMenu, SC_MOVE, MF_BYCOMMAND);
  if ItemExist then
    InsertMenuItem(SysMenu, 0, True, Info);

  // Calc SysPanel Height
  FSysPanelHeight := 0;
  FSysPanelBorder := 0;
  if PopupFormBorderStyle = pbsSysPanel then
    begin
      FSysPanelHeight := GetSystemMetrics(SM_CYHSCROLL) + 2;
      if FSysPanelHeight < (OnDropDownNCHeight-1) then
        FSysPanelHeight := (OnDropDownNCHeight-1);
      if FlatBorder then
        if not ClientEdge then
          begin
            Inc(FSysPanelHeight);
            FSysPanelBorder := 1;
          end;
    end;
end;

procedure TTMaxCodeForm.WMNCHitTest(var Message: TWMNCHitTest);
type
  TCornerHitTest  = {Windows.HTNOWHERE}0..Windows.HTHELP;
  TCornerHitTests = set of TCornerHitTest;
const
  SizingHitTest = [Windows.HTLEFT, Windows.HTRIGHT, Windows.HTTOP, Windows.HTTOPLEFT,
                   Windows.HTTOPRIGHT, Windows.HTBOTTOM, Windows.HTBOTTOMLEFT, Windows.HTBOTTOMRIGHT];
  CornerHitTest : array [TOnCorner] of TCornerHitTests = (
                 [Windows.HTLEFT, Windows.HTTOPLEFT, Windows.HTTOP],
                 [Windows.HTTOP, Windows.HTTOPRIGHT, Windows.HTRIGHT],
                 [Windows.HTLEFT, Windows.HTBOTTOMLEFT, Windows.HTBOTTOM],
                 [Windows.HTBOTTOM, Windows.HTBOTTOMRIGHT, Windows.HTRIGHT]);

  function GetCornerHitTestAt(X, Y: Integer): TCornerHitTest;
  var
    P  : TPoint;
    R  : TRect;
    CX : Integer;
    CY : Integer;
  begin
    Result := Windows.HTNOWHERE;
    P      := Point(X, Y);
    GetWindowRect(Handle, R);
    CX := GetSystemMetrics(SM_CXVSCROLL);
    CY := GetSystemMetrics(SM_CYHSCROLL);
    with R do
      begin
        if PtInRect(Rect(Left, Top, Left + CX, Top + CY), P) then
          Result := Windows.HTTOPLEFT
        else if PtInRect(Rect(Right - CX, Top, Right, Top + CY), P) then
          Result := Windows.HTTOPRIGHT
        else if PtInRect(Rect(Left, Top, Right, Top + CY), P) then
          Result := Windows.HTTOP
        else if PtInRect(Rect(Right - CX, Bottom - CY, Right, Bottom), P) then
          Result := Windows.HTBOTTOMRIGHT
        else if PtInRect(Rect(Right - CX, Top, Right, Bottom), P) then
          Result := Windows.HTRIGHT
        else if PtInRect(Rect(Left, Bottom - CY, Left + CX, Bottom), P) then
          Result := Windows.HTBOTTOMLEFT
        else if PtInRect(Rect(Left, Bottom - CY, Right, Bottom), P) then
          Result := Windows.HTBOTTOM
        else if PtInRect(Rect(Left, Top, Left + CX, Bottom), P) then
          Result := Windows.HTLEFT;
      end;
  end;

var
  PrevMouseAboveCloseButton: Boolean;
begin
  inherited;
  if Sizeable then
    begin
      if Message.Result in [Windows.HTBORDER, Windows.HTNOWHERE] then
        Message.Result := GetCornerHitTestAt(Message.XPos, Message.YPos);
      if (Message.Result in SizingHitTest) and not (Message.Result in CornerHitTest[SizingCorner]) then
        Message.Result := Windows.HTNOWHERE;
    end;

  if PopupFormBorderStyle = pbsSysPanel then
    with Message do
      if Sizeable and PtInRect(FGripRect, SmallPointToPoint(Pos)) then
        Result := GetHitTestByCorner(SizingCorner)
      else
        begin
          PrevMouseAboveCloseButton := FMouseAboveCloseButton;
          FMouseAboveCloseButton    := ((GetCapture = 0) or FCloseButtonIsTracking) and PtInRect(FCloseButtonRect, SmallPointToPoint(Pos));
          if FMouseAboveCloseButton then
            begin
              Result := HTBORDER;
            end;
          if PrevMouseAboveCloseButton <> FMouseAboveCloseButton then
            SendMessage(Handle, WM_NCPAINT, 0, 0);
        end;
  if not Sizeable and (Message.Result in SizingHitTest) then
    Message.Result := Windows.HTNOWHERE;
end;

procedure TTMaxCodeForm.WMNCLButtonDown(var Message: TWMNCLButtonDown);
begin
  inherited;
  if FMouseAboveCloseButton then
    begin
      FCloseButtonIsTracking := True;
      SetCapture(Handle);
      SendMessage(Handle, WM_NCPAINT, 0, 0);
    end;
end;

procedure TTMaxCodeForm.WMNCPaint(var Message: TWMNCPaint);
var
  R, CR, FR : TRect;
  B, DX, DY : Integer;
  DC        : HDC;
  ABrush    : HBRUSH;
  AStyle    : Longint;
begin
  inherited;
  if not (PopupFormBorderStyle in [pbsSimple, pbsSysPanel]) then
    System.Exit;

  DC := GetWindowDC(Handle);

  GetWindowRect(Handle, R);
  FCloseButtonRect := R;
  FGripRect        := R;
  Windows.GetClientRect(Handle, CR);
  MapWindowPoints(0, Handle, R, 2);

  B := -R.Left;
  OffsetRect(CR, -R.Left, -R.Top);
  OffsetRect(R, -R.Left, -R.Top);
  InflateRect(R, -B, -B);

  // 프레임을 그린다..
  if ClientEdge then
    begin
      FR := R;
      if FlatBorder then
        begin
          InflateRect(FR, B, B);
          DrawEdge(DC, FR, EDGE_RAISED, BF_RECT);
          InflateRect(FR, -2, -2);
          if SizingCorner in [coBottomLeft, coBottomRight] then
            Dec(FR.Bottom, FSysPanelHeight)
          else
            Inc(FR.Top, FSysPanelHeight);
          DrawEdge(DC, FR, BDR_SUNKENOUTER, BF_RECT);
        end
      else
        begin
          InflateRect(FR, 2, 2);
          if SizingCorner in [coBottomLeft, coBottomRight] then
            Dec(FR.Bottom, FSysPanelHeight)
          else
            Inc(FR.Top, FSysPanelHeight);
          DrawEdge(DC, FR, EDGE_SUNKEN, BF_RECT);
        end;
    end;

  if PopupFormBorderStyle = pbsSysPanel then
    begin
      if FlatBorder then
        ABrush := GetSysColorBrush(COLOR_WINDOWFRAME)
      else
        ABrush := GetSysColorBrush(COLOR_BTNFACE);

      if ClientEdge then
        begin
          if FlatBorder then
            B := 1
          else
            B := 2;
          InflateRect(R, B, 0);
          if SizingCorner in [coBottomLeft, coBottomRight] then
            OffsetRect(R, 0, B)
          else
            OffsetRect(R, 0, -B);
        end;
      if SizingCorner in [coBottomLeft, coBottomRight] then
        begin
          R.Top := R.Bottom - FSysPanelHeight + FSysPanelBorder;
          if not (FlatBorder and ClientEdge) then
            FillRect(DC, Rect(R.Left, R.Top - FSysPanelBorder, R.Right, R.Top), ABrush);
        end
      else
        begin
          R.Bottom := R.Top + FSysPanelHeight - FSysPanelBorder;
          if not (FlatBorder and ClientEdge) then
            FillRect(DC, Rect(R.Left, R.Bottom, R.Right, R.Bottom + FSysPanelBorder), ABrush);
        end;

      DX := 0;
      DY := 0;
      if not FlatBorder then
        begin
          DX := 1;
          DY := 1;
          if SizingCorner in [coTopLeft, coTopRight] then
            DY := -DY;
          if SizingCorner in [coTopRight, coBottomRight] then
            DX := -DX;
        end;

      if Sizeable then
        begin
          CR := R;
          if not FlatBorder then
            OffsetRect(CR, -DX, DY);
          DrawSizeGrip(DC, CR, SizingCorner);
          with CR do
            ExcludeClipRect(DC, Left, Top, Right, Bottom);
          InflateRect(CR, 2, 2);
          if CR.Top < R.Top then
            CR.Top := R.Top;
          if CR.Bottom > R.Bottom then
            CR.Bottom := R.Bottom;
          OffsetRect(CR, FGripRect.Left, FGripRect.Top);
          FGripRect := CR;
        end;

      CR := R;
      if not FlatBorder then
        OffsetRect(CR, DX, DY);
      DrawCloseButton(DC, CR, FMouseAboveCloseButton or FCloseButtonIsTracking, FMouseAboveCloseButton and FCloseButtonIsTracking, SizingCorner);
      with CR do
        ExcludeClipRect(DC, Left, Top, Right, Bottom);
      with FCloseButtonRect do
        OffsetRect(CR, Left, Top);
      FCloseButtonRect := CR;

      FillRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
      if SizingCorner in [coBottomLeft, coBottomRight] then
        begin
          AStyle := GetWindowLong(Handle, GWL_STYLE);
          if (AStyle and WS_HSCROLL <> 0) and (AStyle and WS_VSCROLL <> 0) then
            with R do
              begin
                Left   := Right - GetSystemMetrics(SM_CXVSCROLL);
                Bottom := Top - 1;
                Top    := Bottom - GetSystemMetrics(SM_CYHSCROLL);
                FillRect(DC, R, GetSysColorBrush(COLOR_BTNFACE));
              end;
        end;
    end;

  ReleaseDC(Handle, DC);
end;

procedure TTMaxCodeForm.WMSizing(var Message: TMessage);
type
  TCornerHitTest  = WMSZ_LEFT..WMSZ_BOTTOMRIGHT;
  TCornerHitTests = set of TCornerHitTest;
const
  CornerHitTest: array [TOnCorner] of TCornerHitTests = (
                 [WMSZ_LEFT, WMSZ_TOPLEFT, WMSZ_TOP],
                 [WMSZ_TOP, WMSZ_TOPRIGHT, WMSZ_RIGHT],
                 [WMSZ_LEFT, WMSZ_BOTTOMLEFT, WMSZ_BOTTOM],
                 [WMSZ_BOTTOM, WMSZ_BOTTOMRIGHT, WMSZ_RIGHT]);
begin
  inherited;
  if not (Sizeable and (Message.WParam in CornerHitTest[SizingCorner])) then
    PRect(Message.lParam)^ := BoundsRect;
end;

procedure TTMaxCodeForm.WMSysCommand(var Message: TWMSysCommand);
begin
  if Message.CmdType = SC_KEYMENU then
    Message.Result := 0
  else
    inherited;
end;

procedure TTMaxCodeForm.WMSysKeyDown(var Message: TWMSysKeyDown);
begin
  if Message.CharCode in [VK_RETURN, VK_MENU] then
    Message.Result := 0
  else
    inherited;
end;

procedure TTMaxCodeForm.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if FMouseAboveCloseButton then
    begin
      FMouseAboveCloseButton := False;
      SendMessage(Handle, WM_NCPAINT, 0, 0);
    end;
end;

procedure TTMaxCodeForm.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  OwnerControl.DoKillFocus(Message);
  CloseUp;
end;


{...TTMaxCustomCodeEdit...}
constructor TTMaxCustomCodeEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSendChildrenStyle := False;
  FPopupAutoSize     := False;
  FPopupFlatBorder   := True;
  FPopupHeight       := 200;
  FPopupMinHeight    := 100;
  FPopupMinWidth     := 100;
  FPopupSizeable     := True;
  FPopupWidth        := 250;
  PopupBorder        := edit_pbShadow;
  PopupClientEdge    := False;
  PopupFlatBorder    := False;
  PopupFormBorderStyle:= pbsSysPanel;

  Fcodeno            := '';
  Fcodename          := '';
  Fcodeid            := '';
  FChangeText        := '';
  FSession           := nil;
  FPopupForm         := nil;
  FQr                := nil;
  FQr                := TTMaxDataSet.Create(nil);
  FDisplayItem       := data_codename;
  FDBRead            := True;
  ButtonGlyph.Bitmap.Handle := LoadBitmap(hInstance,'ONFINDBTN');
end;

destructor TTMaxCustomCodeEdit.Destroy;
begin
  if Assigned(FQr) then
    FQr.Close;
  if FPopupForm <> nil then
    DestroyObjects([FPopupForm, FQr]);
  inherited Destroy;
end;

function TTMaxCustomCodeEdit.IsEditClass: Boolean;
begin
  Result := not FHideEditCursor;
end;

function TTMaxCustomCodeEdit.IsFocused: Boolean;
begin
  Result := inherited IsFocused or ((PopupForm <> nil) and PopupForm.Active);
end;

function TTMaxCustomCodeEdit.IsResetTextClass: Boolean;
begin
  Result := True;
end;

procedure TTMaxCustomCodeEdit.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    begin
      if AComponent = FSession then
         FSession := nil;
    end;
end;

procedure TTMaxCustomCodeEdit.CalcSize(APopupForm: TTMaxCodeForm);
const
  Corners: array[Boolean, Boolean] of TOnCorner =
                 ((coTopLeft, coBottomLeft), (coTopRight, coBottomRight));
var
  EditRect, DropDownRect, R: TRect;
  ALeftFlag, ABottomFlag   : Boolean;
begin
  Windows.GetWindowRect(Self.Handle, EditRect);
  Windows.GetWindowRect(APopupForm.Handle, DropDownRect);
  OffsetRect(DropDownRect, EditRect.Left - DropDownRect.Left, EditRect.Top + Height - DropDownRect.Top);
  with APopupForm do
    begin
      SizingCorner := coBottomRight;
      ALeftFlag    := True;
      ABottomFlag  := True;
      // 스크린 죄표를 구한다.
      R := GetScreenWorkArea(Point(Left, Top));
      // X 좌표 체킹
      if APopupForm.Width > Self.Width then
        begin
          if (DropDownRect.Right > R.Right) and (abs(R.Right - EditRect.Left) < abs(R.Left - EditRect.Right)) then
            begin
              OffsetRect(DropDownRect, - (DropDownRect.Right - DropDownRect.Left) + Self.Width, 0);
              ALeftFlag := False;
            end;
        end;
      // Y 좌표 체킹
      if (DropDownRect.Bottom > R.Bottom) then
        if (abs(R.Bottom - EditRect.Bottom) < abs(EditRect.Top - R.Top)) then
          begin
            OffsetRect(DropDownRect, 0, -(DropDownRect.Bottom - DropDownRect.Top + Self.Height));
            ABottomFlag := False;
          end;
      // set corner
      SizingCorner := Corners[ALeftFlag, ABottomFlag];
      // set pos
      if DropDownRect.Left >= 0 then
        Left := DropDownRect.Left
      else
        Left := 0;
      if DropDownRect.Top >= 0 then
        Top := DropDownRect.Top
      else
        Top := 0;
    end;
end;

procedure TTMaxCustomCodeEdit.DoDropDownPopupForm;
begin
  if not Enabled then
    System.Exit;
  if FListVisible or not CanModify then
    System.Exit;
  if FPopupForm = nil then
    FPopupForm := TTMaxCodeForm.Create(nil)
  else
    DestroyObjects([FPopupForm]);
  FPopupForm.OwnerControl := Self;
  FActiveList := FPopupForm;
  EditButtonClick;

  with FPopupForm do
    begin
      InitializePopup(FPopupForm);
      FListVisible := True;
      ShowPopup;
    end;
  Application.ProcessMessages;  
end;

procedure TTMaxCustomCodeEdit.DropDown;
begin
  DoDropDownPopupForm;
end;

procedure TTMaxCustomCodeEdit.InitializePopup(APopupForm: TTMaxCodeForm);
begin
  with APopupForm do
    begin
      FFlatBorder    := True;
      FSizeable      := True;
      BorderStyle    := bsDialog;
      ClientEdge     := False;
      FlatBorder     := True;
      PopupFormBorderStyle := pbsDialog;
      Sizeable       := True;
      PopupMinHeight := 100;
      PopupMinWidth  := 100;

      FlatBorder           := Self.PopupFlatBorder;
      PopupFormBorderStyle := Self.PopupFormBorderStyle;
      ClientEdge           := PopupClientEdge;
      FlatBorder           := PopupFlatBorder;
      Sizeable             := PopupSizeable;
      Caption              := PopupFormCaption;
      PopupMinHeight       := PopupMinHeight;
      PopupMinWidth        := PopupMinWidth;

      CalcSize(APopupForm);
      CalcPosition(APopupForm, FPopupAutoSize);
      RecreateWnd;
    end;
end;

procedure TTMaxCustomCodeEdit.WMKillFocus(var Message: TMessage);
begin
  inherited;
  if (FChangeText <> Text) and (DBRead) then
    begin
      PL_get_singledata;
      if not FClickBtn then
        FChangeText := Text;
    end;
end;

procedure TTMaxCustomCodeEdit.EditButtonClick;
begin
  FClickBtn := True;
  SetFocus;
  inherited;
end;

procedure TTMaxCustomCodeEdit.PL_get_singledata;
var
  FL_Sql : String;
begin
  if (Trim(Text) = '') or (FClickBtn) then
    begin
      Fcodeno   := '';
      Fcodename := '';
      System.Exit;
    end;
  FQr.Session     := Session;
  FQr.ServiceName := 'HINSA_pyccode';
  FQr.ClearFieldInfo;
  FQr.AddField('codeid'  , ftString, 4);
  FQr.AddField('codeno'  , ftString, 10);
  FQr.AddField('codename', ftString, 30);
  FQr.AddField('codefname',ftString, 30);

  FL_Sql := 'SELECT codeid, codeno, codename, codefname '+
            '  FROM pyccode  '+
            ' WHERE codeid = ''%s'' '+
            '   AND codeno = ''%s'' ';
  FL_Sql := Format(FL_Sql,[Fcodeid,Text]);
  with FQr do
    begin
      Close;
      Sql.Clear;
      Sql.Add(FL_Sql);
      try
        Open;
      except
        begin
          Close;
          System.Exit;
        end;
      end;

      Fcodeno   := FieldByName('codeno').AsString;
      Fcodename := FieldByName('codename').AsString;

      if FDisplayItem = data_codename then
        Text := Fcodename
      else if FDisplayItem = data_union then
        begin
          if Fcodeno <> '' then
            Text := Fcodeno + ' - ' + Fcodename
          else
            Text := '';
        end
      else
        Text := Fcodeno;
      Close;
    end;

  if Assigned(FOnReadEnded) then
    FOnReadEnded(Self);
end;

procedure TTMaxCustomCodeEdit.WMSetFocus(var Message: TMessage);
begin
  inherited;
  FChangeText := Text;
end;

procedure TTMaxCustomCodeEdit.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if DroppedDown then
    Message.Result := Message.Result or DLGC_WANTALLKEYS;
end;


procedure TTMaxCustomCodeEdit.SetHideEditCursor(Value: Boolean);
begin
  if FHideEditCursor <> Value then
    begin
      FHideEditCursor      := Value;
      FImmediatePopupStyle := FHideEditCursor;
      RecreateWnd;
    end;
end;

procedure TTMaxCustomCodeEdit.SetPopupHeight(Value: Integer);
begin
  if Value < FPopupMinHeight then
    Value := FPopupMinHeight;
  if FPopupHeight <> Value then
    begin
      FPopupHeight := Value;
    end;
end;

procedure TTMaxCustomCodeEdit.SetPopupMinHeight(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  FPopupMinHeight := Value;
  SetPopupHeight(FPopupHeight);
end;

procedure TTMaxCustomCodeEdit.SetPopupMinWidth(Value: Integer);
begin
  if Value < 0 then
    Value := 0;
  FPopupMinWidth := Value;
  SetPopupWidth(FPopupWidth);
end;

procedure TTMaxCustomCodeEdit.SetPopupWidth(Value: Integer);
begin
  if Value < FPopupMinWidth then
    Value := FPopupMinWidth;
  if FPopupWidth <> Value then
    begin
      FPopupWidth := Value;
    end;
end;

procedure TTMaxCodeForm.GR_pyccodeDblClick(Sender: TObject);
begin
  with QR_cod do
    begin
      OwnerControl.codeno   := FieldByName('codeno').AsString;
      OwnerControl.codename := FieldByName('codename').AsString;
    end;

  if Assigned(OwnerControl.FOnReadEnded) then
    OwnerControl.FOnReadEnded(Self);    
  CloseUp;
end;

procedure TTMaxCodeForm.FormCreate(Sender: TObject);
begin
  FStart := True;
end;

procedure TTMaxCodeForm.FormPaint(Sender: TObject);
begin
  if FStart then
    begin
      FStart             := False;
      QR_cod.Session     := OwnerControl.Session;
      QR_cod.ServiceName := 'HINSA_pyccode';
      if (OwnerControl.FChangeText <> OwnerControl.Text) then
        BE_key.Text := Trim(ParseString(OwnerControl.Text,'-',1));
      PL_get_code;
    end;
end;

procedure TTMaxCodeForm.GR_pyccodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      GR_pyccodeDblClick(Sender);
      Key := #0;
    end;
end;

procedure TTMaxCodeForm.GR_pyccodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      if QR_cod.Active then
        CloseUp;
    end;

  if not (Sender is TCustomGrid) then
    if Key = VK_RETURN then
      BE_keyButtonClick(Sender,0);    
end;

procedure TTMaxCodeForm.PL_get_code;
var
  FL_Sql : String;
begin
  FIsLoad := True;
  if OwnerControl <> nil then
    QR_cod.Session := OwnerControl.Session;
  QR_cod.ServiceName := 'HINSA_pyccode';
  FL_Sql := 'SELECT codeid, codeno, codename, codefname '+
            '  FROM pyccode '+
            ' WHERE codeid   = ''%s'' '+
            '   AND (codeno LIKE ''%s'' OR codename LIKE ''%s'') '+
//            '   AND nvl(useyn,''Y'') = ''Y'' '+
            ' ORDER BY codeno ';
  FL_Sql := Format(FL_Sql,[OwnerControl.codeid, '%'+BE_key.Text+'%', '%'+BE_key.Text+'%']);
  try
    with QR_cod do
      begin
        Close;
        Sql.Clear;
        Sql.Add(FL_Sql);
        Open;
      end;
  except
    QR_cod.Close;
  end;
  GR_pyccode.SetFocus;
  FIsLoad := False;
end;

procedure TTMaxCodeForm.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  PL_get_code;
end;

procedure TTMaxCodeForm.FB_okClick(Sender: TObject);
begin
  GR_pyccodeDblClick(Sender);
end;

initialization
finalization

end.

