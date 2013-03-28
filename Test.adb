Pragma Ada_2012;

With
TAO_GL,
TAO_GL.Types,
TAO_GL.Functions,
TAO_GL.Utility_Toolkit,
Ada.Numerics.Generic_Elementary_Functions,
Ada.Unchecked_Conversion;

with
System.Address_To_Access_Conversions,
Ada.Numerics,
Ada.Text_IO,
Ada.Containers.Ordered_Maps;

Procedure Test is
    -- Note:
    --	GLUT	OpenGL Utility Toolkit

    Package Test_Enumerations is
	Type NNAS is Access String;
	Type Accessability_1 is Array( Natural Range <> ) of NNAS;
	Type Accessability_2 is Array( Natural Range <> ) of Natural;
	Names	: Constant Accessability_1;
	Values	: Constant Accessability_2;

	Procedure Display( Representation : Boolean := False );
    Private
	Use TAO_GL.Types.Constants;

	Function "+" ( Item : String ) Return NNAS is
	  ( New String'( Item ) );

	Names	: Constant Accessability_1:=
	    ( --2..1	=>  <>   );
+"GL_ZERO",
+"GL_ONE",
+"GL_SRC_COLOR",
+"GL_ONE_MINUS_SRC_COLOR",
+"GL_DST_COLOR",
+"GL_ONE_MINUS_DST_COLOR",
+"GL_SRC_ALPHA",
+"GL_ONE_MINUS_SRC_ALPHA",
+"GL_DST_ALPHA",
+"GL_ONE_MINUS_DST_ALPHA",
+"GL_CONSTANT_COLOR",
+"GL_ONE_MINUS_CONSTANT_COLOR",
+"GL_CONSTANT_ALPHA",
+"GL_ONE_MINUS_CONSTANT_ALPHA",
+"GL_SRC_ALPHA_SATURATE",
+"GL_SRC1_COLOR",
+"GL_SRC1_ALPHA"
	);

	  Values	: constant Accessability_2:=
--	    ( 2..1	=>  <>   );
	  (
GL_ZERO,
GL_ONE,
GL_SRC_COLOR,
GL_ONE_MINUS_SRC_COLOR,
GL_DST_COLOR,
GL_ONE_MINUS_DST_COLOR,
GL_SRC_ALPHA,
GL_ONE_MINUS_SRC_ALPHA,
GL_DST_ALPHA,
GL_ONE_MINUS_DST_ALPHA,
GL_CONSTANT_COLOR,
GL_ONE_MINUS_CONSTANT_COLOR,
GL_CONSTANT_ALPHA,
GL_ONE_MINUS_CONSTANT_ALPHA,
GL_SRC_ALPHA_SATURATE,
GL_SRC1_COLOR,
GL_SRC1_ALPHA
   );



    End  Test_Enumerations;

    Package Body Test_Enumerations is
	Use Ada.Text_IO;

	Procedure Display( Representation : Boolean := False ) is
	    Package A is New Ada.Containers.Ordered_Maps( Natural, NNAS );
	    Mapping : A.Map;
	Begin
	    Ada.Text_IO.Put(  "Length Check: " );
	    if Names'Length = Values'Length then
		Ada.Text_IO.put_line( "PASSED." );
	    else
		declare
		    TAB : Character Renames ASCII.HT;
		begin
		    Ada.Text_IO.Put_Line(  "FAILED."  );
		    Ada.Text_IO.Put_Line(  TAB & "Names:" & Names'Length'IMG  );
		    Ada.Text_IO.Put_Line(  TAB & "Values:" & values'Length'IMG  );
		    Ada.Text_IO.Put_Line(  "FAILED."  );
		end;
		return;
	    end if;

	    POPULATE_MAP:
	    Declare
		No_Error: Boolean:= True;
		package Integer_IO is new Ada.Text_IO.Integer_IO (Integer);
	    Begin
		For Index in Names'Range loop
		    ADD_ELEMENT:
		    Begin
			Mapping.Insert( Values(Index), Names(Index) );
		    Exception
			When Constraint_Error =>
			    No_Error:= False;
			    Ada.Text_IO.Put( "Duplicate Key: " );
			    Integer_IO.Put( Values(Index), Base => 16 );
			    Ada.Text_IO.Put( ASCII.HT & Names(Index).All );
			    Ada.Text_IO.New_Line;
		    End ADD_ELEMENT;
		end loop;
		if not No_Error then
		    return;
		end if;
	    End POPULATE_MAP;

	    For Element of Mapping loop
		declare
		    Tab  : Character Renames ASCII.HT;
		    Name : String Renames Element.All
					(Element'First+3..Element'Last);
		begin
		    if Representation then
		    	    Ada.Text_IO.Put_Line( Tab & Name &
				  Tab & Tab & "=> " & Element.All & ',' );
		    else
			Ada.text_io.Put_line( Name & ',' );
		    end if;
		end;
	    end loop;

	End Display;
    End  Test_Enumerations;

--  	procedure glVertex2f (x, y : TAO_GL.Types.float)
--  	  with Import, Convention => stdcall, external_name => "glVertex2f";
--  	procedure glBegin (mode : TAO_GL.Types.Enum)
--  	  with Import, Convention => stdcall, external_name => "glBegin";
--  	procedure glEnd
--  	  with Import, Convention => stdcall, external_name => "glEnd";
--  	procedure glClear (mask : TAO_GL.Types.Bitfield)
--  	  with Import, Convention => stdcall, external_name => "glClear";
--  	procedure glClearColor (r,g,b,a : TAO_GL.Types.float)
--  	  with Import, Convention => stdcall, external_name => "glClearColor";
--  	procedure glColor3f (r,g,b : TAO_GL.Types.float)
--  	  with Import, Convention => stdcall, external_name => "glColor3f";
    procedure glVertex2f (x, y : TAO_GL.Types.float) is
    begin
	TAO_GL.Functions.Vertex( x => x, y => y );
    end;

    procedure glBegin (mode : TAO_GL.Types.Enum) is
	Tmp : TAO_GL.Types.Vertex_Interpretation
	with  Address => mode'Address;
	Pragma Import( Ada, Tmp );
    begin
	TAO_GL.Functions.Start(tmp);
    End;

    procedure glEnd
      renames TAO_GL.Functions.Stop;

    procedure glClear (mask : TAO_GL.Types.Bitfield)
      renames TAO_GL.Functions.Clear;

    procedure glClearColor (r,g,b,a : TAO_GL.Types.Clamped_Float)
      renames TAO_GL.Functions.ClearColor;

    procedure glColor3f (r,g,b : TAO_GL.Types.float)
      renames TAO_GL.Functions.Color;

    package glut renames tao_gl.Utility_Toolkit.Functions;

    -- Displays a Green/Red/Gray color-wheel.
    Procedure Display is
	I : Float:= 0.0;
	Use TAO_GL.Types.Constants, Ada.Numerics;
	Function convert is new Ada.Unchecked_Conversion(
		Source => Integer,	Target => TAO_GL.Types.Bitfield);
	Function convert is new Ada.Unchecked_Conversion(
		Source => Integer,	Target => TAO_GL.Types.Enum);
	Function convert is new Ada.Unchecked_Conversion(
		Source => Float,	Target => TAO_GL.Types.Float);
	Package K is new
		Generic_Elementary_Functions( TAO_GL.Types.Float );
    begin
	glClearColor(1.0, 1.0, 1.0, 0.0);
	glClear( Convert(GL_COLOR_BUFFER_BIT) );
	glBegin( Convert(GL_TRIANGLE_FAN) );
	glVertex2f(0.0, 0.0);
	loop
	    Exit when not (I <= (2.0*Pi)+0.1);
	    declare

		Use K, TAO_GL.Types;

		S : constant TAO_GL.Types.Float:= Sin ( X => Convert(I) );
		C : constant TAO_GL.Types.Float:= Cos ( X => Convert(I) );
	    begin
		glColor3f( C, S, 0.0 );
		glVertex2f( C , S );
		null;
	    end;
	    I:= I + 0.1;
	end loop;
	glEnd;

	glut.Swap_Buffers;
    end Display;

    -- Renders a white square on a black background.
    Procedure Render is
	Function convert is new Ada.Unchecked_Conversion(
		Source => Integer,	Target => TAO_GL.Types.Bitfield);
	Use TAO_GL.Types.Constants, Ada.Numerics;
	Use TAO_GL.Types;
    begin
	--Clear color buffer
	glClear( convert(GL_COLOR_BUFFER_BIT) );

	--Render quad
	glBegin( GL_QUADS );
	glVertex2f( -0.5, -0.5 );
	glVertex2f(  0.5, -0.5 );
	glVertex2f(  0.5,  0.5 );
	glVertex2f( -0.5,  0.5 );
	glEnd;

	--Update screen
	GLUT.Swap_Buffers;
    end Render;

--  void main(int argc, char** argv) {
--  glutInit(&argc, argv);
--  glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE);
--  glutInitWindowSize(512, 512);
--  glutInitWindowPosition(20, 20);
--  glutCreateWindow("tecnun");
--  glutDisplayFunc(display);
--  glutMainLoop();
--  }

    Void : TAO_GL.Types.Integer:= 0;

    Use GLUT;
    Use Type TAO_GL.Types.Unsigned_Integer;
begin
--      glut.Init; --(&argc, argv);
--      glut.Init_Display_Mode(TAO_GL.Utility_Toolkit.RGB or TAO_GL.Utility_Toolkit.DOUBLE);
--      glut.Init_Window_Size(512, 512);
--      glut.Init_Window_Position(20, 20);
--      Void:= glut.Create_Window("tecnun");
--      glut.Display_Function( Convert(Display'Address) );
--
--  Ada.Text_IO.Put_Line("Write, before main-loop.");
--      glut.Main_Loop;
--
--      Ada.Text_IO.Put_Line("Write, after main-loop.");
    --LeaveMainLoop

Test_Enumerations.Display;

null;
End Test;
