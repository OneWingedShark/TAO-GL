--  GLUT Binding, shamelessly stolen/adapted from here:
--	http://globe3d.sourceforge.net/g3d_html/glut__ads.htm
--	http://globe3d.sourceforge.net/g3d_html/glut__adb.htm

With
System.Storage_Elements,
Interfaces.C.Strings,
System,
TAO_GL.Types;

Use
TAO_GL.Types;

Package TAO_GL.Utility_Toolkit is
    Pragma Elaborate_Body;

    Address_Size : Constant := Standard'Address_Size;

    SubType Unsigned is Unsigned_Integer;
    SubType Key_type is Unsigned_Byte;

--------------------------------------------------------------------------------
----   CONSTANTS	GLUT CONSTANTS FOR FUNCTION PARAMETERS.		    ----
--------------------------------------------------------------------------------

    -- TODO:	Convert these constants into types and alter the procedures in
    --		the Functions package to use them, so as to prevent erroneously
    --		executing programs.

   --  Display mode bit masks.

   RGB                 : constant := 0;
   RGBA                : constant := 0;
   INDEX               : constant := 1;
   SINGLE              : constant := 0;	-- SINGLE = 0 seems suspect, investigate
   DOUBLE              : constant := 2;
   ACCUM               : constant := 4;
   ALPHA               : constant := 8;
   DEPTH               : constant := 16;
   STENCIL             : constant := 32;
   MULTISAMPLE         : constant := 128;
   STEREO              : constant := 256;
   LUMINANCE           : constant := 512;

   --  Mouse buttons.

   LEFT_BUTTON         : constant := 0;
   MIDDLE_BUTTON       : constant := 1;
   RIGHT_BUTTON        : constant := 2;

   --  Mouse button callback state.

   DOWN                : constant := 0;
   UP                  : constant := 1;

   --  function keys

   KEY_F1              : constant := 1;
   KEY_F2              : constant := 2;
   KEY_F3              : constant := 3;
   KEY_F4              : constant := 4;
   KEY_F5              : constant := 5;
   KEY_F6              : constant := 6;
   KEY_F7              : constant := 7;
   KEY_F8              : constant := 8;
   KEY_F9              : constant := 9;
   KEY_F10             : constant := 10;
   KEY_F11             : constant := 11;
   KEY_F12             : constant := 12;

   --  directional keys

   KEY_LEFT            : constant := 100;
   KEY_UP              : constant := 101;
   KEY_RIGHT           : constant := 102;
   KEY_DOWN            : constant := 103;
   KEY_PAGE_UP         : constant := 104;
   KEY_PAGE_DOWN       : constant := 105;
   KEY_HOME            : constant := 106;
   KEY_END             : constant := 107;
   KEY_INSERT          : constant := 108;

   --  Entry/exit callback state.

   LEFT                : constant := 0;
   ENTERED             : constant := 1;

   --  Menu usage callback state.

   MENU_NOT_IN_USE     : constant := 0;
   MENU_IN_USE         : constant := 1;

   --  Visibility callback state.

   NOT_VISIBLE         : constant := 0;
   VISIBLE             : constant := 1;

   --  Window status callback state.

   HIDDEN              : constant := 0;
   FULLY_RETAINED      : constant := 1;
   PARTIALLY_RETAINED  : constant := 2;
   FULLY_COVERED       : constant := 3;

   --  Color index component selection values.

   RED                 : constant := 0;
   GREEN               : constant := 1;
   BLUE                : constant := 2;

   --  glutGameModeGet

   GAME_MODE_ACTIVE          : constant := 0;
   GAME_MODE_POSSIBLE        : constant := 1;
   GAME_MODE_WIDTH           : constant := 2;
   GAME_MODE_HEIGHT          : constant := 3;
   GAME_MODE_PIXEL_DEPTH     : constant := 4;
   GAME_MODE_REFRESH_RATE    : constant := 5;
   GAME_MODE_DISPLAY_CHANGED : constant := 6;

   -- glutSetKeyRepeat modes

   KEY_REPEAT_OFF            : constant := 0;
   KEY_REPEAT_ON             : constant := 1;
   KEY_REPEAT_DEFAULT        : constant := 2;

   -- Joystick button masks

   JOYSTICK_BUTTON_A          : constant := 1;
   JOYSTICK_BUTTON_B          : constant := 2;
   JOYSTICK_BUTTON_C          : constant := 4;
   JOYSTICK_BUTTON_D          : constant := 8;

   --  Stroke font constants (use these in GLUT program).

   STROKE_ROMAN      : constant System.Address
     := System.Storage_Elements.To_Address (0);
   STROKE_MONO_ROMAN : constant System.Address
     := System.Storage_Elements.To_Address (1);

   --  Bitmap font constants (use these in GLUT program).

   BITMAP_9_BY_15        : constant System.Address
     := System.Storage_Elements.To_Address (2);
   BITMAP_8_BY_13        : constant System.Address
     := System.Storage_Elements.To_Address (3);
   BITMAP_TIMES_ROMAN_10 : constant System.Address
     := System.Storage_Elements.To_Address (4);
   BITMAP_TIMES_ROMAN_24 : constant System.Address
     := System.Storage_Elements.To_Address (5);
   BITMAP_HELVETICA_10   : constant System.Address
     := System.Storage_Elements.To_Address (6);
   BITMAP_HELVETICA_12   : constant System.Address
     := System.Storage_Elements.To_Address (7);
   BITMAP_HELVETICA_18   : constant System.Address
     := System.Storage_Elements.To_Address (8);

   --  glutGet parameters.

   WINDOW_X                  : constant := 100;
   WINDOW_Y                  : constant := 101;
   WINDOW_WIDTH              : constant := 102;
   WINDOW_HEIGHT             : constant := 103;
   WINDOW_BUFFER_SIZE        : constant := 104;
   WINDOW_STENCIL_SIZE       : constant := 105;
   WINDOW_DEPTH_SIZE         : constant := 106;
   WINDOW_RED_SIZE           : constant := 107;
   WINDOW_GREEN_SIZE         : constant := 108;
   WINDOW_BLUE_SIZE          : constant := 109;
   WINDOW_ALPHA_SIZE         : constant := 110;
   WINDOW_ACCUM_RED_SIZE     : constant := 111;
   WINDOW_ACCUM_GREEN_SIZE   : constant := 112;
   WINDOW_ACCUM_BLUE_SIZE    : constant := 113;
   WINDOW_ACCUM_ALPHA_SIZE   : constant := 114;
   WINDOW_DOUBLEBUFFER       : constant := 115;
   WINDOW_RGBA               : constant := 116;
   WINDOW_PARENT             : constant := 117;
   WINDOW_NUM_CHILDREN       : constant := 118;
   WINDOW_COLORMAP_SIZE      : constant := 119;
   WINDOW_NUM_SAMPLES        : constant := 120;
   WINDOW_STEREO             : constant := 121;
   WINDOW_CURSOR             : constant := 122;
   SCREEN_WIDTH              : constant := 200;
   SCREEN_HEIGHT             : constant := 201;
   SCREEN_WIDTH_MM           : constant := 202;
   SCREEN_HEIGHT_MM          : constant := 203;
   MENU_NUM_ITEMS            : constant := 300;
   DISPLAY_MODE_POSSIBLE     : constant := 400;
   INIT_WINDOW_X             : constant := 500;
   INIT_WINDOW_Y             : constant := 501;
   INIT_WINDOW_WIDTH         : constant := 502;
   INIT_WINDOW_HEIGHT        : constant := 503;
   INIT_DISPLAY_MODE         : constant := 504;
   ELAPSED_TIME              : constant := 700;

   --  glutDeviceGet parameters.

   HAS_KEYBOARD              : constant := 600;
   HAS_MOUSE                 : constant := 601;
   HAS_SPACEBALL             : constant := 602;
   HAS_DIAL_AND_BUTTON_BOX   : constant := 603;
   HAS_TABLET                : constant := 604;
   NUM_MOUSE_BUTTONS         : constant := 605;
   NUM_SPACEBALL_BUTTONS     : constant := 606;
   NUM_BUTTON_BOX_BUTTONS    : constant := 607;
   NUM_DIALS                 : constant := 608;
   NUM_TABLET_BUTTONS        : constant := 609;

   --  glutLayerGet parameters.

   OVERLAY_POSSIBLE          : constant := 800;
   LAYER_IN_USE              : constant := 801;
   HAS_OVERLAY               : constant := 802;
   TRANSPARENT_INDEX         : constant := 803;
   NORMAL_DAMAGED            : constant := 804;
   OVERLAY_DAMAGED           : constant := 805;

   --  glutVideoResizeGet parameters.

   VIDEO_RESIZE_POSSIBLE     : constant := 900;
   VIDEO_RESIZE_IN_USE       : constant := 901;
   VIDEO_RESIZE_X_DELTA      : constant := 902;
   VIDEO_RESIZE_Y_DELTA      : constant := 903;
   VIDEO_RESIZE_WIDTH_DELTA  : constant := 904;
   VIDEO_RESIZE_HEIGHT_DELTA : constant := 905;
   VIDEO_RESIZE_X            : constant := 906;
   VIDEO_RESIZE_Y            : constant := 907;
   VIDEO_RESIZE_WIDTH        : constant := 908;
   VIDEO_RESIZE_HEIGHT       : constant := 909;

   --  UseLayer parameters.

   NORMAL  : constant := 0;
   OVERLAY : constant := 1;

   --  GetModifiers return mask.

   ACTIVE_SHIFT               : constant := 1;
   ACTIVE_CTRL                : constant := 2;
   ACTIVE_ALT                 : constant := 4;

   --  SetCursor parameters.
   --  Basic arrows.

   CURSOR_RIGHT_ARROW         : constant := 0;
   CURSOR_LEFT_ARROW          : constant := 1;

   --  Symbolic cursor shapes.

   CURSOR_INFO                : constant := 2;
   CURSOR_DESTROY             : constant := 3;
   CURSOR_HELP                : constant := 4;
   CURSOR_CYCLE               : constant := 5;
   CURSOR_SPRAY               : constant := 6;
   CURSOR_WAIT                : constant := 7;
   CURSOR_TEXT                : constant := 8;
   CURSOR_CROSSHAIR           : constant := 9;

   --  Directional cursors.

   CURSOR_UP_DOWN             : constant := 10;
   CURSOR_LEFT_RIGHT          : constant := 11;

   --  Sizing cursors.

   CURSOR_TOP_SIDE            : constant := 12;
   CURSOR_BOTTOM_SIDE         : constant := 13;
   CURSOR_LEFT_SIDE           : constant := 14;
   CURSOR_RIGHT_SIDE          : constant := 15;
   CURSOR_TOP_LEFT_CORNER     : constant := 16;
   CURSOR_TOP_RIGHT_CORNER    : constant := 17;
   CURSOR_BOTTOM_RIGHT_CORNER : constant := 18;
   CURSOR_BOTTOM_LEFT_CORNER  : constant := 19;

   --  Inherit from parent window.

   CURSOR_INHERIT             : constant := 100;

   --  Blank cursor.

   CURSOR_NONE                : constant := 101;

   --  Fullscreen crosshair (if available).

   CURSOR_FULL_CROSSHAIR      : constant := 102;

   --  GLUT initialization sub-API.

   procedure Init;

   -- GLUT API Extension macro definitions
   -- behaviour when the user clicks on an "x" to close a window
   --
   ACTION_EXIT                 : constant := 0;
   ACTION_GLUTMAINLOOP_RETURNS : constant := 1;
   ACTION_CONTINUE_EXECUTION   : constant := 2;

   ACTION_ON_WINDOW_CLOSE      : constant := 16#01F9#;



   GLUT_RENDERING_CONTEXT   : constant := 16#01FD#;

   GLUT_CREATE_NEW_CONTEXT  : constant := 0;
   GLUT_USE_CURRENT_CONTEXT : constant := 1;


--------------------------------------------------------------------------------
----   FUNCTIONS	PACKAGE CONTAININT THE GLUT FUNCTIONS.		    ----
--------------------------------------------------------------------------------

    Package Functions is

	---------------
	--  Handlers --
	---------------

	type Glut_SpecialUp	is Not Null Access
	  Procedure ( Key, X, Y   : Types.Integer )
	  with Size => Address_Size;
	type Glut_Joystick	is Not Null Access
	  Procedure ( ButtonMask : Unsigned; X, Y, Z : Types.Integer )
	  with Size => Address_Size;
	type Simple_Handle	is Not Null Access
	  Procedure
	  with Size => Address_Size;
	type Glut_KeyUpFunc	is Not Null Access
	  Procedure (Key : Key_type; X, Y : Types.Integer)
	  with Size => Address_Size;
	type HW_Handle		is Not Null Access
	  Procedure (Width, Height : Types.Integer)
	  with Size => Address_Size;
	type Menu_Handle	is Not Null Access
	  Procedure (P1 : Types.Integer)
	  with Size => Address_Size;
	type Mouse_Handle	is Not Null Access
	  Procedure (Button, State, X, Y : Types.Integer)
	  with Size => Address_Size;
	type Motion_Handle	is Not Null Access
	  Procedure (X, Y : Types.Integer)
	  with Size => Address_Size;
	type State_Handle	is Not Null Access
	  Procedure (State : Types.Integer)
	  with Size => Address_Size;
	type Space_Handler	is Not Null Access
	  Procedure (X, Y, Z : Types.Integer)
	  with Size => Address_Size;
	type Timer_Handler	is Not Null Access
	  Procedure (Value : Types.Integer)
	  with Size => Address_Size;
	type BS_Handler		is Not Null Access
	  Procedure (Button, State : Types.Integer)
	  with Size => Address_Size;
	type Dial_Handle is Not Null Access
	  Procedure (Dial, Value : Types.Integer)
	  with Size => Address_Size;
	type Menu_Status_Handle is Not Null Access
	  Procedure (Status, X, Y : Types.Integer)
	  with Size => Address_Size;
	type Keyboard_Handle	is Not Null Access
	  Procedure (Key : Key_type; X, Y : Types.Integer)
	  with Size => Address_Size;

	-- Functions for conversion from handle to address.
	Function Convert ( Handle : Glut_SpecialUp	) Return System.Address;
	Function Convert ( Handle : Glut_Joystick	) Return System.Address;
	Function Convert ( Handle : Simple_Handle	) Return System.Address;
	Function Convert ( Handle : Glut_KeyUpFunc	) Return System.Address;
	Function Convert ( Handle : HW_Handle		) Return System.Address;
	Function Convert ( Handle : Menu_Handle		) Return System.Address;
	Function Convert ( Handle : Mouse_Handle	) Return System.Address;
	Function Convert ( Handle : Motion_Handle	) Return System.Address;
	Function Convert ( Handle : State_Handle	) Return System.Address;
	Function Convert ( Handle : Space_Handler	) Return System.Address;
	Function Convert ( Handle : Timer_Handler	) Return System.Address;
	Function Convert ( Handle : BS_Handler		) Return System.Address;
	Function Convert ( Handle : Dial_Handle		) Return System.Address;
	Function Convert ( Handle : Menu_Status_Handle	) Return System.Address;
	Function Convert ( Handle : Keyboard_Handle	) Return System.Address;

	--  Functions for conversion from address to handle.
	Function Convert ( Address : System.Address ) Return Glut_SpecialUp;
	Function Convert ( Address : System.Address ) Return Glut_Joystick;
	Function Convert ( Address : System.Address ) Return Simple_Handle;
	Function Convert ( Address : System.Address ) Return Glut_KeyUpFunc;
	Function Convert ( Address : System.Address ) Return HW_Handle;
	Function Convert ( Address : System.Address ) Return Menu_Handle;
	Function Convert ( Address : System.Address ) Return Mouse_Handle;
	Function Convert ( Address : System.Address ) Return Motion_Handle;
	Function Convert ( Address : System.Address ) Return State_Handle;
	Function Convert ( Address : System.Address ) Return Space_Handler;
	Function Convert ( Address : System.Address ) Return Timer_Handler;
	Function Convert ( Address : System.Address ) Return BS_Handler;
	Function Convert ( Address : System.Address ) Return Dial_Handle;
	Function Convert ( Address : System.Address ) Return Menu_Status_Handle;
	Function Convert ( Address : System.Address ) Return Keyboard_Handle;

	Pragma Inline( Convert );

--  	procedure Set_Option (option_flag, value : Types.Integer)
--  	with Import, Convention => StdCall, External_Name => "glutSetOption";

	procedure Set_Option (option_flag, value : Types.Integer);

	procedure Init_Display_Mode (Mode : Unsigned);

	procedure Init_Display_String (Name : String);

	procedure Init_Window_Position (X, Y : Types.Integer);

	procedure Init_Window_Size (Width, Height : Types.Integer);

	procedure Main_Loop;

	procedure Leave_Main_Loop;

	procedure Main_Loop_Event;

	----------------------
	--  GLUT WINDOWING  --
	----------------------

	function Create_Window (Title : String) return Types.Integer;

	function Create_SubWindow(	Win, X, Y,
					Width, Height : Types.Integer )
		return Types.Integer;

	procedure Destroy_Window (Win : Types.Integer);

	procedure Post_Redisplay;

	procedure Post_Window_Redisplay (Win : Types.Integer);

	procedure Swap_Buffers;

	function Get_Window return Types.Integer;

	function Get_Window_Data return system.Address;

	procedure Set_Window (Win : Types.Integer);

	procedure Set_Window_Data (Data : system.Address);

	procedure Set_Window_Title (Title : String);

	procedure Set_Icon_Title (Title : String);

	procedure Position_Window (X, Y : Types.Integer);

	procedure Reshape_Window (Width, Height : Types.Integer);

	procedure Pop_Window;

	procedure Push_Window;

	procedure Iconify_Window;

	procedure Show_Window;

	procedure Hide_Window;

	procedure Full_Screen;

	procedure Set_Cursor (Cursor : Types.Integer);

	procedure Warp_Pointer (X, Y : Types.Integer);

	procedure Special_Up_Function (Func : Glut_SpecialUp);

	procedure Joystick_Function (	Funct		: Glut_Joystick;
					PollInterval	: Types.Integer);

	----------------
	--  OVERLAYS  --
	----------------

	procedure Establish_Overlay;

	procedure Remove_Overlay;

	procedure Use_Layer (Layer : Enum);

	procedure Post_Overlay_Redisplay;

	procedure Post_Window_Overlay_Redisplay (Win : Types.Integer);

	procedure Show_Overlay;

	procedure Hide_Overlay;

	-------------
	--  MENUS  --
	-------------

	function Create_Menu (P1 : Menu_Handle) return Types.Integer;

	procedure Destroy_Menu (Menu : Types.Integer);

	function Get_Menu return Types.Integer;

	procedure Set_Menu (Menu : Types.Integer);

	procedure Add_Menu_Entry (Label : String; Value : Types.Integer);

	procedure Add_SubMenu (Label : String; Submenu : Types.Integer);

	procedure Change_To_Menu_Entry(	Item  : Types.Integer;
					Label : String;
					Value : Types.Integer);

	procedure Change_To_SubMenu (	Item    : Types.Integer;
					Label   : String;
					Submenu : Types.Integer);

	procedure Remove_Menu_Item (Item : Types.Integer);

	procedure Attach_Menu (Button : Types.Integer);

	procedure Detach_Menu (Button : Types.Integer);

	-----------------
	--  CALLBACKS  --
	-----------------

	procedure Close_Function (Callback : Simple_Handle);

	procedure Display_Function (P1 : Simple_Handle);

	procedure Reshape_Function (P1 : HW_Handle);

	procedure Keyboard_Function (P1 : Keyboard_Handle);

	procedure Keyboard_Up_Function (P1 : Glut_KeyUpFunc);

	procedure Mouse_Function (P1 : Mouse_Handle);

	procedure Motion_Funcction (P1 : Motion_Handle);

	procedure Passive_Motion_Function (P1 : Motion_Handle);

	procedure Entry_Function (P1 : State_Handle);

	procedure Visibility_Function (P1 : State_Handle);

	procedure Idle_Function (P1 : Simple_Handle);

	procedure Timer_Function (	Millis : Unsigned;
					P2     : Timer_Handler;
					Value  : Types.Integer);

	procedure Menu_State_Function (P1 : State_Handle);

	procedure Special_Function (P1 : Glut_SpecialUp);

	procedure Spaceball_Motion_Function (P1 : Space_Handler);

	procedure Spaceball_Rotate_Function (P1 : Space_Handler);

	procedure Spaceball_Button_Function (P1 : BS_Handler);

	procedure Button_Box_Function (P1 : BS_Handler);

	procedure Dials_Function (P1 : Dial_Handle);

	procedure Tablet_Motion_Function (P1 : Motion_Handle);

	procedure Tablet_Button_Function (P1 : Mouse_Handle);

	procedure Menu_Status_Function (P1 : Menu_Status_Handle);

	procedure Overlay_Display_Function (P1 : Simple_Handle);

	procedure Window_Status_Function (P1 : State_Handle);

	-------------
	--  COLOR  --
	-------------

	procedure Set_Color (	P1		 : Types.Integer;
				Red, Green, Blue : Types.Float);

	function Get_Color (Ndx, Component : Types.Integer) return Types.Float;

	procedure Copy_Colormap (Win : Types.Integer);

	----------------------
	--  STATE RETRIEVAL --
	----------------------

	function Get (Type_Id : Enum) return Types.Integer;

	function Device_Get (Type_Id : Enum) return Types.Integer;

	------------------
	--  EXTENSIONS  --
	------------------

	function Extension_Supported (Name : String) return Types.Integer;

	function Get_Modifiers return Types.Integer;

	function Layer_Get (Type_Id : Enum) return Types.Integer;

	------------
	--  FONT  --
	------------

	procedure Bitmap_Character (	Font      : System.Address;
					Character : Types.Integer);

	function Bitmap_Width (	Font      : System.Address;
				Character : Types.Integer)
		return Types.Integer;

	procedure Stroke_Character (	Font      : System.Address;
					Character : Types.Integer);

	function Stroke_Width (	Font      : System.Address;
				Character : Types.Integer)
		return Types.Integer;

	function Stroke_Length ( Font : System.Address;
				 Text : String)
		return Types.Integer;

	function Bitmap_Length(	Font	: System.Address;
				Text	: String)
		return Types.Integer;

	-------------------
	--  GLUT MODELS  --
	-------------------

	procedure Wire_Sphere (	Radius		: Types.Double;
				Slices, Stacks	: Types.Integer);

	procedure Solid_Sphere(	Radius		: Types.Double;
				Slices, Stacks	: Types.Integer);

	procedure Wire_Cone (	Base, Height	: Types.Double;
				Slices, Stacks	: Types.Integer);

	procedure Solid_Cone (	Base, Height	: Types.Double;
				Slices, Stacks	: Types.Integer);

	procedure Wire_Cube (Size : Types.Double);

	procedure Solid_Cube (Size : Types.Double);

	procedure Wire_Torus (	InnerRadius, OuterRadius : Types.Double;
				Sides, Rings		 : Types.Integer);

	procedure Solid_Torus (	InnerRadius, OuterRadius : Types.Double;
				Sides, Rings		 : Types.Integer);

	procedure Wire_Dodecahedron;

	procedure Solid_Dodecahedron;

	procedure Wire_Teapot (Size : Types.Double);

	procedure Solid_Teapot (Size : Types.Double);

	procedure Wire_Octahedron;

	procedure Solid_Octahedron;

	procedure Wire_Tetrahedron;

	procedure Solid_Tetrahedron;

	procedure Wire_Icosahedron;

	procedure Solid_Icosahedron;

	function Video_Resize_Get (Param : Enum) return Types.Integer;

	procedure Setup_Video_Resizing;

	procedure Stop_Video_Resizing;

	procedure Video_Resize (X, Y, Width, Height : Types.Integer);

	procedure Video_Pan (X, Y, Width, Height : Types.Integer);

	-----------------
	--  DEBUGGING  --
	-----------------

	procedure Report_Errors;

	----------------------
	--  DEVICE CONTROL  --
	----------------------

	procedure Ignore_Key_Repeat (Ignore : Types.Integer);

	procedure Set_Key_Repeat (RepeatMode : Types.Integer);

	procedure Force_Joystick_Function;

	-----------------
	--  GAME MODE  --
	-----------------

	procedure Game_Mode_String (Text : String);

	function Enter_Game_Mode return Types.Integer;

	procedure Leave_Game_Mode;

	function Game_Mode_Get (Mode : Enum) return Types.Integer;

	Procedure Init;

    End Functions;

Private

End TAO_GL.Utility_Toolkit;
