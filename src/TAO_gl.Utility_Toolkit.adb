With
Ada.Command_Line,
Ada.Finalization,
Ada.Unchecked_Conversion,
System.Address_To_Access_Conversions,
Interfaces.C.Strings;

Package Body TAO_GL.Utility_Toolkit is

    SubType Character_Pointer is Interfaces.C.Strings.Chars_Ptr;

    Generic
	Type Access_Type is private;
    Package Internal_Convertor is
	Function Internal_Conversion is New
		Ada.Unchecked_Conversion( Access_Type, System.Address )
		with Inline;
	Function Internal_Conversion is New
		Ada.Unchecked_Conversion( System.Address, Access_Type )
		with Inline;
    End Internal_Convertor;


    Package GLUT is
	use Functions;		-- Handler types are in the Functions package.

	--------------------
	--  GLUT IMPORTS  --
	--------------------

	--	WARNING/NOTE:	The following functions fail to link, therefore
	--			they have been replaced with NULL procedures or
	--			functions returning a meaningless constant; in
 	--			addition to this, the wrapping procedures in
 	--			the Functions package will raise Unimplemented.
	--
	--	UNLINKED:	Set_Option, Leave_Main_Loop, Main_Loop_Event,
	--			Get_Window_Data, and Set_Window_Data.

	procedure Set_Option (option_flag, value : Types.Integer) is null;
--	with Import, Convention => StdCall, External_Name => "_glutSetOption";

	procedure Init_Display_Mode (Mode : Unsigned)
	with Import, Convention => StdCall, External_Name => "glutInitDisplayMode";

	procedure Init_Display_String (String : Character_Pointer)
	with Import, Convention => StdCall, External_Name => "glutInitDisplayString";

	procedure Init_Window_Position (X, Y : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutInitWindowPosition";

	procedure Init_Window_Size (Width, Height : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutInitWindowSize";

	procedure Main_Loop
	with Import, Convention => StdCall, External_Name => "glutMainLoop";

	procedure Leave_Main_Loop is null;
--	with Import, Convention => StdCall, External_Name => "glutLeaveMainLoop";

	procedure Main_Loop_Event is null;
--	with Import, Convention => StdCall, External_Name => "glutMainLoopEvent";

	function Create_Window(Title : Character_Pointer)
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutCreateWindow";

	function Create_SubWindow(	Win, X, Y,
					Width, Height : Types.Integer )
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutCreateSubWindow";

	procedure Destroy_Window (Win : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutDestroyWindow";

	procedure Post_Redisplay
	with Import, Convention => StdCall, External_Name => "glutPostRedisplay";

	procedure Post_Window_Redisplay (Win : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutPostWindowRedisplay";

	procedure Swap_Buffers
	with Import, Convention => StdCall, External_Name => "glutSwapBuffers";

	function Get_Window return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutGetWindow";

	function Get_Window_Data return system.Address is ( Get_Window_Data'Address );
--	with Import, Convention => StdCall, External_Name => "glutGetWindowData";

	procedure Set_Window (Win : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSetWindow";

	procedure Set_Window_Data (Data : system.Address) is null;
--	with Import, Convention => StdCall, External_Name => "glutSetWindowData";

	procedure Set_Window_Title (Title : Character_Pointer)
	with Import, Convention => StdCall, External_Name => "glutSetWindowTitle";

	procedure Set_Icon_Title (Title : Character_Pointer)
	with Import, Convention => StdCall, External_Name => "glutSetIconTitle";

	procedure Position_Window (X, Y : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutPositionWindow";

	procedure Reshape_Window (Width, Height : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutReshapeWindow";

	procedure Pop_Window
	with Import, Convention => StdCall, External_Name => "glutPopWindow";

	procedure Push_Window
	with Import, Convention => StdCall, External_Name => "glutPushWindow";

	procedure Iconify_Window
	with Import, Convention => StdCall, External_Name => "glutIconifyWindow";

	procedure Show_Window
	with Import, Convention => StdCall, External_Name => "glutShowWindow";

	procedure Hide_Window
	with Import, Convention => StdCall, External_Name => "glutHideWindow";

	procedure Full_Screen
	with Import, Convention => StdCall, External_Name => "glutFullScreen";

	procedure Set_Cursor (Cursor : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSetCursor";

	procedure Warp_Pointer (X : Types.Integer; Y : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutWarpPointer";

	procedure Special_Up_Function (Func : GLUT_SpecialUp)
	with Import, Convention => StdCall, External_Name => "glutSpecialUpFunc";

	procedure Joystick_Function (	Funct : GLUT_Joystick;
						PollInterval : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutJoystickFunc";

	procedure Establish_Overlay
	with Import, Convention => StdCall, External_Name => "glutEstablishOverlay";

	procedure Remove_Overlay
	with Import, Convention => StdCall, External_Name => "glutRemoveOverlay";

	procedure Use_Layer (Layer : enum)
	with Import, Convention => StdCall, External_Name => "glutUseLayer";

	procedure Post_Overlay_Redisplay
	with Import, Convention => StdCall, External_Name => "glutPostOverlayRedisplay";

	procedure Post_Window_Overlay_Redisplay (Win : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutPostWindowOverlayRedisplay";

	procedure Show_Overlay
	with Import, Convention => StdCall, External_Name => "glutShowOverlay";

	procedure Hide_Overlay
	with Import, Convention => StdCall, External_Name => "glutHideOverlay";

	function Create_Menu (P1 : Menu_Handle) return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutCreateMenu";

	procedure Destroy_Menu (Menu : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutDestroyMenu";

	function Get_Menu return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutGetMenu";

	procedure Set_Menu (Menu : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSetMenu";

	procedure Add_Menu_Entry (	Label : Character_Pointer;
					Value : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutAddMenuEntry";

	procedure Add_SubMenu (	Label   : Character_Pointer;
					Submenu : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutAddSubMenu";

	procedure Change_To_Menu_Entry(	Item  : Types.Integer;
						Label : Character_Pointer;
						Value : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutChangeToMenuEntry";

	procedure Change_To_SubMenu (	Item    : Types.Integer;
						Label   : Character_Pointer;
						Submenu : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutChangeToSubMenu";

	procedure Remove_Menu_Item (Item : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutRemoveMenuItem";

	procedure Attach_Menu (Button : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutAttachMenu";

	procedure Detach_Menu (Button : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutDetachMenu";

	procedure Close_Function (Callback : Simple_Handle) is null;
--	with Import, Convention => StdCall, External_Name => "glutCloseFunc";

	procedure Display_Function (P1 : Simple_Handle)
	with Import, Convention => StdCall, External_Name => "glutDisplayFunc";

	procedure Reshape_Function (P1 : HW_Handle)
	with Import, Convention => StdCall, External_Name => "glutReshapeFunc";

	procedure Keyboard_Function (P1 : Keyboard_Handle)
	with Import, Convention => StdCall, External_Name => "glutKeyboardFunc";

	procedure Keyboard_Up_Function (P1 : GLUT_KeyUpFunc)
	with Import, Convention => StdCall, External_Name => "glutKeyboardUpFunc";

	procedure Mouse_Function (P1 : Mouse_Handle)
	with Import, Convention => StdCall, External_Name => "glutMouseFunc";

	procedure Motion_Funcction (P1 : Motion_Handle)
	with Import, Convention => StdCall, External_Name => "glutMotionFunc";

	procedure Passive_Motion_Function (P1 : Motion_Handle)
	with Import, Convention => StdCall, External_Name => "glutPassiveMotionFunc";

	procedure Entry_Function (P1 : State_Handle)
	with Import, Convention => StdCall, External_Name => "glutEntryFunc";

	procedure Visibility_Function (P1 : State_Handle)
	with Import, Convention => StdCall, External_Name => "glutVisibilityFunc";

	procedure Idle_Function (P1 : Simple_Handle)
	with Import, Convention => StdCall, External_Name => "glutIdleFunc";

	procedure Timer_Function (	Millis : Unsigned;
					P2     : Timer_Handler;
					Value  : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutTimerFunc";

	procedure Menu_State_Function (P1 : State_Handle)
	with Import, Convention => StdCall, External_Name => "glutMenuStateFunc";

	procedure Special_Function (P1 : GLUT_SpecialUp)
	with Import, Convention => StdCall, External_Name => "glutSpecialFunc";

	procedure Spaceball_Motion_Function (P1 : Space_Handler)
	with Import, Convention => StdCall, External_Name => "glutSpaceballMotionFunc";

	procedure Spaceball_Rotate_Function (P1 : Space_Handler)
	with Import, Convention => StdCall, External_Name => "glutSpaceballRotateFunc";

	procedure Spaceball_Button_Function (P1 : BS_Handler)
	with Import, Convention => StdCall, External_Name => "glutSpaceballButtonFunc";

	procedure Button_Box_Function (P1 : BS_Handler)
	with Import, Convention => StdCall, External_Name => "glutButtonBoxFunc";

	procedure Dials_Function (P1 : Dial_Handle)
	with Import, Convention => StdCall, External_Name => "glutDialsFunc";

	procedure Tablet_Motion_Function (P1 : Motion_Handle)
	with Import, Convention => StdCall, External_Name => "glutTabletMotionFunc";

	procedure Tablet_Button_Function (P1 : Mouse_Handle)
	with Import, Convention => StdCall, External_Name => "glutTabletButtonFunc";

	procedure Menu_Status_Function (P1 : Menu_Status_Handle)
	with Import, Convention => StdCall, External_Name => "glutMenuStatusFunc";

	procedure Overlay_Display_Function (P1 : Simple_Handle)
	with Import, Convention => StdCall, External_Name => "glutOverlayDisplayFunc";

	procedure Window_Status_Function (P1 : State_Handle)
	with Import, Convention => StdCall, External_Name => "glutWindowStatusFunc";

	procedure Set_Color (	P1		 : Types.Integer;
					Red, Green, Blue : Types.Float)
	with Import, Convention => StdCall, External_Name => "glutSetColor";

	function Get_Color ( Ndx, Component : Types.Integer )
		return Types.Float
	with Import, Convention => StdCall, External_Name => "glutGetColor";

	procedure Copy_Colormap (Win : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutCopyColormap";

	function Get (Type_Id : Enum) return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutGet";

	function Device_Get (Type_Id : Enum) return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutDeviceGet";

	function Extension_Supported (Name : Character_Pointer)
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutExtensionSupported";

	function Get_Modifiers return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutGetModifiers";

	function Layer_Get (Type_Id : Enum) return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutLayerGet";

	procedure Bitmap_Character (	Font      : System.Address;
						Character : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutBitmapCharacter";

	function Bitmap_Width (	Font      : System.Address;
					Character : Types.Integer)
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutBitmapWidth";

	procedure Stroke_Character (	Font      : System.Address;
						Character : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutStrokeCharacter";

	function Stroke_Width (	Font      : System.Address;
					Character : Types.Integer)
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutStrokeWidth";

	function Stroke_Length ( Font   : System.Address;
				 String : Character_Pointer)
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutStrokeLength";

	function Bitmap_Length(	Font	: System.Address;
					String	: Character_Pointer)
		return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutBitmapLength";

	procedure Wire_Sphere (	Radius		: Types.Double;
					Slices, Stacks	: Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutWireSphere";

	procedure Solid_Sphere(	Radius		: Types.Double;
					Slices, Stacks	: Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSolidSphere";

	procedure Wire_Cone (	Base, Height	: Types.Double;
					Slices, Stacks	: Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutWireCone";

	procedure Solid_Cone (	Base, Height	: Types.Double;
					Slices, Stacks	: Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSolidCone";

	procedure Wire_Cube (Size : Types.Double)
	with Import, Convention => StdCall, External_Name => "glutWireCube";

	procedure Solid_Cube (Size : Types.Double)
	with Import, Convention => StdCall, External_Name => "glutSolidCube";

	procedure Wire_Torus (	InnerRadius, OuterRadius: Types.Double;
					Sides, Rings		: Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutWireTorus";

	procedure Solid_Torus (	InnerRadius, OuterRadius: Types.Double;
					Sides, Rings		: Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSolidTorus";

	procedure Wire_Dodecahedron
	with Import, Convention => StdCall, External_Name => "glutWireDodecahedron";

	procedure Solid_Dodecahedron
	with Import, Convention => StdCall, External_Name => "glutSolidDodecahedron";

	procedure Wire_Teapot (Size : Types.Double)
	with Import, Convention => StdCall, External_Name => "glutWireTeapot";

	procedure Solid_Teapot (Size : Types.Double)
	with Import, Convention => StdCall, External_Name => "glutSolidTeapot";

	procedure Wire_Octahedron
	with Import, Convention => StdCall, External_Name => "glutWireOctahedron";

	procedure Solid_Octahedron
	with Import, Convention => StdCall, External_Name => "glutSolidOctahedron";

	procedure Wire_Tetrahedron
	with Import, Convention => StdCall, External_Name => "glutWireTetrahedron";

	procedure Solid_Tetrahedron
	with Import, Convention => StdCall, External_Name => "glutSolidTetrahedron";

	procedure Wire_Icosahedron
	with Import, Convention => StdCall, External_Name => "glutWireIcosahedron";

	procedure Solid_Icosahedron
	with Import, Convention => StdCall, External_Name => "glutSolidIcosahedron";

	function Video_Resize_Get (Param : Enum) return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutVideoResizeGet";

	procedure Setup_Video_Resizing
	with Import, Convention => StdCall, External_Name => "glutSetupVideoResizing";

	procedure Stop_Video_Resizing
	with Import, Convention => StdCall, External_Name => "glutStopVideoResizing";

	procedure Video_Resize (X, Y, Width, Height : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutVideoResize";

	procedure Video_Pan (X, Y, Width, Height : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutVideoPan";

	procedure Report_Errors
	with Import, Convention => StdCall, External_Name => "glutReportErrors";

	procedure Ignore_Key_Repeat (Ignore : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutIgnoreKeyRepeat";

	procedure Set_Key_Repeat (RepeatMode : Types.Integer)
	with Import, Convention => StdCall, External_Name => "glutSetKeyRepeat";

	procedure Force_Joystick_Function
	with Import, Convention => StdCall, External_Name => "glutForceJoystickFunc";

	procedure Game_Mode_String (String : Character_Pointer)
	with Import, Convention => StdCall, External_Name => "glutGameModeString";

	function Enter_Game_Mode return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutEnterGameMode";

	procedure Leave_Game_Mode
	with Import, Convention => StdCall, External_Name => "glutLeaveGameMode";

	function Game_Mode_Get (Mode : Enum) return Types.Integer
	with Import, Convention => StdCall, External_Name => "glutGameModeGet";

    End GLUT;

    Package Body Functions is

	--------------------------
	--  HANDLE CONVERSIONS  --
	--------------------------

	Package H_01 is new Internal_Convertor( GLUT_SpecialUp		);
	Package H_02 is new Internal_Convertor( GLUT_Joystick		);
	Package H_03 is new Internal_Convertor( Simple_Handle		);
	Package H_04 is new Internal_Convertor( GLUT_KeyUpFunc		);
	Package H_05 is new Internal_Convertor( HW_Handle		);
	Package H_06 is new Internal_Convertor( Menu_Handle		);
	Package H_07 is new Internal_Convertor( Mouse_Handle		);
	Package H_08 is new Internal_Convertor( Motion_Handle		);
	Package H_09 is new Internal_Convertor( State_Handle		);
	Package H_10 is new Internal_Convertor( Space_Handler		);
	Package H_11 is new Internal_Convertor( Timer_Handler		);
	Package H_12 is new Internal_Convertor( BS_Handler		);
	Package H_13 is new Internal_Convertor( Dial_Handle		);
	Package H_14 is new Internal_Convertor( Menu_Status_Handle	);
	Package H_15 is new Internal_Convertor( Keyboard_Handle		);

	Use	H_01,	H_02,	H_03,	H_04,	H_05,	H_06,	H_07,
		H_08,	H_09,	H_10,	H_11,	H_12,	H_13,	H_14,
		H_15;

	Function Convert (Handle : GLUT_SpecialUp) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : GLUT_Joystick) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Simple_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : GLUT_KeyUpFunc) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : HW_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Menu_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Mouse_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Motion_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : State_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Space_Handler) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Timer_Handler) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : BS_Handler) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Dial_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Menu_Status_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );
	Function Convert (Handle : Keyboard_Handle) Return System.Address is
	  ( Internal_Conversion(Handle) );

	Function Convert (Address : System.Address) Return GLUT_SpecialUp is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return GLUT_Joystick is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Simple_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return GLUT_KeyUpFunc is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return HW_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Menu_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Mouse_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Motion_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return State_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Space_Handler is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Timer_Handler is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return BS_Handler is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Dial_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Menu_Status_Handle is
	  ( Internal_Conversion(Address) );
	Function Convert (Address : System.Address) Return Keyboard_Handle is
	  ( Internal_Conversion(Address) );


	------------------------------
	--  PUBLIC FUNCTION BODIES  --
	------------------------------

	procedure Set_Option  (option_flag, value : Types.Integer) is
	begin
	    GLUT.Set_Option(option_flag => option_flag, value => value );
	    raise unimplemented;
	end Set_Option;

	procedure Init_Display_Mode (Mode : Unsigned) is
	begin
	    GLUT.Init_Display_Mode(Mode => Mode);
	end Init_Display_Mode;

	procedure Init_Display_String (Name : String) is
	    C_Name : Character_Pointer := Interfaces.C.Strings.New_String (Name);
	begin
	    GLUT.Init_Display_String (C_Name);
	    Interfaces.C.Strings.Free (C_Name);
	end Init_Display_String;

	procedure Init_Window_Position (X, Y : Types.Integer) is
	begin
	    GLUT.Init_Window_Position( X => X, Y => Y );
	end Init_Window_Position;

	procedure Init_Window_Size (Width, Height : Types.Integer) is
	begin
	    GLUT.Init_Window_Size(Width  => Width, Height => Height);
	end Init_Window_Size;

	procedure Main_Loop is
	begin
	    GLUT.Main_Loop;
	end Main_Loop;

	procedure Leave_Main_Loop is
	begin
	    GLUT.Leave_Main_Loop;
	    raise unimplemented;
	end Leave_Main_Loop;

	procedure Main_Loop_Event is
	begin
	    GLUT.Main_Loop_Event;
	    raise unimplemented;
	end Main_Loop_Event;

	function Create_Window (Title : String) return Types.Integer is
	    C_Title : Character_Pointer := Interfaces.C.Strings.New_String (Title);
	begin
	    Return Result : Types.Integer:= GLUT.Create_Window(C_Title) do
		Interfaces.C.Strings.Free (C_Title);
	    End Return;
	end Create_Window;

	function Create_SubWindow(	Win, X, Y,
					Width, Height : Types.Integer )
				return Types.Integer is
	begin
	    Return GLUT.Create_SubWindow(
				  Win    => Win,
				  X      => X,
				  Y      => Y,
				  Width  => Width,
				  Height => Height
				 );
	end Create_SubWindow;

	procedure Destroy_Window (Win : Types.Integer) is
	begin
	    GLUT.Destroy_Window(Win => Win);
	end Destroy_Window;

	procedure Post_Redisplay is
	begin
	    GLUT.Post_Redisplay;
	end Post_Redisplay;

	procedure Post_Window_Redisplay (Win : Types.Integer) is
	begin
	    GLUT.Post_Window_Redisplay(Win => Win);
	end Post_Window_Redisplay;

	procedure Swap_Buffers is
	begin
	    GLUT.Swap_Buffers;
	end Swap_Buffers;

	function Get_Window return Types.Integer is
	begin
	    Return GLUT.Get_Window;
	end Get_Window;

	function Get_Window_Data return system.Address is
	begin
	    raise unimplemented;
	    Return GLUT.Get_Window_Data;
	end Get_Window_Data;

	procedure Set_Window (Win : Types.Integer) is
	begin
	    GLUT.Set_Window( Win => Win );
	end Set_Window;

	procedure Set_Window_Data (Data : system.Address) is
	begin
	    GLUT.Set_Window_Data( Data => Data );
	    raise unimplemented;
	end Set_Window_Data;

	procedure Set_Window_Title (Title : String) is
	    C_Title : Character_Pointer := Interfaces.C.Strings.New_String (Title);
	begin
	    GLUT.Set_Window_Title( Title => C_Title );
	    Interfaces.C.Strings.Free (C_Title);
	end Set_Window_Title;

	procedure Set_Icon_Title (Title : String) is
	     C_Title : Character_Pointer := Interfaces.C.Strings.New_String (Title);
	begin
	    GLUT.Set_Icon_Title(Title => C_Title);
	    Interfaces.C.Strings.Free (C_Title);
	end Set_Icon_Title;

	procedure Position_Window (X, Y : Types.Integer) is
	begin
	    GLUT.Position_Window(
			X => X,
			Y => Y
		);
	end Position_Window;

	procedure Reshape_Window (Width, Height : Types.Integer) is
	begin
	    GLUT.Reshape_Window(
			Width  => Width,
			Height => Height
		);
	end Reshape_Window;

	procedure Pop_Window is
	begin
	    GLUT.Pop_Window;
	end Pop_Window;

	procedure Push_Window is
	begin
	    GLUT.Push_Window;
	end Push_Window;

	procedure Iconify_Window is
	begin
	    GLUT.Iconify_Window;
	end Iconify_Window;

	procedure Show_Window is
	begin
	    GLUT.Show_Window;
	end Show_Window;

	procedure Hide_Window is
	begin
	    GLUT.Hide_Window;
	end Hide_Window;

	procedure Full_Screen is
	begin
	    GLUT.Full_Screen;
	end Full_Screen;

	procedure Set_Cursor(Cursor : Types.Integer) is
	begin
	    GLUT.Set_Cursor(Cursor => Cursor);
	end Set_Cursor;

	procedure Warp_Pointer(X, Y : Types.Integer) is
	begin
	    GLUT.Warp_Pointer(
			X => X,
			Y => Y
		);
	end Warp_Pointer;

	procedure Special_Up_Function (Func : GLUT_SpecialUp) is
	begin
	    GLUT.Special_Up_Function(Func => Func);
	end Special_Up_Function;

	procedure Joystick_Function (	Funct		: GLUT_Joystick;
					PollInterval	: Types.Integer) is
	begin
	    GLUT.Joystick_Function(
			Funct		=> Funct,
			PollInterval	=> PollInterval
		);
	end Joystick_Function;

	procedure Establish_Overlay is
	begin
	    GLUT.Establish_Overlay;
	end Establish_Overlay;

	procedure Remove_Overlay is
	begin
	    GLUT.Remove_Overlay;
	end Remove_Overlay;

	procedure Use_Layer (Layer : Enum) is
	begin
	    GLUT.Use_Layer(Layer => Layer);
	end Use_Layer;

	procedure Post_Overlay_Redisplay is
	begin
	    GLUT.Post_Overlay_Redisplay;
	end Post_Overlay_Redisplay;

	procedure Post_Window_Overlay_Redisplay (Win : Types.Integer) is
	begin
	    GLUT.Post_Window_Overlay_Redisplay(Win => Win);
	end Post_Window_Overlay_Redisplay;

	procedure Show_Overlay is
	begin
	    GLUT.Show_Overlay;
	end Show_Overlay;

	procedure Hide_Overlay is
	begin
	    GLUT.Hide_Overlay;
	end Hide_Overlay;

	function Create_Menu (P1 : Menu_Handle) return Types.Integer is
	begin
	    Return GLUT.Create_Menu(P1 => P1);
	end Create_Menu;

	procedure Destroy_Menu (Menu : Types.Integer) is
	begin
	    GLUT.Destroy_Menu(Menu => Menu);
	end Destroy_Menu;

	function Get_Menu return Types.Integer is
	begin
	    Return GLUT.Get_Menu;
	end Get_Menu;

	procedure Set_Menu (Menu : Types.Integer) is
	begin
	    GLUT.Set_Menu(Menu => Menu);
	end Set_Menu;

	procedure Add_Menu_Entry (Label : String; Value : Types.Integer) is
	    C_Label : Character_Pointer := Interfaces.C.Strings.New_String (Label);
	begin
	    GLUT.Add_Menu_Entry(
			Label => C_Label,
			Value => Value
		);
	    Interfaces.C.Strings.Free (C_Label);
	end Add_Menu_Entry;

	procedure Add_SubMenu (Label : String; Submenu : Types.Integer) is
	    C_Label : Character_Pointer := Interfaces.C.Strings.New_String (Label);
	begin
	    GLUT.Add_SubMenu(
			Label   => C_Label,
			Submenu => Submenu
		);
	    Interfaces.C.Strings.Free (C_Label);
	end Add_SubMenu;

	procedure Change_To_Menu_Entry(	Item  : Types.Integer;
					Label : String;
					Value : Types.Integer) is
	    C_Label : Character_Pointer := Interfaces.C.Strings.New_String (Label);
	begin
	    GLUT.Change_To_Menu_Entry(
			Item  => Item,
			Label => C_Label,
			Value => Value
		);
	    Interfaces.C.Strings.Free (C_Label);
	end Change_To_Menu_Entry;

	procedure Change_To_SubMenu (	Item    : Types.Integer;
					Label   : String;
					Submenu : Types.Integer) is
	    C_Label : Character_Pointer := Interfaces.C.Strings.New_String (Label);
	begin
	    GLUT.Change_To_SubMenu(
			Item	=> Item,
			Label	=> C_Label,
			Submenu	=> Submenu
		);
	    Interfaces.C.Strings.Free (C_Label);
	End Change_To_SubMenu;

	procedure Remove_Menu_Item (Item : Types.Integer) is
	begin
	    GLUT.Remove_Menu_Item(Item => Item);
	end Remove_Menu_Item;

	procedure Attach_Menu (Button : Types.Integer) is
	begin
	    GLUT.Attach_Menu(Button => Button);
	end Attach_Menu;

	procedure Detach_Menu (Button : Types.Integer) is
	begin
	    GLUT.Detach_Menu(Button => Button);
	end Detach_Menu;

	procedure Close_Function (Callback : Simple_Handle) is
	begin
	    GLUT.Close_Function(Callback => Callback);
	end Close_Function;

	procedure Display_Function (P1 : Simple_Handle) is
	begin
	    GLUT.Display_Function(P1 => P1);
	end Display_Function;

	procedure Reshape_Function (P1 : HW_Handle) is
	begin
	    GLUT.Reshape_Function(P1 => P1);
	end Reshape_Function;

	procedure Keyboard_Function (P1 : Keyboard_Handle) is
	begin
	    GLUT.Keyboard_Function(P1 => P1);
	end Keyboard_Function;

	procedure Keyboard_Up_Function (P1 : GLUT_KeyUpFunc) is
	begin
	    GLUT.Keyboard_Up_Function(P1 => P1);
	end Keyboard_Up_Function;

	procedure Mouse_Function (P1 : Mouse_Handle) is
	begin
	    GLUT.Mouse_Function(P1 => P1);
	end Mouse_Function;

	procedure Motion_Funcction (P1 : Motion_Handle) is
	begin
	    GLUT.Motion_Funcction(P1 => P1);
	end Motion_Funcction;

	procedure Passive_Motion_Function (P1 : Motion_Handle) is
	begin
	    GLUT.Passive_Motion_Function(P1 => P1);
	end Passive_Motion_Function;

	procedure Entry_Function (P1 : State_Handle) is
	begin
	    GLUT.Entry_Function(P1 => P1);
	end Entry_Function;

	procedure Visibility_Function (P1 : State_Handle) is
	begin
	    GLUT.Visibility_Function(P1 => P1);
	end Visibility_Function;

	procedure Idle_Function (P1 : Simple_Handle) is
	begin
	    GLUT.Idle_Function(P1 => P1);
	end Idle_Function;

	procedure Timer_Function (	Millis : Unsigned;
					P2     : Timer_Handler;
					Value  : Types.Integer) is
	begin
	    GLUT.Timer_Function(
			Millis => Millis,
			P2     => P2,
			Value  => Value
		);
	end Timer_Function;

	procedure Menu_State_Function (P1 : State_Handle) is
	begin
	    GLUT.Menu_State_Function(P1 => P1);
	end Menu_State_Function;

	procedure Special_Function (P1 : GLUT_SpecialUp) is
	begin
	    GLUT.Special_Function(P1 => P1);
	end Special_Function;

	procedure Spaceball_Motion_Function (P1 : Space_Handler) is
	begin
	    GLUT.Spaceball_Motion_Function(P1 => P1);
	end Spaceball_Motion_Function;

	procedure Spaceball_Rotate_Function (P1 : Space_Handler) is
	begin
	    GLUT.Spaceball_Rotate_Function(P1 => P1);
	end Spaceball_Rotate_Function;

	procedure Spaceball_Button_Function (P1 : BS_Handler) is
	begin
	    GLUT.Spaceball_Button_Function(P1 => P1);
	end Spaceball_button_Function;

	procedure Button_Box_Function (P1 : BS_Handler) is
	begin
	    GLUT.Button_Box_Function(P1 => P1);
	end Button_Box_Function;

	procedure Dials_Function (P1 : Dial_Handle) is
	begin
	    GLUT.Dials_Function(P1 => P1);
	end Dials_Function;

	procedure Tablet_Motion_Function (P1 : Motion_Handle) is
	begin
	    GLUT.Tablet_Motion_Function( P1 => P1 );
	end Tablet_Motion_Function;

	procedure Tablet_Button_Function (P1 : Mouse_Handle) is
	begin
	    GLUT.Tablet_Button_Function(P1 => P1);
	end Tablet_Button_Function;

	procedure Menu_Status_Function (P1 : Menu_Status_Handle) is
	begin
	    GLUT.Menu_Status_Function(P1 => P1);
	end Menu_Status_Function;

	procedure Overlay_Display_Function (P1 : Simple_Handle) is
	begin
	    GLUT.Overlay_Display_Function(P1 => P1);
	end Overlay_Display_Function;

	procedure Window_Status_Function (P1 : State_Handle) is
	begin
	    GLUT.Window_Status_Function(P1 => P1);
	end Window_Status_Function;

	procedure Set_Color (	P1		 : Types.Integer;
				Red, Green, Blue : Types.Float) is
	begin
	    GLUT.Set_Color(
		P1    => P1,
		Red   => Red,
		Green => Green,
		Blue  => Blue
	    );
	end Set_Color;

	function Get_Color(Ndx, Component : Types.Integer) return types.Float is
	begin
	    Return  GLUT.Get_Color(
			Ndx       => Ndx,
			Component => Component
		    );
	end Get_Color;

	procedure Copy_Colormap (Win : Types.Integer) is
	begin
	    GLUT.Copy_Colormap(Win => Win);
	end Copy_Colormap;

	function Get (Type_Id : Enum) return Types.Integer is
	begin
	    Return GLUT.Get(Type_Id => Type_Id);
	end Get;

	function Device_Get (Type_Id : Enum) return Types.Integer is
	begin
	    Return GLUT.Device_Get(Type_Id => Type_Id);
	end Device_Get;

	function Extension_Supported (Name : String) return Types.Integer is
	    C_Name : Character_Pointer := Interfaces.C.Strings.New_String (Name);
	begin
	    Return Result : Types.Integer:= GLUT.Extension_Supported(C_Name) do
		Interfaces.C.Strings.Free (C_Name);
	    End Return;
	end Extension_Supported;

	function Get_Modifiers return Types.Integer is
	begin
	    return GLUT.Get_Modifiers;
	end Get_Modifiers;

	function Layer_Get (Type_Id : Enum) return Types.Integer is
	begin
	    return GLUT.Layer_Get(Type_Id => Type_Id);
	end Layer_Get;


	procedure Bitmap_Character (	Font      : System.Address;
					Character : Types.Integer) is
	begin
	    GLUT.Bitmap_Character(
			Font      => Font,
			Character => Character
		);
	end Bitmap_Character;

	function Bitmap_Width (	Font      : System.Address;
				Character : Types.Integer)
		return Types.Integer is
	begin
	    Return GLUT.Bitmap_Width(
				Font      => Font,
				Character => Character
			);
	end Bitmap_Width;

	procedure Stroke_Character (	Font      : System.Address;
					Character : Types.Integer) is
	begin
	    GLUT.Stroke_Character(
			Font      => Font,
			Character => Character
		);
	end Stroke_Character;

	function Stroke_Width (	Font      : System.Address;
				Character : Types.Integer)
		return Types.Integer is
	begin
	    Return GLUT.Stroke_Width(
				Font      => Font,
				Character => Character
			);
	end Stroke_Width;

	function Stroke_Length ( Font  : System.Address;
				 Text  : String)
		return Types.Integer is
	    C_Text : Character_Pointer:= Interfaces.C.Strings.New_String (Text);
	begin
	    Return Result : Types.Integer:= GLUT.Stroke_Length(
							Font   => Font,
							String => C_Text
						) do
		Interfaces.C.Strings.Free (C_Text);
	    End return;
	end Stroke_Length;

	function Bitmap_Length(	Font	: System.Address;
				Text	: String)
		return Types.Integer is
	    C_Text : Character_Pointer:= Interfaces.C.Strings.New_String (Text);
	begin
	    Return Result : Types.Integer:= GLUT.Bitmap_Length(
							Font   => Font,
							String => C_Text
						) do
		Interfaces.C.Strings.Free (C_Text);
	    End return;
	end Bitmap_Length;

	procedure Wire_Sphere (	Radius		: Types.Double;
				Slices, Stacks	: Types.Integer) is
	begin
	    GLUT.Wire_Sphere(
			Radius => Radius,
			Slices => Slices,
			Stacks => Stacks
		);
	end Wire_Sphere;

	procedure Solid_Sphere(	Radius		: Types.Double;
				Slices, Stacks	: Types.Integer) is
	begin
	    GLUT.Solid_Sphere(
			Radius => Radius,
			Slices => Slices,
			Stacks => Stacks
		);
	end Solid_Sphere;

	procedure Wire_Cone (	Base, Height	: Types.Double;
				Slices, Stacks	: Types.Integer) is
	begin
	    GLUT.Wire_Cone(
			Base   => Base,
			Height => Height,
			Slices => Slices,
			Stacks => Stacks
		);
	end Wire_Cone;

	procedure Solid_Cone (	Base, Height	: Types.Double;
				Slices, Stacks	: Types.Integer) is
	begin
	    GLUT.Solid_Cone(
			Base   => Base,
			Height => Height,
			Slices => Slices,
			Stacks => Stacks
		);
	end Solid_Cone;

	procedure Wire_Cube (Size : Types.Double) is
	begin
	    GLUT.Wire_Cube(Size => Size);
	end Wire_Cube;

	procedure Solid_Cube (Size : Types.Double) is
	begin
	    GLUT.Solid_Cube(Size => Size);
	end Solid_Cube;

	procedure Wire_Torus (	InnerRadius, OuterRadius : Types.Double;
				Sides, Rings		 : Types.Integer) is
	begin
	    GLUT.Wire_Torus(
			InnerRadius => InnerRadius,
			OuterRadius => OuterRadius,
			Sides       => Sides,
			Rings       => Rings
		);
	end Wire_Torus;

	procedure Solid_Torus (	InnerRadius, OuterRadius : Types.Double;
				Sides, Rings		 : Types.Integer) is
	begin
	    GLUT.Solid_Torus(
			InnerRadius => InnerRadius,
			OuterRadius => OuterRadius,
			Sides       => Sides,
			Rings       => Rings
		);
	end Solid_Torus;

	procedure Wire_Dodecahedron is
	begin
	    GLUT.Wire_Dodecahedron;
	end Wire_Dodecahedron;

	procedure Solid_Dodecahedron is
	begin
	    GLUT.Solid_Dodecahedron;
	end Solid_Dodecahedron;

	procedure Wire_Teapot (Size : Types.Double) is
	begin
	    GLUT.Wire_Teapot(Size => Size);
	end Wire_Teapot;

	procedure Solid_Teapot (Size : Types.Double) is
	begin
	    GLUT.Solid_Teapot(Size => Size);
	end Solid_Teapot;

	procedure Wire_Octahedron is
	begin
	    GLUT.Wire_Octahedron;
	end Wire_Octahedron;

	procedure Solid_Octahedron is
	begin
	    GLUT.Solid_Octahedron;
	end Solid_Octahedron;

	procedure Wire_Tetrahedron is
	begin
	    GLUT.Wire_Tetrahedron;
	end Wire_Tetrahedron;

	procedure Solid_Tetrahedron is
	begin
	    GLUT.Solid_Tetrahedron;
	end Solid_Tetrahedron;


	procedure Wire_Icosahedron is
	begin
	    GLUT.Wire_Icosahedron;
	end Wire_Icosahedron;

	procedure Solid_Icosahedron is
	begin
	    GLUT.Solid_Icosahedron;
	end Solid_Icosahedron;

	function Video_Resize_Get (Param : Enum) return Types.Integer is
	begin
	    Return GLUT.Video_Resize_Get(Param => Param);
	end Video_Resize_Get;

	procedure Setup_Video_Resizing is
	begin
	    GLUT.Setup_Video_Resizing;
	end Setup_Video_Resizing;

	procedure Stop_Video_Resizing is
	begin
	    GLUT.Stop_Video_Resizing;
	end Stop_Video_Resizing;

	procedure Video_Resize (X, Y, Width, Height : Types.Integer) is
	begin
	    GLUT.Video_Resize(
			X      => X,
			Y      => Y,
			Width  => Width,
			Height => Height
		);
	end Video_Resize;

	procedure Video_Pan (X, Y, Width, Height : Types.Integer) is
	begin
	    GLUT.Video_Pan(
			X      => X,
			Y      => Y,
			Width  => Width,
			Height => Height
		);
	end Video_Pan;

	procedure Report_Errors is
	begin
	    GLUT.Report_Errors;
	end Report_Errors;

	procedure Ignore_Key_Repeat (Ignore : Types.Integer) is
	begin
	    GLUT.Ignore_Key_Repeat(Ignore => Ignore);
	end Ignore_Key_Repeat;

	procedure Set_Key_Repeat (RepeatMode : Types.Integer) is
	begin
	    GLUT.Set_Key_Repeat(RepeatMode => RepeatMode);
	end Set_Key_Repeat;

	procedure Force_Joystick_Function is
	begin
	    GLUT.Force_Joystick_Function;
	end Force_Joystick_Function;

	procedure Game_Mode_String (Text : String) is
	    C_Text : Character_Pointer := Interfaces.C.Strings.New_String (Text);
	begin
	    GLUT.Game_Mode_String(C_Text);
	    Interfaces.C.Strings.Free (C_Text);
	end Game_Mode_String;

	function Enter_Game_Mode return Types.Integer is
	begin
	    Return GLUT.Enter_Game_Mode;
	end Enter_Game_Mode;

	procedure Leave_Game_Mode is
	begin
	    GLUT.Leave_Game_Mode;
	end Leave_Game_Mode;

	function Game_Mode_Get (Mode : Enum) return Types.Integer is
	begin
	    Return Result : Types.Integer:= GLUT.Game_Mode_Get(Mode => Mode);
	end Game_Mode_Get;

	Procedure init renames TAO_GL.Utility_Toolkit.Init;

    End Functions;

    ---------------------------------------------------------------
    --  Initialization, Command-Line Arguments, Etc.		 --
    ---------------------------------------------------------------


    type Argvz is array (0 .. 500) of aliased Character_Pointer;

    type Arg_Type is new ada.finalization.Controlled with record
	-- finalization - free Argv strings
	-- RK 23-Oct-2006, to remove the memory leak in question.
	v       : Argvz:= (others => interfaces.c.strings.Null_Ptr);
	v_Count : Natural:= 0;
    end record;

    procedure Finalize (Self : in out Arg_Type) is
	use interfaces.c.strings;
    begin
	if Self.v(0) /= interfaces.c.strings.Null_Ptr then
	    free (Self.v (0));
	end if;

	for I in 1 .. Self.v_Count loop
	    free (Self.v (I));
	end loop;
    end Finalize;

    Arg : Arg_Type;

    procedure GLUT_Init (Argcp : access Integer;
			 Argv : access Character_Pointer);
    --pragma Import (C, GLUT_Init, "glutInit", "glutInit"); -- APEX
    pragma Import (StdCall, GLUT_Init, "glutInit"); -- GNAT/OA

    -- Pure Ada method, from IBM / Rational Apex support:

    -- "This procedure may be a useful replacement when porting an
    --  Ada program written for Gnat, which imports argc and argv like this:
    --  argc : aliased integer;
    --  pragma Import (C, argc, "gnat_argc");
    --
    --  argv : chars_ptr_ptr;
    --  pragma Import (C, argv, "gnat_argv");
    -- "

    -- http://www-1.ibm.com/support/docview.wss?uid=swg21125019

    procedure Init is
	use Ada.Command_Line;
	use Interfaces.C.Strings;

	Argc : aliased Integer := Argument_Count + 1;
    begin
	Arg.v_Count := Argument_Count;

	Arg.v (0) := New_String (Command_Name);
	for I in 1 .. Arg.v_Count loop
	    Arg.v (I) := New_String (Argument (I));
	end loop;

	GLUT_Init (Argc'Access, Arg.v (0)'Access);
    end Init;

End TAO_GL.Utility_Toolkit;
