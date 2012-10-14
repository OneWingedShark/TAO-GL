Package TAO_GL.Types is

    Pragma Pure;

--------------------------------------------------------------------------------
----   BASIC TPYES	OPEN-GL DEFINED ELEMENTARY TYPES (SANS ARRAYS).     ----
--------------------------------------------------------------------------------

    -------------------
    --  8-BIT TYPES  --
    -------------------

    Type Boolean is New Interfaces.Integer_8 Range 0..1
	with Size => 8;
    Type Byte		is new Interfaces.Integer_8;
    Type Unsigned_Byte	is new Interfaces.Unsigned_8;

    --------------------
    --  16-BIT TYPES  --
    --------------------

    Type Short		is New interfaces.Integer_16;
    Type Unsigned_Short	is new Interfaces.Unsigned_16;

    --------------------
    --  32-BIT TYPES  --
    --------------------

    Type Integer		is new Interfaces.Integer_32;
    Type Unsigned_Integer	is new Interfaces.Unsigned_32;

    Type Enum is new Interfaces.Unsigned_32;
    Type Bitfield is Array (0..31) of Standard.Boolean
	with	Component_Size	=> 1,
		Size		=> 32,
		Pack;

    Type Size is new Interfaces.Integer_32
			Range 0..Interfaces.Integer_32'Last;

    ----------------------------
    --  FLOATING POINT TYPES  --
    ----------------------------

    Type Float is new Interfaces.IEEE_Float_32
			Range Interfaces.IEEE_Float_32'Range;
    Type Clamped_Float is new Float
			Range 0.0..1.0+Float'Small;

    Type Double is new Interfaces.IEEE_Float_64
			Range Interfaces.IEEE_Float_64'Range;
    Type Clamped_Double is new Double
			Range 0.0..1.0+Double'Small;

    Type Half	  is private;
    Type Float_11 is private;
    Type Float_10 is private;

    -------------------
    --  INDEX TYPES  --
    -------------------
    Type Chanel_Indices is ( Red, Green, Blue, Alpha );

    -- NOTE:	The actual indicies Red..Alpha & Red..Blue are given by the
    --		following subtypes, to be defined in the SubType section:
    --
    --		SubType RGBA is Chanel_Indices Range Chanel_Indices'Range;
    --		SubType RGB is RGBA Range Red..Green;


--------------------------------------------------------------------------------
----   CONSTANTS	OPEN-GL TYPES RELATING TO THE CONSTANTS FOR ENUM.   ----
--------------------------------------------------------------------------------

Package Constants is
    ------------------------------
    --  OpenGL Value Constants  --
    ------------------------------

    GL_ACCUM                           : constant := 16#0100#;
    GL_LOAD                            : constant := 16#0101#;
    GL_RETURN                          : constant := 16#0102#;
    GL_MULT                            : constant := 16#0103#;
    GL_ADD                             : constant := 16#0104#;

    GL_NEVER                           : constant := 16#0200#;
    GL_LESS                            : constant := 16#0201#;
    GL_EQUAL                           : constant := 16#0202#;
    GL_LEQUAL                          : constant := 16#0203#;
    GL_GREATER                         : constant := 16#0204#;
    GL_NOTEQUAL                        : constant := 16#0205#;
    GL_GEQUAL                          : constant := 16#0206#;
    GL_ALWAYS                          : constant := 16#0207#;

    -- NOTE:	Given the composition of the bitfield, these are redundant, and
    --		should likely be converted into the bit-positions they represent
    GL_CURRENT_BIT	   : constant := 2#00000000_00000000_00000000_00000001#;
    GL_POINT_BIT	   : constant := 2#00000000_00000000_00000000_00000010#;
    GL_LINE_BIT		   : constant := 2#00000000_00000000_00000000_00000100#;
    GL_POLYGON_BIT	   : constant := 2#00000000_00000000_00000000_00001000#;
    GL_POLYGON_STIPPLE_BIT : constant := 2#00000000_00000000_00000000_00010000#;
    GL_PIXEL_MODE_BIT      : constant := 2#00000000_00000000_00000000_00100000#;
    GL_LIGHTING_BIT        : constant := 2#00000000_00000000_00000000_01000000#;
    GL_FOG_BIT             : constant := 2#00000000_00000000_00000000_10000000#;
    GL_DEPTH_BUFFER_BIT    : constant := 2#00000000_00000000_00000001_00000000#;
    GL_ACCUM_BUFFER_BIT    : constant := 2#00000000_00000000_00000010_00000000#;
    GL_STENCIL_BUFFER_BIT  : constant := 2#00000000_00000000_00000100_00000000#;
    GL_VIEWPORT_BIT        : constant := 2#00000000_00000000_00001000_00000000#;
    GL_TRANSFORM_BIT       : constant := 2#00000000_00000000_00010000_00000000#;
    GL_ENABLE_BIT          : constant := 2#00000000_00000000_00100000_00000000#;
    GL_COLOR_BUFFER_BIT    : constant := 2#00000000_00000000_01000000_00000000#;
    GL_HINT_BIT            : constant := 2#00000000_00000000_10000000_00000000#;
    GL_EVAL_BIT            : constant := 2#00000000_00000001_00000000_00000000#;
    GL_LIST_BIT            : constant := 2#00000000_00000010_00000000_00000000#;
    GL_TEXTURE_BIT         : constant := 2#00000000_00000100_00000000_00000000#;
    GL_SCISSOR_BIT         : constant := 2#00000000_00001000_00000000_00000000#;
    GL_ALL_ATTRIB_BITS     : constant := 2#00000000_00001111_11111111_11111111#;

    GL_POINTS                          : constant := 16#0000#;
    GL_LINES                           : constant := 16#0001#;
    GL_LINE_LOOP                       : constant := 16#0002#;
    GL_LINE_STRIP                      : constant := 16#0003#;
    GL_TRIANGLES                       : constant := 16#0004#;
    GL_TRIANGLE_STRIP                  : constant := 16#0005#;
    GL_TRIANGLE_FAN                    : constant := 16#0006#;
    GL_QUADS                           : constant := 16#0007#;
    GL_QUAD_STRIP                      : constant := 16#0008#;
    GL_POLYGON                         : constant := 16#0009#;

    GL_ZERO                            : constant := 0;
    GL_ONE                             : constant := 1;
    GL_SRC_COLOR                       : constant := 16#0300#;
    GL_ONE_MINUS_SRC_COLOR             : constant := 16#0301#;
    GL_SRC_ALPHA                       : constant := 16#0302#;
    GL_ONE_MINUS_SRC_ALPHA             : constant := 16#0303#;
    GL_DST_ALPHA                       : constant := 16#0304#;
    GL_ONE_MINUS_DST_ALPHA             : constant := 16#0305#;

    GL_DST_COLOR                       : constant := 16#0306#;
    GL_ONE_MINUS_DST_COLOR             : constant := 16#0307#;
    GL_SRC_ALPHA_SATURATE              : constant := 16#0308#;

    GL_TRUE                            : constant := 1;
    GL_FALSE                           : constant := 0;

    GL_CLIP_PLANE0                     : constant := 16#3000#;
    GL_CLIP_PLANE1                     : constant := 16#3001#;
    GL_CLIP_PLANE2                     : constant := 16#3002#;
    GL_CLIP_PLANE3                     : constant := 16#3003#;
    GL_CLIP_PLANE4                     : constant := 16#3004#;
    GL_CLIP_PLANE5                     : constant := 16#3005#;

    GL_BYTE                            : constant := 16#1400#;
    GL_UNSIGNED_BYTE                   : constant := 16#1401#;
    GL_SHORT                           : constant := 16#1402#;
    GL_UNSIGNED_SHORT                  : constant := 16#1403#;
    GL_INT                             : constant := 16#1404#;
    GL_UNSIGNED_INT                    : constant := 16#1405#;
    GL_FLOAT                           : constant := 16#1406#;
    GL_2_BYTES                         : constant := 16#1407#;
    GL_3_BYTES                         : constant := 16#1408#;
    GL_4_BYTES                         : constant := 16#1409#;
    GL_DOUBLE                          : constant := 16#140A#;

    GL_NONE                            : constant := 0;
    GL_FRONT_LEFT                      : constant := 16#0400#;
    GL_FRONT_RIGHT                     : constant := 16#0401#;
    GL_BACK_LEFT                       : constant := 16#0402#;
    GL_BACK_RIGHT                      : constant := 16#0403#;
    GL_FRONT                           : constant := 16#0404#;
    GL_BACK                            : constant := 16#0405#;
    GL_LEFT                            : constant := 16#0406#;
    GL_RIGHT                           : constant := 16#0407#;
    GL_FRONT_AND_BACK                  : constant := 16#0408#;
    GL_AUX0                            : constant := 16#0409#;
    GL_AUX1                            : constant := 16#040A#;
    GL_AUX2                            : constant := 16#040B#;
    GL_AUX3                            : constant := 16#040C#;

    GL_NO_ERROR                        : constant := 0;
    GL_INVALID_ENUM                    : constant := 16#0500#;
    GL_INVALID_VALUE                   : constant := 16#0501#;
    GL_INVALID_OPERATION               : constant := 16#0502#;
    GL_STACK_OVERFLOW                  : constant := 16#0503#;
    GL_STACK_UNDERFLOW                 : constant := 16#0504#;
    GL_OUT_OF_MEMORY                   : constant := 16#0505#;

    GL_2D                              : constant := 16#0600#;
    GL_3D                              : constant := 16#0601#;
    GL_3D_COLOR                        : constant := 16#0602#;
    GL_3D_COLOR_TEXTURE                : constant := 16#0603#;
    GL_4D_COLOR_TEXTURE                : constant := 16#0604#;

    GL_PASS_THROUGH_TOKEN              : constant := 16#0700#;
    GL_POINT_TOKEN                     : constant := 16#0701#;
    GL_LINE_TOKEN                      : constant := 16#0702#;
    GL_POLYGON_TOKEN                   : constant := 16#0703#;
    GL_BITMAP_TOKEN                    : constant := 16#0704#;
    GL_DRAW_PIXEL_TOKEN                : constant := 16#0705#;
    GL_COPY_PIXEL_TOKEN                : constant := 16#0706#;
    GL_LINE_RESET_TOKEN                : constant := 16#0707#;

    GL_EXP                             : constant := 16#0800#;
    GL_EXP2                            : constant := 16#0801#;

    GL_CW                              : constant := 16#0900#;
    GL_CCW                             : constant := 16#0901#;

    GL_COEFF                           : constant := 16#0A00#;
    GL_ORDER                           : constant := 16#0A01#;
    GL_DOMAIN                          : constant := 16#0A02#;

    GL_CURRENT_COLOR                   : constant := 16#0B00#;
    GL_CURRENT_INDEX                   : constant := 16#0B01#;
    GL_CURRENT_NORMAL                  : constant := 16#0B02#;
    GL_CURRENT_TEXTURE_COORDS          : constant := 16#0B03#;
    GL_CURRENT_RASTER_COLOR            : constant := 16#0B04#;
    GL_CURRENT_RASTER_INDEX            : constant := 16#0B05#;
    GL_CURRENT_RASTER_TEXTURE_COORDS   : constant := 16#0B06#;
    GL_CURRENT_RASTER_POSITION         : constant := 16#0B07#;
    GL_CURRENT_RASTER_POSITION_VALID   : constant := 16#0B08#;
    GL_CURRENT_RASTER_DISTANCE         : constant := 16#0B09#;
    GL_POINT_SMOOTH                    : constant := 16#0B10#;
    GL_POINT_SIZE                      : constant := 16#0B11#;
    GL_POINT_SIZE_RANGE                : constant := 16#0B12#;
    GL_POINT_SIZE_GRANULARITY          : constant := 16#0B13#;
    GL_LINE_SMOOTH                     : constant := 16#0B20#;
    GL_LINE_WIDTH                      : constant := 16#0B21#;
    GL_LINE_WIDTH_RANGE                : constant := 16#0B22#;
    GL_LINE_WIDTH_GRANULARITY          : constant := 16#0B23#;
    GL_LINE_STIPPLE                    : constant := 16#0B24#;
    GL_LINE_STIPPLE_PATTERN            : constant := 16#0B25#;
    GL_LINE_STIPPLE_REPEAT             : constant := 16#0B26#;
    GL_LIST_MODE                       : constant := 16#0B30#;
    GL_MAX_LIST_NESTING                : constant := 16#0B31#;
    GL_LIST_BASE                       : constant := 16#0B32#;
    GL_LIST_INDEX                      : constant := 16#0B33#;
    GL_POLYGON_MODE                    : constant := 16#0B40#;
    GL_POLYGON_SMOOTH                  : constant := 16#0B41#;
    GL_POLYGON_STIPPLE                 : constant := 16#0B42#;
    GL_EDGE_FLAG                       : constant := 16#0B43#;
    GL_CULL_FACE                       : constant := 16#0B44#;
    GL_CULL_FACE_MODE                  : constant := 16#0B45#;
    GL_FRONT_FACE                      : constant := 16#0B46#;
    GL_LIGHTING                        : constant := 16#0B50#;
    GL_LIGHT_MODEL_LOCAL_VIEWER        : constant := 16#0B51#;
    GL_LIGHT_MODEL_TWO_SIDE            : constant := 16#0B52#;
    GL_LIGHT_MODEL_AMBIENT             : constant := 16#0B53#;
    GL_SHADE_MODEL                     : constant := 16#0B54#;
    GL_COLOR_MATERIAL_FACE             : constant := 16#0B55#;
    GL_COLOR_MATERIAL_PARAMETER        : constant := 16#0B56#;
    GL_COLOR_MATERIAL                  : constant := 16#0B57#;
    GL_FOG                             : constant := 16#0B60#;
    GL_FOG_INDEX                       : constant := 16#0B61#;
    GL_FOG_DENSITY                     : constant := 16#0B62#;
    GL_FOG_START                       : constant := 16#0B63#;
    GL_FOG_END                         : constant := 16#0B64#;
    GL_FOG_MODE                        : constant := 16#0B65#;
    GL_FOG_COLOR                       : constant := 16#0B66#;
    GL_DEPTH_RANGE                     : constant := 16#0B70#;
    GL_DEPTH_TEST                      : constant := 16#0B71#;
    GL_DEPTH_WRITEMASK                 : constant := 16#0B72#;
    GL_DEPTH_CLEAR_VALUE               : constant := 16#0B73#;
    GL_DEPTH_FUNC                      : constant := 16#0B74#;
    GL_ACCUM_CLEAR_VALUE               : constant := 16#0B80#;
    GL_STENCIL_TEST                    : constant := 16#0B90#;
    GL_STENCIL_CLEAR_VALUE             : constant := 16#0B91#;
    GL_STENCIL_FUNC                    : constant := 16#0B92#;
    GL_STENCIL_VALUE_MASK              : constant := 16#0B93#;
    GL_STENCIL_FAIL                    : constant := 16#0B94#;
    GL_STENCIL_PASS_DEPTH_FAIL         : constant := 16#0B95#;
    GL_STENCIL_PASS_DEPTH_PASS         : constant := 16#0B96#;
    GL_STENCIL_REF                     : constant := 16#0B97#;
    GL_STENCIL_WRITEMASK               : constant := 16#0B98#;
    GL_MATRIX_MODE                     : constant := 16#0BA0#;
    GL_NORMALIZE                       : constant := 16#0BA1#;
    GL_VIEWPORT                        : constant := 16#0BA2#;
    GL_MODELVIEW_STACK_DEPTH           : constant := 16#0BA3#;
    GL_PROJECTION_STACK_DEPTH          : constant := 16#0BA4#;
    GL_TEXTURE_STACK_DEPTH             : constant := 16#0BA5#;
    GL_MODELVIEW_MATRIX                : constant := 16#0BA6#;
    GL_PROJECTION_MATRIX               : constant := 16#0BA7#;
    GL_TEXTURE_MATRIX                  : constant := 16#0BA8#;
    GL_ATTRIB_STACK_DEPTH              : constant := 16#0BB0#;
    GL_CLIENT_ATTRIB_STACK_DEPTH       : constant := 16#0BB1#;
    GL_ALPHA_TEST                      : constant := 16#0BC0#;
    GL_ALPHA_TEST_FUNC                 : constant := 16#0BC1#;
    GL_ALPHA_TEST_REF                  : constant := 16#0BC2#;
    GL_DITHER                          : constant := 16#0BD0#;
    GL_BLEND_DST                       : constant := 16#0BE0#;
    GL_BLEND_SRC                       : constant := 16#0BE1#;
    GL_BLEND                           : constant := 16#0BE2#;
    GL_LOGIC_OP_MODE                   : constant := 16#0BF0#;
    GL_INDEX_LOGIC_OP                  : constant := 16#0BF1#;
    GL_COLOR_LOGIC_OP                  : constant := 16#0BF2#;
    GL_AUX_BUFFERS                     : constant := 16#0C00#;
    GL_DRAW_BUFFER                     : constant := 16#0C01#;
    GL_READ_BUFFER                     : constant := 16#0C02#;
    GL_SCISSOR_BOX                     : constant := 16#0C10#;
    GL_SCISSOR_TEST                    : constant := 16#0C11#;
    GL_INDEX_CLEAR_VALUE               : constant := 16#0C20#;
    GL_INDEX_WRITEMASK                 : constant := 16#0C21#;
    GL_COLOR_CLEAR_VALUE               : constant := 16#0C22#;
    GL_COLOR_WRITEMASK                 : constant := 16#0C23#;
    GL_INDEX_MODE                      : constant := 16#0C30#;
    GL_RGBA_MODE                       : constant := 16#0C31#;
    GL_DOUBLEBUFFER                    : constant := 16#0C32#;
    GL_STEREO                          : constant := 16#0C33#;
    GL_RENDER_MODE                     : constant := 16#0C40#;
    GL_PERSPECTIVE_CORRECTION_HINT     : constant := 16#0C50#;
    GL_POINT_SMOOTH_HINT               : constant := 16#0C51#;
    GL_LINE_SMOOTH_HINT                : constant := 16#0C52#;
    GL_POLYGON_SMOOTH_HINT             : constant := 16#0C53#;
    GL_FOG_HINT                        : constant := 16#0C54#;
    GL_TEXTURE_GEN_S                   : constant := 16#0C60#;
    GL_TEXTURE_GEN_T                   : constant := 16#0C61#;
    GL_TEXTURE_GEN_R                   : constant := 16#0C62#;
    GL_TEXTURE_GEN_Q                   : constant := 16#0C63#;
    GL_PIXEL_MAP_I_TO_I                : constant := 16#0C70#;
    GL_PIXEL_MAP_S_TO_S                : constant := 16#0C71#;
    GL_PIXEL_MAP_I_TO_R                : constant := 16#0C72#;
    GL_PIXEL_MAP_I_TO_G                : constant := 16#0C73#;
    GL_PIXEL_MAP_I_TO_B                : constant := 16#0C74#;
    GL_PIXEL_MAP_I_TO_A                : constant := 16#0C75#;
    GL_PIXEL_MAP_R_TO_R                : constant := 16#0C76#;
    GL_PIXEL_MAP_G_TO_G                : constant := 16#0C77#;
    GL_PIXEL_MAP_B_TO_B                : constant := 16#0C78#;
    GL_PIXEL_MAP_A_TO_A                : constant := 16#0C79#;
    GL_PIXEL_MAP_I_TO_I_SIZE           : constant := 16#0CB0#;
    GL_PIXEL_MAP_S_TO_S_SIZE           : constant := 16#0CB1#;
    GL_PIXEL_MAP_I_TO_R_SIZE           : constant := 16#0CB2#;
    GL_PIXEL_MAP_I_TO_G_SIZE           : constant := 16#0CB3#;
    GL_PIXEL_MAP_I_TO_B_SIZE           : constant := 16#0CB4#;
    GL_PIXEL_MAP_I_TO_A_SIZE           : constant := 16#0CB5#;
    GL_PIXEL_MAP_R_TO_R_SIZE           : constant := 16#0CB6#;
    GL_PIXEL_MAP_G_TO_G_SIZE           : constant := 16#0CB7#;
    GL_PIXEL_MAP_B_TO_B_SIZE           : constant := 16#0CB8#;
    GL_PIXEL_MAP_A_TO_A_SIZE           : constant := 16#0CB9#;
    GL_UNPACK_SWAP_BYTES               : constant := 16#0CF0#;
    GL_UNPACK_LSB_FIRST                : constant := 16#0CF1#;
    GL_UNPACK_ROW_LENGTH               : constant := 16#0CF2#;
    GL_UNPACK_SKIP_ROWS                : constant := 16#0CF3#;
    GL_UNPACK_SKIP_PIXELS              : constant := 16#0CF4#;
    GL_UNPACK_ALIGNMENT                : constant := 16#0CF5#;
    GL_PACK_SWAP_BYTES                 : constant := 16#0D00#;
    GL_PACK_LSB_FIRST                  : constant := 16#0D01#;
    GL_PACK_ROW_LENGTH                 : constant := 16#0D02#;
    GL_PACK_SKIP_ROWS                  : constant := 16#0D03#;
    GL_PACK_SKIP_PIXELS                : constant := 16#0D04#;
    GL_PACK_ALIGNMENT                  : constant := 16#0D05#;
    GL_MAP_COLOR                       : constant := 16#0D10#;
    GL_MAP_STENCIL                     : constant := 16#0D11#;
    GL_INDEX_SHIFT                     : constant := 16#0D12#;
    GL_INDEX_OFFSET                    : constant := 16#0D13#;
    GL_RED_SCALE                       : constant := 16#0D14#;
    GL_RED_BIAS                        : constant := 16#0D15#;
    GL_ZOOM_X                          : constant := 16#0D16#;
    GL_ZOOM_Y                          : constant := 16#0D17#;
    GL_GREEN_SCALE                     : constant := 16#0D18#;
    GL_GREEN_BIAS                      : constant := 16#0D19#;
    GL_BLUE_SCALE                      : constant := 16#0D1A#;
    GL_BLUE_BIAS                       : constant := 16#0D1B#;
    GL_ALPHA_SCALE                     : constant := 16#0D1C#;
    GL_ALPHA_BIAS                      : constant := 16#0D1D#;
    GL_DEPTH_SCALE                     : constant := 16#0D1E#;
    GL_DEPTH_BIAS                      : constant := 16#0D1F#;
    GL_MAX_EVAL_ORDER                  : constant := 16#0D30#;
    GL_MAX_LIGHTS                      : constant := 16#0D31#;
    GL_MAX_CLIP_PLANES                 : constant := 16#0D32#;
    GL_MAX_TEXTURE_SIZE                : constant := 16#0D33#;
    GL_MAX_PIXEL_MAP_TABLE             : constant := 16#0D34#;
    GL_MAX_ATTRIB_STACK_DEPTH          : constant := 16#0D35#;
    GL_MAX_MODELVIEW_STACK_DEPTH       : constant := 16#0D36#;
    GL_MAX_NAME_STACK_DEPTH            : constant := 16#0D37#;
    GL_MAX_PROJECTION_STACK_DEPTH      : constant := 16#0D38#;
    GL_MAX_TEXTURE_STACK_DEPTH         : constant := 16#0D39#;
    GL_MAX_VIEWPORT_DIMS               : constant := 16#0D3A#;
    GL_MAX_CLIENT_ATTRIB_STACK_DEPTH   : constant := 16#0D3B#;
    GL_SUBPIXEL_BITS                   : constant := 16#0D50#;
    GL_INDEX_BITS                      : constant := 16#0D51#;
    GL_RED_BITS                        : constant := 16#0D52#;
    GL_GREEN_BITS                      : constant := 16#0D53#;
    GL_BLUE_BITS                       : constant := 16#0D54#;
    GL_ALPHA_BITS                      : constant := 16#0D55#;
    GL_DEPTH_BITS                      : constant := 16#0D56#;
    GL_STENCIL_BITS                    : constant := 16#0D57#;
    GL_ACCUM_RED_BITS                  : constant := 16#0D58#;
    GL_ACCUM_GREEN_BITS                : constant := 16#0D59#;
    GL_ACCUM_BLUE_BITS                 : constant := 16#0D5A#;
    GL_ACCUM_ALPHA_BITS                : constant := 16#0D5B#;
    GL_NAME_STACK_DEPTH                : constant := 16#0D70#;
    GL_AUTO_NORMAL                     : constant := 16#0D80#;
    GL_MAP1_COLOR_4                    : constant := 16#0D90#;
    GL_MAP1_INDEX                      : constant := 16#0D91#;
    GL_MAP1_NORMAL                     : constant := 16#0D92#;
    GL_MAP1_TEXTURE_COORD_1            : constant := 16#0D93#;
    GL_MAP1_TEXTURE_COORD_2            : constant := 16#0D94#;
    GL_MAP1_TEXTURE_COORD_3            : constant := 16#0D95#;
    GL_MAP1_TEXTURE_COORD_4            : constant := 16#0D96#;
    GL_MAP1_VERTEX_3                   : constant := 16#0D97#;
    GL_MAP1_VERTEX_4                   : constant := 16#0D98#;
    GL_MAP2_COLOR_4                    : constant := 16#0DB0#;
    GL_MAP2_INDEX                      : constant := 16#0DB1#;
    GL_MAP2_NORMAL                     : constant := 16#0DB2#;
    GL_MAP2_TEXTURE_COORD_1            : constant := 16#0DB3#;
    GL_MAP2_TEXTURE_COORD_2            : constant := 16#0DB4#;
    GL_MAP2_TEXTURE_COORD_3            : constant := 16#0DB5#;
    GL_MAP2_TEXTURE_COORD_4            : constant := 16#0DB6#;
    GL_MAP2_VERTEX_3                   : constant := 16#0DB7#;
    GL_MAP2_VERTEX_4                   : constant := 16#0DB8#;
    GL_MAP1_GRID_DOMAIN                : constant := 16#0DD0#;
    GL_MAP1_GRID_SEGMENTS              : constant := 16#0DD1#;
    GL_MAP2_GRID_DOMAIN                : constant := 16#0DD2#;
    GL_MAP2_GRID_SEGMENTS              : constant := 16#0DD3#;
    GL_TEXTURE_1D                      : constant := 16#0DE0#;
    GL_TEXTURE_2D                      : constant := 16#0DE1#;
    GL_FEEDBACK_BUFFER_POINTER         : constant := 16#0DF0#;
    GL_FEEDBACK_BUFFER_SIZE            : constant := 16#0DF1#;
    GL_FEEDBACK_BUFFER_TYPE            : constant := 16#0DF2#;
    GL_SELECTION_BUFFER_POINTER        : constant := 16#0DF3#;
    GL_SELECTION_BUFFER_SIZE           : constant := 16#0DF4#;

    GL_TEXTURE_WIDTH                   : constant := 16#1000#;
    GL_TEXTURE_HEIGHT                  : constant := 16#1001#;
    GL_TEXTURE_INTERNAL_FORMAT         : constant := 16#1003#;
    GL_TEXTURE_BORDER_COLOR            : constant := 16#1004#;
    GL_TEXTURE_BORDER                  : constant := 16#1005#;

    GL_DONT_CARE                       : constant := 16#1100#;
    GL_FASTEST                         : constant := 16#1101#;
    GL_NICEST                          : constant := 16#1102#;

    GL_LIGHT0                          : constant := 16#4000#;
    GL_LIGHT1                          : constant := 16#4001#;
    GL_LIGHT2                          : constant := 16#4002#;
    GL_LIGHT3                          : constant := 16#4003#;
    GL_LIGHT4                          : constant := 16#4004#;
    GL_LIGHT5                          : constant := 16#4005#;
    GL_LIGHT6                          : constant := 16#4006#;
    GL_LIGHT7                          : constant := 16#4007#;

    GL_AMBIENT                         : constant := 16#1200#;
    GL_DIFFUSE                         : constant := 16#1201#;
    GL_SPECULAR                        : constant := 16#1202#;
    GL_POSITION                        : constant := 16#1203#;
    GL_SPOT_DIRECTION                  : constant := 16#1204#;
    GL_SPOT_EXPONENT                   : constant := 16#1205#;
    GL_SPOT_CUTOFF                     : constant := 16#1206#;
    GL_CONSTANT_ATTENUATION            : constant := 16#1207#;
    GL_LINEAR_ATTENUATION              : constant := 16#1208#;
    GL_QUADRATIC_ATTENUATION           : constant := 16#1209#;

    GL_COMPILE                         : constant := 16#1300#;
    GL_COMPILE_AND_EXECUTE             : constant := 16#1301#;

    GL_CLEAR                           : constant := 16#1500#;
    GL_AND                             : constant := 16#1501#;
    GL_AND_REVERSE                     : constant := 16#1502#;
    GL_COPY                            : constant := 16#1503#;
    GL_AND_INVERTED                    : constant := 16#1504#;
    GL_NOOP                            : constant := 16#1505#;
    GL_XOR                             : constant := 16#1506#;
    GL_OR                              : constant := 16#1507#;
    GL_NOR                             : constant := 16#1508#;
    GL_EQUIV                           : constant := 16#1509#;
    GL_INVERT                          : constant := 16#150A#;
    GL_OR_REVERSE                      : constant := 16#150B#;
    GL_COPY_INVERTED                   : constant := 16#150C#;
    GL_OR_INVERTED                     : constant := 16#150D#;
    GL_NAND                            : constant := 16#150E#;
    GL_SET                             : constant := 16#150F#;

    GL_EMISSION                        : constant := 16#1600#;
    GL_SHININESS                       : constant := 16#1601#;
    GL_AMBIENT_AND_DIFFUSE             : constant := 16#1602#;
    GL_COLOR_INDEXES                   : constant := 16#1603#;

    GL_MODELVIEW                       : constant := 16#1700#;
    GL_PROJECTION                      : constant := 16#1701#;
    GL_TEXTURE                         : constant := 16#1702#;

    GL_COLOR                           : constant := 16#1800#;
    GL_DEPTH                           : constant := 16#1801#;
    GL_STENCIL                         : constant := 16#1802#;

    GL_COLOR_INDEX                     : constant := 16#1900#;
    GL_STENCIL_INDEX                   : constant := 16#1901#;
    GL_DEPTH_COMPONENT                 : constant := 16#1902#;

    GL_RED                             : constant := 16#1903#;
    GL_GREEN                           : constant := 16#1904#;
    GL_BLUE                            : constant := 16#1905#;
    GL_ALPHA                           : constant := 16#1906#;

    GL_RGB                             : constant := 16#1907#;
    GL_RGBA                            : constant := 16#1908#;
    GL_LUMINANCE                       : constant := 16#1909#;
    GL_LUMINANCE_ALPHA                 : constant := 16#190A#;

    GL_BITMAP                          : constant := 16#1A00#;

    GL_POINT                           : constant := 16#1B00#;
    GL_LINE                            : constant := 16#1B01#;
    GL_FILL                            : constant := 16#1B02#;

    GL_RENDER                          : constant := 16#1C00#;
    GL_FEEDBACK                        : constant := 16#1C01#;
    GL_SELECT                          : constant := 16#1C02#;

    GL_FLAT                            : constant := 16#1D00#;
    GL_SMOOTH                          : constant := 16#1D01#;

    GL_KEEP                            : constant := 16#1E00#;
    GL_REPLACE                         : constant := 16#1E01#;
    GL_INCR                            : constant := 16#1E02#;
    GL_DECR                            : constant := 16#1E03#;

    GL_VENDOR                          : constant := 16#1F00#;
    GL_RENDERER                        : constant := 16#1F01#;
    GL_VERSION                         : constant := 16#1F02#;
    GL_EXTENSIONS                      : constant := 16#1F03#;

    GL_S                               : constant := 16#2000#;
    GL_T                               : constant := 16#2001#;
    GL_R                               : constant := 16#2002#;
    GL_Q                               : constant := 16#2003#;

    GL_MODULATE                        : constant := 16#2100#;
    GL_DECAL                           : constant := 16#2101#;

    GL_TEXTURE_ENV_MODE                : constant := 16#2200#;
    GL_TEXTURE_ENV_COLOR               : constant := 16#2201#;

    GL_TEXTURE_ENV                     : constant := 16#2300#;

    GL_EYE_LINEAR                      : constant := 16#2400#;
    GL_OBJECT_LINEAR                   : constant := 16#2401#;
    GL_SPHERE_MAP                      : constant := 16#2402#;

    GL_TEXTURE_GEN_MODE                : constant := 16#2500#;
    GL_OBJECT_PLANE                    : constant := 16#2501#;
    GL_EYE_PLANE                       : constant := 16#2502#;

    GL_NEAREST                         : constant := 16#2600#;
    GL_LINEAR                          : constant := 16#2601#;

    GL_NEAREST_MIPMAP_NEAREST          : constant := 16#2700#;
    GL_LINEAR_MIPMAP_NEAREST           : constant := 16#2701#;
    GL_NEAREST_MIPMAP_LINEAR           : constant := 16#2702#;
    GL_LINEAR_MIPMAP_LINEAR            : constant := 16#2703#;

    GL_TEXTURE_MAG_FILTER              : constant := 16#2800#;
    GL_TEXTURE_MIN_FILTER              : constant := 16#2801#;
    GL_TEXTURE_WRAP_S                  : constant := 16#2802#;
    GL_TEXTURE_WRAP_T                  : constant := 16#2803#;

    GL_CLAMP                           : constant := 16#2900#;
    GL_REPEAT                          : constant := 16#2901#;

    GL_CLIENT_PIXEL_STORE_BIT          : constant := 16#00000001#;
    GL_CLIENT_VERTEX_ARRAY_BIT         : constant := 16#00000002#;
    GL_CLIENT_ALL_ATTRIB_BITS          : constant := 16#ffffffff#;

    GL_POLYGON_OFFSET_FACTOR           : constant := 16#8038#;
    GL_POLYGON_OFFSET_UNITS            : constant := 16#2A00#;
    GL_POLYGON_OFFSET_POINT            : constant := 16#2A01#;
    GL_POLYGON_OFFSET_LINE             : constant := 16#2A02#;
    GL_POLYGON_OFFSET_FILL             : constant := 16#8037#;

    GL_ALPHA4                          : constant := 16#803B#;
    GL_ALPHA8                          : constant := 16#803C#;
    GL_ALPHA12                         : constant := 16#803D#;
    GL_ALPHA16                         : constant := 16#803E#;
    GL_LUMINANCE4                      : constant := 16#803F#;
    GL_LUMINANCE8                      : constant := 16#8040#;
    GL_LUMINANCE12                     : constant := 16#8041#;
    GL_LUMINANCE16                     : constant := 16#8042#;
    GL_LUMINANCE4_ALPHA4               : constant := 16#8043#;
    GL_LUMINANCE6_ALPHA2               : constant := 16#8044#;
    GL_LUMINANCE8_ALPHA8               : constant := 16#8045#;
    GL_LUMINANCE12_ALPHA4              : constant := 16#8046#;
    GL_LUMINANCE12_ALPHA12             : constant := 16#8047#;
    GL_LUMINANCE16_ALPHA16             : constant := 16#8048#;
    GL_INTENSITY                       : constant := 16#8049#;
    GL_INTENSITY4                      : constant := 16#804A#;
    GL_INTENSITY8                      : constant := 16#804B#;
    GL_INTENSITY12                     : constant := 16#804C#;
    GL_INTENSITY16                     : constant := 16#804D#;
    GL_R3_G3_B2                        : constant := 16#2A10#;
    GL_RGB4                            : constant := 16#804F#;
    GL_RGB5                            : constant := 16#8050#;
    GL_RGB8                            : constant := 16#8051#;
    GL_RGB10                           : constant := 16#8052#;
    GL_RGB12                           : constant := 16#8053#;
    GL_RGB16                           : constant := 16#8054#;
    GL_RGBA2                           : constant := 16#8055#;
    GL_RGBA4                           : constant := 16#8056#;
    GL_RGB5_A1                         : constant := 16#8057#;
    GL_RGBA8                           : constant := 16#8058#;
    GL_RGB10_A2                        : constant := 16#8059#;
    GL_RGBA12                          : constant := 16#805A#;
    GL_RGBA16                          : constant := 16#805B#;
    GL_TEXTURE_RED_SIZE                : constant := 16#805C#;
    GL_TEXTURE_GREEN_SIZE              : constant := 16#805D#;
    GL_TEXTURE_BLUE_SIZE               : constant := 16#805E#;
    GL_TEXTURE_ALPHA_SIZE              : constant := 16#805F#;
    GL_TEXTURE_LUMINANCE_SIZE          : constant := 16#8060#;
    GL_TEXTURE_INTENSITY_SIZE          : constant := 16#8061#;
    GL_PROXY_TEXTURE_1D                : constant := 16#8063#;
    GL_PROXY_TEXTURE_2D                : constant := 16#8064#;

    GL_TEXTURE_PRIORITY                : constant := 16#8066#;
    GL_TEXTURE_RESIDENT                : constant := 16#8067#;
    GL_TEXTURE_BINDING_1D              : constant := 16#8068#;
    GL_TEXTURE_BINDING_2D              : constant := 16#8069#;

    GL_VERTEX_ARRAY                    : constant := 16#8074#;
    GL_NORMAL_ARRAY                    : constant := 16#8075#;
    GL_COLOR_ARRAY                     : constant := 16#8076#;
    GL_INDEX_ARRAY                     : constant := 16#8077#;
    GL_TEXTURE_COORD_ARRAY             : constant := 16#8078#;
    GL_EDGE_FLAG_ARRAY                 : constant := 16#8079#;
    GL_VERTEX_ARRAY_SIZE               : constant := 16#807A#;
    GL_VERTEX_ARRAY_TYPE               : constant := 16#807B#;
    GL_VERTEX_ARRAY_STRIDE             : constant := 16#807C#;
    GL_NORMAL_ARRAY_TYPE               : constant := 16#807E#;
    GL_NORMAL_ARRAY_STRIDE             : constant := 16#807F#;
    GL_COLOR_ARRAY_SIZE                : constant := 16#8081#;
    GL_COLOR_ARRAY_TYPE                : constant := 16#8082#;
    GL_COLOR_ARRAY_STRIDE              : constant := 16#8083#;
    GL_INDEX_ARRAY_TYPE                : constant := 16#8085#;
    GL_INDEX_ARRAY_STRIDE              : constant := 16#8086#;
    GL_TEXTURE_COORD_ARRAY_SIZE        : constant := 16#8088#;
    GL_TEXTURE_COORD_ARRAY_TYPE        : constant := 16#8089#;
    GL_TEXTURE_COORD_ARRAY_STRIDE      : constant := 16#808A#;
    GL_EDGE_FLAG_ARRAY_STRIDE          : constant := 16#808C#;
    GL_VERTEX_ARRAY_POINTER            : constant := 16#808E#;
    GL_NORMAL_ARRAY_POINTER            : constant := 16#808F#;
    GL_COLOR_ARRAY_POINTER             : constant := 16#8090#;
    GL_INDEX_ARRAY_POINTER             : constant := 16#8091#;
    GL_TEXTURE_COORD_ARRAY_POINTER     : constant := 16#8092#;
    GL_EDGE_FLAG_ARRAY_POINTER         : constant := 16#8093#;
    GL_V2F                             : constant := 16#2A20#;
    GL_V3F                             : constant := 16#2A21#;
    GL_C4UB_V2F                        : constant := 16#2A22#;
    GL_C4UB_V3F                        : constant := 16#2A23#;
    GL_C3F_V3F                         : constant := 16#2A24#;
    GL_N3F_V3F                         : constant := 16#2A25#;
    GL_C4F_N3F_V3F                     : constant := 16#2A26#;
    GL_T2F_V3F                         : constant := 16#2A27#;
    GL_T4F_V4F                         : constant := 16#2A28#;
    GL_T2F_C4UB_V3F                    : constant := 16#2A29#;
    GL_T2F_C3F_V3F                     : constant := 16#2A2A#;
    GL_T2F_N3F_V3F                     : constant := 16#2A2B#;
    GL_T2F_C4F_N3F_V3F                 : constant := 16#2A2C#;
    GL_T4F_C4F_N3F_V4F                 : constant := 16#2A2D#;

    GL_EXT_vertex_array                : constant := 1;
    GL_EXT_bgra                        : constant := 1;
    GL_EXT_paletted_texture            : constant := 1;
    GL_WIN_swap_hint                   : constant := 1;
    GL_WIN_draw_range_elements         : constant := 1;

    GL_VERTEX_ARRAY_EXT                : constant := 16#8074#;
    GL_NORMAL_ARRAY_EXT                : constant := 16#8075#;
    GL_COLOR_ARRAY_EXT                 : constant := 16#8076#;
    GL_INDEX_ARRAY_EXT                 : constant := 16#8077#;
    GL_TEXTURE_COORD_ARRAY_EXT         : constant := 16#8078#;
    GL_EDGE_FLAG_ARRAY_EXT             : constant := 16#8079#;
    GL_VERTEX_ARRAY_SIZE_EXT           : constant := 16#807A#;
    GL_VERTEX_ARRAY_TYPE_EXT           : constant := 16#807B#;
    GL_VERTEX_ARRAY_STRIDE_EXT         : constant := 16#807C#;
    GL_VERTEX_ARRAY_COUNT_EXT          : constant := 16#807D#;
    GL_NORMAL_ARRAY_TYPE_EXT           : constant := 16#807E#;
    GL_NORMAL_ARRAY_STRIDE_EXT         : constant := 16#807F#;
    GL_NORMAL_ARRAY_COUNT_EXT          : constant := 16#8080#;
    GL_COLOR_ARRAY_SIZE_EXT            : constant := 16#8081#;
    GL_COLOR_ARRAY_TYPE_EXT            : constant := 16#8082#;
    GL_COLOR_ARRAY_STRIDE_EXT          : constant := 16#8083#;
    GL_COLOR_ARRAY_COUNT_EXT           : constant := 16#8084#;
    GL_INDEX_ARRAY_TYPE_EXT            : constant := 16#8085#;
    GL_INDEX_ARRAY_STRIDE_EXT          : constant := 16#8086#;
    GL_INDEX_ARRAY_COUNT_EXT           : constant := 16#8087#;
    GL_TEXTURE_COORD_ARRAY_SIZE_EXT    : constant := 16#8088#;
    GL_TEXTURE_COORD_ARRAY_TYPE_EXT    : constant := 16#8089#;
    GL_TEXTURE_COORD_ARRAY_STRIDE_EXT  : constant := 16#808A#;
    GL_TEXTURE_COORD_ARRAY_COUNT_EXT   : constant := 16#808B#;
    GL_EDGE_FLAG_ARRAY_STRIDE_EXT      : constant := 16#808C#;
    GL_EDGE_FLAG_ARRAY_COUNT_EXT       : constant := 16#808D#;
    GL_VERTEX_ARRAY_POINTER_EXT        : constant := 16#808E#;
    GL_NORMAL_ARRAY_POINTER_EXT        : constant := 16#808F#;
    GL_COLOR_ARRAY_POINTER_EXT         : constant := 16#8090#;
    GL_INDEX_ARRAY_POINTER_EXT         : constant := 16#8091#;
    GL_TEXTURE_COORD_ARRAY_POINTER_EXT : constant := 16#8092#;
    GL_EDGE_FLAG_ARRAY_POINTER_EXT     : constant := 16#8093#;

    --	NOTE:	The following is an artifact from the initial C-header
    --		translation; it seems to have no effect on the compilation.
    --	unsupported macro		: GL_DOUBLE_EXT GL_DOUBLE

    GL_BGR_EXT                         : constant := 16#80E0#;
    GL_BGRA_EXT                        : constant := 16#80E1#;

    GL_COLOR_TABLE_FORMAT_EXT          : constant := 16#80D8#;
    GL_COLOR_TABLE_WIDTH_EXT           : constant := 16#80D9#;
    GL_COLOR_TABLE_RED_SIZE_EXT        : constant := 16#80DA#;
    GL_COLOR_TABLE_GREEN_SIZE_EXT      : constant := 16#80DB#;
    GL_COLOR_TABLE_BLUE_SIZE_EXT       : constant := 16#80DC#;
    GL_COLOR_TABLE_ALPHA_SIZE_EXT      : constant := 16#80DD#;
    GL_COLOR_TABLE_LUMINANCE_SIZE_EXT  : constant := 16#80DE#;
    GL_COLOR_TABLE_INTENSITY_SIZE_EXT  : constant := 16#80DF#;

    GL_COLOR_INDEX1_EXT                : constant := 16#80E2#;
    GL_COLOR_INDEX2_EXT                : constant := 16#80E3#;
    GL_COLOR_INDEX4_EXT                : constant := 16#80E4#;
    GL_COLOR_INDEX8_EXT                : constant := 16#80E5#;
    GL_COLOR_INDEX12_EXT               : constant := 16#80E6#;
    GL_COLOR_INDEX16_EXT               : constant := 16#80E7#;

    GL_MAX_ELEMENTS_VERTICES_WIN       : constant := 16#80E8#;
    GL_MAX_ELEMENTS_INDICES_WIN        : constant := 16#80E9#;

    GL_PHONG_WIN                       : constant := 16#80EA#;
    GL_PHONG_HINT_WIN                  : constant := 16#80EB#;

    GL_FOG_SPECULAR_TEXTURE_WIN        : constant := 16#80EC#;

    -- Additions for OpenGL versions, not covered in the .h files.
    GL_CONSTANT_COLOR				: constant :=	16#8001#;
    GL_ONE_MINUS_CONSTANT_COLOR			: constant :=	16#8002#;
    GL_CONSTANT_ALPHA				: Constant := 	16#8003#;
    GL_COLOR_SUM				: constant :=	16#8458#;
    GL_COLOR_TABLE				: constant :=	16#80D0#;
    GL_CONVOLUTION_1D				: constant :=	16#8010#;
    GL_CONVOLUTION_2D				: constant :=	16#8011#;
    GL_HISTOGRAM				: constant :=	16#8024#;
    GL_MINMAX					: constant :=	16#802E#;
    GL_MULTISAMPLE				: constant :=	16#809D#;
    GL_POINT_SPRITE				: constant :=	16#8861#;
    GL_POST_COLOR_MATRIX_COLOR_TABLE		: constant :=	16#80D2#;
    GL_POST_CONVOLUTION_COLOR_TABLE		: constant :=	16#80D1#;
    GL_RESCALE					: constant :=	16#803A#;
    GL_SAMPLE_ALPHA_TO_COVERAGE			: constant :=	16#809E#;
    GL_SAMPLE_ALPHA_TO_ONE			: constant :=	16#809F#;
    GL_SAMPLE_COVERAGE				: constant :=	16#80A0#;
    GL_SEPARABLE_2D				: constant :=	16#8012#;
    GL_TEXTURE_3D				: constant :=	16#806F#;
    GL_TEXTURE_CUBE_MAP				: constant :=	16#8513#;
    GL_VERTEX_PROGRAM_POINT_SIZE		: constant :=	16#8642#;
    GL_VERTEX_PROGRAM_TWO_SIDE			: constant :=	16#8643#;
    GL_FOG_COORD_ARRAY				: constant :=	16#8457#;
    GL_SECONDARY_COLOR_ARRAY			: constant :=	16#845E#;

    GL_ACTIVE_TEXTURE				: Constant :=	16#84E0#;
    GL_ALIASED_POINT_SIZE_RANGE			: Constant :=	16#846D#;
    GL_ALIASED_LINE_WIDTH_RANGE			: Constant :=	16#846E#;
    GL_ARRAY_BUFFER_BINDING			: Constant :=	16#8894#;
    GL_BLEND_COLOR				: Constant :=	16#8005#;
    GL_BLEND_DST_ALPHA				: Constant :=	16#80CA#;
    GL_BLEND_DST_RGB				: Constant :=	16#80C8#;
    GL_BLEND_EQUATION				: Constant :=	16#8009#;
    GL_BLEND_EQUATION_RGB			: Constant :=
	GL_BLEND_EQUATION;
    GL_BLEND_EQUATION_ALPHA			: Constant :=	16#883D#;
    GL_BLEND_SRC_ALPHA				: Constant :=	16#80CB#;
    GL_BLEND_SRC_RGB				: Constant :=	16#80C9#;
    GL_CLIENT_ACTIVE_TEXTURE			: Constant :=	16#84E1#;
    GL_COLOR_ARRAY_BUFFER_BINDING		: Constant :=	16#8898#;
    GL_COLOR_MATRIX				: Constant :=	16#80B1#;
    GL_COLOR_MATRIX_STACK_DEPTH			: Constant :=	16#80B2#;
    GL_COMPRESSED_TEXTURE_FORMATS		: Constant :=	16#86A3#;
    GL_CURRENT_FOG_COORD			: Constant :=	16#8453#;
    GL_CURRENT_PROGRAM				: Constant :=	16#8B8D#;
    GL_CURRENT_RASTER_SECONDARY_COLOR		: Constant :=	16#845F#;
    GL_CURRENT_SECONDARY_COLOR			: Constant :=	16#8459#;
    GL_EDGE_FLAG_ARRAY_BUFFER_BINDING		: Constant :=	16#889B#;
    GL_ELEMENT_ARRAY_BUFFER_BINDING		: Constant :=	16#8895#;
    GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING	: Constant:=	16#889D#;
    GL_FOG_COORD_ARRAY_BUFFER_BINDING		: Constant :=
	GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING ;
    GL_FOG_COORDINATE_ARRAY_STRIDE		: Constant :=	16#8455#;
    GL_FOG_COORD_ARRAY_STRIDE			: Constant :=
	GL_FOG_COORDINATE_ARRAY_STRIDE;
    GL_FOG_COORDINATE_ARRAY_TYPE		: Constant :=	16#8454#;
    GL_FOG_COORD_ARRAY_TYPE			: Constant :=
	GL_FOG_COORDINATE_ARRAY_TYPE;
    GL_FOG_COORD_SRC				: Constant :=	16#8450#;
    GL_FRAGMENT_SHADER_DERIVATIVE_HINT		: Constant :=	16#8B8B#;
    GL_GENERATE_MIPMAP_HINT			: Constant :=	16#8192#;
    GL_INDEX_ARRAY_BUFFER_BINDING		: Constant :=	16#8899#;
    GL_LIGHT_MODEL_COLOR_CONTROL		: Constant :=	16#81F8#;
    GL_MAX_3D_TEXTURE_SIZE			: Constant :=	16#8073#;
    GL_MAX_COLOR_MATRIX_STACK_DEPTH		: Constant :=	16#80B3#;
    GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS		: Constant :=	16#8B4D#;
    GL_MAX_CUBE_MAP_TEXTURE_SIZE		: Constant :=	16#851C#;
    GL_MAX_DRAW_BUFFERS				: Constant :=	16#8824#;
    GL_MAX_ELEMENTS_INDICES			: Constant :=	16#80E9#;
    GL_MAX_ELEMENTS_VERTICES			: Constant :=	16#80E8#;
    GL_MAX_FRAGMENT_UNIFORM_COMPONENTS		: Constant :=	16#8B49#;
    GL_MAX_TEXTURE_COORDS			: Constant :=	16#8871#;
    GL_MAX_TEXTURE_IMAGE_UNITS			: Constant :=	16#8872#;
    GL_MAX_TEXTURE_LOD_BIAS			: Constant :=	16#84FD#;
    GL_MAX_TEXTURE_UNITS			: Constant :=	16#84E2#;
    GL_MAX_VARYING_FLOATS			: Constant :=	16#8B4B#;
    GL_MAX_VERTEX_ATTRIBS			: Constant :=	16#8869#;
    GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS		: Constant :=	16#8B4C#;
    GL_MAX_VERTEX_UNIFORM_COMPONENTS		: Constant :=	16#8B4A#;
    GL_NORMAL_ARRAY_BUFFER_BINDING		: Constant :=	16#8897#;
    GL_NUM_COMPRESSED_TEXTURE_FORMATS		: Constant :=	16#86A2#;
    GL_PACK_IMAGE_HEIGHT			: Constant :=	16#806C#;
    GL_PACK_SKIP_IMAGES				: Constant :=	16#806B#;
    GL_PIXEL_PACK_BUFFER_BINDING		: Constant :=	16#88ED#;
    GL_PIXEL_UNPACK_BUFFER_BINDING		: Constant :=	16#88EF#;
    GL_POINT_DISTANCE_ATTENUATION		: Constant :=	16#8129#;
    GL_POINT_FADE_THRESHOLD_SIZE		: Constant :=	16#8128#;
    GL_POINT_SIZE_MAX				: Constant :=	16#8127#;
    GL_POINT_SIZE_MIN				: Constant :=	16#8126#;
    GL_POST_COLOR_MATRIX_RED_BIAS		: Constant :=	16#80B8#;
    GL_POST_COLOR_MATRIX_GREEN_BIAS		: Constant :=	16#80B9#;
    GL_POST_COLOR_MATRIX_BLUE_BIAS		: Constant :=	16#80BA#;
    GL_POST_COLOR_MATRIX_ALPHA_BIAS		: Constant :=	16#80BB#;
    GL_POST_COLOR_MATRIX_RED_SCALE		: Constant :=	16#80B4#;
    GL_POST_COLOR_MATRIX_GREEN_SCALE		: Constant :=	16#80B5#;
    GL_POST_COLOR_MATRIX_BLUE_SCALE		: Constant :=	16#80B6#;
    GL_POST_COLOR_MATRIX_ALPHA_SCALE		: Constant :=	16#80B7#;
    GL_POST_CONVOLUTION_RED_BIAS		: Constant :=	16#8020#;
    GL_POST_CONVOLUTION_GREEN_BIAS		: Constant :=	16#8021#;
    GL_POST_CONVOLUTION_BLUE_BIAS		: Constant :=	16#8022#;
    GL_POST_CONVOLUTION_ALPHA_BIAS		: Constant :=	16#8023#;
    GL_POST_CONVOLUTION_RED_SCALE		: Constant :=	16#801C#;
    GL_POST_CONVOLUTION_GREEN_SCALE		: Constant :=	16#801D#;
    GL_POST_CONVOLUTION_BLUE_SCALE		: Constant :=	16#801E#;
    GL_POST_CONVOLUTION_ALPHA_SCALE		: Constant :=	16#801F#;
    GL_RESCALE_NORMAL				: Constant :=	16#803A#;
    GL_SAMPLE_BUFFERS				: Constant :=	16#80A8#;
    GL_SAMPLE_COVERAGE_VALUE			: Constant :=	16#80AA#;
    GL_SAMPLE_COVERAGE_INVERT			: Constant :=	16#80AB#;
    GL_SAMPLES					: Constant :=	16#80A9#;
    GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING	: Constant :=	16#889C#;
    GL_SECONDARY_COLOR_ARRAY_SIZE		: Constant :=	16#845A#;
    GL_SECONDARY_COLOR_ARRAY_STRIDE		: Constant :=	16#845C#;
    GL_SECONDARY_COLOR_ARRAY_TYPE		: Constant :=	16#845B#;
--      GL_SMOOTH_LINE_WIDTH_RANGE : Constant :=		16#0B22#;
--      GL_SMOOTH_LINE_WIDTH_GRANULARITY : Constant :=	16#0B23#;
--      GL_SMOOTH_POINT_SIZE_RANGE : Constant :=		16#0B12#;
--      GL_SMOOTH_POINT_SIZE_GRANULARITY : Constant :=	16#0B13#;
    GL_STENCIL_BACK_FAIL			: Constant :=	16#8801#;
    GL_STENCIL_BACK_FUNC			: Constant :=	16#8800#;
    GL_STENCIL_BACK_PASS_DEPTH_FAIL		: Constant :=	16#8802#;
    GL_STENCIL_BACK_PASS_DEPTH_PASS		: Constant :=	16#8803#;
    GL_STENCIL_BACK_REF				: Constant :=	16#8CA3#;
    GL_STENCIL_BACK_VALUE_MASK			: Constant :=	16#8CA4#;
    GL_STENCIL_BACK_WRITEMASK			: Constant :=	16#8CA5#;
    GL_TEXTURE_BINDING_3D			: Constant :=	16#806A#;
    GL_TEXTURE_BINDING_CUBE_MAP			: Constant :=	16#8514#;
    GL_TEXTURE_COMPRESSION_HINT			: Constant :=	16#84EF#;
    GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING	: Constant :=	16#889A#;
    GL_TRANSPOSE_COLOR_MATRIX			: Constant :=	16#84E6#;
    GL_TRANSPOSE_MODELVIEW_MATRIX		: Constant :=	16#84E3#;
    GL_TRANSPOSE_PROJECTION_MATRIX		: Constant :=	16#84E4#;
    GL_TRANSPOSE_TEXTURE_MATRIX			: Constant :=	16#84E5#;
    GL_UNPACK_IMAGE_HEIGHT			: Constant :=	16#806E#;
    GL_UNPACK_SKIP_IMAGES			: Constant :=	16#806D#;
    GL_VERTEX_ARRAY_BUFFER_BINDING		: Constant :=	16#8896#;
    GL_TABLE_TOO_LARGE				: Constant :=	16#8031#;
    GL_SHADING_LANGUAGE_VERSION			: Constant :=	16#8B8C#;

    GL_BGR					: constant :=	16#80E0#;
    GL_BGRA					: constant :=	16#80E1#;
    GL_UNSIGNED_BYTE_3_3_2			: constant :=	16#8032#;
    GL_UNSIGNED_BYTE_2_3_3_REV			: constant :=	16#8362#;
    GL_UNSIGNED_SHORT_5_6_5			: constant :=	16#8363#;
    GL_UNSIGNED_SHORT_5_6_5_REV			: constant :=	16#8364#;
    GL_UNSIGNED_SHORT_4_4_4_4			: constant :=	16#8033#;
    GL_UNSIGNED_SHORT_4_4_4_4_REV		: constant :=	16#8365#;
    GL_UNSIGNED_SHORT_5_5_5_1			: constant :=	16#8034#;
    GL_UNSIGNED_SHORT_1_5_5_5_REV		: constant :=	16#8366#;
    GL_UNSIGNED_INT_8_8_8_8			: constant :=	16#8035#;
    GL_UNSIGNED_INT_8_8_8_8_REV			: constant :=	16#8367#;
    GL_UNSIGNED_INT_10_10_10_2			: constant :=	16#8036#;
    GL_UNSIGNED_INT_2_10_10_10_REV		: constant :=	16#8368#;

    GL_INCR_WRAP				: constant :=	16#8507#;
    GL_DECR_WRAP				: constant :=	16#8508#;
    GL_NORMAL_MAP				: constant :=	16#8511#;
    GL_REFLECTION_MAP				: constant :=	16#8512#;
    GL_TEXTURE_FILTER_CONTROL			: constant :=	16#8500#;
    GL_TEXTURE_LOD_BIAS				: constant :=	16#8501#;
    GL_COMBINE					: constant :=	16#8570#;
    GL_COMBINE_RGB				: constant :=	16#8571#;
    GL_COMBINE_ALPHA				: constant :=	16#8572#;
    GL_SRC0_RGB					: constant :=	16#8580#;
    GL_SRC1_RGB					: constant :=	16#8581#;
    GL_SRC2_RGB					: constant :=	16#8582#;
    GL_SRC0_ALPHA				: constant :=	16#8588#;
    GL_SRC1_ALPHA				: constant :=	16#8589#;
    GL_SRC2_ALPHA				: constant :=	16#858A#;
    GL_OPERAND0_RGB				: constant :=	16#8590#;
    GL_OPERAND1_RGB				: constant :=	16#8591#;
    GL_OPERAND2_RGB				: constant :=	16#8592#;
    GL_OPERAND0_ALPHA				: constant :=	16#8598#;
    GL_OPERAND1_ALPHA				: constant :=	16#8599#;
    GL_OPERAND2_ALPHA				: constant :=	16#859A#;
    GL_RGB_SCALE				: constant :=	16#8573#;
    GL_ADD_SIGNED				: constant :=	16#8574#;
    GL_INTERPOLATE				: constant :=	16#8575#;
    GL_SUBTRACT					: constant :=	16#84E7#;
    GL_CONSTANT					: constant :=	16#8576#;
    GL_PRIMARY_COLOR				: constant :=	16#8577#;
    GL_PREVIOUS					: constant :=	16#8578#;
    GL_COORD_REPLACE				: constant :=	16#8862#;
    GL_TEXTURE_MIN_LOD				: constant :=	16#813A#;
    GL_TEXTURE_MAX_LOD				: constant :=	16#813B#;

    GL_TEXTURE_BASE_LEVEL			: constant :=	16#813C#;
    GL_TEXTURE_MAX_LEVEL			: constant :=	16#813D#;
    GL_TEXTURE_WRAP_R				: constant :=	16#8072#;
    GL_TEXTURE_COMPARE_MODE			: constant :=	16#884C#;
    GL_TEXTURE_COMPARE_FUNC			: constant :=	16#884D#;
    GL_DEPTH_TEXTURE_MODE			: constant :=	16#884B#;
    GL_GENERATE_MIPMAP				: constant :=	16#8191#;
    GL_TEXTURE_CUBE_MAP_POSITIVE_X		: constant :=	16#8515#;
    GL_TEXTURE_CUBE_MAP_NEGATIVE_X		: constant :=	16#8516#;
    GL_TEXTURE_CUBE_MAP_POSITIVE_Y		: constant :=	16#8517#;
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Y		: constant :=	16#8518#;
    GL_TEXTURE_CUBE_MAP_POSITIVE_Z		: constant :=	16#8519#;
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Z		: constant :=	16#851A#;
    GL_PROXY_TEXTURE_CUBE_MAP			: constant :=	16#851B#;
    GL_PROXY_TEXTURE_3D				: constant :=	16#8070#;
    GL_TEXTURE_DEPTH				: constant :=	16#8071#;
    GL_TEXTURE_DEPTH_SIZE			: constant :=	16#884A#;
    GL_TEXTURE_COMPRESSED_IMAGE_SIZE		: constant :=	16#86A0#;
    GL_TEXTURE_COMPRESSED			: constant :=	16#86A1#;
    GL_COMPRESSED_ALPHA				: constant :=	16#84E9#;
    GL_COMPRESSED_LUMINANCE			: constant :=	16#84EA#;
    GL_COMPRESSED_LUMINANCE_ALPHA		: constant :=	16#84EB#;
    GL_COMPRESSED_INTENSITY			: constant :=	16#84EC#;
    GL_COMPRESSED_RGB				: constant :=	16#84ED#;
    GL_COMPRESSED_RGBA				: constant :=	16#84EE#;
    GL_DEPTH_COMPONENT16			: constant :=	16#81A5#;
    GL_DEPTH_COMPONENT24			: constant :=	16#81A6#;
    GL_DEPTH_COMPONENT32			: constant :=	16#81A7#;
    GL_SLUMINANCE				: constant :=	16#8C46#;
    GL_SLUMINANCE8				: constant :=	16#8C47#;
    GL_SLUMINANCE_ALPHA				: constant :=	16#8C44#;
    GL_SLUMINANCE8_ALPHA8			: constant :=	16#8C45#;
    GL_SRGB					: constant :=	16#8C40#;
    GL_SRGB8					: constant :=	16#8C41#;
    GL_SRGB_ALPHA				: constant :=	16#8C42#;
    GL_SRGB8_ALPHA8				: constant :=	16#8C43#;

End Constants;
Use Constants;


--------------------------------------------------------------------------------
----   ENUM-TYPES	TYPES SUBSETTING/RESTRICTING ENUMERATION PARAMETERS.----
--------------------------------------------------------------------------------

    For	Chanel_Indices Use
      (
       Red	=> GL_RED,	-- 16#1903#,
       Green	=> GL_GREEN,	-- 16#1904#,
       Blue	=> GL_BLUE,	-- 16#1905#,
       Alpha	=> GL_ALPHA	-- 16#1906#
      );

    Type Comparisions is (
	NEVER,		LESS,		EQUAL,		LEQUAL,
	GREATER,	NOTEQUAL,	GEQUAL,		ALWAYS
			 )	with size => Enum'Size;

    Type Source_Factor is (
		ZERO,
		ONE,
		SRC_COLOR,
		ONE_MINUS_SRC_COLOR,
		SRC_ALPHA,
		ONE_MINUS_SRC_ALPHA,
		DST_ALPHA,
		ONE_MINUS_DST_ALPHA,
		DST_COLOR,
		ONE_MINUS_DST_COLOR,
		SRC_ALPHA_SATURATE,
		CONSTANT_COLOR,
		ONE_MINUS_CONSTANT_COLOR,
		CONSTANT_ALPHA,
		ONE_MINUS_CONSTANT_ALPHA
			  ) with Size => Enum'Size;

    -- Values prefixed with "OP_" to prevent clashes with keywords.
    Type Logic_Operators is (
	OP_CLEAR,		OP_AND,			OP_AND_REVERSE,
	OP_COPY,		OP_AND_INVERTED,	OP_NOOP,
	OP_XOR,			OP_OR,			OP_NOR,
	OP_EQUIV,		OP_INVERT,		OP_OR_REVERSE,
	OP_COPY_INVERTED,	OP_OR_INVERTED,		OP_NAND,
	OP_SET
		)	with SIZE => Enum'Size;

    Type Face is (
	FRONT,		BACK,		FRONT_AND_BACK
		 ) with size => Enum'Size;

    Type Orientation is (Clockwise, Counterclockwise) with size => Enum'Size;

    Type Raster_Mode is (
	POINT,		LINE,		FILL
		   )  with size => Enum'Size;

    Type Clipping_Plane is (
	CLIP_PLANE_1,		CLIP_PLANE_2,		CLIP_PLANE_3,
	CLIP_PLANE_4,		CLIP_PLANE_5,		CLIP_PLANE_6
		) with Size => Enum'Size;

    Type Drawing_Mode is (
	NONE,			FRONT_LEFT,		FRONT_RIGHT,
	BACK_LEFT,		BACK_RIGHT,		FRONT,
	BACK,			LEFT,			RIGHT,
	FRONT_AND_BACK,		AUX_1,			AUX_2,
	AUX_3,			AUX_4
			 ) with size => Enum'Size;

    Type Lighting_Style is (
	AMBIENT,		DIFFUSE,		SPECULAR,
	POSITION,		SPOT_DIRECTION,		SPOT_EXPONENT,
	SPOT_CUTOFF,		CONSTANT_ATTENUATION,	LINEAR_ATTENUATION,
	QUADRATIC_ATTENUATION
		  )	with Size => Enum'Size;

    Type Light_Source is(
	LIGHT_1,	LIGHT_2,	LIGHT_3,	LIGHT_4,
	LIGHT_5,	LIGHT_6,	LIGHT_7,	LIGHT_8
			)	with size => Enum'Size;


    Type Capability is (
	POINT_SMOOTH,
	LINE_SMOOTH,
	LINE_STIPPLE,
	POLYGON_SMOOTH,
	POLYGON_STIPPLE,
	CULL_FACE,
	LIGHTING,
	COLOR_MATERIAL,
	FOG,
	DEPTH_TEST,
	STENCIL_TEST,
	NORMALIZE,
	ALPHA_TEST,
	DITHER,
	BLEND,
	INDEX_LOGIC_OP,
	COLOR_LOGIC_OP,
	SCISSOR_TEST,
	TEXTURE_GEN_S,
	TEXTURE_GEN_T,
	TEXTURE_GEN_R,
	TEXTURE_GEN_Q,
	AUTO_NORMAL,
	MAP1_COLOR_4,
	MAP1_INDEX,
	MAP1_NORMAL,
	MAP1_TEXTURE_COORD_1,
	MAP1_TEXTURE_COORD_2,
	MAP1_TEXTURE_COORD_3,
	MAP1_TEXTURE_COORD_4,
	MAP1_VERTEX_3,
	MAP1_VERTEX_4,
	MAP2_COLOR_4,
	MAP2_INDEX,
	MAP2_NORMAL,
	MAP2_TEXTURE_COORD_1,
	MAP2_TEXTURE_COORD_2,
	MAP2_TEXTURE_COORD_3,
	MAP2_TEXTURE_COORD_4,
	MAP2_VERTEX_3,
	MAP2_VERTEX_4,
	TEXTURE_1D,
	TEXTURE_2D,
	POLYGON_OFFSET_POINT,
	POLYGON_OFFSET_LINE,
	CLIP_PLANE_1,
	CLIP_PLANE_2,
	CLIP_PLANE_3,
	CLIP_PLANE_4,
	CLIP_PLANE_5,
	CLIP_PLANE_6,
	LIGHT_1,
	LIGHT_2,
	LIGHT_3,
	LIGHT_4,
	LIGHT_5,
	LIGHT_6,
	LIGHT_7,
	LIGHT_8,
	CONVOLUTION_1D,
	CONVOLUTION_2D,
	SEPARABLE_2D,
	HISTOGRAM,
	MINMAX,
	POLYGON_OFFSET_FILL,
	RESCALE_NORMAL,
	TEXTURE_3D,
	MULTISAMPLE,
	SAMPLE_ALPHA_TO_COVERAGE,
	SAMPLE_ALPHA_TO_ONE,
	SAMPLE_COVERAGE,
	COLOR_TABLE,
	POST_CONVOLUTION_COLOR_TABLE,
	POST_COLOR_MATRIX_COLOR_TABLE,
	COLOR_SUM,
	TEXTURE_CUBE_MAP,
	VERTEX_PROGRAM_POINT_SIZE,
	VERTEX_PROGRAM_TWO_SIDE,
	POINT_SPRITE
		    ) with Size => Enum'Size;

    Type Client_Capibility is (
	VERTEX_ARRAY,
	NORMAL_ARRAY,
	COLOR_ARRAY,
	INDEX_ARRAY,
	TEXTURE_COORD_ARRAY,
	EDGE_FLAG_ARRAY,
	FOG_COORD_ARRAY,
	SECONDARY_COLOR_ARRAY
		  ) with Size => Enum'Size;
    Type State_Variable is (
		AUX0,
		AUX1,
		AUX2,
		AUX3,
		CURRENT_COLOR,
		CURRENT_INDEX,
		CURRENT_NORMAL,
		CURRENT_TEXTURE_COORDS,
		CURRENT_RASTER_COLOR,
		CURRENT_RASTER_INDEX,
		CURRENT_RASTER_TEXTURE_COORDS,
		CURRENT_RASTER_POSITION,
		CURRENT_RASTER_POSITION_VALID,
		CURRENT_RASTER_DISTANCE,
		POINT_SMOOTH,
		POINT_SIZE,
		POINT_SIZE_RANGE,
		POINT_SIZE_GRANULARITY,
		LINE_SMOOTH,
		LINE_WIDTH,
		LINE_WIDTH_RANGE,
		LINE_WIDTH_GRANULARITY,
		LINE_STIPPLE,
		LINE_STIPPLE_PATTERN,
		LINE_STIPPLE_REPEAT,
		LIST_MODE,
		MAX_LIST_NESTING,
		LIST_BASE,
		LIST_INDEX,
		POLYGON_MODE,
		POLYGON_SMOOTH,
		POLYGON_STIPPLE,
		EDGE_FLAG,
		CULL_FACE,
		CULL_FACE_MODE,
		FRONT_FACE,
		LIGHTING,
		LIGHT_MODEL_LOCAL_VIEWER,
		LIGHT_MODEL_TWO_SIDE,
		LIGHT_MODEL_AMBIENT,
		SHADE_MODEL,
		COLOR_MATERIAL_FACE,
		COLOR_MATERIAL_PARAMETER,
		COLOR_MATERIAL,
		FOG,
		FOG_INDEX,
		FOG_DENSITY,
		FOG_START,
		FOG_END,
		FOG_MODE,
		FOG_COLOR,
		DEPTH_RANGE,
		DEPTH_TEST,
		DEPTH_WRITEMASK,
		DEPTH_CLEAR_VALUE,
		DEPTH_FUNC,
		ACCUM_CLEAR_VALUE,
		STENCIL_TEST,
		STENCIL_CLEAR_VALUE,
		STENCIL_FUNC,
		STENCIL_VALUE_MASK,
		STENCIL_FAIL,
		STENCIL_PASS_DEPTH_FAIL,
		STENCIL_PASS_DEPTH_PASS,
		STENCIL_REF,
		STENCIL_WRITEMASK,
		MATRIX_MODE,
		NORMALIZE,
		VIEWPORT,
		MODELVIEW_STACK_DEPTH,
		PROJECTION_STACK_DEPTH,
		TEXTURE_STACK_DEPTH,
		MODELVIEW_MATRIX,
		PROJECTION_MATRIX,
		TEXTURE_MATRIX,
		ATTRIB_STACK_DEPTH,
		CLIENT_ATTRIB_STACK_DEPTH,
		ALPHA_TEST,
		ALPHA_TEST_FUNC,
		ALPHA_TEST_REF,
		DITHER,
		BLEND,
		LOGIC_OP_MODE,
		INDEX_LOGIC_OP,
		COLOR_LOGIC_OP,
		AUX_BUFFERS,
		DRAW_BUFFER,
		READ_BUFFER,
		SCISSOR_BOX,
		SCISSOR_TEST,
		INDEX_CLEAR_VALUE,
		INDEX_WRITEMASK,
		COLOR_CLEAR_VALUE,
		COLOR_WRITEMASK,
		INDEX_MODE,
		RGBA_MODE,
		DOUBLEBUFFER,
		STEREO,
		RENDER_MODE,
		PERSPECTIVE_CORRECTION_HINT,
		POINT_SMOOTH_HINT,
		LINE_SMOOTH_HINT,
		POLYGON_SMOOTH_HINT,
		FOG_HINT,
		TEXTURE_GEN_S,
		TEXTURE_GEN_T,
		TEXTURE_GEN_R,
		TEXTURE_GEN_Q,
		PIXEL_MAP_I_TO_I_SIZE,
		PIXEL_MAP_S_TO_S_SIZE,
		PIXEL_MAP_I_TO_R_SIZE,
		PIXEL_MAP_I_TO_G_SIZE,
		PIXEL_MAP_I_TO_B_SIZE,
		PIXEL_MAP_I_TO_A_SIZE,
		PIXEL_MAP_R_TO_R_SIZE,
		PIXEL_MAP_G_TO_G_SIZE,
		PIXEL_MAP_B_TO_B_SIZE,
		PIXEL_MAP_A_TO_A_SIZE,
		UNPACK_SWAP_BYTES,
		UNPACK_LSB_FIRST,
		UNPACK_ROW_LENGTH,
		UNPACK_SKIP_ROWS,
		UNPACK_SKIP_PIXELS,
		UNPACK_ALIGNMENT,
		PACK_SWAP_BYTES,
		PACK_LSB_FIRST,
		PACK_ROW_LENGTH,
		PACK_SKIP_ROWS,
		PACK_SKIP_PIXELS,
		PACK_ALIGNMENT,
		MAP_COLOR,
		MAP_STENCIL,
		INDEX_SHIFT,
		INDEX_OFFSET,
		RED_SCALE,
		RED_BIAS,
		ZOOM_X,
		ZOOM_Y,
		GREEN_SCALE,
		GREEN_BIAS,
		BLUE_SCALE,
		BLUE_BIAS,
		ALPHA_SCALE,
		ALPHA_BIAS,
		DEPTH_SCALE,
		DEPTH_BIAS,
		MAX_EVAL_ORDER,
		MAX_LIGHTS,
		MAX_CLIP_PLANES,
		MAX_TEXTURE_SIZE,
		MAX_PIXEL_MAP_TABLE,
		MAX_ATTRIB_STACK_DEPTH,
		MAX_MODELVIEW_STACK_DEPTH,
		MAX_NAME_STACK_DEPTH,
		MAX_PROJECTION_STACK_DEPTH,
		MAX_TEXTURE_STACK_DEPTH,
		MAX_VIEWPORT_DIMS,
		MAX_CLIENT_ATTRIB_STACK_DEPTH,
		SUBPIXEL_BITS,
		INDEX_BITS,
		RED_BITS,
		GREEN_BITS,
		BLUE_BITS,
		ALPHA_BITS,
		DEPTH_BITS,
		STENCIL_BITS,
		ACCUM_RED_BITS,
		ACCUM_GREEN_BITS,
		ACCUM_BLUE_BITS,
		ACCUM_ALPHA_BITS,
		NAME_STACK_DEPTH,
		AUTO_NORMAL,
		MAP1_COLOR_4,
		MAP1_INDEX,
		MAP1_NORMAL,
		MAP1_TEXTURE_COORD_1,
		MAP1_TEXTURE_COORD_2,
		MAP1_TEXTURE_COORD_3,
		MAP1_TEXTURE_COORD_4,
		MAP1_VERTEX_3,
		MAP1_VERTEX_4,
		MAP2_COLOR_4,
		MAP2_INDEX,
		MAP2_NORMAL,
		MAP2_TEXTURE_COORD_1,
		MAP2_TEXTURE_COORD_2,
		MAP2_TEXTURE_COORD_3,
		MAP2_TEXTURE_COORD_4,
		MAP2_VERTEX_3,
		MAP2_VERTEX_4,
		MAP1_GRID_DOMAIN,
		MAP1_GRID_SEGMENTS,
		MAP2_GRID_DOMAIN,
		MAP2_GRID_SEGMENTS,
		TEXTURE_1D,
		TEXTURE_2D,
		FEEDBACK_BUFFER_SIZE,
		FEEDBACK_BUFFER_TYPE,
		SELECTION_BUFFER_SIZE,
		POLYGON_OFFSET_UNITS,
		POLYGON_OFFSET_POINT,
		POLYGON_OFFSET_LINE,
		CLIP_PLANE_1,
		CLIP_PLANE_2,
		CLIP_PLANE_3,
		CLIP_PLANE_4,
		CLIP_PLANE_5,
		CLIP_PLANE_6,
		LIGHT_1,
		LIGHT_2,
		LIGHT_3,
		LIGHT_4,
		LIGHT_5,
		LIGHT_6,
		LIGHT_7,
		LIGHT_8,
		BLEND_COLOR,
		BLEND_EQUATION_RGB,
		CONVOLUTION_1D,
		CONVOLUTION_2D,
		SEPARABLE_2D,
		POST_CONVOLUTION_RED_SCALE,
		POST_CONVOLUTION_GREEN_SCALE,
		POST_CONVOLUTION_BLUE_SCALE,
		POST_CONVOLUTION_ALPHA_SCALE,
		POST_CONVOLUTION_RED_BIAS,
		POST_CONVOLUTION_GREEN_BIAS,
		POST_CONVOLUTION_BLUE_BIAS,
		POST_CONVOLUTION_ALPHA_BIAS,
		HISTOGRAM,
		MINMAX,
		POLYGON_OFFSET_FILL,
		POLYGON_OFFSET_FACTOR,
		RESCALE_NORMAL,
		TEXTURE_BINDING_1D,
		TEXTURE_BINDING_2D,
		TEXTURE_BINDING_3D,
		PACK_SKIP_IMAGES,
		PACK_IMAGE_HEIGHT,
		UNPACK_SKIP_IMAGES,
		UNPACK_IMAGE_HEIGHT,
		TEXTURE_3D,
		MAX_3D_TEXTURE_SIZE,
		VERTEX_ARRAY,
		NORMAL_ARRAY,
		COLOR_ARRAY,
		INDEX_ARRAY,
		TEXTURE_COORD_ARRAY,
		EDGE_FLAG_ARRAY,
		VERTEX_ARRAY_SIZE,
		VERTEX_ARRAY_TYPE,
		VERTEX_ARRAY_STRIDE,
		NORMAL_ARRAY_TYPE,
		NORMAL_ARRAY_STRIDE,
		COLOR_ARRAY_SIZE,
		COLOR_ARRAY_TYPE,
		COLOR_ARRAY_STRIDE,
		INDEX_ARRAY_TYPE,
		INDEX_ARRAY_STRIDE,
		TEXTURE_COORD_ARRAY_SIZE,
		TEXTURE_COORD_ARRAY_TYPE,
		TEXTURE_COORD_ARRAY_STRIDE,
		EDGE_FLAG_ARRAY_STRIDE,
		SAMPLE_BUFFERS,
		SAMPLES,
		SAMPLE_COVERAGE_VALUE,
		SAMPLE_COVERAGE_INVERT,
		COLOR_MATRIX,
		COLOR_MATRIX_STACK_DEPTH,
		MAX_COLOR_MATRIX_STACK_DEPTH,
		POST_COLOR_MATRIX_RED_SCALE,
		POST_COLOR_MATRIX_GREEN_SCALE,
		POST_COLOR_MATRIX_BLUE_SCALE,
		POST_COLOR_MATRIX_ALPHA_SCALE,
		POST_COLOR_MATRIX_RED_BIAS,
		POST_COLOR_MATRIX_GREEN_BIAS,
		POST_COLOR_MATRIX_BLUE_BIAS,
		POST_COLOR_MATRIX_ALPHA_BIAS,
		BLEND_DST_RGB,
		BLEND_SRC_RGB,
		BLEND_DST_ALPHA,
		BLEND_SRC_ALPHA,
		COLOR_TABLE,
		POST_CONVOLUTION_COLOR_TABLE,
		POST_COLOR_MATRIX_COLOR_TABLE,
		MAX_ELEMENTS_VERTICES,
		MAX_ELEMENTS_INDICES,
		POINT_SIZE_MIN,
		POINT_SIZE_MAX,
		POINT_FADE_THRESHOLD_SIZE,
		POINT_DISTANCE_ATTENUATION,
		GENERATE_MIPMAP_HINT,
		LIGHT_MODEL_COLOR_CONTROL,
		FOG_COORD_SRC,
		CURRENT_FOG_COORD,
		FOG_COORD_ARRAY_TYPE,
		FOG_COORD_ARRAY_STRIDE,
		FOG_COORD_ARRAY,
		COLOR_SUM,
		CURRENT_SECONDARY_COLOR,
		SECONDARY_COLOR_ARRAY_SIZE,
		SECONDARY_COLOR_ARRAY_TYPE,
		SECONDARY_COLOR_ARRAY_STRIDE,
		SECONDARY_COLOR_ARRAY,
		CURRENT_RASTER_SECONDARY_COLOR,
		ALIASED_POINT_SIZE_RANGE,
		ALIASED_LINE_WIDTH_RANGE,
		ACTIVE_TEXTURE,
		CLIENT_ACTIVE_TEXTURE,
		MAX_TEXTURE_UNITS,
		TRANSPOSE_MODELVIEW_MATRIX,
		TRANSPOSE_PROJECTION_MATRIX,
		TRANSPOSE_TEXTURE_MATRIX,
		TRANSPOSE_COLOR_MATRIX,
		TEXTURE_COMPRESSION_HINT,
		MAX_TEXTURE_LOD_BIAS,
		TEXTURE_CUBE_MAP,
		TEXTURE_BINDING_CUBE_MAP,
		MAX_CUBE_MAP_TEXTURE_SIZE,
		VERTEX_PROGRAM_POINT_SIZE,
		VERTEX_PROGRAM_TWO_SIDE,
		NUM_COMPRESSED_TEXTURE_FORMATS,
		COMPRESSED_TEXTURE_FORMATS,
		STENCIL_BACK_FUNC,
		STENCIL_BACK_FAIL,
		STENCIL_BACK_PASS_DEPTH_FAIL,
		STENCIL_BACK_PASS_DEPTH_PASS,
		MAX_DRAW_BUFFERS,
		BLEND_EQUATION_ALPHA,
		POINT_SPRITE,
		MAX_VERTEX_ATTRIBS,
		MAX_TEXTURE_COORDS,
		MAX_TEXTURE_IMAGE_UNITS,
		ARRAY_BUFFER_BINDING,
		ELEMENT_ARRAY_BUFFER_BINDING,
		VERTEX_ARRAY_BUFFER_BINDING,
		NORMAL_ARRAY_BUFFER_BINDING,
		COLOR_ARRAY_BUFFER_BINDING,
		INDEX_ARRAY_BUFFER_BINDING,
		TEXTURE_COORD_ARRAY_BUFFER_BINDING,
		EDGE_FLAG_ARRAY_BUFFER_BINDING,
		SECONDARY_COLOR_ARRAY_BUFFER_BINDING,
		FOG_COORD_ARRAY_BUFFER_BINDING,
		PIXEL_PACK_BUFFER_BINDING,
		PIXEL_UNPACK_BUFFER_BINDING,
		MAX_FRAGMENT_UNIFORM_COMPONENTS,
		MAX_VERTEX_UNIFORM_COMPONENTS,
		MAX_VARYING_FLOATS,
		MAX_VERTEX_TEXTURE_IMAGE_UNITS,
		MAX_COMBINED_TEXTURE_IMAGE_UNITS,
		FRAGMENT_SHADER_DERIVATIVE_HINT,
		CURRENT_PROGRAM,
		STENCIL_BACK_REF,
		STENCIL_BACK_VALUE_MASK,
		STENCIL_BACK_WRITEMASK
			 ) with size => Enum'size;

    Type Rendering_Mode is (
	RENDER,		FEEDBACK,		SELECTION
		) with Size => Enum'Size;

    Type Error_Flag is (
	NO_ERROR,		INVALID_ENUM,		INVALID_VALUE,
	INVALID_OPERATION,	STACK_OVERFLOW,		STACK_UNDERFLOW,
	OUT_OF_MEMORY,		TABLE_TOO_LARGE
		    ) with Size => Enum'Size;

    Type String_Constants is (
	VENDOR, RENDERER, VERSION, EXTENSIONS, SHADING_LANGUAGE_VERSION
		 ) with Size => Enum'Size;

    Type Hints is (
		PERSPECTIVE_CORRECTION_HINT,
		POINT_SMOOTH_HINT,
		LINE_SMOOTH_HINT,
		POLYGON_SMOOTH_HINT,
		FOG_HINT,
		GENERATE_MIPMAP_HINT,
		TEXTURE_COMPRESSION_HINT,
		FRAGMENT_SHADER_DERIVATIVE_HINT
		  ) with Size => Enum'Size;

    Type Hint_Mode is (
	DONT_CARE,	FASTEST,	NICEST
		   ) with Size => Enum'Size;

    Type Accumulator_Operators is (
		ACCUM,		LOAD,		OP_RETURN,
		MULT,		ADD
				  ) with Size => Enum'Size;

    Type Matrix_Mode_Type is (
	MODELVIEW,	PROJECTION,	TEXTURE,	COLOR
			) with Size => Enum'Size;

    Type Command_Mode is (
	COMPILE,	COMPILE_AND_EXECUTE
			 ) with Size => Enum'Size;

    Type List_Type is (
		LIST_BYTE,
		LIST_UNSIGNED_BYTE,
		LIST_SHORT,
		LIST_UNSIGNED_SHORT,
		LIST_INTEGER,
		LIST_UNSIGNED_INTEGER,
		LIST_FLOAT,
		LIST_2_BYTES,
		LIST_3_BYTES,
		LIST_4_BYTES
		   ) With Size => Enum'Size;

    Type Vertex_Interpretation is (
		POINTS,
		LINES,
		LINE_LOOP,
		LINE_STRIP,
		TRIANGLES,
		TRIANGLE_STRIP,
		TRIANGLE_FAN,
		QUADS,
		QUAD_STRIP,
		POLYGON
				  ) With Size => Enum'Size;

    Type Shading_Technique is (
		FLAT,	SMOOTH
			      ) with Size => Enum'Size;

    Type Light_Model is (
	LOCAL_VIEWER,	TWO_SIDE,	AMBIENT,	COLOR_CONTROL
		  ) with Size => Enum'Size;

    Type  Material_Parameter is (
	AMBIENT,	DIFFUSE,	SPECULAR,
	EMISSION,	SHININESS,	AMBIENT_AND_DIFFUSE,
	COLOR_INDEXES
				) with Size => Enum'Size;

    Type Pixel_Storage is (
	UNPACK_SWAP_BYTES,	UNPACK_LSB_FIRST,	UNPACK_ROW_LENGTH,
	UNPACK_SKIP_ROWS,	UNPACK_SKIP_PIXELS,	UNPACK_ALIGNMENT,
	PACK_SWAP_BYTES,	PACK_LSB_FIRST,		PACK_ROW_LENGTH,
	PACK_SKIP_ROWS,		PACK_SKIP_PIXELS,	PACK_ALIGNMENT,
	PACK_SKIP_IMAGES,	PACK_IMAGE_HEIGHT,	UNPACK_SKIP_IMAGES,
	UNPACK_IMAGE_HEIGHT
			  ) with Size => Enum'Size;

    Type Transfer_Style is (
	MAP_COLOR,			MAP_STENCIL,
	INDEX_SHIFT,			INDEX_OFFSET,
	RED_SCALE,			RED_BIAS,
	GREEN_SCALE,			GREEN_BIAS,
	BLUE_SCALE,			BLUE_BIAS,
	ALPHA_SCALE,			ALPHA_BIAS,
	DEPTH_SCALE,			DEPTH_BIAS,
	POST_CONVOLUTION_RED_SCALE,	POST_CONVOLUTION_GREEN_SCALE,
	POST_CONVOLUTION_BLUE_SCALE,	POST_CONVOLUTION_ALPHA_SCALE,
	POST_CONVOLUTION_RED_BIAS,	POST_CONVOLUTION_GREEN_BIAS,
	POST_CONVOLUTION_BLUE_BIAS,	POST_CONVOLUTION_ALPHA_BIAS,
	POST_COLOR_MATRIX_RED_SCALE,	POST_COLOR_MATRIX_GREEN_SCALE,
	POST_COLOR_MATRIX_BLUE_SCALE,	POST_COLOR_MATRIX_ALPHA_SCALE,
	POST_COLOR_MATRIX_RED_BIAS,	POST_COLOR_MATRIX_GREEN_BIAS,
	POST_COLOR_MATRIX_BLUE_BIAS,	POST_COLOR_MATRIX_ALPHA_BIAS
			   ) with Size => Enum'Size;

    Type Pixel_Mapping_Type is (
	I_TO_I,		S_TO_S,		I_TO_R,
	I_TO_G,		I_TO_B,		I_TO_A,
	R_TO_R,		G_TO_G,		B_TO_B,
	A_TO_A
			  ) with Size => Enum'Size;

    Type Pixel_Data_Format is (
	COLOR_INDEX,		STENCIL_INDEX,
	DEPTH_COMPONENT,	RED,
	GREEN,			BLUE,
	ALPHA,			PDF_RGB,
	PDF_RGBA,		LUMINANCE,
	LUMINANCE_ALPHA,	PDF_BGR,
	PDF_BGRA
			   ) With Size => Enum'Size;

    Type Pixel_Data_Type is (
	PDT_BYTE,
	PDT_UNSIGNED_BYTE,
	PDT_SHORT,
	PDT_UNSIGNED_SHORT,
	PDT_INTEGER,
	PDT_UNSIGNED_INTEGER,
	PDT_FLOAT,
	PDT_BITMAP,
	PDT_332,		-- UNSIGNED_BYTE
	PDT_4444,		-- UNSIGNED_SHORT
	PDT_5551,		-- UNSIGNED_SHORT
	PDT_8888,		-- UNSIGNED_INTEGER
	PDT_AAA2,		-- UNSIGNED_INTEGER
	PDT_233,		-- UNSIGNED_BYTE
	PDT_565,		-- UNSIGNED_SHORT
	PDT_REVERSE_565,	-- UNSIGNED_SHORT
	PDT_REVEVERSE_4444,	-- UNSIGNED_SHORT
	PDT_REVERSE_1555,	-- UNSIGNED_SHORT
	PDT_REVERSE_8888,	-- UNSIGNED_INTEGER
	PDT_REVERSE_2AAA	-- UNSIGNED_INTEGER
			    ) With Size => Enum'Size;

    Type Pixel_Copy_Type is (
	COLOR,		DEPTH,		STENCIL
		       ) With Size => Enum'Size;

    Type Stencil_Op_Type is (
	ZERO,
	INVERT,
	KEEP,
	REPLACE,
	INCREMENT,
	DECREMENT,
	INCREMENT_WRAP,
	DECREMENT_WRAP
			) With Size => Enum'Size;

    Type Texture_Generation_Type is (
	EYE_LINEAR,
	OBJECT_LINEAR,
	SPHERE_MAP,
	NORMAL_MAP,
	REFLECTION_MAP
				   ) With Size => Enum'Size;

    Type Texture_Coordinate_Type is ( S, T, R, Q ) with Size => Enum'Size;

    Type Texture_Coordinate_Generation is (
	TEXTURE_GEN_MODE,
	OBJECT_PLANE,
	EYE_PLANE
					  ) with Size => Enum'Size;

    Type Texture_Environment_Type is (
	TEXTURE_ENVIRON,
	TEXTURE_FILTER_CONTROL,
	POINT_SPRITE
				     ) with Size => Enum'Size;

    Type Texture_Environ_Type is (
	ALPHA_SCALE,
	TEXTURE_ENV_MODE,
	TEXTURE_LOD_BIAS,
	COMBINE_RGB,
	COMBINE_ALPHA,
	RGB_SCALE,
	SOURCE_1_RGB,
	SOURCE_2_RGB,
	SOURCE_3_RGB,
	SOURCE_1_ALPHA,
	SOURCE_2_ALPHA,
	SOURCE_3_ALPHA,
	OPERAND_1_RGB,
	OPERAND_2_RGB,
	OPERAND_3_RGB,
	OPERAND_1_ALPHA,
	OPERAND_2_ALPHA,
	OPERAND_3_ALPHA,
	COORD_REPLACE
		 ) with Size => Enum'Size;

    Type Texture_Environ_Parameter is (
        ADD,
        SRC_COLOR,
        ONE_MINUS_SRC_COLOR,
        SRC_ALPHA,
        ONE_MINUS_SRC_ALPHA,
        BLEND,
        TEXTURE,
        REPLACE,
        MODULATE,
        DECAL,
        SUBTRACT,
        COMBINE,
        ADD_SIGNED,
        INTERPOLATE,
        TEP_CONSTANT,
        PRIMARY_COLOR,
        PREVIOUS
				      ) With Size => Enum'Size;

    Type Texture_Target is (
	One_Dimensional, Two_Dimensional, Three_Dimensional, Cube_Map
			       ) with SIZE => Enum'Size;

    Type Extended_Texture_Target is (
	TEXTURE_1D,
	TEXTURE_2D,
	PROXY_TEXTURE_1D,
	PROXY_TEXTURE_2D,
	TEXTURE_3D,
	PROXY_TEXTURE_3D,
	TEXTURE_CUBE_MAP_POSITIVE_X,
	TEXTURE_CUBE_MAP_NEGATIVE_X,
	TEXTURE_CUBE_MAP_POSITIVE_Y,
	TEXTURE_CUBE_MAP_NEGATIVE_Y,
	TEXTURE_CUBE_MAP_POSITIVE_Z,
	TEXTURE_CUBE_MAP_NEGATIVE_Z,
	PROXY_TEXTURE_CUBE_MAP
				    ) with Size => Enum'Size;


    Type Texture_Paramater_Type is (
	TEXTURE_BORDER_COLOR,
	TEXTURE_MAG_FILTER,
	TEXTURE_MIN_FILTER,
	TEXTURE_WRAP_S,
	TEXTURE_WRAP_T,
	TEXTURE_PRIORITY,
	TEXTURE_WRAP_R,
	TEXTURE_MIN_LOD,
	TEXTURE_MAX_LOD,
	TEXTURE_BASE_LEVEL,
	TEXTURE_MAX_LEVEL,
	GENERATE_MIPMAP,
	DEPTH_TEXTURE_MODE,
	TEXTURE_COMPARE_MODE,
	TEXTURE_COMPARE_FUNC
		) with Size => Enum'Size;

    Type Texture_Parameter is (
	WIDTH,
	HEIGHT,
	INTERNAL_FORMAT,
	BORDER,
	RED_SIZE,
	GREEN_SIZE,
	BLUE_SIZE,
	ALPHA_SIZE,
	LUMINANCE_SIZE,
	INTENSITY_SIZE,
	DEPTH,
	COMPRESSED_IMAGE_SIZE,
	COMPRESSED,
	DEPTH_SIZE
	    ) with size => Enum'Size;

    Type Internal_Format_Type is (
	DEPTH_COMPONENT,
	ALPHA,
	RGB_Format,
	RGBA_Format,
	LUMINANCE,
	LUMINANCE_ALPHA,
	R3_G3_B2,
	ALPHA4,
	ALPHA8,
	ALPHA12,
	ALPHA16,
	LUMINANCE4,
	LUMINANCE8,
	LUMINANCE12,
	LUMINANCE16,
	LUMINANCE4_ALPHA4,
	LUMINANCE6_ALPHA2,
	LUMINANCE8_ALPHA8,
	LUMINANCE12_ALPHA4,
	LUMINANCE12_ALPHA12,
	LUMINANCE16_ALPHA16,
	INTENSITY,
	INTENSITY4,
	INTENSITY8,
	INTENSITY12,
	INTENSITY16,
	RGB4,
	RGB5,
	RGB8,
	RGB10,
	RGB12,
	RGB16,
	RGBA2,
	RGBA4,
	RGB5_A1,
	RGBA8,
	RGB10_A2,
	RGBA12,
	RGBA16,
	DEPTH_COMPONENT16,
	DEPTH_COMPONENT24,
	DEPTH_COMPONENT32,
	COMPRESSED_ALPHA,
	COMPRESSED_LUMINANCE,
	COMPRESSED_LUMINANCE_ALPHA,
	COMPRESSED_INTENSITY,
	COMPRESSED_RGB,
	COMPRESSED_RGBA,
	SRGB,
	SRGB8,
	SRGB_ALPHA,
	SRGB8_ALPHA8,
	SLUMINANCE_ALPHA,
	SLUMINANCE8_ALPHA8,
	SLUMINANCE,
	SLUMINANCE8
				 ) with size => Enum'Size;

    Type Map_Target is (
	MAP1_COLOR_4,
	MAP1_INDEX,
	MAP1_NORMAL,
	MAP1_TEXTURE_COORD_1,
	MAP1_TEXTURE_COORD_2,
	MAP1_TEXTURE_COORD_3,
	MAP1_TEXTURE_COORD_4,
	MAP1_VERTEX_3,
	MAP1_VERTEX_4,
	MAP2_COLOR_4,
	MAP2_INDEX,
	MAP2_NORMAL,
	MAP2_TEXTURE_COORD_1,
	MAP2_TEXTURE_COORD_2,
	MAP2_TEXTURE_COORD_3,
	MAP2_TEXTURE_COORD_4,
	MAP2_VERTEX_3,
	MAP2_VERTEX_4
		       ) with Size => Enum'Size;

    Type Map_Query is (
	COEFF,
	ORDER,
	DOMAIN
		      ) with Size => Enum'Size;

    Type Fog_Parameter is (
	FOG_INDEX,
	FOG_DENSITY,
	FOG_START,
	FOG_END,
	FOG_MODE,
	FOG_COLOR,
	FOG_COORD_SRC
		) with Size => Enum'Size;

    Type Vertex_Info is (
	VI_2D,
	VI_3D,
	VI_3D_COLOR,
	VI_3D_COLOR_TEXTURE,
	VI_4D_COLOR_TEXTURE
			) with Size => Enum'Size;

    Type Array_Format_Type is (
	V2F,
	V3F,
	C4UB_V2F,
	C4UB_V3F,
	C3F_V3F,
	N3F_V3F,
	C4F_N3F_V3F,
	T2F_V3F,
	T4F_V4F,
	T2F_C4UB_V3F,
	T2F_C3F_V3F,
	T2F_N3F_V3F,
	T2F_C4F_N3F_V3F,
	T4F_C4F_N3F_V4F
			      ) with Size => Enum'Size;


--------------------------------------------------------------------------------
----   REPRESENTATIONS	ALIASING TYPES RELATING TO CONSTANTS FOR ENUM.      ----
--------------------------------------------------------------------------------

    For Comparisions Use (
	NEVER		=> GL_NEVER,
	LESS		=> GL_LESS,
	EQUAL		=> GL_EQUAL,
	LEQUAL		=> GL_LEQUAL,
	GREATER		=> GL_GREATER,
	NOTEQUAL	=> GL_NOTEQUAL,
	GEQUAL		=> GL_GEQUAL,
	ALWAYS		=> GL_ALWAYS
			 );

    For Source_Factor Use
      (
	ZERO			=>	0,
	ONE			=>	1,
	SRC_COLOR		=>	16#0300#,
	ONE_MINUS_SRC_COLOR	=>	16#0301#,
	SRC_ALPHA		=>	16#0302#,
	ONE_MINUS_SRC_ALPHA	=>	16#0303#,
	DST_ALPHA		=>	16#0304#,
	ONE_MINUS_DST_ALPHA	=>	16#0305#,
	DST_COLOR		=>	16#0306#,
	ONE_MINUS_DST_COLOR	=>	16#0307#,
	SRC_ALPHA_SATURATE	=>	16#0308#,
	CONSTANT_COLOR		=>	16#8001#,
	ONE_MINUS_CONSTANT_COLOR=>	16#8002#,
	CONSTANT_ALPHA		=>	16#8003#,
	ONE_MINUS_CONSTANT_ALPHA=>	16#8004#
      );

    For Logic_Operators Use
      (
	OP_CLEAR		=>	GL_CLEAR,
	OP_AND			=>	GL_AND,
	OP_AND_REVERSE		=>	GL_AND_REVERSE,
	OP_COPY			=>	GL_COPY,
	OP_AND_INVERTED		=>	GL_AND_INVERTED,
	OP_NOOP			=>	GL_NOOP,
	OP_XOR			=>	GL_XOR,
	OP_OR			=>	GL_OR,
	OP_NOR			=>	GL_NOR,
	OP_EQUIV		=>	GL_EQUIV,
	OP_INVERT		=>	GL_INVERT,
	OP_OR_REVERSE		=>	GL_OR_REVERSE,
	OP_COPY_INVERTED	=>	GL_COPY_INVERTED,
	OP_OR_INVERTED		=>	GL_OR_INVERTED,
	OP_NAND			=>	GL_NAND,
	OP_SET			=>	GL_SET
      );

    For Face Use
      (
	FRONT		=> GL_FRONT,
	BACK		=> GL_BACK,
	FRONT_AND_BACK	=> GL_FRONT_AND_BACK
      );

    For Orientation Use
      (
	Clockwise		=> GL_CW,
	Counterclockwise	=> GL_CCW
      );

    For Raster_Mode Use
      (
	POINT	=>	GL_POINT,
	LINE	=>	GL_LINE,
	FILL	=>	GL_FILL
      );

    For Clipping_Plane Use
      (
	CLIP_PLANE_1	=>	GL_CLIP_PLANE0,
	CLIP_PLANE_2	=>	GL_CLIP_PLANE1,
	CLIP_PLANE_3	=>	GL_CLIP_PLANE2,
	CLIP_PLANE_4	=>	GL_CLIP_PLANE3,
	CLIP_PLANE_5	=>	GL_CLIP_PLANE4,
	CLIP_PLANE_6	=>	GL_CLIP_PLANE5
      );

    For Drawing_Mode Use
     (
	NONE		=> GL_NONE,
	FRONT_LEFT	=> GL_FRONT_LEFT,
	FRONT_RIGHT	=> GL_FRONT_RIGHT,
	BACK_LEFT	=> GL_BACK_LEFT,
	BACK_RIGHT	=> GL_BACK_RIGHT,
	FRONT		=> GL_FRONT,
	BACK		=> GL_BACK,
	LEFT		=> GL_LEFT,
	RIGHT		=> GL_RIGHT,
	FRONT_AND_BACK	=> GL_FRONT_AND_BACK,
	AUX_1		=> GL_AUX0,
	AUX_2		=> GL_AUX1,
	AUX_3		=> GL_AUX2,
	AUX_4		=> GL_AUX3
   );

    For Lighting_Style Use
      (
	AMBIENT			=> GL_AMBIENT,
	DIFFUSE			=> GL_DIFFUSE,
	SPECULAR		=> GL_SPECULAR,
	POSITION		=> GL_POSITION,
	SPOT_DIRECTION		=> GL_SPOT_DIRECTION,
	SPOT_EXPONENT		=> GL_SPOT_EXPONENT,
	SPOT_CUTOFF		=> GL_SPOT_CUTOFF,
	CONSTANT_ATTENUATION	=> GL_CONSTANT_ATTENUATION,
	LINEAR_ATTENUATION	=> GL_LINEAR_ATTENUATION,
	QUADRATIC_ATTENUATION	=> GL_QUADRATIC_ATTENUATION
      );


    For Light_Source use
      (
	LIGHT_1 => GL_LIGHT0,
	LIGHT_2 => GL_LIGHT1,
	LIGHT_3 => GL_LIGHT2,
	LIGHT_4 => GL_LIGHT3,
	LIGHT_5 => GL_LIGHT4,
	LIGHT_6 => GL_LIGHT5,
	LIGHT_7 => GL_LIGHT6,
	LIGHT_8 => GL_LIGHT7
      );


      For Capability use
      (
    	ALPHA_TEST			=> GL_ALPHA_TEST,
	AUTO_NORMAL			=> GL_AUTO_NORMAL,
	BLEND				=> GL_BLEND,
	CLIP_PLANE_1			=> GL_CLIP_PLANE0,
	CLIP_PLANE_2			=> GL_CLIP_PLANE1,
	CLIP_PLANE_3			=> GL_CLIP_PLANE2,
	CLIP_PLANE_4			=> GL_CLIP_PLANE3,
	CLIP_PLANE_5			=> GL_CLIP_PLANE4,
	CLIP_PLANE_6			=> GL_CLIP_PLANE5,
	COLOR_LOGIC_OP			=> GL_COLOR_LOGIC_OP,
	COLOR_MATERIAL			=> GL_COLOR_MATERIAL,
	COLOR_SUM			=> GL_COLOR_SUM,
	COLOR_TABLE			=> GL_COLOR_TABLE,
	CONVOLUTION_1D			=> GL_CONVOLUTION_1D,
	CONVOLUTION_2D			=> GL_CONVOLUTION_2D,
	CULL_FACE			=> GL_CULL_FACE,
	DEPTH_TEST			=> GL_DEPTH_TEST,
	DITHER				=> GL_DITHER,
	FOG				=> GL_FOG,
	HISTOGRAM			=> GL_HISTOGRAM,
	INDEX_LOGIC_OP			=> GL_INDEX_LOGIC_OP,
	LIGHT_1				=> GL_LIGHT0,
	LIGHT_2				=> GL_LIGHT1,
	LIGHT_3				=> GL_LIGHT2,
	LIGHT_4				=> GL_LIGHT3,
	LIGHT_5				=> GL_LIGHT4,
	LIGHT_6				=> GL_LIGHT5,
	LIGHT_7				=> GL_LIGHT6,
	LIGHT_8				=> GL_LIGHT7,
	LIGHTING			=> GL_LIGHTING,
	LINE_SMOOTH			=> GL_LINE_SMOOTH,
	LINE_STIPPLE			=> GL_LINE_STIPPLE,
	MAP1_COLOR_4			=> GL_MAP1_COLOR_4,
	MAP1_INDEX			=> GL_MAP1_INDEX,
	MAP1_NORMAL			=> GL_MAP1_NORMAL,
	MAP1_TEXTURE_COORD_1		=> GL_MAP1_TEXTURE_COORD_1,
	MAP1_TEXTURE_COORD_2		=> GL_MAP1_TEXTURE_COORD_2,
	MAP1_TEXTURE_COORD_3		=> GL_MAP1_TEXTURE_COORD_3,
	MAP1_TEXTURE_COORD_4		=> GL_MAP1_TEXTURE_COORD_4,
	MAP1_VERTEX_3			=> GL_MAP1_VERTEX_3,
	MAP1_VERTEX_4			=> GL_MAP1_VERTEX_4,
	MAP2_COLOR_4			=> GL_MAP2_COLOR_4,
	MAP2_INDEX			=> GL_MAP2_INDEX,
	MAP2_NORMAL			=> GL_MAP2_NORMAL,
	MAP2_TEXTURE_COORD_1		=> GL_MAP2_TEXTURE_COORD_1,
	MAP2_TEXTURE_COORD_2		=> GL_MAP2_TEXTURE_COORD_2,
	MAP2_TEXTURE_COORD_3		=> GL_MAP2_TEXTURE_COORD_3,
	MAP2_TEXTURE_COORD_4		=> GL_MAP2_TEXTURE_COORD_4,
	MAP2_VERTEX_3			=> GL_MAP2_VERTEX_3,
	MAP2_VERTEX_4			=> GL_MAP2_VERTEX_4,
	MINMAX				=> GL_MINMAX,
	MULTISAMPLE			=> GL_MULTISAMPLE,
	NORMALIZE			=> GL_NORMALIZE,
	POINT_SMOOTH			=> GL_POINT_SMOOTH,
	POINT_SPRITE			=> GL_POINT_SPRITE,
	POLYGON_OFFSET_FILL		=> GL_POLYGON_OFFSET_FILL,
	POLYGON_OFFSET_LINE		=> GL_POLYGON_OFFSET_LINE,
	POLYGON_OFFSET_POINT		=> GL_POLYGON_OFFSET_POINT,
	POLYGON_SMOOTH			=> GL_POLYGON_SMOOTH,
	POLYGON_STIPPLE			=> GL_POLYGON_STIPPLE,
	POST_COLOR_MATRIX_COLOR_TABLE	=> GL_POST_COLOR_MATRIX_COLOR_TABLE,
	POST_CONVOLUTION_COLOR_TABLE	=> GL_POST_CONVOLUTION_COLOR_TABLE,
	RESCALE_NORMAL			=> GL_RESCALE,
	SAMPLE_ALPHA_TO_COVERAGE	=> GL_SAMPLE_ALPHA_TO_COVERAGE,
	SAMPLE_ALPHA_TO_ONE		=> GL_SAMPLE_ALPHA_TO_ONE,
	SAMPLE_COVERAGE			=> GL_SAMPLE_COVERAGE,
	SEPARABLE_2D			=> GL_SEPARABLE_2D,
	SCISSOR_TEST			=> GL_SCISSOR_TEST,
	STENCIL_TEST			=> GL_STENCIL_TEST,
	TEXTURE_1D			=> GL_TEXTURE_1D,
	TEXTURE_2D			=> GL_TEXTURE_2D,
	TEXTURE_3D			=> GL_TEXTURE_3D,
	TEXTURE_CUBE_MAP		=> GL_TEXTURE_CUBE_MAP,
	TEXTURE_GEN_Q			=> GL_TEXTURE_GEN_Q,
	TEXTURE_GEN_R			=> GL_TEXTURE_GEN_R,
	TEXTURE_GEN_S			=> GL_TEXTURE_GEN_S,
	TEXTURE_GEN_T			=> GL_TEXTURE_GEN_T,
	VERTEX_PROGRAM_POINT_SIZE	=> GL_VERTEX_PROGRAM_POINT_SIZE,
	VERTEX_PROGRAM_TWO_SIDE		=> GL_VERTEX_PROGRAM_TWO_SIDE
      );


    For Client_Capibility Use
      (
	COLOR_ARRAY		=> GL_COLOR_ARRAY,
	EDGE_FLAG_ARRAY		=> GL_EDGE_FLAG_ARRAY,
	FOG_COORD_ARRAY		=> GL_FOG_COORD_ARRAY,
	INDEX_ARRAY		=> GL_INDEX_ARRAY,
	NORMAL_ARRAY		=> GL_NORMAL_ARRAY,
	SECONDARY_COLOR_ARRAY	=> GL_SECONDARY_COLOR_ARRAY,
	TEXTURE_COORD_ARRAY	=> GL_TEXTURE_COORD_ARRAY,
	VERTEX_ARRAY		=> GL_VERTEX_ARRAY
      );

    For State_Variable Use
      (
	AUX0				=> GL_AUX0,
	AUX1				=> GL_AUX1,
	AUX2				=> GL_AUX2,
	AUX3				=> GL_AUX3,
	CURRENT_COLOR			=> GL_CURRENT_COLOR,
	CURRENT_INDEX			=> GL_CURRENT_INDEX,
	CURRENT_NORMAL			=> GL_CURRENT_NORMAL,
	CURRENT_TEXTURE_COORDS		=> GL_CURRENT_TEXTURE_COORDS,
	CURRENT_RASTER_COLOR		=> GL_CURRENT_RASTER_COLOR,
	CURRENT_RASTER_INDEX		=> GL_CURRENT_RASTER_INDEX,
	CURRENT_RASTER_TEXTURE_COORDS	=> GL_CURRENT_RASTER_TEXTURE_COORDS,
	CURRENT_RASTER_POSITION		=> GL_CURRENT_RASTER_POSITION,
	CURRENT_RASTER_POSITION_VALID	=> GL_CURRENT_RASTER_POSITION_VALID,
	CURRENT_RASTER_DISTANCE		=> GL_CURRENT_RASTER_DISTANCE,
	POINT_SMOOTH			=> GL_POINT_SMOOTH,
	POINT_SIZE			=> GL_POINT_SIZE,
	POINT_SIZE_RANGE		=> GL_POINT_SIZE_RANGE,
	POINT_SIZE_GRANULARITY		=> GL_POINT_SIZE_GRANULARITY,
	LINE_SMOOTH			=> GL_LINE_SMOOTH,
	LINE_WIDTH			=> GL_LINE_WIDTH,
	LINE_WIDTH_RANGE		=> GL_LINE_WIDTH_RANGE,
	LINE_WIDTH_GRANULARITY		=> GL_LINE_WIDTH_GRANULARITY,
	LINE_STIPPLE			=> GL_LINE_STIPPLE,
	LINE_STIPPLE_PATTERN		=> GL_LINE_STIPPLE_PATTERN,
	LINE_STIPPLE_REPEAT		=> GL_LINE_STIPPLE_REPEAT,
	LIST_MODE			=> GL_LIST_MODE,
	MAX_LIST_NESTING		=> GL_MAX_LIST_NESTING,
	LIST_BASE			=> GL_LIST_BASE,
	LIST_INDEX			=> GL_LIST_INDEX,
	POLYGON_MODE			=> GL_POLYGON_MODE,
	POLYGON_SMOOTH			=> GL_POLYGON_SMOOTH,
	POLYGON_STIPPLE			=> GL_POLYGON_STIPPLE,
	EDGE_FLAG			=> GL_EDGE_FLAG,
	CULL_FACE			=> GL_CULL_FACE,
	CULL_FACE_MODE			=> GL_CULL_FACE_MODE,
	FRONT_FACE			=> GL_FRONT_FACE,
	LIGHTING			=> GL_LIGHTING,
	LIGHT_MODEL_LOCAL_VIEWER	=> GL_LIGHT_MODEL_LOCAL_VIEWER,
	LIGHT_MODEL_TWO_SIDE		=> GL_LIGHT_MODEL_TWO_SIDE,
	LIGHT_MODEL_AMBIENT		=> GL_LIGHT_MODEL_AMBIENT,
	SHADE_MODEL			=> GL_SHADE_MODEL,
	COLOR_MATERIAL_FACE		=> GL_COLOR_MATERIAL_FACE,
	COLOR_MATERIAL_PARAMETER	=> GL_COLOR_MATERIAL_PARAMETER,
	COLOR_MATERIAL			=> GL_COLOR_MATERIAL,
	FOG				=> GL_FOG,
	FOG_INDEX			=> GL_FOG_INDEX,
	FOG_DENSITY			=> GL_FOG_DENSITY,
	FOG_START			=> GL_FOG_START,
	FOG_END				=> GL_FOG_END,
	FOG_MODE			=> GL_FOG_MODE,
	FOG_COLOR			=> GL_FOG_COLOR,
	DEPTH_RANGE			=> GL_DEPTH_RANGE,
	DEPTH_TEST			=> GL_DEPTH_TEST,
	DEPTH_WRITEMASK			=> GL_DEPTH_WRITEMASK,
	DEPTH_CLEAR_VALUE		=> GL_DEPTH_CLEAR_VALUE,
	DEPTH_FUNC			=> GL_DEPTH_FUNC,
	ACCUM_CLEAR_VALUE		=> GL_ACCUM_CLEAR_VALUE,
	STENCIL_TEST			=> GL_STENCIL_TEST,
	STENCIL_CLEAR_VALUE		=> GL_STENCIL_CLEAR_VALUE,
	STENCIL_FUNC			=> GL_STENCIL_FUNC,
	STENCIL_VALUE_MASK		=> GL_STENCIL_VALUE_MASK,
	STENCIL_FAIL			=> GL_STENCIL_FAIL,
	STENCIL_PASS_DEPTH_FAIL		=> GL_STENCIL_PASS_DEPTH_FAIL,
	STENCIL_PASS_DEPTH_PASS		=> GL_STENCIL_PASS_DEPTH_PASS,
	STENCIL_REF			=> GL_STENCIL_REF,
	STENCIL_WRITEMASK		=> GL_STENCIL_WRITEMASK,
	MATRIX_MODE			=> GL_MATRIX_MODE,
	NORMALIZE			=> GL_NORMALIZE,
	VIEWPORT			=> GL_VIEWPORT,
	MODELVIEW_STACK_DEPTH		=> GL_MODELVIEW_STACK_DEPTH,
	PROJECTION_STACK_DEPTH		=> GL_PROJECTION_STACK_DEPTH,
	TEXTURE_STACK_DEPTH		=> GL_TEXTURE_STACK_DEPTH,
	MODELVIEW_MATRIX		=> GL_MODELVIEW_MATRIX,
	PROJECTION_MATRIX		=> GL_PROJECTION_MATRIX,
	TEXTURE_MATRIX			=> GL_TEXTURE_MATRIX,
	ATTRIB_STACK_DEPTH		=> GL_ATTRIB_STACK_DEPTH,
	CLIENT_ATTRIB_STACK_DEPTH	=> GL_CLIENT_ATTRIB_STACK_DEPTH,
	ALPHA_TEST			=> GL_ALPHA_TEST,
	ALPHA_TEST_FUNC			=> GL_ALPHA_TEST_FUNC,
	ALPHA_TEST_REF			=> GL_ALPHA_TEST_REF,
	DITHER				=> GL_DITHER,
	BLEND				=> GL_BLEND,
	LOGIC_OP_MODE			=> GL_LOGIC_OP_MODE,
	INDEX_LOGIC_OP			=> GL_INDEX_LOGIC_OP,
	COLOR_LOGIC_OP			=> GL_COLOR_LOGIC_OP,
	AUX_BUFFERS			=> GL_AUX_BUFFERS,
	DRAW_BUFFER			=> GL_DRAW_BUFFER,
	READ_BUFFER			=> GL_READ_BUFFER,
	SCISSOR_BOX			=> GL_SCISSOR_BOX,
	SCISSOR_TEST			=> GL_SCISSOR_TEST,
	INDEX_CLEAR_VALUE		=> GL_INDEX_CLEAR_VALUE,
	INDEX_WRITEMASK			=> GL_INDEX_WRITEMASK,
	COLOR_CLEAR_VALUE		=> GL_COLOR_CLEAR_VALUE,
	COLOR_WRITEMASK			=> GL_COLOR_WRITEMASK,
	INDEX_MODE			=> GL_INDEX_MODE,
	RGBA_MODE			=> GL_RGBA_MODE,
	DOUBLEBUFFER			=> GL_DOUBLEBUFFER,
	STEREO				=> GL_STEREO,
	RENDER_MODE			=> GL_RENDER_MODE,
	PERSPECTIVE_CORRECTION_HINT	=> GL_PERSPECTIVE_CORRECTION_HINT,
	POINT_SMOOTH_HINT		=> GL_POINT_SMOOTH_HINT,
	LINE_SMOOTH_HINT		=> GL_LINE_SMOOTH_HINT,
	POLYGON_SMOOTH_HINT		=> GL_POLYGON_SMOOTH_HINT,
	FOG_HINT			=> GL_FOG_HINT,
	TEXTURE_GEN_S			=> GL_TEXTURE_GEN_S,
	TEXTURE_GEN_T			=> GL_TEXTURE_GEN_T,
	TEXTURE_GEN_R			=> GL_TEXTURE_GEN_R,
	TEXTURE_GEN_Q			=> GL_TEXTURE_GEN_Q,
	PIXEL_MAP_I_TO_I_SIZE		=> GL_PIXEL_MAP_I_TO_I_SIZE,
	PIXEL_MAP_S_TO_S_SIZE		=> GL_PIXEL_MAP_S_TO_S_SIZE,
	PIXEL_MAP_I_TO_R_SIZE		=> GL_PIXEL_MAP_I_TO_R_SIZE,
	PIXEL_MAP_I_TO_G_SIZE		=> GL_PIXEL_MAP_I_TO_G_SIZE,
	PIXEL_MAP_I_TO_B_SIZE		=> GL_PIXEL_MAP_I_TO_B_SIZE,
	PIXEL_MAP_I_TO_A_SIZE		=> GL_PIXEL_MAP_I_TO_A_SIZE,
	PIXEL_MAP_R_TO_R_SIZE		=> GL_PIXEL_MAP_R_TO_R_SIZE,
	PIXEL_MAP_G_TO_G_SIZE		=> GL_PIXEL_MAP_G_TO_G_SIZE,
	PIXEL_MAP_B_TO_B_SIZE		=> GL_PIXEL_MAP_B_TO_B_SIZE,
	PIXEL_MAP_A_TO_A_SIZE		=> GL_PIXEL_MAP_A_TO_A_SIZE,
	UNPACK_SWAP_BYTES		=> GL_UNPACK_SWAP_BYTES,
	UNPACK_LSB_FIRST		=> GL_UNPACK_LSB_FIRST,
	UNPACK_ROW_LENGTH		=> GL_UNPACK_ROW_LENGTH,
	UNPACK_SKIP_ROWS		=> GL_UNPACK_SKIP_ROWS,
	UNPACK_SKIP_PIXELS		=> GL_UNPACK_SKIP_PIXELS,
	UNPACK_ALIGNMENT		=> GL_UNPACK_ALIGNMENT,
	PACK_SWAP_BYTES			=> GL_PACK_SWAP_BYTES,
	PACK_LSB_FIRST			=> GL_PACK_LSB_FIRST,
	PACK_ROW_LENGTH			=> GL_PACK_ROW_LENGTH,
	PACK_SKIP_ROWS			=> GL_PACK_SKIP_ROWS,
	PACK_SKIP_PIXELS		=> GL_PACK_SKIP_PIXELS,
	PACK_ALIGNMENT			=> GL_PACK_ALIGNMENT,
	MAP_COLOR			=> GL_MAP_COLOR,
	MAP_STENCIL			=> GL_MAP_STENCIL,
	INDEX_SHIFT			=> GL_INDEX_SHIFT,
	INDEX_OFFSET			=> GL_INDEX_OFFSET,
	RED_SCALE			=> GL_RED_SCALE,
	RED_BIAS			=> GL_RED_BIAS,
	ZOOM_X				=> GL_ZOOM_X,
	ZOOM_Y				=> GL_ZOOM_Y,
	GREEN_SCALE			=> GL_GREEN_SCALE,
	GREEN_BIAS			=> GL_GREEN_BIAS,
	BLUE_SCALE			=> GL_BLUE_SCALE,
	BLUE_BIAS			=> GL_BLUE_BIAS,
	ALPHA_SCALE			=> GL_ALPHA_SCALE,
	ALPHA_BIAS			=> GL_ALPHA_BIAS,
	DEPTH_SCALE			=> GL_DEPTH_SCALE,
	DEPTH_BIAS			=> GL_DEPTH_BIAS,
	MAX_EVAL_ORDER			=> GL_MAX_EVAL_ORDER,
	MAX_LIGHTS			=> GL_MAX_LIGHTS,
	MAX_CLIP_PLANES			=> GL_MAX_CLIP_PLANES,
	MAX_TEXTURE_SIZE		=> GL_MAX_TEXTURE_SIZE,
	MAX_PIXEL_MAP_TABLE		=> GL_MAX_PIXEL_MAP_TABLE,
	MAX_ATTRIB_STACK_DEPTH		=> GL_MAX_ATTRIB_STACK_DEPTH,
	MAX_MODELVIEW_STACK_DEPTH	=> GL_MAX_MODELVIEW_STACK_DEPTH,
	MAX_NAME_STACK_DEPTH		=> GL_MAX_NAME_STACK_DEPTH,
	MAX_PROJECTION_STACK_DEPTH	=> GL_MAX_PROJECTION_STACK_DEPTH,
	MAX_TEXTURE_STACK_DEPTH		=> GL_MAX_TEXTURE_STACK_DEPTH,
	MAX_VIEWPORT_DIMS		=> GL_MAX_VIEWPORT_DIMS,
	MAX_CLIENT_ATTRIB_STACK_DEPTH	=> GL_MAX_CLIENT_ATTRIB_STACK_DEPTH,
	SUBPIXEL_BITS			=> GL_SUBPIXEL_BITS,
	INDEX_BITS			=> GL_INDEX_BITS,
	RED_BITS			=> GL_RED_BITS,
	GREEN_BITS			=> GL_GREEN_BITS,
	BLUE_BITS			=> GL_BLUE_BITS,
	ALPHA_BITS			=> GL_ALPHA_BITS,
	DEPTH_BITS			=> GL_DEPTH_BITS,
	STENCIL_BITS			=> GL_STENCIL_BITS,
	ACCUM_RED_BITS			=> GL_ACCUM_RED_BITS,
	ACCUM_GREEN_BITS		=> GL_ACCUM_GREEN_BITS,
	ACCUM_BLUE_BITS			=> GL_ACCUM_BLUE_BITS,
	ACCUM_ALPHA_BITS		=> GL_ACCUM_ALPHA_BITS,
	NAME_STACK_DEPTH		=> GL_NAME_STACK_DEPTH,
	AUTO_NORMAL			=> GL_AUTO_NORMAL,
	MAP1_COLOR_4			=> GL_MAP1_COLOR_4,
	MAP1_INDEX			=> GL_MAP1_INDEX,
	MAP1_NORMAL			=> GL_MAP1_NORMAL,
	MAP1_TEXTURE_COORD_1		=> GL_MAP1_TEXTURE_COORD_1,
	MAP1_TEXTURE_COORD_2		=> GL_MAP1_TEXTURE_COORD_2,
	MAP1_TEXTURE_COORD_3		=> GL_MAP1_TEXTURE_COORD_3,
	MAP1_TEXTURE_COORD_4		=> GL_MAP1_TEXTURE_COORD_4,
	MAP1_VERTEX_3			=> GL_MAP1_VERTEX_3,
	MAP1_VERTEX_4			=> GL_MAP1_VERTEX_4,
	MAP2_COLOR_4			=> GL_MAP2_COLOR_4,
	MAP2_INDEX			=> GL_MAP2_INDEX,
	MAP2_NORMAL			=> GL_MAP2_NORMAL,
	MAP2_TEXTURE_COORD_1		=> GL_MAP2_TEXTURE_COORD_1,
	MAP2_TEXTURE_COORD_2		=> GL_MAP2_TEXTURE_COORD_2,
	MAP2_TEXTURE_COORD_3		=> GL_MAP2_TEXTURE_COORD_3,
	MAP2_TEXTURE_COORD_4		=> GL_MAP2_TEXTURE_COORD_4,
	MAP2_VERTEX_3			=> GL_MAP2_VERTEX_3,
	MAP2_VERTEX_4			=> GL_MAP2_VERTEX_4,
	MAP1_GRID_DOMAIN		=> GL_MAP1_GRID_DOMAIN,
	MAP1_GRID_SEGMENTS		=> GL_MAP1_GRID_SEGMENTS,
	MAP2_GRID_DOMAIN		=> GL_MAP2_GRID_DOMAIN,
	MAP2_GRID_SEGMENTS		=> GL_MAP2_GRID_SEGMENTS,
	TEXTURE_1D			=> GL_TEXTURE_1D,
	TEXTURE_2D			=> GL_TEXTURE_2D,
	FEEDBACK_BUFFER_SIZE		=> GL_FEEDBACK_BUFFER_SIZE,
	FEEDBACK_BUFFER_TYPE		=> GL_FEEDBACK_BUFFER_TYPE,
	SELECTION_BUFFER_SIZE		=> GL_SELECTION_BUFFER_SIZE,
	POLYGON_OFFSET_UNITS		=> GL_POLYGON_OFFSET_UNITS,
	POLYGON_OFFSET_POINT		=> GL_POLYGON_OFFSET_POINT,
	POLYGON_OFFSET_LINE		=> GL_POLYGON_OFFSET_LINE,
	CLIP_PLANE_1			=> GL_CLIP_PLANE0,
	CLIP_PLANE_2			=> GL_CLIP_PLANE1,
	CLIP_PLANE_3			=> GL_CLIP_PLANE2,
	CLIP_PLANE_4			=> GL_CLIP_PLANE3,
	CLIP_PLANE_5			=> GL_CLIP_PLANE4,
	CLIP_PLANE_6			=> GL_CLIP_PLANE5,
	LIGHT_1				=> GL_LIGHT0,
	LIGHT_2				=> GL_LIGHT1,
	LIGHT_3				=> GL_LIGHT2,
	LIGHT_4				=> GL_LIGHT3,
	LIGHT_5				=> GL_LIGHT4,
	LIGHT_6				=> GL_LIGHT5,
	LIGHT_7				=> GL_LIGHT6,
	LIGHT_8				=> GL_LIGHT7,
	BLEND_COLOR			=> GL_BLEND_COLOR,
	BLEND_EQUATION_RGB		=> GL_BLEND_EQUATION_RGB,
	CONVOLUTION_1D			=> GL_CONVOLUTION_1D,
	CONVOLUTION_2D			=> GL_CONVOLUTION_2D,
	SEPARABLE_2D			=> GL_SEPARABLE_2D,
	POST_CONVOLUTION_RED_SCALE	=> GL_POST_CONVOLUTION_RED_SCALE,
	POST_CONVOLUTION_GREEN_SCALE	=> GL_POST_CONVOLUTION_GREEN_SCALE,
	POST_CONVOLUTION_BLUE_SCALE	=> GL_POST_CONVOLUTION_BLUE_SCALE,
	POST_CONVOLUTION_ALPHA_SCALE	=> GL_POST_CONVOLUTION_ALPHA_SCALE,
	POST_CONVOLUTION_RED_BIAS	=> GL_POST_CONVOLUTION_RED_BIAS,
	POST_CONVOLUTION_GREEN_BIAS	=> GL_POST_CONVOLUTION_GREEN_BIAS,
	POST_CONVOLUTION_BLUE_BIAS	=> GL_POST_CONVOLUTION_BLUE_BIAS,
	POST_CONVOLUTION_ALPHA_BIAS	=> GL_POST_CONVOLUTION_ALPHA_BIAS,
	HISTOGRAM			=> GL_HISTOGRAM,
	MINMAX				=> GL_MINMAX,
	POLYGON_OFFSET_FILL		=> GL_POLYGON_OFFSET_FILL,
	POLYGON_OFFSET_FACTOR		=> GL_POLYGON_OFFSET_FACTOR,
	RESCALE_NORMAL			=> GL_RESCALE_NORMAL,
	TEXTURE_BINDING_1D		=> GL_TEXTURE_BINDING_1D,
	TEXTURE_BINDING_2D		=> GL_TEXTURE_BINDING_2D,
	TEXTURE_BINDING_3D		=> GL_TEXTURE_BINDING_3D,
	PACK_SKIP_IMAGES		=> GL_PACK_SKIP_IMAGES,
	PACK_IMAGE_HEIGHT		=> GL_PACK_IMAGE_HEIGHT,
	UNPACK_SKIP_IMAGES		=> GL_UNPACK_SKIP_IMAGES,
	UNPACK_IMAGE_HEIGHT		=> GL_UNPACK_IMAGE_HEIGHT,
	TEXTURE_3D			=> GL_TEXTURE_3D,
	MAX_3D_TEXTURE_SIZE		=> GL_MAX_3D_TEXTURE_SIZE,
	VERTEX_ARRAY			=> GL_VERTEX_ARRAY,
	NORMAL_ARRAY			=> GL_NORMAL_ARRAY,
	COLOR_ARRAY			=> GL_COLOR_ARRAY,
	INDEX_ARRAY			=> GL_INDEX_ARRAY,
	TEXTURE_COORD_ARRAY		=> GL_TEXTURE_COORD_ARRAY,
	EDGE_FLAG_ARRAY			=> GL_EDGE_FLAG_ARRAY,
	VERTEX_ARRAY_SIZE		=> GL_VERTEX_ARRAY_SIZE,
	VERTEX_ARRAY_TYPE		=> GL_VERTEX_ARRAY_TYPE,
	VERTEX_ARRAY_STRIDE		=> GL_VERTEX_ARRAY_STRIDE,
	NORMAL_ARRAY_TYPE		=> GL_NORMAL_ARRAY_TYPE,
	NORMAL_ARRAY_STRIDE		=> GL_NORMAL_ARRAY_STRIDE,
	COLOR_ARRAY_SIZE		=> GL_COLOR_ARRAY_SIZE,
	COLOR_ARRAY_TYPE		=> GL_COLOR_ARRAY_TYPE,
	COLOR_ARRAY_STRIDE		=> GL_COLOR_ARRAY_STRIDE,
	INDEX_ARRAY_TYPE		=> GL_INDEX_ARRAY_TYPE,
	INDEX_ARRAY_STRIDE		=> GL_INDEX_ARRAY_STRIDE,
	TEXTURE_COORD_ARRAY_SIZE	=> GL_TEXTURE_COORD_ARRAY_SIZE,
	TEXTURE_COORD_ARRAY_TYPE	=> GL_TEXTURE_COORD_ARRAY_TYPE,
	TEXTURE_COORD_ARRAY_STRIDE	=> GL_TEXTURE_COORD_ARRAY_STRIDE,
	EDGE_FLAG_ARRAY_STRIDE		=> GL_EDGE_FLAG_ARRAY_STRIDE,
	SAMPLE_BUFFERS			=> GL_SAMPLE_BUFFERS,
	SAMPLES				=> GL_SAMPLES,
	SAMPLE_COVERAGE_VALUE		=> GL_SAMPLE_COVERAGE_VALUE,
	SAMPLE_COVERAGE_INVERT		=> GL_SAMPLE_COVERAGE_INVERT,
	COLOR_MATRIX			=> GL_COLOR_MATRIX,
	COLOR_MATRIX_STACK_DEPTH	=> GL_COLOR_MATRIX_STACK_DEPTH,
	MAX_COLOR_MATRIX_STACK_DEPTH	=> GL_MAX_COLOR_MATRIX_STACK_DEPTH,
	POST_COLOR_MATRIX_RED_SCALE	=> GL_POST_COLOR_MATRIX_RED_SCALE,
	POST_COLOR_MATRIX_GREEN_SCALE	=> GL_POST_COLOR_MATRIX_GREEN_SCALE,
	POST_COLOR_MATRIX_BLUE_SCALE	=> GL_POST_COLOR_MATRIX_BLUE_SCALE,
	POST_COLOR_MATRIX_ALPHA_SCALE	=> GL_POST_COLOR_MATRIX_ALPHA_SCALE,
	POST_COLOR_MATRIX_RED_BIAS	=> GL_POST_COLOR_MATRIX_RED_BIAS,
	POST_COLOR_MATRIX_GREEN_BIAS	=> GL_POST_COLOR_MATRIX_GREEN_BIAS,
	POST_COLOR_MATRIX_BLUE_BIAS	=> GL_POST_COLOR_MATRIX_BLUE_BIAS,
	POST_COLOR_MATRIX_ALPHA_BIAS	=> GL_POST_COLOR_MATRIX_ALPHA_BIAS,
	BLEND_DST_RGB			=> GL_BLEND_DST_RGB,
	BLEND_SRC_RGB			=> GL_BLEND_SRC_RGB,
	BLEND_DST_ALPHA			=> GL_BLEND_DST_ALPHA,
	BLEND_SRC_ALPHA			=> GL_BLEND_SRC_ALPHA,
	COLOR_TABLE			=> GL_COLOR_TABLE,
	POST_CONVOLUTION_COLOR_TABLE	=> GL_POST_CONVOLUTION_COLOR_TABLE,
	POST_COLOR_MATRIX_COLOR_TABLE	=> GL_POST_COLOR_MATRIX_COLOR_TABLE,
	MAX_ELEMENTS_VERTICES		=> GL_MAX_ELEMENTS_VERTICES,
	MAX_ELEMENTS_INDICES		=> GL_MAX_ELEMENTS_INDICES,
	POINT_SIZE_MIN			=> GL_POINT_SIZE_MIN,
	POINT_SIZE_MAX			=> GL_POINT_SIZE_MAX,
	POINT_FADE_THRESHOLD_SIZE	=> GL_POINT_FADE_THRESHOLD_SIZE,
	POINT_DISTANCE_ATTENUATION	=> GL_POINT_DISTANCE_ATTENUATION,
	GENERATE_MIPMAP_HINT		=> GL_GENERATE_MIPMAP_HINT,
	LIGHT_MODEL_COLOR_CONTROL	=> GL_LIGHT_MODEL_COLOR_CONTROL,
	FOG_COORD_SRC			=> GL_FOG_COORD_SRC,
	CURRENT_FOG_COORD		=> GL_CURRENT_FOG_COORD,
	FOG_COORD_ARRAY_TYPE		=> GL_FOG_COORD_ARRAY_TYPE,
	FOG_COORD_ARRAY_STRIDE		=> GL_FOG_COORD_ARRAY_STRIDE,
	FOG_COORD_ARRAY			=> GL_FOG_COORD_ARRAY,
	COLOR_SUM			=> GL_COLOR_SUM,
	CURRENT_SECONDARY_COLOR		=> GL_CURRENT_SECONDARY_COLOR,
	SECONDARY_COLOR_ARRAY_SIZE	=> GL_SECONDARY_COLOR_ARRAY_SIZE,
	SECONDARY_COLOR_ARRAY_TYPE	=> GL_SECONDARY_COLOR_ARRAY_TYPE,
	SECONDARY_COLOR_ARRAY_STRIDE	=> GL_SECONDARY_COLOR_ARRAY_STRIDE,
	SECONDARY_COLOR_ARRAY		=> GL_SECONDARY_COLOR_ARRAY,
	CURRENT_RASTER_SECONDARY_COLOR	=> GL_CURRENT_RASTER_SECONDARY_COLOR,
	ALIASED_POINT_SIZE_RANGE	=> GL_ALIASED_POINT_SIZE_RANGE,
	ALIASED_LINE_WIDTH_RANGE	=> GL_ALIASED_LINE_WIDTH_RANGE,
	ACTIVE_TEXTURE			=> GL_ACTIVE_TEXTURE,
	CLIENT_ACTIVE_TEXTURE		=> GL_CLIENT_ACTIVE_TEXTURE,
	MAX_TEXTURE_UNITS		=> GL_MAX_TEXTURE_UNITS,
	TRANSPOSE_MODELVIEW_MATRIX	=> GL_TRANSPOSE_MODELVIEW_MATRIX,
	TRANSPOSE_PROJECTION_MATRIX	=> GL_TRANSPOSE_PROJECTION_MATRIX,
	TRANSPOSE_TEXTURE_MATRIX	=> GL_TRANSPOSE_TEXTURE_MATRIX,
	TRANSPOSE_COLOR_MATRIX		=> GL_TRANSPOSE_COLOR_MATRIX,
	TEXTURE_COMPRESSION_HINT	=> GL_TEXTURE_COMPRESSION_HINT,
	MAX_TEXTURE_LOD_BIAS		=> GL_MAX_TEXTURE_LOD_BIAS,
	TEXTURE_CUBE_MAP		=> GL_TEXTURE_CUBE_MAP,
	TEXTURE_BINDING_CUBE_MAP	=> GL_TEXTURE_BINDING_CUBE_MAP,
	MAX_CUBE_MAP_TEXTURE_SIZE	=> GL_MAX_CUBE_MAP_TEXTURE_SIZE,
	VERTEX_PROGRAM_POINT_SIZE	=> GL_VERTEX_PROGRAM_POINT_SIZE,
	VERTEX_PROGRAM_TWO_SIDE		=> GL_VERTEX_PROGRAM_TWO_SIDE,
	NUM_COMPRESSED_TEXTURE_FORMATS	=> GL_NUM_COMPRESSED_TEXTURE_FORMATS,
	COMPRESSED_TEXTURE_FORMATS	=> GL_COMPRESSED_TEXTURE_FORMATS,
	STENCIL_BACK_FUNC		=> GL_STENCIL_BACK_FUNC,
	STENCIL_BACK_FAIL		=> GL_STENCIL_BACK_FAIL,
	STENCIL_BACK_PASS_DEPTH_FAIL	=> GL_STENCIL_BACK_PASS_DEPTH_FAIL,
	STENCIL_BACK_PASS_DEPTH_PASS	=> GL_STENCIL_BACK_PASS_DEPTH_PASS,
	MAX_DRAW_BUFFERS		=> GL_MAX_DRAW_BUFFERS,
	BLEND_EQUATION_ALPHA		=> GL_BLEND_EQUATION_ALPHA,
	POINT_SPRITE			=> GL_POINT_SPRITE,
	MAX_VERTEX_ATTRIBS		=> GL_MAX_VERTEX_ATTRIBS,
	MAX_TEXTURE_COORDS		=> GL_MAX_TEXTURE_COORDS,
	MAX_TEXTURE_IMAGE_UNITS		=> GL_MAX_TEXTURE_IMAGE_UNITS,
	ARRAY_BUFFER_BINDING		=> GL_ARRAY_BUFFER_BINDING,
	ELEMENT_ARRAY_BUFFER_BINDING	=> GL_ELEMENT_ARRAY_BUFFER_BINDING,
	VERTEX_ARRAY_BUFFER_BINDING	=> GL_VERTEX_ARRAY_BUFFER_BINDING,
	NORMAL_ARRAY_BUFFER_BINDING	=> GL_NORMAL_ARRAY_BUFFER_BINDING,
	COLOR_ARRAY_BUFFER_BINDING	=> GL_COLOR_ARRAY_BUFFER_BINDING,
	INDEX_ARRAY_BUFFER_BINDING	=> GL_INDEX_ARRAY_BUFFER_BINDING,
	TEXTURE_COORD_ARRAY_BUFFER_BINDING
					=> GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING,
	EDGE_FLAG_ARRAY_BUFFER_BINDING	=> GL_EDGE_FLAG_ARRAY_BUFFER_BINDING,
	SECONDARY_COLOR_ARRAY_BUFFER_BINDING
					=> GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING,
	FOG_COORD_ARRAY_BUFFER_BINDING	=> GL_FOG_COORD_ARRAY_BUFFER_BINDING,
	PIXEL_PACK_BUFFER_BINDING	=> GL_PIXEL_PACK_BUFFER_BINDING,
	PIXEL_UNPACK_BUFFER_BINDING	=> GL_PIXEL_UNPACK_BUFFER_BINDING,
	MAX_FRAGMENT_UNIFORM_COMPONENTS	=> GL_MAX_FRAGMENT_UNIFORM_COMPONENTS,
	MAX_VERTEX_UNIFORM_COMPONENTS	=> GL_MAX_VERTEX_UNIFORM_COMPONENTS,
	MAX_VARYING_FLOATS		=> GL_MAX_VARYING_FLOATS,
	MAX_VERTEX_TEXTURE_IMAGE_UNITS	=> GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS,
	MAX_COMBINED_TEXTURE_IMAGE_UNITS=> GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS,
	FRAGMENT_SHADER_DERIVATIVE_HINT	=> GL_FRAGMENT_SHADER_DERIVATIVE_HINT,
	CURRENT_PROGRAM			=> GL_CURRENT_PROGRAM,
	STENCIL_BACK_REF		=> GL_STENCIL_BACK_REF,
	STENCIL_BACK_VALUE_MASK		=> GL_STENCIL_BACK_VALUE_MASK,
	STENCIL_BACK_WRITEMASK		=> GL_STENCIL_BACK_WRITEMASK
      );

    For Rendering_Mode Use
      (
	RENDER		=>	GL_RENDER,
	SELECTION	=>	GL_SELECT,
	FEEDBACK	=>	GL_FEEDBACK
      );

    For Error_Flag Use
      (
	NO_ERROR		=> GL_NO_ERROR,
	INVALID_ENUM		=> GL_INVALID_ENUM,
	INVALID_VALUE		=> GL_INVALID_VALUE,
	INVALID_OPERATION	=> GL_INVALID_OPERATION,
	STACK_OVERFLOW		=> GL_STACK_OVERFLOW,
	STACK_UNDERFLOW		=> GL_STACK_UNDERFLOW,
	OUT_OF_MEMORY		=> GL_OUT_OF_MEMORY,
	TABLE_TOO_LARGE		=> GL_TABLE_TOO_LARGE
      );

    For String_Constants Use
      (
	Vendor				=> GL_VENDOR,
	RENDERER			=> GL_RENDERER,
	Version				=> GL_VERSION,
	Shading_Language_Version	=> GL_SHADING_LANGUAGE_VERSION,
	EXTENSIONS			=> GL_EXTENSIONS
      );

    For Hints Use
      (
	FOG_HINT			=> GL_FOG_HINT,
	GENERATE_MIPMAP_HINT		=> GL_GENERATE_MIPMAP_HINT,
	LINE_SMOOTH_HINT		=> GL_LINE_SMOOTH_HINT,
	PERSPECTIVE_CORRECTION_HINT	=> GL_PERSPECTIVE_CORRECTION_HINT,
	POINT_SMOOTH_HINT		=> GL_POINT_SMOOTH_HINT,
	POLYGON_SMOOTH_HINT		=> GL_POLYGON_SMOOTH_HINT,
	TEXTURE_COMPRESSION_HINT	=> GL_TEXTURE_COMPRESSION_HINT,
	FRAGMENT_SHADER_DERIVATIVE_HINT	=> GL_FRAGMENT_SHADER_DERIVATIVE_HINT
      );

    For Hint_Mode Use
      (
	FASTEST		=> GL_FASTEST,
	NICEST		=> GL_NICEST,
	DONT_CARE	=> GL_DONT_CARE
      );

    For Accumulator_Operators Use
      (
	Accum		=> GL_ACCUM,
	LOAD		=> GL_LOAD,
	OP_RETURN	=> GL_RETURN,
	MULT		=> GL_MULT,
	ADD		=> GL_ADD
      );

    For Matrix_Mode_Type Use
      (
	MODELVIEW	=> GL_MODELVIEW,
	PROJECTION	=> GL_PROJECTION,
	TEXTURE		=> GL_TEXTURE,
	COLOR		=> GL_COLOR
      );

    For Command_Mode Use
      (
	COMPILE			=> GL_COMPILE,
	COMPILE_AND_EXECUTE	=> GL_COMPILE_AND_EXECUTE
      );

    For List_Type Use
      (
	GL_BYTE,
	GL_UNSIGNED_BYTE,
	GL_SHORT,
	GL_UNSIGNED_SHORT,
	GL_INT,
	GL_UNSIGNED_INT,
	GL_FLOAT,
	GL_2_BYTES,
	GL_3_BYTES,
	GL_4_BYTES
      );

    For Vertex_Interpretation Use
      (
	POINTS		=> GL_POINTS,
	LINES		=> GL_LINES,
	LINE_STRIP	=> GL_LINE_STRIP,
	LINE_LOOP	=> GL_LINE_LOOP,
	TRIANGLES	=> GL_TRIANGLES,
	TRIANGLE_STRIP	=> GL_TRIANGLE_STRIP,
	TRIANGLE_FAN	=> GL_TRIANGLE_FAN,
	QUADS		=> GL_QUADS,
	QUAD_STRIP	=> GL_QUAD_STRIP,
	POLYGON		=> GL_POLYGON
      );

    For Shading_Technique Use
      (
	Flat	=> GL_FLAT,
	Smooth	=> GL_SMOOTH
      );

    For Light_Model Use
      (
	Ambient		=> GL_LIGHT_MODEL_AMBIENT,
	COLOR_CONTROL	=> GL_LIGHT_MODEL_COLOR_CONTROL,
	LOCAL_VIEWER	=> GL_LIGHT_MODEL_LOCAL_VIEWER,
	TWO_SIDE	=> GL_LIGHT_MODEL_TWO_SIDE
      );

    For Material_Parameter Use
      (
	AMBIENT			=> GL_AMBIENT,
	DIFFUSE			=> GL_DIFFUSE,
	SPECULAR		=> GL_SPECULAR,
	EMISSION		=> GL_EMISSION,
	SHININESS		=> GL_SHININESS,
	AMBIENT_AND_DIFFUSE	=> GL_AMBIENT_AND_DIFFUSE,
	COLOR_INDEXES		=> GL_COLOR_INDEXES
      );

    For Pixel_Storage Use
      (
	UNPACK_SWAP_BYTES	=> GL_UNPACK_SWAP_BYTES,
	UNPACK_LSB_FIRST	=> GL_UNPACK_LSB_FIRST,
	UNPACK_ROW_LENGTH	=> GL_UNPACK_ROW_LENGTH,
	UNPACK_SKIP_ROWS	=> GL_UNPACK_SKIP_ROWS,
	UNPACK_SKIP_PIXELS	=> GL_UNPACK_SKIP_PIXELS,
	UNPACK_ALIGNMENT	=> GL_UNPACK_ALIGNMENT,
	PACK_SWAP_BYTES		=> GL_PACK_SWAP_BYTES,
	PACK_LSB_FIRST		=> GL_PACK_LSB_FIRST,
	PACK_ROW_LENGTH		=> GL_PACK_ROW_LENGTH,
	PACK_SKIP_ROWS		=> GL_PACK_SKIP_ROWS,
	PACK_SKIP_PIXELS	=> GL_PACK_SKIP_PIXELS,
	PACK_ALIGNMENT		=> GL_PACK_ALIGNMENT,
	PACK_SKIP_IMAGES	=> GL_PACK_SKIP_IMAGES,
	PACK_IMAGE_HEIGHT	=> GL_PACK_IMAGE_HEIGHT,
	UNPACK_SKIP_IMAGES	=> GL_UNPACK_SKIP_IMAGES,
	UNPACK_IMAGE_HEIGHT	=> GL_UNPACK_IMAGE_HEIGHT
      );

    For Transfer_Style Use
      (
	MAP_COLOR			=> GL_MAP_COLOR,
	MAP_STENCIL			=> GL_MAP_STENCIL,
	INDEX_SHIFT			=> GL_INDEX_SHIFT,
	INDEX_OFFSET			=> GL_INDEX_OFFSET,
	RED_SCALE			=> GL_RED_SCALE,
	RED_BIAS			=> GL_RED_BIAS,
	GREEN_SCALE			=> GL_GREEN_SCALE,
	GREEN_BIAS			=> GL_GREEN_BIAS,
	BLUE_SCALE			=> GL_BLUE_SCALE,
	BLUE_BIAS			=> GL_BLUE_BIAS,
	ALPHA_SCALE			=> GL_ALPHA_SCALE,
	ALPHA_BIAS			=> GL_ALPHA_BIAS,
	DEPTH_SCALE			=> GL_DEPTH_SCALE,
	DEPTH_BIAS			=> GL_DEPTH_BIAS,
	POST_CONVOLUTION_RED_SCALE	=> GL_POST_CONVOLUTION_RED_SCALE,
	POST_CONVOLUTION_GREEN_SCALE	=> GL_POST_CONVOLUTION_GREEN_SCALE,
	POST_CONVOLUTION_BLUE_SCALE	=> GL_POST_CONVOLUTION_BLUE_SCALE,
	POST_CONVOLUTION_ALPHA_SCALE	=> GL_POST_CONVOLUTION_ALPHA_SCALE,
	POST_CONVOLUTION_RED_BIAS	=> GL_POST_CONVOLUTION_RED_BIAS,
	POST_CONVOLUTION_GREEN_BIAS	=> GL_POST_CONVOLUTION_GREEN_BIAS,
	POST_CONVOLUTION_BLUE_BIAS	=> GL_POST_CONVOLUTION_BLUE_BIAS,
	POST_CONVOLUTION_ALPHA_BIAS	=> GL_POST_CONVOLUTION_ALPHA_BIAS,
	POST_COLOR_MATRIX_RED_SCALE	=> GL_POST_COLOR_MATRIX_RED_SCALE,
	POST_COLOR_MATRIX_GREEN_SCALE	=> GL_POST_COLOR_MATRIX_GREEN_SCALE,
	POST_COLOR_MATRIX_BLUE_SCALE	=> GL_POST_COLOR_MATRIX_BLUE_SCALE,
	POST_COLOR_MATRIX_ALPHA_SCALE	=> GL_POST_COLOR_MATRIX_ALPHA_SCALE,
	POST_COLOR_MATRIX_RED_BIAS	=> GL_POST_COLOR_MATRIX_RED_BIAS,
	POST_COLOR_MATRIX_GREEN_BIAS	=> GL_POST_COLOR_MATRIX_GREEN_BIAS,
	POST_COLOR_MATRIX_BLUE_BIAS	=> GL_POST_COLOR_MATRIX_BLUE_BIAS,
	POST_COLOR_MATRIX_ALPHA_BIAS	=> GL_POST_COLOR_MATRIX_ALPHA_BIAS
      );

    For Pixel_Mapping_Type Use
      (
	I_TO_I	=> GL_PIXEL_MAP_I_TO_I,
	S_TO_S	=> GL_PIXEL_MAP_S_TO_S,
	I_TO_R	=> GL_PIXEL_MAP_I_TO_R,
	I_TO_G	=> GL_PIXEL_MAP_I_TO_G,
	I_TO_B	=> GL_PIXEL_MAP_I_TO_B,
	I_TO_A	=> GL_PIXEL_MAP_I_TO_A,
	R_TO_R	=> GL_PIXEL_MAP_R_TO_R,
	G_TO_G	=> GL_PIXEL_MAP_G_TO_G,
	B_TO_B	=> GL_PIXEL_MAP_B_TO_B,
	A_TO_A	=> GL_PIXEL_MAP_A_TO_A
      );

    For Pixel_Data_Format Use
      (
	COLOR_INDEX		=> GL_COLOR_INDEX,
	STENCIL_INDEX		=> GL_STENCIL_INDEX,
	DEPTH_COMPONENT		=> GL_DEPTH_COMPONENT,
	RED			=> GL_RED,
	GREEN			=> GL_GREEN,
	BLUE			=> GL_BLUE,
	ALPHA			=> GL_ALPHA,
	PDF_RGB			=> GL_RGB,
	PDF_BGR			=> GL_BGR,
	PDF_RGBA		=> GL_RGBA,
	PDF_BGRA		=> GL_BGRA,
	LUMINANCE		=> GL_LUMINANCE,
	LUMINANCE_ALPHA		=> GL_LUMINANCE_ALPHA
      );

    For Pixel_Data_Type Use
      (
	PDT_BYTE		=> GL_BYTE,
	PDT_UNSIGNED_BYTE	=> GL_UNSIGNED_BYTE,
	PDT_SHORT		=> GL_SHORT,
	PDT_UNSIGNED_SHORT	=> GL_UNSIGNED_SHORT,
	PDT_INTEGER		=> GL_INT,
	PDT_UNSIGNED_INTEGER	=> GL_UNSIGNED_INT,
	PDT_FLOAT		=> GL_FLOAT,
	PDT_BITMAP		=> GL_BITMAP,
	PDT_332			=> GL_UNSIGNED_BYTE_3_3_2,
	PDT_4444		=> GL_UNSIGNED_SHORT_4_4_4_4,
	PDT_5551		=> GL_UNSIGNED_SHORT_5_5_5_1,
	PDT_8888		=> GL_UNSIGNED_INT_8_8_8_8,
	PDT_AAA2		=> GL_UNSIGNED_INT_10_10_10_2,
	PDT_233			=> GL_UNSIGNED_BYTE_2_3_3_REV,
	PDT_565			=> GL_UNSIGNED_SHORT_5_6_5,
	PDT_REVERSE_565		=> GL_UNSIGNED_SHORT_5_6_5_REV,
	PDT_REVEVERSE_4444	=> GL_UNSIGNED_SHORT_4_4_4_4_REV,
	PDT_REVERSE_1555	=> GL_UNSIGNED_SHORT_1_5_5_5_REV,
	PDT_REVERSE_8888	=> GL_UNSIGNED_INT_8_8_8_8_REV,
	PDT_REVERSE_2AAA	=> GL_UNSIGNED_INT_2_10_10_10_REV
      );

    For Pixel_Copy_Type Use
      (
	Color	=> GL_COLOR,
	Depth	=> GL_DEPTH,
	Stencil	=> GL_STENCIL
      );

    For Stencil_Op_Type Use
      (
	ZERO		=> GL_ZERO,
	KEEP		=> GL_KEEP,
	REPLACE		=> GL_REPLACE,
	INCREMENT	=> GL_INCR,
	DECREMENT	=> GL_DECR,
	INVERT		=> GL_INVERT,
	INCREMENT_WRAP	=> GL_INCR_WRAP,
	DECREMENT_WRAP	=> GL_DECR_WRAP
      );

    For Texture_Generation_Type Use
      (
	OBJECT_LINEAR	=> GL_OBJECT_LINEAR,
	EYE_LINEAR	=> GL_EYE_LINEAR,
	SPHERE_MAP	=> GL_SPHERE_MAP,
	NORMAL_MAP	=> GL_NORMAL_MAP,
	REFLECTION_MAP	=> GL_REFLECTION_MAP
      );

    For Texture_Coordinate_Type Use
      (
	S	=> GL_S,
	T	=> GL_T,
	R	=> GL_R,
	Q	=> GL_Q
      );

    For Texture_Coordinate_Generation Use
      (
	TEXTURE_GEN_MODE	=> GL_TEXTURE_GEN_MODE,
	OBJECT_PLANE		=> GL_OBJECT_PLANE,
	EYE_PLANE		=> GL_EYE_PLANE
      );

    For Texture_Environment_Type Use
      (
	TEXTURE_ENVIRON		=> GL_TEXTURE_ENV,
	TEXTURE_FILTER_CONTROL	=> GL_TEXTURE_FILTER_CONTROL,
	POINT_SPRITE		=> GL_POINT_SPRITE
      );

    For Texture_Environ_Type Use
      (
	ALPHA_SCALE		=> GL_ALPHA_SCALE,
	TEXTURE_ENV_MODE	=> GL_TEXTURE_ENV_MODE,
	TEXTURE_LOD_BIAS	=> GL_TEXTURE_LOD_BIAS,
	COMBINE_RGB		=> GL_COMBINE_RGB,
	COMBINE_ALPHA		=> GL_COMBINE_ALPHA,
	RGB_SCALE		=> GL_RGB_SCALE,
	SOURCE_1_RGB		=> GL_SRC0_RGB,
	SOURCE_2_RGB		=> GL_SRC1_RGB,
	SOURCE_3_RGB		=> GL_SRC2_RGB,
	SOURCE_1_ALPHA		=> GL_SRC0_ALPHA,
	SOURCE_2_ALPHA		=> GL_SRC1_ALPHA,
	SOURCE_3_ALPHA		=> GL_SRC2_ALPHA,
	OPERAND_1_RGB		=> GL_OPERAND0_RGB,
	OPERAND_2_RGB		=> GL_OPERAND1_RGB,
	OPERAND_3_RGB		=> GL_OPERAND2_RGB,
	OPERAND_1_ALPHA		=> GL_OPERAND0_ALPHA,
	OPERAND_2_ALPHA		=> GL_OPERAND1_ALPHA,
	OPERAND_3_ALPHA		=> GL_OPERAND2_ALPHA,
	COORD_REPLACE		=> GL_COORD_REPLACE
      );

    For Texture_Environ_Parameter Use
      (
        ADD			=> GL_ADD,
        SRC_COLOR		=> GL_SRC_COLOR,
        ONE_MINUS_SRC_COLOR	=> GL_ONE_MINUS_SRC_COLOR,
        SRC_ALPHA		=> GL_SRC_ALPHA,
        ONE_MINUS_SRC_ALPHA	=> GL_ONE_MINUS_SRC_ALPHA,
        BLEND			=> GL_BLEND,
        TEXTURE			=> GL_TEXTURE,
        REPLACE			=> GL_REPLACE,
        MODULATE		=> GL_MODULATE,
        DECAL			=> GL_DECAL,
        SUBTRACT		=> GL_SUBTRACT,
        COMBINE			=> GL_COMBINE,
        ADD_SIGNED		=> GL_ADD_SIGNED,
        INTERPOLATE		=> GL_INTERPOLATE,
        TEP_CONSTANT		=> GL_CONSTANT,
        PRIMARY_COLOR		=> GL_PRIMARY_COLOR,
        PREVIOUS		=> GL_PREVIOUS
      );

    for Texture_Target Use
      (
	One_Dimensional		=> GL_TEXTURE_1D,
	Two_Dimensional		=> GL_TEXTURE_2D,
	Three_Dimensional	=> GL_TEXTURE_3D,
	Cube_Map		=> GL_TEXTURE_CUBE_MAP
      );

    For Extended_Texture_Target Use
      (
	TEXTURE_1D			=> GL_TEXTURE_1D,
	TEXTURE_2D			=> GL_TEXTURE_2D,
	PROXY_TEXTURE_1D		=> GL_PROXY_TEXTURE_1D,
	PROXY_TEXTURE_2D		=> GL_PROXY_TEXTURE_2D,
	TEXTURE_3D			=> GL_TEXTURE_3D,
	PROXY_TEXTURE_3D		=> GL_PROXY_TEXTURE_3D,
	TEXTURE_CUBE_MAP_POSITIVE_X	=> GL_TEXTURE_CUBE_MAP_POSITIVE_X,
	TEXTURE_CUBE_MAP_NEGATIVE_X	=> GL_TEXTURE_CUBE_MAP_NEGATIVE_X,
	TEXTURE_CUBE_MAP_POSITIVE_Y	=> GL_TEXTURE_CUBE_MAP_POSITIVE_Y,
	TEXTURE_CUBE_MAP_NEGATIVE_Y	=> GL_TEXTURE_CUBE_MAP_NEGATIVE_Y,
	TEXTURE_CUBE_MAP_POSITIVE_Z	=> GL_TEXTURE_CUBE_MAP_POSITIVE_Z,
	TEXTURE_CUBE_MAP_NEGATIVE_Z	=> GL_TEXTURE_CUBE_MAP_NEGATIVE_Z,
	PROXY_TEXTURE_CUBE_MAP		=> GL_PROXY_TEXTURE_CUBE_MAP
      );


    For Texture_Paramater_Type Use
      (
        TEXTURE_MAG_FILTER              => GL_TEXTURE_MAG_FILTER,
        TEXTURE_MIN_FILTER              => GL_TEXTURE_MIN_FILTER,
        TEXTURE_WRAP_S          => GL_TEXTURE_WRAP_S,
        TEXTURE_WRAP_T          => GL_TEXTURE_WRAP_T,
        TEXTURE_PRIORITY                => GL_TEXTURE_PRIORITY,
        TEXTURE_WRAP_R          => GL_TEXTURE_WRAP_R,
        TEXTURE_MIN_LOD         => GL_TEXTURE_MIN_LOD,
        TEXTURE_MAX_LOD         => GL_TEXTURE_MAX_LOD,
        TEXTURE_BASE_LEVEL              => GL_TEXTURE_BASE_LEVEL,
        TEXTURE_MAX_LEVEL               => GL_TEXTURE_MAX_LEVEL,
        GENERATE_MIPMAP         => GL_GENERATE_MIPMAP,
        DEPTH_TEXTURE_MODE              => GL_DEPTH_TEXTURE_MODE,
        TEXTURE_COMPARE_MODE            => GL_TEXTURE_COMPARE_MODE,
        TEXTURE_COMPARE_FUNC            => GL_TEXTURE_COMPARE_FUNC,
	TEXTURE_BORDER_COLOR	=> GL_TEXTURE_BORDER_COLOR
      );

    For Texture_Parameter Use
      (
        WIDTH			=> GL_TEXTURE_WIDTH,
        HEIGHT			=> GL_TEXTURE_HEIGHT,
        INTERNAL_FORMAT		=> GL_TEXTURE_INTERNAL_FORMAT,
        BORDER			=> GL_TEXTURE_BORDER,
        RED_SIZE		=> GL_TEXTURE_RED_SIZE,
        GREEN_SIZE		=> GL_TEXTURE_GREEN_SIZE,
        BLUE_SIZE		=> GL_TEXTURE_BLUE_SIZE,
        ALPHA_SIZE		=> GL_TEXTURE_ALPHA_SIZE,
        LUMINANCE_SIZE		=> GL_TEXTURE_LUMINANCE_SIZE,
        INTENSITY_SIZE		=> GL_TEXTURE_INTENSITY_SIZE,
	DEPTH			=> GL_TEXTURE_DEPTH,
	COMPRESSED_IMAGE_SIZE	=> GL_TEXTURE_COMPRESSED_IMAGE_SIZE,
	COMPRESSED		=> GL_TEXTURE_COMPRESSED,
	DEPTH_SIZE		=> GL_TEXTURE_DEPTH_SIZE
      );

    For Internal_Format_Type Use
      (
       DEPTH_COMPONENT			=> GL_DEPTH_COMPONENT,
       ALPHA				=> GL_ALPHA,
       RGB_Format			=> GL_RGB,
       RGBA_Format			=> GL_RGBA,
       LUMINANCE			=> GL_LUMINANCE,
       LUMINANCE_ALPHA			=> GL_LUMINANCE_ALPHA,
       R3_G3_B2				=> GL_R3_G3_B2,
       ALPHA4				=> GL_ALPHA4,
       ALPHA8				=> GL_ALPHA8,
       ALPHA12				=> GL_ALPHA12,
       ALPHA16				=> GL_ALPHA16,
       LUMINANCE4			=> GL_LUMINANCE4,
       LUMINANCE8			=> GL_LUMINANCE8,
       LUMINANCE12			=> GL_LUMINANCE12,
       LUMINANCE16			=> GL_LUMINANCE16,
       LUMINANCE4_ALPHA4		=> GL_LUMINANCE4_ALPHA4,
       LUMINANCE6_ALPHA2		=> GL_LUMINANCE6_ALPHA2,
       LUMINANCE8_ALPHA8		=> GL_LUMINANCE8_ALPHA8,
       LUMINANCE12_ALPHA4		=> GL_LUMINANCE12_ALPHA4,
       LUMINANCE12_ALPHA12		=> GL_LUMINANCE12_ALPHA12,
       LUMINANCE16_ALPHA16		=> GL_LUMINANCE16_ALPHA16,
       INTENSITY			=> GL_INTENSITY,
       INTENSITY4			=> GL_INTENSITY4,
       INTENSITY8			=> GL_INTENSITY8,
       INTENSITY12			=> GL_INTENSITY12,
       INTENSITY16			=> GL_INTENSITY16,
       RGB4				=> GL_RGB4,
       RGB5				=> GL_RGB5,
       RGB8				=> GL_RGB8,
       RGB10				=> GL_RGB10,
       RGB12				=> GL_RGB12,
       RGB16				=> GL_RGB16,
       RGBA2				=> GL_RGBA2,
       RGBA4				=> GL_RGBA4,
       RGB5_A1				=> GL_RGB5_A1,
       RGBA8				=> GL_RGBA8,
       RGB10_A2				=> GL_RGB10_A2,
       RGBA12				=> GL_RGBA12,
       RGBA16				=> GL_RGBA16,
       DEPTH_COMPONENT16		=> GL_DEPTH_COMPONENT16,
       DEPTH_COMPONENT24		=> GL_DEPTH_COMPONENT24,
       DEPTH_COMPONENT32		=> GL_DEPTH_COMPONENT32,
       COMPRESSED_ALPHA			=> GL_COMPRESSED_ALPHA,
       COMPRESSED_LUMINANCE		=> GL_COMPRESSED_LUMINANCE,
       COMPRESSED_LUMINANCE_ALPHA	=> GL_COMPRESSED_LUMINANCE_ALPHA,
       COMPRESSED_INTENSITY		=> GL_COMPRESSED_INTENSITY,
       COMPRESSED_RGB			=> GL_COMPRESSED_RGB,
       COMPRESSED_RGBA			=> GL_COMPRESSED_RGBA,
       SRGB				=> GL_SRGB,
       SRGB8				=> GL_SRGB8,
       SRGB_ALPHA			=> GL_SRGB_ALPHA,
       SRGB8_ALPHA8			=> GL_SRGB8_ALPHA8,
       SLUMINANCE_ALPHA			=> GL_SLUMINANCE_ALPHA,
       SLUMINANCE8_ALPHA8		=> GL_SLUMINANCE8_ALPHA8,
       SLUMINANCE			=> GL_SLUMINANCE,
       SLUMINANCE8			=> GL_SLUMINANCE8
      );

    For Map_Target use
      (
	MAP1_COLOR_4		=> GL_MAP1_COLOR_4,
	MAP1_INDEX		=> GL_MAP1_INDEX,
	MAP1_NORMAL		=> GL_MAP1_NORMAL,
	MAP1_TEXTURE_COORD_1	=> GL_MAP1_TEXTURE_COORD_1,
	MAP1_TEXTURE_COORD_2	=> GL_MAP1_TEXTURE_COORD_2,
	MAP1_TEXTURE_COORD_3	=> GL_MAP1_TEXTURE_COORD_3,
	MAP1_TEXTURE_COORD_4	=> GL_MAP1_TEXTURE_COORD_4,
	MAP1_VERTEX_3		=> GL_MAP1_VERTEX_3,
	MAP1_VERTEX_4		=> GL_MAP1_VERTEX_4,
	MAP2_COLOR_4		=> GL_MAP2_COLOR_4,
	MAP2_INDEX		=> GL_MAP2_INDEX,
	MAP2_NORMAL		=> GL_MAP2_NORMAL,
	MAP2_TEXTURE_COORD_1	=> GL_MAP2_TEXTURE_COORD_1,
	MAP2_TEXTURE_COORD_2	=> GL_MAP2_TEXTURE_COORD_2,
	MAP2_TEXTURE_COORD_3	=> GL_MAP2_TEXTURE_COORD_3,
	MAP2_TEXTURE_COORD_4	=> GL_MAP2_TEXTURE_COORD_4,
	MAP2_VERTEX_3		=> GL_MAP2_VERTEX_3,
	MAP2_VERTEX_4		=> GL_MAP2_VERTEX_4
      );

    For Map_Query Use
      (
	COEFF		=> GL_COEFF,
	ORDER		=> GL_ORDER,
	DOMAIN		=> GL_DOMAIN
      );

    for Fog_Parameter Use
      (
	FOG_INDEX	=> GL_FOG_INDEX,
	FOG_DENSITY	=> GL_FOG_DENSITY,
	FOG_START	=> GL_FOG_START,
	FOG_END		=> GL_FOG_END,
	FOG_MODE	=> GL_FOG_MODE,
	FOG_COLOR	=> GL_FOG_COLOR,
	FOG_COORD_SRC	=> GL_FOG_COORD_SRC
      );

    For Vertex_Info Use
      (
	VI_2D			=> GL_2D,
	VI_3D			=> GL_3D,
	VI_3D_COLOR		=> GL_3D_COLOR,
	VI_3D_COLOR_TEXTURE	=> GL_3D_COLOR_TEXTURE,
	VI_4D_COLOR_TEXTURE	=> GL_4D_COLOR_TEXTURE
      );

    For Array_Format_Type Use
      (
	V2F			=> GL_V2F,
	V3F			=> GL_V3F,
	C4UB_V2F		=> GL_C4UB_V2F,
	C4UB_V3F		=> GL_C4UB_V3F,
	C3F_V3F			=> GL_C3F_V3F,
	N3F_V3F			=> GL_N3F_V3F,
	C4F_N3F_V3F		=> GL_C4F_N3F_V3F,
	T2F_V3F			=> GL_T2F_V3F,
	T4F_V4F			=> GL_T4F_V4F,
	T2F_C4UB_V3F		=> GL_T2F_C4UB_V3F,
	T2F_C3F_V3F		=> GL_T2F_C3F_V3F,
	T2F_N3F_V3F		=> GL_T2F_N3F_V3F,
	T2F_C4F_N3F_V3F		=> GL_T2F_C4F_N3F_V3F,
	T4F_C4F_N3F_V4F		=> GL_T4F_C4F_N3F_V4F
      );


--------------------------------------------------------------------------------
----   SUBTYPES		OPEN-GL TYPES RELATING TO THE CONSTANTS FOR ENUM.   ----
--------------------------------------------------------------------------------

    SubType RGBA is Chanel_Indices Range Chanel_Indices'Range;
    SubType RGB is RGBA Range Red..Green;

    SubType Destination_Factor is Source_Factor
	with STATIC_PREDICATE => Destination_Factor /= SRC_ALPHA_SATURATE;

    SubType Buffer_Mode is Drawing_Mode
	with static_predicate => Buffer_Mode in FRONT_LEFT..RIGHT|AUX_1..AUX_4;

    SubType Pixel_Packing is Pixel_Storage Range
	PACK_SWAP_BYTES..PACK_IMAGE_HEIGHT;

    SubType Pixel_Unpacking is Pixel_Storage
	with Static_Predicate => Pixel_Unpacking not in Pixel_Packing;

    SubType Material_Color is Material_Parameter Range
      	AMBIENT..AMBIENT_AND_DIFFUSE
	with Static_Predicate => Material_Color /= SHININESS;

    SubType Pixel_Data_Type_8 is Pixel_Data_Type
	with  Static_Predicate => Pixel_Data_Type_8 in
		PDT_BYTE | PDT_UNSIGNED_BYTE | PDT_332 | PDT_233;

    SubType Pixel_Data_Type_16 is Pixel_Data_Type
	with  Static_Predicate => Pixel_Data_Type_16 in
		PDT_SHORT | PDT_UNSIGNED_SHORT | PDT_4444 | PDT_5551 |
		PDT_565 | PDT_REVERSE_565 | PDT_REVEVERSE_4444 |
		PDT_REVERSE_1555;

    SubType Pixel_Data_Type_32 is Pixel_Data_Type
	with  Static_Predicate => Pixel_Data_Type_32 in
		PDT_INTEGER | PDT_UNSIGNED_INTEGER | PDT_8888 | PDT_AAA2 |
		PDT_REVERSE_8888 | PDT_REVERSE_2AAA | PDT_FLOAT;


    SubType Nonsymbol_Environ_Parameter is Texture_Environ_Type
	with Static_Predicate =>  Nonsymbol_Environ_Parameter in
		TEXTURE_LOD_BIAS | RGB_SCALE | ALPHA_SCALE;

    SubType Nonvector_Texture_Paramater_Type is Texture_Paramater_Type Range
	Texture_Paramater_Type'Succ(TEXTURE_BORDER_COLOR)
      ..Texture_Paramater_Type'Last;

    SubType Texture_Pixel_Data_Format is Pixel_Data_Format
	with Static_Predicate =>
		Texture_Pixel_Data_Format not in STENCIL_INDEX|DEPTH_COMPONENT;

    SubType Texture_Target_1D is Extended_Texture_Target
	with Static_Predicate =>  Texture_Target_1D in
				TEXTURE_1D | PROXY_TEXTURE_1D;

    SubType Texture_Target_2D is Extended_Texture_Target
	with Static_Predicate =>  Texture_Target_2D not in Texture_Target_1D;

    SubType Map1_Target is Map_Target Range MAP1_COLOR_4..MAP1_VERTEX_4;

    SubType Map2_Target is Map_Target Range MAP2_COLOR_4..MAP2_VERTEX_4;


--------------------------------------------------------------------------------
----   MATRICES/ARRAYS		OPEN-GL DEFINED ARRAY & MATRIX TYPES.	    ----
--------------------------------------------------------------------------------

    ---------------------
    --  VECTOR ARRAYS  --
    ---------------------

    -- Vector_Range is the range of the length of acceptable OpenGL vectors.
    SubType Dimension_Range is Positive Range 1..4;

    -- Vector_Range is the range of the length of acceptable OpenGL vectors.
    SubType Vector_Range is Dimension_Range Range
	Dimension_Range'Succ(Dimension_Range'First)..Dimension_Range'Last;

    Generic
	Type Element is private;
    Package Vector is

	-- Vector's index type may be needed to be widened to Positive.
	Type Vector is Array(Positive Range <>) of Aliased Element;
	SubType Vector_2 is Vector(1..2);
	SubType Vector_3 is Vector(1..3);
	SubType Vector_4 is Vector(1..4);

	Type Color_via_Chanels	is Array (Chanel_Indices Range <>)
	  of Aliased Element
	  with static_predicate => Color_via_Chanels'Length in 3..4
					and Color_via_Chanels'First = Red;
	Subtype Color_RGB	is Color_via_Chanels(RGB);
	Subtype Color_RGBA	is Color_via_Chanels(RGBA);
    End Vector;


    Package Float_Vector			is new Vector(		 Float);
    Package Double_Vector			is new Vector(		Double);
    Package Short_Vector			is new Vector(		 Short);
    Package Integer_Vector			is new Vector(	       Integer);
    Package Byte_Vector				is new Vector(		  Byte);
    Package Unsigned_Byte_Vector		is new Vector(   Unsigned_Byte);
    Package Unsigned_Short_Vector		is new Vector(  Unsigned_Short);
    Package Unsigned_Integer_Vector		is new Vector(Unsigned_Integer);
    Package Clamped_Float_Vector		is new Vector(   Clamped_Float);

    SubType Double_Vector_Type		  is Double_Vector.Vector;
    SubType Float_Vector_Type		  is Float_Vector.Vector;
    SubType Short_Vector_Type		  is Short_Vector.Vector;
    SubType Integer_Vector_Type		  is Integer_Vector.Vector;
    SubType Byte_Vector_Type		  is Byte_Vector.Vector;
    SubType Unsigned_Short_Vector_Type	  is Unsigned_Short_Vector.Vector;
    SubType Unsigned_Integer_Vector_Type  is Unsigned_Integer_Vector.Vector;
    SubType Unsigned_Byte_Vector_Type	  is Unsigned_Byte_Vector.Vector;
    SubType Clamped_Float_Vector_Type	  is Clamped_Float_Vector.Vector;

    SubType Double_Color	   is Double_Vector.Color_via_Chanels;
    SubType Float_Color		   is Float_Vector.Color_via_Chanels;
    SubType Short_Color		   is Short_Vector.Color_via_Chanels;
    SubType Integer_Color	   is Integer_Vector.Color_via_Chanels;
    SubType Byte_Color		   is Byte_Vector.Color_via_Chanels;
    SubType Unsigned_Short_Color   is Unsigned_Short_Vector.Color_via_Chanels;
    SubType Unsigned_Integer_Color is Unsigned_Integer_Vector.Color_via_Chanels;
    SubType Unsigned_Byte_Color	   is Unsigned_Byte_Vector.Color_via_Chanels;


    Type Boolean_Vector_Type is Array (Positive Range <>) of Aliased Boolean;

    SubType Two_Bytes	is Byte_Vector.Vector_2;
    SubType Three_Bytes	is Byte_Vector.Vector_3;
    SubType Four_Bytes	is Byte_Vector.Vector_4;

    Package Two_Byte_Vector	is new Vector(	Two_Bytes	);
    Package Three_Byte_Vector	is new Vector(	Three_Bytes	);
    Package Four_Byte_Vector	is new Vector(	Four_Bytes	);

    SubType Two_Byte_Vector_Type	is Two_Byte_Vector.Vector;
    SubType Three_Byte_Vector_Type	is Three_Byte_Vector.Vector;
    SubType Four_Byte_Vector_Type	is Four_Byte_Vector.Vector;


    ---------------------
    --  MATRIX ARRAYS  --
    ---------------------
    SubType Matrix_Index is Positive Range 1..4;
    Type Float_Matrix  is array (Matrix_Index, Matrix_Index) of Aliased Float;
    Type Double_Matrix is array(Matrix_Index, Matrix_Index) of Aliased Double;

    Type Bitmap is Array(Positive Range <>, Positive Range <>) of Unsigned_Byte;


Private
    -- TODO:	Finish the small-float type declarations by providing the
    --		appropriate primitive operations for manipulation and conversion
    --		to/from the standard 32-bit IEEE Float. Fortionately they appear
    --		to be non-critical to the standarc/core OpenGL functions.

    Type Mantissa_10 is New Natural Range 0..2**10-1;
    For Mantissa_10'Size Use 10;

    Type Mantissa_6 is Mod 2**6;
    --New Natural Range 0..2**6-1;
    For Mantissa_6'Size Use 6;

    Type Mantissa_5 is Mod 2**5; --New Natural Range 0..2**5-1;
    For Mantissa_5'Size Use 5;

    Type Exponent_5 is Mod 2**5;
    --New Natural Range 0..2**5-1;
    For Exponent_5'Size Use 5;

    Type Float_10 is record
	Mantissa : Mantissa_5;
	Exponent : Exponent_5;
    end record;
    Pragma Pack(Float_10);
    for Float_10'Size use 10;

    Type Float_11 is record
	Mantissa : Mantissa_6;
	Exponent : Exponent_5;
    end record;
    Pragma Pack(Float_11);
    for Float_11'Size use 11;

    Type Half is record
	Sign	 : Standard.Boolean;
	Mantissa : Mantissa_10;
	Exponent : Exponent_5;
    end record;
    pragma Pack(Half);
    for Half'Size Use 16;

End TAO_GL.Types;
