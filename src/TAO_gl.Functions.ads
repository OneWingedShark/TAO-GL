Pragma Ada_2012;

With
System,
TAO_GL.Types;

Use
TAO_GL.Types;

Use Type System.Address;

Package TAO_GL.Functions is

    Function Executing		Return Boolean with Inline;
    Function ARB_Enabled	Return Boolean with Inline;

procedure ClearColor (Red, Green, Blue, Alpha : Clamped_Float)
	with pre => not Executing;

procedure Clear (mask : bitfield)
	with pre => not Executing;

procedure IndexMask (mask : Unsigned_Integer)
	with pre => not Executing;

procedure ColorMask (Red, Green, Blue, Alpha : Types.Boolean)
	with pre => not Executing;

procedure AlphaFunc (func : Comparisions; ref : Clamped_Float)
	with pre => not Executing;

procedure BlendFunc (Source : Source_Factor; Destination : Destination_Factor)
	with pre => not Executing;

procedure LogicOp (OpCode : Logic_Operators)
	with pre => not Executing;

procedure CullFace (mode : Face)
	with pre => not Executing;

procedure FrontFace (mode : Orientation)
	with pre => not Executing;

procedure PointSize (size : float)
	with pre => not Executing AND size > 0.0;

procedure LineWidth (width : float)
	with pre => not Executing AND width > 0.0;

procedure LineStipple (factor : Types.Integer; pattern : Unsigned_Short)
	with pre => not Executing;

procedure PolygonMode (Face : Types.Face; mode : Raster_Mode)
	with pre => not Executing;

procedure PolygonOffset (factor, units : Types.float)
	with pre => not Executing;

-- NOTE: I'm unsure how to translate this function.
procedure PolygonStipple (mask : access Unsigned_Byte)
	with pre => not Executing;

Function GetPolygonStipple Return Unsigned_Byte_Vector_Type
	with pre => not Executing;

procedure EdgeFlag (flag : Types.Boolean);

Function EdgeFlag (flag : Types.Boolean) Return Types.Boolean;

procedure Scissor (x, y : Types.Integer; width, height : Size)
	with pre => not Executing;

procedure ClipPlane (Plane : Clipping_Plane; Equation : Double_Vector.Vector_4)
	with pre => not Executing;

Function GetClipPlane (plane : Clipping_Plane) return Double_Vector.Vector_4
	with pre => not Executing;

procedure DrawBuffer (mode : Drawing_Mode)
	with pre => not Executing;

procedure ReadBuffer (mode : Buffer_Mode)
	with pre => not Executing;

procedure Enable (cap : Capability)
	with pre => not Executing;

procedure Disable (cap : Capability)
	with pre => not Executing;

function IsEnabled (cap : Capability) return Types.Boolean
	with pre => not Executing;

procedure EnableClientState (cap : Client_Capibility)
	with pre => not Executing;

procedure DisableClientState (cap : Client_Capibility)
	with pre => not Executing;

function Get (Name : State_Variable) return Boolean_Vector_Type
	with pre => not Executing;

Function Get (Name : State_Variable) return Double_Vector_Type
	with pre => not Executing;

Function Get (Name : State_Variable) return Float_Vector_Type
	with pre => not Executing;

Function Get (Name : State_Variable) return Types.Integer_Vector_Type
	with pre => not Executing;

procedure PushAttrib (mask : bitfield)
	with pre => not Executing;

procedure PopAttrib
	with pre => not Executing;

procedure PushClientAttrib (mask : bitfield);

procedure PopClientAttrib;

function RenderMode (Mode : Rendering_Mode) return Types.Integer
	with pre => not Executing;

function GetError return Error_Flag
	with pre => not Executing;

function GetString (Name : String_Constants) return String
	with pre => not Executing;

procedure Finish
	with pre => not Executing;

procedure Flush
	with pre => not Executing;

procedure Hint (Target : Hints; mode : Hint_Mode)
	with pre => not Executing;

procedure ClearDepth (depth : Clamped_Double)
	with pre => not Executing;

procedure DepthFunc (func : Comparisions)
	with pre => not Executing;

procedure DepthMask (flag : Types.Boolean)
	with pre => not Executing;

procedure DepthRange (near_val, far_val : Clamped_Double)
	with pre => not Executing;

procedure ClearAccum (red, green, blue, alpha : Types.Float)
	with pre => not Executing;

procedure Accum (op : Accumulator_Operators; value : Types.Float)
	with pre => not Executing;

procedure MatrixMode (mode : Matrix_Mode_Type)
	with pre => not Executing;

procedure Ortho (left, right, bottom, top, near, far : double)
	with pre => not (Executing or
			(left = right or bottom = top or near = far));

procedure Frustum (left, right, bottom, top, near, far : double)
    with pre => ( near > 0.0 and far > 0.0 )
		and not (Executing or
			(left = right or bottom = top or near = far));

procedure Viewport (x, y : Types.Integer; width, height : Types.Size)
	with pre => not Executing;

procedure PushMatrix
	with pre => not Executing;

procedure PopMatrix
	with pre => not Executing;

procedure LoadIdentity
	with pre => not Executing;

procedure LoadMatrix (m : Double_Matrix)
	with pre => not Executing;

procedure LoadMatrix (m : Float_Matrix)
	with pre => not Executing;

procedure MultMatrix (m : Double_Matrix)
	with pre => not Executing;

procedure MultMatrix (m : Float_Matrix)
	with pre => not Executing;

procedure Rotate (angle, x, y, z : double)
	with pre => not Executing;

procedure Rotate (angle, x, y, z : Types.float)
	with pre => not Executing;

procedure Scale (x, y, z : double)
	with pre => not Executing;

procedure Scale (x, y, z : Types.float)
	with pre => not Executing;

procedure Translate (x, y, z : double)
	with pre => not Executing;

procedure Translate (x, y, z : Types.float)
	with pre => not Executing;

function IsList (list : Unsigned_Integer) return Types.Boolean
	with pre => not Executing;

procedure DeleteLists (list : Unsigned_Integer; c_range : Types.Size)
	with pre => not Executing;

function GenLists (list_range : Types.Size) return Unsigned_Integer
	with pre => not Executing;

procedure NewList (List : Unsigned_Integer; mode : Command_Mode)
	with pre => List /= 0 and not Executing;

procedure EndList
	with pre => not Executing;

procedure CallList (list : Unsigned_Integer);

-- CallLists should be overloaded to use *_Vector_Type as "lists" instead of System.Address.
procedure CallLists (	n		: Types.Size;
			List_Type	: Types.List_Type;
			lists		: System.Address);

procedure ListBase (base : Unsigned_Integer)
	with pre => not Executing;

procedure Start(Mode: Vertex_Interpretation) -- renames glBegin
	 with pre => not Executing, post => Executing;

procedure Stop -- renames glEnd
	with pre => Executing, post => Not Executing;

--  procedure Vertex (x, y : double);
--
--  procedure Vertex (x, y : float);
--
--  procedure Vertex (x, y : Types.Integer);
--
--  procedure Vertex (x, y : short);
--
--  procedure Vertex (x, y, z : double);
--
--  procedure Vertex (x, y, z : float);
--
--  procedure Vertex (x, y, z : Types.Integer);
--
--  procedure Vertex (x, y, z : short);

procedure Vertex (x, y : double; z : double:= 0.0; w : double:= 1.0)
	with pre => Executing;

procedure Vertex (	x, y	: Types.float;
			z	: Types.float:= 0.0;
			w	: Types.float:= 1.0)
	with pre => Executing;

procedure Vertex (	x, y	: Types.Integer;
			z	: Types.Integer:= 0;
			w	: Types.Integer:= 1)
	with pre => Executing;

procedure Vertex (	x, y	: short;
			z	: short:= 0;
			w	: short:= 1)
	with pre => Executing;

procedure Vertex (v : Double_Vector_Type)
	with pre => v'length in Vector_Range and Executing;

procedure Vertex (v : Float_Vector_Type)
	with pre => v'length in Vector_Range and Executing;

procedure Vertex (v : Types.Integer_Vector_Type)
	with pre => v'length in Vector_Range and Executing;

procedure Vertex (v : Short_Vector_Type)
	with pre => v'length in Vector_Range and Executing;

procedure Normal (x, y, z : byte);

procedure Normal (x, y, z : double);

procedure Normal (x, y, z : Types.float);

procedure Normal (x, y, z : Types.Integer);

procedure Normal (x, y, z : short);

procedure Normal (v : Byte_Vector_Type)
	with pre => v'length = 3;

procedure Normal (v : Double_Vector_Type)
	with pre => v'length = 3;

procedure Normal (v : Float_Vector_Type)
	with pre => v'length = 3;

procedure Normal (v : Types.Integer_Vector_Type)
	with pre => v'length = 3;

procedure Normal (v : Short_Vector_Type)
	with pre => v'length = 3;

procedure Index (c : double);

procedure Index (c : float);

procedure Index (c : Types.Integer);

procedure Index (c : short);

procedure Index (c : Unsigned_Byte);

procedure Index (c : access double);

procedure Index (c : access Types.float);

procedure Index (c : access Types.Integer);

procedure Index (c : access short);

procedure Index (c : access Unsigned_Byte);

procedure Color (Red, Green, Blue : byte);

procedure Color (Red, Green, Blue : double);

procedure Color (Red, Green, Blue : Types.float);

procedure Color (Red, Green, Blue : Types.Integer);

procedure Color (Red, Green, Blue : short);

procedure Color (Red, Green, Blue : Unsigned_Byte);

procedure Color (Red, Green, Blue : Unsigned_Integer);

procedure Color (Red, Green, Blue : Unsigned_Short);

procedure Color (Red, Green, Blue, Alpha : byte);

procedure Color (Red, Green, Blue, Alpha : double);

procedure Color (Red, Green, Blue, Alpha : Types.float);

procedure Color (Red, Green, Blue, Alpha : Types.Integer);

procedure Color (Red, Green, Blue, Alpha : short);

procedure Color (Red, Green, Blue, Alpha : Unsigned_Byte);

procedure Color (Red, Green, Blue, Alpha : Unsigned_Integer);

procedure Color (Red, Green, Blue, Alpha : Unsigned_Short);

procedure Color (v : Byte_Color);

procedure Color (v : Double_Color);

procedure Color (v : Float_Color);

procedure Color (v : Types.Integer_Color);

procedure Color (v : Short_Color);

procedure Color (v : Unsigned_Byte_Color);

procedure Color (v : Unsigned_Integer_Color);

procedure Color (v : Unsigned_Short_Color);

procedure TexCoord (	s	: double;
			t, r	: double:= 0.0;
			q	: double:= 1.0);

procedure TexCoord (	s	: Types.float;
			t, r	: Types.float:= 0.0;
			q	: Types.float:= 1.0);

procedure TexCoord (	s	: Types.Integer;
			t, r	: Types.Integer:= 1;
			q	: Types.Integer:= 0);

procedure TexCoord (	s	: short;
			t, r	: short:= 1;
			q	: short:= 0);

procedure TexCoord (v : Double_Vector_Type)
	with pre => v'length in Vector_Range;

procedure TexCoord (v : Float_Vector_Type)
	with pre => v'length in Vector_Range;

procedure TexCoord (v : Types.Integer_Vector_Type)
	with pre => v'length in Vector_Range;

procedure TexCoord (v : Short_Vector_Type)
	with pre => v'length in Vector_Range;

procedure RasterPos (	x, y	: double;
			z	: double:= 0.0;
			w	: double:= 1.0)
	with pre => not Executing;

procedure RasterPos (	x, y	: Types.float;
			z	: Types.float:= 0.0;
			w	: Types.float:= 1.0)
	with pre => not Executing;

procedure RasterPos (	x, y	: Types.Integer;
			z	: Types.Integer:= 0;
			w	: Types.Integer:= 1)
	with pre => not Executing;

procedure RasterPos (	x, y	: short;
			z	: short:= 0;
			w	: short:= 1)
	with pre => not Executing;

procedure RasterPos (v : Double_Vector_Type)
	with pre => v'length in Vector_Range and not Executing;

procedure RasterPos (v : Float_Vector_Type)
	with pre => v'length in Vector_Range and not Executing;

procedure RasterPos (v : Types.Integer_Vector_Type)
	with pre => v'length in Vector_Range and not Executing;

procedure RasterPos (v : Short_Vector_Type)
	with pre => v'length in Vector_Range and not Executing;

procedure Rect (x1, y1, x2, y2 : double)
	with pre => Not Executing;

procedure Rect (x1, y1, x2, y2 : Types.float)
	with pre => Not Executing;

procedure Rect (x1, y1, x2, y2 : Types.Integer)
	with pre => Not Executing;

procedure Rect (x1, y1, x2, y2 : short)
	with pre => Not Executing;

procedure Rect (v1, v2 : Double_Vector_Type)
	with pre => v1'length = 2 and v2'length = 2 and not Executing;

procedure Rect (v1, v2 : Float_Vector_Type)
	with pre => v1'length = 2 and v2'length = 2 and not Executing;

procedure Rect (v1, v2 : Types.Integer_Vector_Type)
	with pre => v1'length = 2 and v2'length = 2 and not Executing;

procedure Rect (v1, v2 : Short_Vector_Type)
	with pre => v1'length = 2 and v2'length = 2 and not Executing;

procedure ShadeModel (mode : Shading_Technique)
	with pre => Not Executing;

procedure Light (	light	: Light_Source;
			pname	: Lighting_Style;
			param	: Types.float)
	with pre => Not Executing;

procedure Light (	light	: Light_Source;
			pname	: Lighting_Style;
			param	: Types.Integer)
	with pre => Not Executing;

procedure Light (	light	: Light_Source;
			pname	: Lighting_Style;
			params	: Float_Vector_Type)
	with pre => Not Executing;

procedure Light (	light	: Light_Source;
			pname	: Lighting_Style;
			params	: Types.Integer_Vector_Type)
	with pre => Not Executing;

Function GetLight (	light	: Light_Source;
		 	pname	: Lighting_Style)
		return Float_Vector_Type
	with pre => Not Executing;

Function GetLight (	light	: Light_Source;
			pname	: Lighting_Style)
		return Types.Integer_Vector_Type
	with pre => Not Executing;

procedure LightModel (	pname	: Light_Model;
			param	: Types.float)
	with pre => Not Executing;

procedure LightModel (	pname	: Light_Model;
			param	: Types.Integer)
	with pre => Not Executing;

procedure LightModel (	pname	: Light_Model;
			params	: float_vector_type)
	with pre => Not Executing;

procedure LightModel (	pname	: Light_Model;
			params	: Types.Integer_vector_type)
	with pre => Not Executing;

procedure Material (	face	: Types.Face;
			param	: Types.Float);

procedure Material (	face	: Types.Face;
			param	: Types.Integer);

procedure Material (	face	: Types.Face;
			pname	: Material_Parameter;
			params	: Float_Vector_Type);

procedure Material (	face	: Types.Face;
			pname	: Material_Parameter;
			params	: Types.Integer_Vector_Type);

function GetMaterial (	face	: Types.Face;
			pname	: Material_Parameter)
		return Float_Vector_Type
	with pre => Not Executing;

function GetMaterial (	face	: Types.Face;
			pname	: Material_Parameter)
		return Types.Integer_Vector_Type
	with pre => Not Executing;

procedure ColorMaterial (	face : Types.Face;
				mode : Material_Color)
	with pre => Not Executing;

procedure PixelZoom (x_factor, y_factor : Types.float)
	with pre => Not Executing;

procedure PixelStore (	pname	: Pixel_Storage;
			param	: Types.float)
	with pre => Not Executing
			and (if pname in PACK_ALIGNMENT | UNPACK_ALIGNMENT
				then param in 1.0|2.0|4.0|8.0)
			and (if pname in PACK_ROW_LENGTH..PACK_SKIP_IMAGES |
					 UNPACK_ROW_LENGTH..UNPACK_SKIP_IMAGES
				then param >= 0.0);

procedure PixelStore (	pname	: Pixel_Storage;
			param	: Types.Integer)
	with pre => Not Executing
			and (if pname in PACK_ALIGNMENT | UNPACK_ALIGNMENT
				then param in 1|2|4|8)
			and (if pname in PACK_ROW_LENGTH..PACK_SKIP_IMAGES |
					 UNPACK_ROW_LENGTH..UNPACK_SKIP_IMAGES
				then param >= 0);

procedure PixelTransfer (	pname	: Transfer_Style;
				param	: Types.float)
	with pre => Not Executing
			and (if not ARB_Enabled
				then pname in MAP_COLOR..DEPTH_BIAS);

procedure PixelTransfer (	pname	: Transfer_Style;
				param	: Types.Integer)
	with pre => Not Executing
			and (if not ARB_Enabled
				then pname in MAP_COLOR..DEPTH_BIAS);

procedure PixelMap (	map	: Pixel_Mapping_Type;
			values	: Float_Vector_Type)
	with pre => Not Executing;

procedure PixelMap (	map	: Pixel_Mapping_Type;
			values	: Unsigned_Integer_Vector_Type)
	with pre => Not Executing;

procedure PixelMap (	map	: Pixel_Mapping_Type;
			values	: Unsigned_Short_Vector_Type)
	with pre => Not Executing;

Function GetPixelMap (map : Pixel_Mapping_Type)
		return Float_Vector_Type
	with pre => Not Executing;

Function GetPixelMap (map : Pixel_Mapping_Type)
		return Unsigned_Integer_Vector_Type
	with pre => Not Executing;

Function GetPixelMap (map : Pixel_Mapping_Type)
		return Unsigned_Short_Vector_Type
	with pre => Not Executing;

procedure Bitmap (	x_origin, y_origin, x_move, y_move	: Types.Float;
			bitmap					: Types.Bitmap)
	with pre => Not Executing;

-- NOTE: ReadPixels needs better preconditions, namely preconditions on the format parameter.
Function ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format)
		Return Byte_Vector_Type
	with pre => Not Executing;

Function ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format)
		Return Short_Vector_Type
	with pre => Not Executing;

Function ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format)
		Return Integer_Vector_Type
	with pre => Not Executing;

Function ReadPixels (	x, y : Types.Integer;
			width, height : Types.Size;
			Format : Pixel_Data_Format)
		Return Float_Vector_Type
	with pre => Not Executing;

Function ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type_8)
		Return Unsigned_Byte_Vector_Type
	with pre => Not Executing;

Function ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type_16)
		Return Unsigned_Short_Vector_Type
	with pre => Not Executing;

Function ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type_32)
		Return Unsigned_Integer_Vector_Type
	with pre => Not Executing;

Procedure ReadPixels (	x, y		: Types.Integer;
			width, height	: Types.Size;
			Format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type;
			Pixels		: System.Address)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			pixels		: Byte_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			pixels		: Short_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			pixels		: Integer_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			pixels		: Float_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type_8;
			pixels		: Unsigned_Byte_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type_16;
			pixels		: Unsigned_Short_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type_32;
			pixels		: Unsigned_Integer_Vector_Type)
	with pre => Not Executing;

procedure DrawPixels (	Width, Height	: Types.Size;
			format		: Pixel_Data_Format;
			Data_Type	: Pixel_Data_Type;
			pixels		: System.Address)
	with pre => Not Executing;

procedure CopyPixels (	X, Y		: Types.Integer;
			Width, Height	: Types.Size;
			Style		: Pixel_Copy_Type)
	with pre => Not Executing;

procedure StencilFunc (	func		: Comparisions;
			reference	: Types.Integer;
			mask		: Unsigned_Integer)
	with pre => Not Executing;

procedure StencilMask (mask : Bitfield)
	with pre => Not Executing;

procedure StencilOp (fail, zfail, zpass : Stencil_Op_Type)
	with pre => Not Executing;

procedure ClearStencil (s : Types.Integer)
	with pre => Not Executing;

procedure TexGen (	coord	: Texture_Coordinate_Type;
			param	: double)
	with pre => Not Executing;

procedure TexGen (	coord	: Texture_Coordinate_Type;
			param	: Types.float)
	with pre => Not Executing;

procedure TexGen (	coord	: Texture_Coordinate_Type;
			param	: Types.Integer)
	with pre => Not Executing;

procedure TexGen (	coord	: Texture_Coordinate_Type;
			pname	: Texture_Coordinate_Generation;
			params	: Double_Vector_Type)
	with pre => Not Executing;

procedure TexGen (	coord	: Texture_Coordinate_Type;
			pname	: Texture_Coordinate_Generation;
			params	: Float_Vector_Type)
	with pre => Not Executing;

procedure TexGen (	coord	: Texture_Coordinate_Type;
			pname	: Texture_Coordinate_Generation;
			params	: Integer_Vector_Type)
	with pre => Not Executing;

Function GetTexGen (	coord	: Texture_Coordinate_Type;
			pname	: Texture_Coordinate_Generation)
		Return Double_Vector_Type
	with pre => Not Executing;

Function GetTexGen (	coord	: Texture_Coordinate_Type;
			pname	: Texture_Coordinate_Generation)
		Return Float_Vector_Type
	with pre => Not Executing;

Function GetTexGen (	coord	: Texture_Coordinate_Type;
			pname	: Texture_Coordinate_Generation)
		Return Integer_Vector_Type
	with pre => Not Executing;

procedure TexEnv (	target	: Texture_Environment_Type;
			pname	: Texture_Environ_Type;
			param	: Texture_Environ_Parameter)
	with pre => Not Executing;

procedure TexEnv (	target	: Texture_Environment_Type;
			pname	: Texture_Environ_Type;
			param	: Types.Integer)
	with pre => Not Executing;

procedure TexEnv (	target	: Texture_Environment_Type;
			pname	: Texture_Environ_Type;
			param	: Float)
	with pre => Not Executing;

-- TODO: Expand out [overload] these functions to allow for color-array inputs.
--  procedure TexEnvfv (target : enum; pname : enum; params : access float);
--  procedure TexEnviv (target : enum; pname : enum; params : access Types.Integer);

Function GetTexEnv (	target	: Texture_Environment_Type;
			pname	: Texture_Environ_Type)
		Return Types.Float
	with pre => Not Executing;

Function GetTexEnv (	target	: Texture_Environment_Type;
			pname	: Texture_Environ_Type)
		    Return Types.Integer
	with pre => Not Executing;

procedure TexParameter (	target	: Texture_Target;
				pname	: Nonvector_Texture_Paramater_Type;
				param	: Types.Float)
	with pre => Not Executing;

procedure TexParameter (	target	: Texture_Target;
				pname	: Nonvector_Texture_Paramater_Type;
				param	: Types.Integer)
	with pre => Not Executing;

procedure TexParameter (	target	: Texture_Target;
				pname	: Texture_Paramater_Type;
				params	: Float_Vector_Type)
	with pre => Not Executing;

procedure TexParameter (	target	: Texture_Target;
				pname	: Texture_Paramater_Type;
				params	: Integer_Vector_Type)
	with pre => Not Executing;

Function GetTexParameter (	target	: Texture_Target;
				pname	: Texture_Paramater_Type)
		return Float_Vector_Type
	with pre => Not Executing;

Function GetTexParameter (	target	: Texture_Target;
				pname	: Texture_Paramater_Type)
		return Integer_Vector_Type
	with pre => Not Executing;

Function GetTexLevelParameter (	target	: Extended_Texture_Target;
				level	: Types.Size;
				pname	: Texture_Parameter)
		return Float_Vector_Type
	with pre => Not Executing;

Function GetTexLevelParameter (	target	: Extended_Texture_Target;
				level	: Types.Size;
				pname	: Texture_Parameter)
			       return Integer_Vector_Type
	with pre => Not Executing;

procedure TexImage1D (	target		: Texture_Target_1D;
			level		: Types.Integer;
			InternalFormat	: Internal_Format_Type;
			width		: Types.Size;
			border		: Types.Boolean;
			format		: Texture_Pixel_Data_Format;
			c_type		: Pixel_Data_Type;
			pixels		: System.Address)
	with pre => Not Executing;

procedure TexImage2D (	target		: Texture_Target_2D;
			level		: Types.Integer;
			InternalFormat	: Internal_Format_Type;
			width, height	: Types.Size;
			border		: Types.Boolean;
			format		: Texture_Pixel_Data_Format;
			c_type		: Pixel_Data_Type;
			pixels		: System.Address)
	with pre => Not Executing;

-- TODO: See if this can be transformedinto a set of overloaded functions.
procedure GetTexImage (	target	: Extended_Texture_Target;
			level	: Size;
			format	: Texture_Pixel_Data_Format;
			c_type	: Pixel_Data_Type;
			pixels	: System.Address)
	with pre => Not Executing;

procedure Map1 (	target	: Map1_Target;
			u1, u2	: double;
			stride	: Types.Integer;
			order	: Types.Size;
			points	: Double_Vector_Type)
	with pre => Not Executing and (order >= 1) and (u1 /= u2);

procedure Map1 (	target	: Map1_Target;
			u1, u2	: types.Float;
			stride	: Types.Integer;
			order	: Types.Size;
			points	: Float_Vector_Type)
	with pre => Not Executing and (order >= 1) and (u1 /= u2);

procedure Map2 (	target			: Map2_Target;
			u1, u2, v1, v2		: double;
			ustride, vstride	: Types.Integer;
			uorder, vorder		: Types.Size;
			points			: Double_Vector_Type)
	with pre => Not Executing and (uorder >= 1) and (vorder >= 1) and (u1 /= u2) and (v1 /= v2);

procedure Map2 (	target			: Map2_Target;
			u1, u2, v1, v2		: Types.Float;
			ustride, vstride	: Types.Integer;
			uorder, vorder		: Types.Size;
			points			: Float_Vector_Type)
	with pre => Not Executing and (uorder >= 1) and (vorder >= 1) and (u1 /= u2) and (v1 /= v2);

procedure GetMap (	target	: Map_Target;
			query	: Map_Query;
			v	: Double_Vector_Type)
	with pre => Not Executing;

procedure GetMap (	target	: Map_Target;
			query	: Map_Query;
			v	: Float_Vector_Type)
	with pre => Not Executing;

procedure GetMap (	target	: Map_Target;
			query	: Map_Query;
			v	: Integer_Vector_Type)
	with pre => Not Executing;

procedure EvalCoord (u : double);

procedure EvalCoord (u : Types.float);

procedure EvalCoord (u, v : double);

procedure EvalCoord (u, v : Types.float);

procedure EvalCoord (u : Double_Vector_Type)
	with pre => u'length in 1..2;

procedure EvalCoord (u : Float_Vector_Type)
	with pre => u'length in 1..2;

procedure MapGrid (	un	: Types.Size;
			u1, u2	: double)
	with pre => Not Executing and un > 0;

procedure MapGrid (	un	: Types.Size;
			u1, u2	: Types.Float)
	with pre => Not Executing and un > 0;

procedure MapGrid (	un, vn		: Types.Size;
			u1, u2, v1, v2	: double)
	with pre => Not Executing and un > 0 and vn > 0;

procedure MapGrid (	un, vn		: Types.Size;
			u1, u2, v1, v2	: Types.Float)
	with pre => Not Executing and un > 0 and vn > 0;

procedure EvalPoint (i : Types.Integer);

procedure EvalPoint (i, j : Types.Integer);

procedure EvalMesh (	mode	: Raster_Mode;
			i1, i2	: Types.Integer)
	with pre => Not Executing and mode /= Fill;

procedure EvalMesh (	mode		: Raster_Mode;
			i1, i2, j1, j2	: Types.Integer)
	with pre => Not Executing;

procedure Fog (	pname	: Fog_Parameter;
		param	: float)
	with pre => Not Executing and pname /= FOG_COLOR;

procedure Fog (	pname	: Fog_Parameter;
		param	: Types.Integer)
	with pre => Not Executing and pname /= FOG_COLOR;

procedure Fog (	pname	: Fog_Parameter;
		params	: Float_Vector_Type)
	with pre => Not Executing;

procedure Fog (	pname	: Fog_Parameter;
		params	: Integer_Vector_Type)
	with pre => Not Executing;

procedure FeedbackBuffer (	size	: Types.Size;
				c_type	: Vertex_Info;
				buffer	: Float_Vector_Type)
	with pre => Not Executing;

procedure PassThrough (token : float)
	with pre => Not Executing;

procedure SelectBuffer (buffer : in out Unsigned_Integer_Vector_Type)
	with pre => Not Executing;

procedure InitNames
	with pre => Not Executing;

procedure LoadName (name : Unsigned_Integer)
	with pre => Not Executing;

procedure PushName (name : Unsigned_Integer)
	with pre => Not Executing;

procedure PopName
	with pre => Not Executing;

procedure GenTextures (textures : Unsigned_Integer_Vector_Type)
	with pre => Not Executing;

procedure DeleteTextures (textures : Unsigned_Integer_Vector_Type)
	with pre => Not Executing;

procedure BindTexture (	target	: Texture_Target;
			texture	: Unsigned_Integer)
	with pre => Not Executing;

procedure PrioritizeTextures (	n		: Types.Size;
				textures	: Unsigned_Integer_Vector_Type;
				priorities	: Clamped_Float_Vector_Type)
	with pre => Not Executing;

function AreTexturesResident (	n		: Types.Size;
				textures	: Unsigned_Integer_Vector_Type;
				residences	: Boolean_Vector_Type)
		return Types.Boolean
	with pre => Not Executing and (for all B of textures => B /= 0);

function IsTexture (texture : Unsigned_Integer) return Types.Boolean
	with pre => Not Executing;

-- Note: this is glTexSubImage1D.
procedure TexSubImage(	level, width	: Types.Size;
			xoffset		: Types.Integer;
			format		: Texture_Pixel_Data_Format;
			c_type		: Pixel_Data_Type;
			pixels		: System.Address)
	with pre => Not Executing;

-- Note: this is glTexSubImage2D.
procedure TexSubImage(	target			: Texture_Target_2D;
			level, width, height	: Types.Size;
			xoffset, yoffset	: Types.Integer;
			format			: Texture_Pixel_Data_Format;
			c_type			: Pixel_Data_Type;
			pixels			: System.Address)
	with pre => Not Executing;

-- NOTE: This is glCopyTexImage1D.
procedure CopyTexImage (	level, width	: Types.Size;
				Internalformat	: Internal_Format_Type;
				x, y		: Types.Integer;
				border		: Types.Boolean)
	with pre => Not Executing;

-- NOTE: This is glCopyTexImage2D.
procedure CopyTexImage (	target			: Texture_Target_2D;
				level, width, height	: Types.Size;
				Internalformat		: Internal_Format_Type;
				x, y			: Types.Integer;
				border			: Types.Boolean)
	with pre => Not Executing;

-- NOTE: This is glCopyTexSubImage1D.
procedure CopyTexSubImage (	level, width	: Types.Size;
				xoffset, x, y	: Types.Integer);

-- NOTE: This is glCopyTexSubImage2D.
procedure CopyTexSubImage (	target			: Texture_Target_2D;
				level, width, height	: Types.Size;
				xoffset, yoffset, x, y	: Types.Integer)
	with pre => Not Executing;

procedure VertexPointer (	size, stride	: Types.Size;
				v		: Float_Vector_Type)
	with pre => size in 2..4;

procedure VertexPointer (	size, stride	: Types.Size;
				v		: Double_Vector_Type)
	with pre => size in 2..4;

procedure VertexPointer (	size, stride	: Types.Size;
				v		: Short_Vector_Type)
	with pre => size in 2..4;

procedure VertexPointer (	size, stride	: Types.Size;
				v		: Integer_Vector_Type)
	with pre => size in 2..4;

procedure NormalPointer (	stride	: Types.Size;
				v	: Float_Vector_Type);

procedure NormalPointer (	stride	: Types.Size;
				v	: Double_Vector_Type);

procedure NormalPointer (	stride	: Types.Size;
				v	: Short_Vector_Type);

procedure NormalPointer (	stride	: Types.Size;
				v	: Integer_Vector_Type);

--  NOTE: As far as I can tell the following are redundant given above overloadings.
--  procedure ColorPointer (size : Types.Integer; c_type : enum; stride : Types.Size; ptr : System.Address);
--
--  procedure IndexPointer (c_type : enum; stride : Types.Size; ptr : System.Address);
--
--  procedure TexCoordPointer (size : Types.Integer; c_type : enum; stride : Types.Size; ptr : System.Address);
--
--  procedure EdgeFlagPointer (stride : Types.Size; ptr : System.Address);
--
--  procedure GetPointerv (pname : enum; params : System.Address);

procedure ArrayElement (i : Types.Integer);

procedure DrawArrays (	mode	: Vertex_Interpretation;
			first	: Types.Integer;
			count	: Types.Size)
	with pre => Not Executing;

procedure DrawElements (	mode	: Vertex_Interpretation;
				vector	: Unsigned_Byte_Vector_Type)
	with pre => Not Executing;

procedure DrawElements (	mode	: Vertex_Interpretation;
				vector	: Unsigned_Short_Vector_Type)
	with pre => Not Executing;

procedure DrawElements (	mode	: Vertex_Interpretation;
				vector	: Unsigned_Integer_Vector_Type)
	with pre => Not Executing;

procedure InterleavedArrays (	format	: Array_Format_Type;
				stride	: Types.Size;
				pointer	: System.Address);

-- VERSION 4.3 MARK
-- procedure ActiveTexture( Texture : Texture_Number );
--
--  procedure AttachShader(program, shader : Unsigned_Integer)
--  	with pre => Not Executing;
--
--  procedure BeginQuery(Target : Query_Target; ID : Unsigned_Integer)
--  	with pre => Not Executing and ID /= 0;
--
--  procedure BindAttribLocation(	Program,  Index	: Unsigned_Integer;
--  				Name		: String)
--  	with pre => Not Executing and Name(Name'First..Name'First+3) /= "gl_";
--
--  procedure BindBuffer(Target : Buffers; Buffer  : Unsigned_Integer);
--
--  procedure BlendColor(Red, Green, Blue, Alpha : Types.Float);
--
--  procedure BlendEquation(mode : Blend_Type);
--
--  procedure BlendEquation(mode : Blend_Type; buffer : Drawing_Buffer_Number);
--
--  procedure BlendEquationSeparate(Mode_RGB, Mode_Alpha : Blend_Type);
--
--  procedure BlendEquationSeparate(Mode_RGB, Mode_Alpha : Blend_Type; Buffer : Drawing_Buffer_Number);
--
--  procedure glBlendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha : Scale_Factor);
--
--  procedure glBlendFuncSeparatei(buffer : Unsigned_Integer; srcRGB, dstRGB, srcAlpha, dstAlpha : Scale_Factor);
--
--  procedure BufferData(target : Buffers; usage : Usage_Pattern; size : Types.Size; data : System.Address:= System.Null_Address);
--
--  procedure BufferSubData(Target : Buffers; Offset : Types.Size; Size : Access Types.Size; Data : System.Address);
--
--  procedure glColorMask(red, green, blue, alpha : Types.Boolean);
--
--  procedure glColorMask(Buffer : Drawing_Buffer_Number; Red, Green, Blue, Alpha : Types.Boolean);
--






--	with pre => Not Executing;
--Buffers

Private

	OpenGL_Executing : Standard.Boolean := False;

    Function Executing Return Boolean is
	( Boolean(OpenGL_Executing) ) with Inline;

    Function ARB_Enabled Return Boolean is
	-- TODO: Need to replace this with a real determination for ARB.
	( Boolean(True) );

End TAO_GL.Functions;
