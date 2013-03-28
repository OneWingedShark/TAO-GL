Pragma Ada_2012;

With
TAO_GL.Types,
Ada.Unchecked_Conversion,
Interfaces.C.Strings,
System.Address_To_Access_Conversions;

Use
TAO_GL.Types;

Package Body TAO_GL.Functions is
    Type Jump_To_Mark;

    ------------------------------------------
    --  OPENGL API FUNCTION SPECIFICATIONS  --
    ------------------------------------------

    procedure glClearColor (red, green, blue, alpha : Clamped_Float)
	with Import, Convention => stdcall, External_Name => "glClearColor";
    procedure glClear (mask : Bitfield)
	with Import, Convention => stdcall, External_Name => "glClear";
    procedure glBegin (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glBegin";
    procedure glEnd
	with Import, Convention => stdcall, External_Name => "glEnd";
    procedure glIndexMask (mask : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glIndexMask";
    procedure glColorMask (red, green, blue, alpha : Types.Boolean)
	with Import, Convention => stdcall, External_Name => "glColorMask";
    procedure glAlphaFunc (func : Enum; ref : Clamped_Float)
	with Import, Convention => stdcall, External_Name => "glAlphaFunc";
    procedure glBlendFunc (sfactor : Enum; dfactor : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendFunc";
    procedure glLogicOp (opcode : Enum)
	with Import, Convention => stdcall, External_Name => "glLogicOp";
    procedure glCullFace (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glCullFace";
    procedure glFrontFace (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glFrontFace";
    procedure glPointSize (size : Float)
	with Import, Convention => stdcall, External_Name => "glPointSize";
    procedure glLineWidth (width : Float)
	with Import, Convention => stdcall, External_Name => "glLineWidth";
    procedure glLineStipple (factor : Types.Integer; pattern : Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glLineStipple";
    procedure glPolygonMode (face, mode : Enum)
	with Import, Convention => stdcall, External_Name => "glPolygonMode";
    procedure glPolygonOffset (factor, units : Types.Float)
	with Import, Convention => stdcall, External_Name => "glPolygonOffset";
    procedure glPolygonStipple (mask : access Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glPolygonStipple";
    procedure glGetPolygonStipple (mask : access Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glGetPolygonStipple";
    procedure glEdgeFlag (flag : Types.Boolean)
	with Import, Convention => stdcall, External_Name => "glEdgeFlag";
    procedure glEdgeFlagv (flag : access Types.Boolean)
	with Import, Convention => stdcall, External_Name => "glEdgeFlagv";
    procedure glScissor (x, y : Types.Integer; width, height : Size)
	with Import, Convention => stdcall, External_Name => "glScissor";
    procedure glClipPlane (plane : Enum; equation : access Double)
	with Import, Convention => stdcall, External_Name => "glClipPlane";
    procedure glGetClipPlane (plane : Enum; equation : access Double)
	with Import, Convention => stdcall, External_Name => "glGetClipPlane";
    procedure glDrawBuffer (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glDrawBuffer";
    procedure glReadBuffer (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glReadBuffer";
    procedure glEnable (cap : Enum)
	with Import, Convention => stdcall, External_Name => "glEnable";
    procedure glDisable (cap : Enum)
	with Import, Convention => stdcall, External_Name => "glDisable";
    function glIsEnabled (cap : Enum) return Types.Boolean
	with Import, Convention => stdcall, External_Name => "glIsEnabled";
    procedure glEnableClientState (cap : Enum)
	with Import, Convention => stdcall, External_Name => "glEnableClientState";
    procedure glDisableClientState (cap : Enum)
	with Import, Convention => stdcall, External_Name => "glDisableClientState";
    procedure glGetBooleanv (pname : Enum; params : access Types.Boolean)
	with Import, Convention => stdcall, External_Name => "glGetBooleanv";
    procedure glGetDoublev (pname : Enum; params : access Types.Double)
	with Import, Convention => stdcall, External_Name => "glGetDoublev";
    procedure glGetFloatv (pname : Enum; params : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetFloatv";
    procedure glGetIntegerv (pname : Enum; params : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetIntegerv";
    procedure glPushAttrib (mask : Bitfield)
	with Import, Convention => stdcall, External_Name => "glPushAttrib";
    procedure glPopAttrib
	with Import, Convention => stdcall, External_Name => "glPopAttrib";
    procedure glPushClientAttrib (mask : Bitfield)
	with Import, Convention => stdcall, External_Name => "glPushClientAttrib";
    procedure glPopClientAttrib
	with Import, Convention => stdcall, External_Name => "glPopClientAttrib";
    function glRenderMode (mode : Enum) return Types.Integer
	with Import, Convention => stdcall, External_Name => "glRenderMode";
    function glGetError return Enum
	with Import, Convention => stdcall, External_Name => "glGetError";
    function glGetString (name : Enum) return access Unsigned_Byte
	with Import, Convention => stdcall, External_Name => "glGetString";
    procedure glFinish
	with Import, Convention => stdcall, External_Name => "glFinish";
    procedure glFlush
	with Import, Convention => stdcall, External_Name => "glFlush";
    procedure glHint (target, mode : Enum)
	with Import, Convention => stdcall, External_Name => "glHint";
    procedure glClearDepth (depth : Clamped_Double)
	with Import, Convention => stdcall, External_Name => "glClearDepth";
    procedure glDepthFunc (func : Enum)
	with Import, Convention => stdcall, External_Name => "glDepthFunc";
    procedure glDepthMask (flag : Types.Boolean)
	with Import, Convention => stdcall, External_Name => "glDepthMask";
    procedure glDepthRange (near_val, far_val : Clamped_Double)
	with Import, Convention => stdcall, External_Name => "glDepthRange";
    procedure glClearAccum (red, green, blue, alpha : Types.Float)
	with Import, Convention => stdcall, External_Name => "glClearAccum";
    procedure glAccum (op : Enum; value : Types.Float)
	with Import, Convention => stdcall, External_Name => "glAccum";
    procedure glMatrixMode (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glMatrixMode";
    procedure glOrtho (left, right, bottom, top, near_val, far_val : Double)
	with Import, Convention => stdcall, External_Name => "glOrtho";
    procedure glFrustum (left, right, bottom, top, near_val, far_val : Double)
	with Import, Convention => stdcall, External_Name => "glFrustum";
    procedure glViewport (x,y : Types.Integer; width, height : Size)
	with Import, Convention => stdcall, External_Name => "glViewport";
    procedure glPushMatrix
	with Import, Convention => stdcall, External_Name => "glPushMatrix";
    procedure glPopMatrix
	with Import, Convention => stdcall, External_Name => "glPopMatrix";
    procedure glLoadIdentity
	with Import, Convention => stdcall, External_Name => "glLoadIdentity";
    procedure glLoadMatrixd (m : access Double)
	with Import, Convention => stdcall, External_Name => "glLoadMatrixd";
    procedure glLoadMatrixf (m : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glLoadMatrixf";
    procedure glMultMatrixd (m : access Double)
	with Import, Convention => stdcall, External_Name => "glMultMatrixd";
    procedure glMultMatrixf (m : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glMultMatrixf";
    procedure glRotated (angle, x, y, z : Double)
	with Import, Convention => stdcall, External_Name => "glRotated";
    procedure glRotatef (angle, x, y, z : Types.Float)
	with Import, Convention => stdcall, External_Name => "glRotatef";
    procedure glScaled (x, y, z : Double)
	with Import, Convention => stdcall, External_Name => "glScaled";
    procedure glScalef (x, y, z : Types.Float)
	with Import, Convention => stdcall, External_Name => "glScalef";
    procedure glTranslated (x, y, z : Double)
	with Import, Convention => stdcall, External_Name => "glTranslated";
    procedure glTranslatef (x, y, z : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTranslatef";
    function glIsList (list : Unsigned_Integer) return Types.Boolean
	with Import, Convention => stdcall, External_Name => "glIsList";
    procedure glDeleteLists (list : Unsigned_Integer; c_range : Size)
	with Import, Convention => stdcall, External_Name => "glDeleteLists";
    function glGenLists (c_range : Size) return Unsigned_Integer
	with Import, Convention => stdcall, External_Name => "glGenLists";
    procedure glNewList (list : Unsigned_Integer; mode : Enum)
	with Import, Convention => stdcall, External_Name => "glNewList";
    procedure glEndList
	with Import, Convention => stdcall, External_Name => "glEndList";
    procedure glCallList (list : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glCallList";
    procedure glCallLists (n : Size; c_type : Enum; lists : System.Address)
	with Import, Convention => stdcall, External_Name => "glCallLists";
    procedure glListBase (base : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glListBase";
    procedure glVertex2d (x, y : Double)
	with Import, Convention => stdcall, External_Name => "glVertex2d";
    procedure glVertex2f (x, y : Types.Float)
	with Import, Convention => stdcall, External_Name => "glVertex2f";
    procedure glVertex2i (x, y : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glVertex2i";
    procedure glVertex2s (x, y : Short)
	with Import, Convention => stdcall, External_Name => "glVertex2s";
    procedure glVertex3d (x, y, z : Double)
	with Import, Convention => stdcall, External_Name => "glVertex3d";
    procedure glVertex3f (x, y, z : Types.Float)
	with Import, Convention => stdcall, External_Name => "glVertex3f";
    procedure glVertex3i (x, y, z : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glVertex3i";
    procedure glVertex3s (x, y, z : Short)
	with Import, Convention => stdcall, External_Name => "glVertex3s";
    procedure glVertex4d (x, y, z, w : Double)
	with Import, Convention => stdcall, External_Name => "glVertex4d";
    procedure glVertex4f (x, y, z, w : Types.Float)
	with Import, Convention => stdcall, External_Name => "glVertex4f";
    procedure glVertex4i (x, y, z, w : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glVertex4i";
    procedure glVertex4s (x, y, z, w : Short)
	with Import, Convention => stdcall, External_Name => "glVertex4s";
    procedure glVertex2dv (v : access Types.Double)
	with Import, Convention => stdcall, External_Name => "glVertex2dv";
    procedure glVertex2fv (v : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glVertex2fv";
    procedure glVertex2iv (v : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glVertex2iv";
    procedure glVertex2sv (v : access Types.Short)
	with Import, Convention => stdcall, External_Name => "glVertex2sv";
    procedure glVertex3dv (v : access Types.Double)
	with Import, Convention => stdcall, External_Name => "glVertex3dv";
    procedure glVertex3fv (v : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glVertex3fv";
    procedure glVertex3iv (v : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glVertex3iv";
    procedure glVertex3sv (v : access Types.Short)
	with Import, Convention => stdcall, External_Name => "glVertex3sv";
    procedure glVertex4dv (v : access Types.Double)
	with Import, Convention => stdcall, External_Name => "glVertex4dv";
    procedure glVertex4fv (v : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glVertex4fv";
    procedure glVertex4iv (v : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glVertex4iv";
    procedure glVertex4sv (v : access Types.Short)
	with Import, Convention => stdcall, External_Name => "glVertex4sv";
    procedure glNormal3b (nx, ny, nz : Byte)
	with Import, Convention => stdcall, External_Name => "glNormal3b";
    procedure glNormal3d (nx, ny, nz : Double)
	with Import, Convention => stdcall, External_Name => "glNormal3d";
    procedure glNormal3f (nx, ny, nz : Types.Float)
	with Import, Convention => stdcall, External_Name => "glNormal3f";
    procedure glNormal3i (nx, ny, nz : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glNormal3i";
    procedure glNormal3s (nx, ny, nz : Short)
	with Import, Convention => stdcall, External_Name => "glNormal3s";
    procedure glNormal3bv (v : access Byte)
	with Import, Convention => stdcall, External_Name => "glNormal3bv";
    procedure glNormal3dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glNormal3dv";
    procedure glNormal3fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glNormal3fv";
    procedure glNormal3iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glNormal3iv";
    procedure glNormal3sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glNormal3sv";
    procedure glIndexd (c : Double)
	with Import, Convention => stdcall, External_Name => "glIndexd";
    procedure glIndexf (c : Float)
	with Import, Convention => stdcall, External_Name => "glIndexf";
    procedure glIndexi (c : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glIndexi";
    procedure glIndexs (c : Short)
	with Import, Convention => stdcall, External_Name => "glIndexs";
    procedure glIndexub (c : Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glIndexub";
    procedure glIndexdv (c : access Double)
	with Import, Convention => stdcall, External_Name => "glIndexdv";
    procedure glIndexfv (c : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glIndexfv";
    procedure glIndexiv (c : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glIndexiv";
    procedure glIndexsv (c : access Short)
	with Import, Convention => stdcall, External_Name => "glIndexsv";
    procedure glIndexubv (c : access Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glIndexubv";
    procedure glColor3b (red, green, blue : Byte)
	with Import, Convention => stdcall, External_Name => "glColor3b";
    procedure glColor3d (red, green, blue : Double)
	with Import, Convention => stdcall, External_Name => "glColor3d";
    procedure glColor3f (red, green,  blue : Types.Float)
	with Import, Convention => stdcall, External_Name => "glColor3f";
    procedure glColor3i (red, green, blue : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glColor3i";
    procedure glColor3s (red, green, blue : Short)
	with Import, Convention => stdcall, External_Name => "glColor3s";
    procedure glColor3ub (red, green, blue : Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glColor3ub";
    procedure glColor3ui (red, green, blue : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glColor3ui";
    procedure glColor3us (red, green, blue : Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glColor3us";
    procedure glColor4b (red, green, blue, alpha : Byte)
	with Import, Convention => stdcall, External_Name => "glColor4b";
    procedure glColor4d (red, green, blue, alpha : Double)
	with Import, Convention => stdcall, External_Name => "glColor4d";
    procedure glColor4f (red, green, blue, alpha : Types.Float)
	with Import, Convention => stdcall, External_Name => "glColor4f";
    procedure glColor4i (red, green, blue, alpha : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glColor4i";
    procedure glColor4s (red, green, blue, alpha : Short)
	with Import, Convention => stdcall, External_Name => "glColor4s";
    procedure glColor4ub (red, green, blue, alpha : Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glColor4ub";
    procedure glColor4ui (red, green, blue, alpha : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glColor4ui";
    procedure glColor4us (red, green, blue, alpha : Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glColor4us";
    procedure glColor3bv (v : access Byte)
	with Import, Convention => stdcall, External_Name => "glColor3bv";
    procedure glColor3dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glColor3dv";
    procedure glColor3fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glColor3fv";
    procedure glColor3iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glColor3iv";
    procedure glColor3sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glColor3sv";
    procedure glColor3ubv (v : access Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glColor3ubv";
    procedure glColor3uiv (v : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glColor3uiv";
    procedure glColor3usv (v : access Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glColor3usv";
    procedure glColor4bv (v : access Byte)
	with Import, Convention => stdcall, External_Name => "glColor4bv";
    procedure glColor4dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glColor4dv";
    procedure glColor4fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glColor4fv";
    procedure glColor4iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glColor4iv";
    procedure glColor4sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glColor4sv";
    procedure glColor4ubv (v : access Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glColor4ubv";
    procedure glColor4uiv (v : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glColor4uiv";
    procedure glColor4usv (v : access Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glColor4usv";
    procedure glTexCoord1d (s : Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord1d";
    procedure glTexCoord1f (s : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord1f";
    procedure glTexCoord1i (s : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord1i";
    procedure glTexCoord1s (s : Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord1s";
    procedure glTexCoord2d (s, t : Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord2d";
    procedure glTexCoord2f (s, t : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord2f";
    procedure glTexCoord2i (s, t : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord2i";
    procedure glTexCoord2s (s, t : Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord2s";
    procedure glTexCoord3d (s, t, r : Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord3d";
    procedure glTexCoord3f (s, t, r : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord3f";
    procedure glTexCoord3i (s,  t, r : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord3i";
    procedure glTexCoord3s (s, t, r : Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord3s";
    procedure glTexCoord4d (s, t, r, q : Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord4d";
    procedure glTexCoord4f (s, t, r, q : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord4f";
    procedure glTexCoord4i (s, t, r, q : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord4i";
    procedure glTexCoord4s (s, t, r, q : Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord4s";
    procedure glTexCoord1dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord1dv";
    procedure glTexCoord1fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord1fv";
    procedure glTexCoord1iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord1iv";
    procedure glTexCoord1sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord1sv";
    procedure glTexCoord2dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord2dv";
    procedure glTexCoord2fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord2fv";
    procedure glTexCoord2iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord2iv";
    procedure glTexCoord2sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord2sv";
    procedure glTexCoord3dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord3dv";
    procedure glTexCoord3fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord3fv";
    procedure glTexCoord3iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord3iv";
    procedure glTexCoord3sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord3sv";
    procedure glTexCoord4dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glTexCoord4dv";
    procedure glTexCoord4fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexCoord4fv";
    procedure glTexCoord4iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexCoord4iv";
    procedure glTexCoord4sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glTexCoord4sv";
    procedure glRasterPos2d (x, y : Double)
	with Import, Convention => stdcall, External_Name => "glRasterPos2d";
    procedure glRasterPos2f (x, y : Float)
	with Import, Convention => stdcall, External_Name => "glRasterPos2f";
    procedure glRasterPos2i (x,  y : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRasterPos2i";
    procedure glRasterPos2s (x, y : Short)
	with Import, Convention => stdcall, External_Name => "glRasterPos2s";
    procedure glRasterPos3d (x, y, z : Double)
	with Import, Convention => stdcall, External_Name => "glRasterPos3d";
    procedure glRasterPos3f (x, y, z : Float)
	with Import, Convention => stdcall, External_Name => "glRasterPos3f";
    procedure glRasterPos3i (x, y, z : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRasterPos3i";
    procedure glRasterPos3s (x, y, z : Short)
	with Import, Convention => stdcall, External_Name => "glRasterPos3s";
    procedure glRasterPos4d (x, y, z, w : Double)
	with Import, Convention => stdcall, External_Name => "glRasterPos4d";
    procedure glRasterPos4f (x, y, z, w : Types.Float)
	with Import, Convention => stdcall, External_Name => "glRasterPos4f";
    procedure glRasterPos4i (x, y, z, w : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRasterPos4i";
    procedure glRasterPos4s (x, y, z, w : Short)
	with Import, Convention => stdcall, External_Name => "glRasterPos4s";
    procedure glRasterPos2dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glRasterPos2dv";
    procedure glRasterPos2fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glRasterPos2fv";
    procedure glRasterPos2iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRasterPos2iv";
    procedure glRasterPos2sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glRasterPos2sv";
    procedure glRasterPos3dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glRasterPos3dv";
    procedure glRasterPos3fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glRasterPos3fv";
    procedure glRasterPos3iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRasterPos3iv";
    procedure glRasterPos3sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glRasterPos3sv";
    procedure glRasterPos4dv (v : access Double)
	with Import, Convention => stdcall, External_Name => "glRasterPos4dv";
    procedure glRasterPos4fv (v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glRasterPos4fv";
    procedure glRasterPos4iv (v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRasterPos4iv";
    procedure glRasterPos4sv (v : access Short)
	with Import, Convention => stdcall, External_Name => "glRasterPos4sv";
    procedure glRectd (x1, y1, x2, y2 : Double)
	with Import, Convention => stdcall, External_Name => "glRectd";
    procedure glRectf (x1, y1, x2, y2 : Types.Float)
	with Import, Convention => stdcall, External_Name => "glRectf";
    procedure glRecti (x1, y1, x2, y2 : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRecti";
    procedure glRects (x1, y1, x2, y2 : Short)
	with Import, Convention => stdcall, External_Name => "glRects";
    procedure glRectdv (v1, v2 : access Double)
	with Import, Convention => stdcall, External_Name => "glRectdv";
    procedure glRectfv (v1, v2 : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glRectfv";
    procedure glRectiv (v1, v2 : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glRectiv";
    procedure glRectsv (v1, v2 : access Types.Short)
	with Import, Convention => stdcall, External_Name => "glRectsv";
    procedure glShadeModel (mode : Enum)
	with Import, Convention => stdcall, External_Name => "glRectsv";
    procedure glLightf (light, pname : Enum; param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glLightf";
    procedure glLighti (light, pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glLighti";
    procedure glLightfv (light, pname : Enum; params : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glLightfv";
    procedure glLightiv (light, pname : Enum; params : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glLightiv";
    procedure glGetLightfv (light, pname : Enum; params : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetLightfv";
    procedure glGetLightiv (light, pname : Enum; params : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetLightiv";
    procedure glLightModelf (pname : Enum; param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glLightModelf";
    procedure glLightModeli (pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glLightModeli";
    procedure glLightModelfv (pname : Enum; params : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glLightModelfv";
    procedure glLightModeliv (pname : Enum; params : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glLightModeliv";
    procedure glMaterialf (face, pname : Enum; param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glMaterialf";
    procedure glMateriali (face, pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glMateriali";
    procedure glMaterialfv (face, pname : Enum; params : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glMaterialfv";
    procedure glMaterialiv (face, pname : Enum; params : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glMaterialiv";
    procedure glGetMaterialfv (face, pname : Enum; params : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetMaterialfv";
    procedure glGetMaterialiv (face, pname : Enum; params : access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetMaterialiv";
    procedure glColorMaterial (face, mode : Enum)
	with Import, Convention => stdcall, External_Name => "glColorMaterial";
    procedure glPixelZoom (xfactor, yfactor : Types.Float)
	with Import, Convention => stdcall, External_Name => "glPixelZoom";
    procedure glPixelStoref (pname: Enum;  param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glPixelStoref";
    procedure glPixelStorei (pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glPixelStorei";
    procedure glPixelTransferf (pname : Enum; param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glPixelTransferf";
    procedure glPixelTransferi (pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glPixelTransferi";
    procedure glPixelMapfv (map : Enum; mapsize : Types.Integer; values : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glPixelMapfv";
    procedure glPixelMapuiv (map : Enum; mapsize : Types.Integer; values : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glPixelMapuiv";
    procedure glPixelMapusv (map : Enum; mapsize : Types.Integer; values : access Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glPixelMapusv";
    procedure glGetPixelMapfv (map : Enum; values : access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetPixelMapfv";
    procedure glGetPixelMapuiv (map : Enum; values : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glGetPixelMapuiv";
    procedure glGetPixelMapusv (map : Enum; values : access Unsigned_Short)
	with Import, Convention => stdcall, External_Name => "glGetPixelMapusv";
    procedure glBitmap (width, height : Size; xorig, yorig, xmove, ymove : Types.Float; bitmap : access Unsigned_Byte)
	with Import, Convention => stdcall, External_Name => "glBitmap";
    procedure glReadPixels (x, y : Types.Integer; width, height : Size; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glReadPixels";
    procedure glDrawPixels (width, height : Size; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glDrawPixels";
    procedure glCopyPixels (x, y : Types.Integer; width, height : Size; c_type : Enum)
	with Import, Convention => stdcall, External_Name => "glCopyPixels";
    procedure glStencilFunc (func : Enum; ref : Types.Integer; mask : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glStencilFunc";
    procedure glStencilMask (mask : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glStencilMask";
    procedure glStencilOp (fail, zfail, zpass : Enum)
	with Import, Convention => stdcall, External_Name => "glStencilOp";
    procedure glClearStencil (s : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glClearStencil";
    procedure glTexGend (coord, pname : Enum; param : Double)
	with Import, Convention => stdcall, External_Name => "glTexGend";
    procedure glTexGenf (coord, pname : Enum; param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexGenf";
    procedure glTexGeni (coord, pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexGeni";
    procedure glTexGendv (coord, pname : Enum; params : access Double)
	with Import, Convention => stdcall, External_Name => "glTexGendv";
    procedure glTexGenfv (coord, pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexGenfv";
    procedure glTexGeniv (coord, pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexGeniv";
    procedure glGetTexGendv (coord, pname : Enum; params : access Double)
	with Import, Convention => stdcall, External_Name => "glGetTexGendv";
    procedure glGetTexGenfv (coord, pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetTexGenfv";
    procedure glGetTexGeniv (coord, pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetTexGeniv";
    procedure glTexEnvf (target, pname : Enum; param : Float)
	with Import, Convention => stdcall, External_Name => "glTexEnvf";
    procedure glTexEnvi (target, pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexEnvi";
    procedure glTexEnvfv (target, pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexEnvfv";
    procedure glTexEnviv (target, pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexEnviv";
    procedure glGetTexEnvfv (target, pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetTexEnvfv";
    procedure glGetTexEnviv (target, pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetTexEnviv";
    procedure glTexParameterf (target, pname : Enum; param : Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexParameterf";
    procedure glTexParameteri (target, pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexParameteri";
    procedure glTexParameterfv (target, pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glTexParameterfv";
    procedure glTexParameteriv (target, pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glTexParameteriv";
    procedure glGetTexParameterfv (target, pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetTexParameterfv";
    procedure glGetTexParameteriv (target, pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetTexParameteriv";
    procedure glGetTexLevelParameterfv (target : Enum; level : Types.Integer; pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetTexLevelParameterfv";
    procedure glGetTexLevelParameteriv (target : Enum; level : Types.Integer; pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetTexLevelParameteriv";
    procedure glTexImage1D (target : Enum; level : Types.Integer; internalFormat : Types.Integer; width : Size; border : Types.Integer; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glTexImage1D";
    procedure glTexImage2D (target : Enum; level : Types.Integer; internalFormat : Types.Integer; width, height : Size; border : Types.Integer; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glTexImage2D";
    procedure glGetTexImage (target : Enum; level : Types.Integer; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glGetTexImage";
    procedure glMap1d (target : Enum; u1, u2 : Double; stride, order : Types.Integer; points : access Double)
	with Import, Convention => stdcall, External_Name => "glMap1d";
    procedure glMap1f (target : Enum; u1, u2 : Types.Float; stride, order : Types.Integer; points : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glMap1f";
    procedure glMap2d (target : Enum; u1, u2 : Double; ustride, uorder : Types.Integer; v1, v2 : Double; vstride, vorder : Types.Integer; points : access Double)
	with Import, Convention => stdcall, External_Name => "glMap2d";
    procedure glMap2f (target : Enum; u1, u2 : Types.Float; ustride, uorder : Types.Integer; v1, v2 : Types.Float; vstride, vorder : Types.Integer; points : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glMap2f";
    procedure glGetMapdv (target, query : Enum; v : access Double)
	with Import, Convention => stdcall, External_Name => "glGetMapdv";
    procedure glGetMapfv (target, query : Enum; v : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glGetMapfv";
    procedure glGetMapiv (target, query : Enum; v : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glGetMapiv";
    procedure glEvalCoord1d (u : Double)
	with Import, Convention => stdcall, External_Name => "glEvalCoord1d";
    procedure glEvalCoord1f (u : Types.Float)
	with Import, Convention => stdcall, External_Name => "glEvalCoord1f";
    procedure glEvalCoord1dv (u : access Double)
	with Import, Convention => stdcall, External_Name => "glEvalCoord1dv";
    procedure glEvalCoord1fv (u : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glEvalCoord1fv";
    procedure glEvalCoord2d (u, v : Double)
	with Import, Convention => stdcall, External_Name => "glEvalCoord2d";
    procedure glEvalCoord2f (u, v : Types.Float)
	with Import, Convention => stdcall, External_Name => "glEvalCoord2f";
    procedure glEvalCoord2dv (u : access Double)
	with Import, Convention => stdcall, External_Name => "glEvalCoord2dv";
    procedure glEvalCoord2fv (u : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glEvalCoord2fv";
    procedure glMapGrid1d (un : Types.Integer; u1, u2 : Double)
	with Import, Convention => stdcall, External_Name => "glMapGrid1d";
    procedure glMapGrid1f (un : Types.Integer; u1, u2 : Types.Float)
	with Import, Convention => stdcall, External_Name => "glMapGrid1f";
    procedure glMapGrid2d (un : Types.Integer; u1, u2 : Double; vn : Types.Integer; v1, v2 : Double)
	with Import, Convention => stdcall, External_Name => "glMapGrid2d";
    procedure glMapGrid2f (un : Types.Integer; u1, u2 : Types.Float; vn : Types.Integer; v1, v2 : Types.Float)
	with Import, Convention => stdcall, External_Name => "glMapGrid2f";
    procedure glEvalPoint1 (i : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glEvalPoint1";
    procedure glEvalPoint2 (i, j : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glEvalPoint2";
    procedure glEvalMesh1 (mode : Enum; i1, i2 : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glEvalMesh1";
    procedure glEvalMesh2 (mode : Enum; i1, i2, j1, j2 : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glEvalMesh2";
    procedure glFogf (pname : Enum; param : Float)
	with Import, Convention => stdcall, External_Name => "glFogf";
    procedure glFogi (pname : Enum; param : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glFogi";
    procedure glFogfv (pname : Enum; params : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glFogfv";
    procedure glFogiv (pname : Enum; params : Access Types.Integer)
	with Import, Convention => stdcall, External_Name => "glFogiv";
    procedure glFeedbackBuffer (size : Types.Size; c_type : Enum; buffer : Access Types.Float)
	with Import, Convention => stdcall, External_Name => "glFeedbackBuffer";
    procedure glPassThrough (token : Float)
	with Import, Convention => stdcall, External_Name => "glPassThrough";
    procedure glSelectBuffer (size : Types.Size; buffer : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glSelectBuffer";
    procedure glInitNames
	with Import, Convention => stdcall, External_Name => "glInitNames";
    procedure glLoadName (name : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glLoadName";
    procedure glPushName (name : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glPushName";
    procedure glPopName
	with Import, Convention => StdCall, External_Name => "glPopName";
    procedure glGenTextures (n : Size; textures : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glGenTextures";
    procedure glDeleteTextures (n : Size; textures : access Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glDeleteTextures";
    procedure glBindTexture (target : Enum; texture : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glBindTexture";
    procedure glPrioritizeTextures (n : Size; textures : access Unsigned_Integer; priorities : access Clamped_Float)
	with Import, Convention => stdcall, External_Name => "glPrioritizeTextures";
    function glAreTexturesResident (n : Size; textures : access Unsigned_Integer; residences : access Types.Boolean) return Types.Boolean
	with Import, Convention => stdcall, External_Name => "glAreTexturesResident";
    function glIsTexture (texture : Unsigned_Integer) return Types.Boolean
	with Import, Convention => stdcall, External_Name => "glIsTexture";
    procedure glTexSubImage1D (target : Enum; level, xoffset : Types.Integer; width : Size; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glTexSubImage1D";
    procedure glTexSubImage2D (target : Enum; level, xoffset, yoffset : Types.Integer; width, height : Size; format, c_type : Enum; pixels : System.Address)
	with Import, Convention => stdcall, External_Name => "glTexSubImage2D";
    procedure glCopyTexImage1D (target : Enum; level : Types.Integer; internalformat : Enum; x, y : Types.Integer; width : Size; border : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glCopyTexImage1D";
    procedure glCopyTexImage2D (target : Enum; level : Types.Integer; internalformat : Enum; x, y : Types.Integer; width, height : Size; border : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glCopyTexImage2D";
    procedure glCopyTexSubImage1D (target : Enum; level, xoffset, x, y : Types.Integer; width : Size)
	with Import, Convention => stdcall, External_Name => "glCopyTexSubImage1D";
    procedure glCopyTexSubImage2D (target : Enum; level, xoffset, yoffset, x, y : Types.Integer; width, height : Size)
	with Import, Convention => stdcall, External_Name => "glCopyTexSubImage2D";
    procedure glVertexPointer (size : Types.Integer; c_type : Enum; stride : Types.Size; ptr : System.Address)
	with Import, Convention => stdcall, External_Name => "glVertexPointer";
    procedure glNormalPointer (c_type : Enum; stride : Size; ptr : System.Address)
	with Import, Convention => stdcall, External_Name => "glNormalPointer";
    procedure glColorPointer (size : Types.Integer; c_type : Enum; stride : Types.Size; ptr : System.Address)
	with Import, Convention => stdcall, External_Name => "glColorPointer";
    procedure glIndexPointer (c_type : Enum; stride : Size; ptr : System.Address)
	with Import, Convention => stdcall, External_Name => "glIndexPointer";
    procedure glTexCoordPointer (size : Types.Integer; c_type : Enum; stride : Types.Size; ptr : System.Address)
	with Import, Convention => stdcall, External_Name => "glTexCoordPointer";
    procedure glEdgeFlagPointer (stride : Size; ptr : System.Address)
	with Import, Convention => stdcall, External_Name => "glEdgeFlagPointer";
    procedure glGetPointerv (pname : Enum; params : System.Address)
	with Import, Convention => stdcall, External_Name => "glGetPointerv";
    procedure glArrayElement (i : Types.Integer)
	with Import, Convention => stdcall, External_Name => "glArrayElement";
    procedure glDrawArrays (mode : Enum; first : Types.Integer; count : Size)
	with Import, Convention => stdcall, External_Name => "glDrawArrays";
    procedure glDrawElements (mode : Enum; count : Size; c_type : Enum; indices : System.Address)
	with Import, Convention => stdcall, External_Name => "glDrawElements";
    procedure glInterleavedArrays (format : Enum; stride : Size; pointer : System.Address)
	with Import, Convention => stdcall, External_Name => "glInterleavedArrays";
-- VERSION 4.3 MARK

    procedure glActiveTexture(texture : Enum)
	with Import, Convention => stdcall, External_Name => "glActiveTexture";
    procedure glAttachShader(program, shader : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glAttachShader";
    procedure glBeginQuery(Target : Query_Target; ID : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glBeginQuery";
    procedure glBindAttribLocation(Program,  Index  : Unsigned_Integer; Name : Access Character)
	with Import, Convention => stdcall, External_Name => "glBindAttribLocation";
    procedure glBindBuffer(Target : Enum; Buffer  : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glBindBuffer";
    procedure glBlendColor(Red, Green, Blue, Alpha : Types.Float)
	with Import, Convention => stdcall, External_Name => "glBlendColor";
    procedure glBlendEquation(mode : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendEquation";
    procedure glBlendEquationi(buffer : Unsigned_Integer; mode : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendEquationi";
    procedure glBlendEquationSeparate(Mode_RGB, Mode_Alpha : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendEquationSeparate";
    procedure glBlendEquationSeparatei(buffer : Unsigned_Integer; Mode_RGB, Mode_Alpha : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendEquationSeparatei";
    procedure glBlendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendFuncSeparate";
    procedure glBlendFuncSeparatei(buffer : Unsigned_Integer; srcRGB, dstRGB, srcAlpha, dstAlpha : Enum)
	with Import, Convention => stdcall, External_Name => "glBlendFuncSeparate";
    procedure glBufferData(target : Enum;  size : access Types.Size; data : System.Address; usage : Enum)
	with Import, Convention => stdcall, External_Name => "glBufferData";
    procedure glBufferSubData(Target : Enum; Offset : Access Types.Integer; Size : Access Types.Size; Data : System.Address)
	with Import, Convention => stdcall, External_Name => "glBufferSubData";
--    procedure glColorMask(red, green, blue, alpha : Types.Boolean)
--	with Import, Convention => stdcall, External_Name => "glColorMask";
    procedure glColorMaski(Buffer : Enum; Red, Green, Blue, Alpha : Types.Boolean)
	with Import, Convention => stdcall, External_Name => "glColorMaski";
  procedure glCompileShader(Shader : Unsigned_Integer)
	with Import, Convention => stdcall, External_Name => "glCompileShader";




--  glClearIndex
--  glClientActiveTexture
--  glColorSubTable
--  glColorTableParameter
Type Jump_To_Mark is null record;
-- NOTE:	To be able to claim full OpenGL 4.3 the following functions
--	 	need to be added and linked:
--  glCompileShader
--  glCompressedTexImage1D
--  glCompressedTexImage3D
--  glCompressedTexSubImage1D
--  glCompressedTexSubImage2D
--  glCompressedTexSubImage3D
--  glConvolutionFilter1D
--  glConvolutionFilter2D
--  glConvolutionParameter
--  glCopyColorSubTable
--  glCopyColorTable
--  glCopyConvolutionFilter1D
--  glCopyConvolutionFilter2D
--  glCopyTexSubImage3D
--  glCreateProgram
--  glCreateShader
--  glDeleteBuffers
--  glDeleteProgram
--  glDeleteQueries
--  glDeleteShader
--  glDetachShader
--  glDisable
--  glDisableClientState
--  glDisableVertexAttribArray
--  glDrawRangeElements
--  glEdgeFlagPointer
--  glEnableVertexAttribArray
--  glEnd
--  glEndQuery
--  glFogCoord
--  glFogCoordPointer
--  glGenBuffers
--  glGenQueries
--  glGetActiveAttrib
--  glGetActiveUniform
--  glGetAttachedShaders
--  glGetAttribLocation
--  glGetBufferParameteriv
--  glGetBufferPointerv
--  glGetBufferSubData
--  glGetColorTable
--  glGetColorTableParameter
--  glGetCompressedTexImage
--  glGetConvolutionFilter
--  glGetConvolutionParameter
--  glGetHistogram
--  glGetHistogramParameter
--  glGetMinmax
--  glGetMinmaxParameter
--  glGetPointerv
--  glGetProgram
--  glGetProgramInfoLog
--  glGetQueryObject
--  glGetQueryiv
--  glGetSeparableFilter
--  glGetShader
--  glGetShaderInfoLog
--  glGetShaderSource
--  glGetUniform
--  glGetUniformLocation
--  glGetVertexAttrib
--  glGetVertexAttribPointerv
--  glHistogram
--  glIndexPointer
--  glIsBuffer
--  glIsProgram
--  glIsQuery
--  glIsShader
--  glLinkProgram
--  glLoadTransposeMatrix
--  glMapBuffer
--  glMinmax
--  glMultTransposeMatrix
--  glMultiDrawArrays
--  glMultiDrawElements
--  glMultiTexCoord
--  glPointParameter
--  glPopAttrib
--  glPopClientAttrib
--  glPopMatrix
--  glPopName
--  glResetHistogram
--  glResetMinmax
--  glSampleCoverage
--  glSecondaryColor
--  glSecondaryColorPointer
--  glSeparableFilter2D
--  glShaderSource
--  glStencilFuncSeparate
--  glStencilMaskSeparate
--  glStencilOpSeparate
--  glTexCoordPointer
--  glTexImage3D
--  glTexSubImage3D
--  glUniform
--  glUnmapBuffer
--  glValidateProgram
--  glVertexAttrib
--  glVertexAttribPointer
--  glWindowPos

    --------------------------------------
    --  TYPE/ENUM CONVERSION FUNCTIONS  --
    --------------------------------------

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Unsigned_Integer, Source => Bitfield);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Comparisions);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Scale_Factor);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Logic_Operators);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Face);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Orientation);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Raster_Mode);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Clipping_Plane);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Drawing_Mode);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Lighting_Style);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Light_Source);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Capability);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Client_Capibility);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => State_Variable);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Rendering_Mode);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Error_Flag);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => String_Constants);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Hints);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Hint_Mode);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Accumulator_Operators);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Matrix_Mode_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Command_Mode);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => List_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Vertex_Interpretation);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Shading_Technique);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Light_Model);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Material_Parameter);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Pixel_Storage);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Transfer_Style);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Pixel_Mapping_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Pixel_Data_Format);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Pixel_Data_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Pixel_Copy_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Stencil_Op_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Generation_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Coordinate_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Coordinate_Generation);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Environment_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Environ_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Environ_Parameter);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Target);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Paramater_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Texture_Parameter);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Extended_Texture_Target);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Internal_Format_Type);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Map_Target);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Map_Query);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Fog_Parameter);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Vertex_Info);

    Function Convert is new Ada.Unchecked_Conversion
	(Target => Enum, Source => Array_Format_Type);


    ----------------------------------------------
    --  VECTOR/ARRAY ADDRESS/ACCESS CONVERSIONS --
    ----------------------------------------------

    Package Byte_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Byte );

    Package Short_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Short );

    Package Integer_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Integer );

    Package Float_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Float );

    Package Double_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Double );

    Package Unsigned_Byte_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Unsigned_Byte );

    Package Unsigned_Short_Addr is New
	System.Address_To_Access_Conversions( Object => Types.Unsigned_Short );

    Package Unsigned_Integer_Addr is New
	System.Address_To_Access_Conversions(Object => Types.Unsigned_Integer);

    Package Clamped_Float_Addr is New
	System.Address_To_Access_Conversions(Object => Clamped_Float);

    Package Boolean_Addr is New
	System.Address_To_Access_Conversions(Object => Types.Boolean);

    Use
	Byte_Addr, Short_Addr, Integer_Addr, Float_Addr, Double_Addr,
	Unsigned_Byte_Addr, Unsigned_Short_Addr, Unsigned_Integer_Addr,
	Clamped_Float_Addr, Boolean_Addr;

    ---------------------------------
    --  BINDING WRAPPER FUNCTIONS  --
    ---------------------------------


    procedure ClearColor (Red, Green, Blue, Alpha : Clamped_Float) is
    begin
	glClearColor(	Red => Red,	Green => Green,
			Blue => Blue,	Alpha => Alpha	);
    end ClearColor;

    procedure Clear (mask : bitfield) is
    begin
	glClear( mask => mask );
    end Clear;

    procedure IndexMask (mask : Unsigned_Integer) is
    begin
	glIndexMask( mask );
    end IndexMask;

    procedure ColorMask (Red, Green, Blue, Alpha : Types.Boolean) is
    begin
	glColorMask(	Red => Red,	Green => Green,
			Blue => Blue,	Alpha => Alpha	);
    end ColorMask;

    procedure AlphaFunc (func : Comparisions; ref : Clamped_Float) is
    begin
	glalphaFunc( func => Convert(func), ref  => ref );
    end AlphaFunc;

    procedure BlendFunc (Source : Source_Factor; Destination : Destination_Factor) is
    begin
	glBlendFunc(	dfactor => convert(Destination),
			sfactor => Convert(Source)	);
    end BlendFunc;

    procedure LogicOp (OpCode : Logic_Operators) is
    begin
	glLogicOp(	opcode => Convert(OpCode)	);
    End LogicOp;

    procedure CullFace (mode : Face) is
    begin
	glCullFace(	mode => Convert(mode)	);
    end CullFace;

    procedure FrontFace (mode : Orientation) is
    begin
	glFrontFace(	mode => Convert(mode)	);
    end FrontFace;

    procedure PointSize (size : float) is
    begin
	glPointSize(	size => Size	);
    end PointSize;

    procedure LineWidth (width : float) is
    begin
	glLineWidth(	width => width	);
    end LineWidth;

    procedure LineStipple (factor : Types.Integer; pattern : Unsigned_Short) is
    begin
	glLineStipple(	factor  => factor,
			pattern => pattern	);
    end LineStipple;


    procedure PolygonMode (Face : Types.Face; mode : Raster_Mode) is
    begin
	glPolygonMode(	face => Convert(face),
			mode => Convert(mode)	);
    end PolygonMode;

    procedure PolygonOffset (factor, units : Types.float) is
    begin
	glPolygonOffset(
		factor => factor,
		units  => units	);
    end PolygonOffset;

    procedure PolygonStipple (mask : access Unsigned_Byte) is
    begin
	glPolygonStipple(	mask => mask	);
    end PolygonStipple;

--      procedure GetPolygonStipple (mask : access Unsigned_Byte) is -- NOTE: should likely be a function.
--      begin
--  	glGetPolygonStipple(	mask => mask	);
--      end GetPolygonStipple;

    function GetPolygonStipple Return Unsigned_Byte_Vector_Type is
	Height	: Constant := 32;
	Width	: Constant := 32;
    begin
	Return Result : Unsigned_Byte_Vector_Type(1..Width*Height) do
	    glGetPolygonStipple( mask => Result(Result'First)'Access );
	End Return;
    end GetPolygonStipple;

    procedure EdgeFlag (flag : Types.Boolean) is
    begin
	glEdgeFlag(	flag => flag	);
    end EdgeFlag;

    Function EdgeFlag (flag : Types.Boolean) Return Types.Boolean is
	-- This *should* be done via extended return; aliased extended returns
	-- are allowed in Ada 2012, however my 2012 compiler rejects that.
	Result : Aliased Types.Boolean:= flag;
    begin
	glEdgeFlagv( Result'Access );
	Return Result;
    end EdgeFlag;

    procedure Scissor (x, y : Types.Integer; width, height : Size) is
    begin
	glScissor(
		x	=> x,
		y	=> y,
		width	=> width,
		height	=> height
	);
    end Scissor;

    procedure ClipPlane (Plane : Clipping_Plane; Equation : Double_Vector.Vector_4) is
	-- Shouldn't have to use Address_To_Access here; the proper item should
        -- be indicated by Equation(Equation'First)'Access -- this, however,
	-- generates the Error: access-to-variable designates constant.
	Package Addr is new System.Address_To_Access_Conversions(Object => Double);
    begin
	glClipPlane(	equation => Addr.To_Pointer(Equation'Address),
			plane    => Convert(Plane)	);
    end ClipPlane;

    Function GetClipPlane (plane : Clipping_Plane) return Double_Vector.Vector_4 is
    begin
	Return Result : Double_Vector.Vector_4 do
	    glGetClipPlane(
		plane    => Convert(plane),
		equation => Result(Result'First)'Access
		);
	End return;
    end GetClipPlane;

    procedure DrawBuffer (mode : Drawing_Mode) is
    begin
	glDrawBuffer(	mode => Convert(mode)	);
    end DrawBuffer;

    procedure ReadBuffer (mode : Buffer_Mode) is
    begin
	glReadBuffer(	mode => Convert(Mode)	);
    end ReadBuffer;

    procedure Enable (cap : Capability) is
    begin
	glEnable(	cap => Convert(cap)	);
    end Enable;

    procedure Disable (cap : Capability) is
    begin
	glDisable(	cap => Convert(cap)	);
    end Disable;

    function IsEnabled (cap : Capability) return Types.Boolean is
    begin
	Return glIsEnabled(	cap => Convert(cap)	);
    end IsEnabled;

    procedure EnableClientState (cap : Client_Capibility) is
    begin
	glEnableClientState(	cap => Convert(cap)	);
    end EnableClientState;

    procedure DisableClientState (cap : Client_Capibility) is
    begin
	glDisableClientState(cap => 	Convert(cap)	);
    end DisableClientState;

    function Get_Elements (Name : State_Variable) Return Natural with Inline;
    function Get_Elements (Name : State_Variable) Return Natural is
    -- This function returns the number of results in a given glGet* call.
    begin
	Return Values: Natural:= Natural'First do
	case Name is
	When	COMPRESSED_TEXTURE_FORMATS|	CURRENT_PROGRAM
		-- I am unsure how to determine the number of elemens for these.
	    => Raise Unimplemented;
	When	COLOR_MATRIX|			MODELVIEW_MATRIX|
		PROJECTION_MATRIX|		TEXTURE_MATRIX|
		TRANSPOSE_COLOR_MATRIX|		TRANSPOSE_MODELVIEW_MATRIX|
		TRANSPOSE_PROJECTION_MATRIX|	TRANSPOSE_TEXTURE_MATRIX
	    => Values:= 16;
	When	ACCUM_CLEAR_VALUE|		BLEND_COLOR|
		COLOR_CLEAR_VALUE|		COLOR_WRITEMASK|
		CURRENT_COLOR|			CURRENT_RASTER_COLOR|
		CURRENT_RASTER_POSITION|	CURRENT_RASTER_SECONDARY_COLOR|
		CURRENT_RASTER_TEXTURE_COORDS|	CURRENT_SECONDARY_COLOR|
		CURRENT_TEXTURE_COORDS|		FOG_COLOR|
		LIGHT_MODEL_AMBIENT|		MAP2_GRID_DOMAIN|
		SCISSOR_BOX|			VIEWPORT
	    => Values:= 4;
	When	CURRENT_NORMAL|			POINT_DISTANCE_ATTENUATION
	    => Values:= 3;
	When	ALIASED_POINT_SIZE_RANGE|	ALIASED_LINE_WIDTH_RANGE|
		DEPTH_RANGE|			LINE_WIDTH_RANGE|
		MAP1_GRID_DOMAIN|		MAP2_GRID_SEGMENTS|
		MAX_VIEWPORT_DIMS|		POINT_SIZE_RANGE|
		POLYGON_MODE-- |			SMOOTH_LINE_WIDTH_RANGE|
		--SMOOTH_POINT_SIZE_RANGE
	    => Values:= 2;
	When Others
	    => Values:= 1;
	end case;
	End Return;
    end Get_Elements;


    function Get (Name : State_Variable) return Boolean_Vector_Type is
    begin
	Return Result : Types.Boolean_Vector_Type(1..Get_Elements(Name)) do
		glGetBooleanv(	pname  => Convert(Name),
				params => Result(Result'First)'Access
			);
	End Return;
    end Get;

    Function Get (Name : State_Variable) return Double_Vector_Type is
    begin
	Return Result : Double_Vector_Type(1..Get_Elements(Name)) do
		glGetDoublev(	pname  => Convert(Name),
				params => Result(Result'First)'Access
			);
	End Return;
    end Get;

    Function Get (Name : State_Variable) return Float_Vector_Type is
    begin
	Return Result : Float_Vector_Type(1..Get_Elements(Name)) do
		glGetFloatv(	pname  => Convert(Name),
				params => Result(Result'First)'Access
			);
	End Return;
    end Get;

    Function Get (Name : State_Variable) return Types.Integer_Vector_Type is
    begin
	Return Result : Types.Integer_Vector_Type(1..Get_Elements(Name)) do
		glGetIntegerv(	pname  => Convert(Name),
				params => Result(Result'First)'Access
			);
	End Return;
    end Get;

    procedure PushAttrib (mask : bitfield) is
    begin
	glPushAttrib(	mask => mask	);
    end PushAttrib;

    procedure PopAttrib is
    begin
	glPopAttrib;
    end PopAttrib;

    procedure PushClientAttrib (mask : bitfield) is
    begin
	glPushClientAttrib(	mask => mask	);
    end PushClientAttrib;

    procedure PopClientAttrib is
    begin
	glPopClientAttrib;
    end PopClientAttrib;

    function RenderMode (Mode : Rendering_Mode) return Types.Integer is
    begin
	Return Result : Types.Integer:= glRenderMode(	mode => Convert(mode)	);
    end RenderMode;

    function GetError return Error_Flag is
    begin
	Return Result : Error_Flag:= Error_Flag'Val(glGetError);
    end GetError;

    function GetString (Name : String_Constants) return String is
	Type AUB is Access All Unsigned_Byte;
	Temp : AUB:= AUB( glGetString( name => Convert(Name) ) );

	Use Interfaces.C.Strings;
	Function Convert is new Ada.Unchecked_Conversion
		( Target => chars_ptr,	Source => AUB );
    begin
	Return Value(	Item => Convert(Temp)	);
    end GetString;

    procedure Finish is
    begin
	glFinish;
    end Finish;

    procedure Flush is
    begin
	glFlush;
    end Flush;

    procedure Hint (Target : Hints; mode : Hint_Mode) is
    begin
	glHint(	target => Convert(Target),
		mode   => Convert(mode)	);
    end Hint;

    procedure ClearDepth (depth : Clamped_Double) is
    begin
	glClearDepth(	depth => depth	);
    end ClearDepth;

    procedure DepthFunc (func : Comparisions) is
    begin
	glDepthFunc(	func => Convert(func)	);
    end DepthFunc;

    procedure DepthMask (flag : Types.Boolean) is
    begin
	glDepthMask(	flag => flag	);
    end DepthMask;

    procedure DepthRange (near_val, far_val : Clamped_Double) is
    begin
	glDepthRange(	near_val => near_val,
			far_val  => far_val	);
    end DepthRange;

    procedure ClearAccum (red, green, blue, alpha : Types.Float) is
    begin
	glClearAccum(	Red => Red,	Green => Green,
			Blue => Blue,	Alpha => Alpha	);
    end ClearAccum;

    procedure Accum (op : Accumulator_Operators; value : Types.float) is
    begin
	glAccum(	value => value,
			op    => Convert(op)	);
    end Accum;

    procedure MatrixMode (mode : Matrix_Mode_Type) is
    begin
	glMatrixMode(	mode => Convert(mode)	);
    end MatrixMode;

    procedure Ortho (left, right, bottom, top, near, far : double) is
    begin
	glOrtho(
		left     => left,
		right    => right,
		bottom   => bottom,
		top      => top,
		near_val => near,
		far_val  => far
	);
    end Ortho;

    procedure Frustum (left, right, bottom, top, near, far : double) is
    begin
	glFrustum(
		left     => left,
		right    => right,
		bottom   => bottom,
		top      => top,
		near_val => near,
		far_val  => far
	);
    end Frustum;

    procedure Viewport (x, y : Types.Integer; width, height : Types.Size) is
    begin
	glViewport(
	    x      => x,
	    y      => y,
	    width  => width,
	    height => height
	);
    end Viewport;

    procedure PushMatrix is
    begin
	glPushMatrix;
    end PushMatrix;

    procedure PopMatrix is
    begin
	glPopMatrix;
    end PopMatrix;

    procedure LoadIdentity is
    begin
	glLoadIdentity;
    end LoadIdentity;

    procedure LoadMatrix (m : Double_Matrix) is
	Package Addr is new System.Address_To_Access_Conversions
	  (Object => Double);
    begin
	glLoadMatrixd(	m => addr.To_Pointer(m'Address)	);
    end LoadMatrix;

    procedure LoadMatrix (m : Float_Matrix) is
    begin
	glLoadMatrixf(	m => To_Pointer(m'Address)	);
    end LoadMatrix;

    procedure MultMatrix (m : Double_Matrix) is
	Package Addr is new System.Address_To_Access_Conversions
	  (Object => Double);
    begin
	glMultMatrixd(	m => addr.To_Pointer(m'Address)	);
    end MultMatrix;

    procedure MultMatrix (m : Float_Matrix) is
    begin
	glMultMatrixf(	m => To_Pointer(m'Address)	);
    end MultMatrix;

    procedure Rotate (angle, x, y, z : double) is
    begin
	glRotated(
	   angle => angle,
	   x     => x,
	   y     => y,
	   z     => z
	);
    end Rotate;

    procedure Rotate (angle, x, y, z : Types.float) is
    begin
	glRotatef(
	   angle => angle,
	   x     => x,
	   y     => y,
	   z     => z
	);
    end Rotate;

    procedure Scale (x, y, z : double) is
    begin
	glScaled(
	  x => x,
	  y => y,
	  z => z
	 );
    end Scale;

    procedure Scale (x, y, z : Types.float) is
    begin
	glScalef(
	  x => x,
	  y => y,
	  z => z
	 );
    end Scale;

    procedure Translate (x, y, z : double) is
    begin
	glTranslated(
	      x => x,
	      y => y,
	      z => z
	     );
    end Translate;

    procedure Translate (x, y, z : Types.float) is
    begin
	glTranslatef(
	      x => x,
	      y => y,
	      z => z
	     );
    end Translate;

    function IsList (list : Unsigned_Integer) return Types.Boolean is
    begin
	Return glIsList(list => list);
    end IsList;

    procedure DeleteLists (list : Unsigned_Integer; c_range : Types.Size) is
    begin
	glDeleteLists(
	       list    => list,
	       c_range => c_range
	      );
    end DeleteLists;

    function GenLists (list_range : Types.Size) return Unsigned_Integer is
    begin
	Return glGenLists(	c_range => list_range	);
    end GenLists;

    procedure NewList (List : Unsigned_Integer; mode : Command_Mode) is
    begin
	glNewList(
	   list => list,
	   mode => Convert(mode)
	  );
    end NewList;

    procedure EndList is
    begin
	glEndList;
    end EndList;

    procedure CallList (list : Unsigned_Integer) is
    begin
	glCallList(	list => list	);
    end CallList;

    procedure CallLists(n : Types.Size; List_Type : Types.List_Type; lists : System.Address) is
    begin
	Null;
    end CallLists;

    procedure CallLists (Lists : Byte_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_BYTE),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Unsigned_Byte_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_UNSIGNED_BYTE),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Short_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_BYTE),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Unsigned_Short_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_UNSIGNED_SHORT),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Types.Integer_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_INTEGER),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Unsigned_Integer_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_UNSIGNED_INTEGER),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Float_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_FLOAT),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Two_Byte_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_2_BYTES),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Three_Byte_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_3_BYTES),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure CallLists (Lists : Four_Byte_Vector_Type) is
    begin
	glCallLists(
	     n      => Lists'Length,
	     c_type => Convert(LIST_4_BYTES),
	     lists  => Lists'Address
	    );
    end CallLists;

    procedure ListBase (base : Unsigned_Integer) is
    begin
	glListBase(	base => base	);
    end ListBase;

    procedure Start(Mode: Vertex_Interpretation) is
    begin
	OpenGL_Executing:= True;
	glBegin(	mode => Convert(mode)	);
    end Start;

    procedure Stop is
    begin
	glEnd;
	OpenGL_Executing:= false;
    end Stop;

    procedure Vertex (x, y : double; z : double:= 0.0; w : double:= 1.0) is
    begin
	glVertex4d(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end Vertex;

    procedure Vertex (x, y : Types.float; z : Types.float:= 0.0; w : Types.float:= 1.0) is
    begin
	glVertex4f(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end Vertex;

    procedure Vertex (x, y : Types.Integer; z : Types.Integer:= 0; w : Types.Integer:= 1) is
    begin
	glVertex4i(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end Vertex;

    procedure Vertex (x, y : short; z : short:= 0; w : short:= 1) is
    begin
	glVertex4s(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end Vertex;

    procedure Vertex (v : Double_Vector_Type) is
    begin
	case v'Length is
	When 2 => glVertex2dv(	v => To_Pointer( v'Address )	);
	When 3 => glVertex3dv(	v => To_Pointer( v'Address )	);
	When 4 => glVertex4dv(	v => To_Pointer( v'Address )	);
	When Others => Raise Constraint_Error;
	end case;
    end Vertex;

    procedure Vertex (v : Float_Vector_Type) is
    begin
	case v'Length is
	When 2 => glVertex2fv(	v => To_Pointer( v'Address )	);
	When 3 => glVertex3fv(	v => To_Pointer( v'Address )	);
	When 4 => glVertex4fv(	v => To_Pointer( v'Address )	);
	When Others => Raise Constraint_Error;
	end case;
    end Vertex;

    procedure Vertex (v : Types.Integer_Vector_Type) is
    begin
	case v'Length is
	When 2 => glVertex2iv(	v => To_Pointer( v'Address )	);
	When 3 => glVertex3iv(	v => To_Pointer( v'Address )	);
	When 4 => glVertex4iv(	v => To_Pointer( v'Address )	);
	When Others => Raise Constraint_Error;
	end case;
    end Vertex;

    procedure Vertex (v : Short_Vector_Type) is
    begin
	case v'Length is
	When 2 => glVertex2sv(	v => To_Pointer( v'Address )	);
	When 3 => glVertex3sv(	v => To_Pointer( v'Address )	);
	When 4 => glVertex4sv(	v => To_Pointer( v'Address )	);
	When Others => Raise Constraint_Error;
	end case;
    end Vertex;

    procedure Normal (x, y, z : byte) is
    begin
	glNormal3b(
		nx => x,
		ny => y,
		nz => z
	);
    end Normal;

    procedure Normal (x, y, z : double) is
    begin
	glNormal3d(
		nx => x,
		ny => y,
		nz => z
	);
    end Normal;

    procedure Normal (x, y, z : Types.Float) is
    begin
	glNormal3f(
		nx => x,
		ny => y,
		nz => z
	);
    end Normal;

    procedure Normal (x, y, z : Types.Integer) is
    begin
	glNormal3i(
		nx => x,
		ny => y,
		nz => z
	);
    end Normal;

    procedure Normal (x, y, z : short) is
    begin
	glNormal3s(
		nx => x,
		ny => y,
		nz => z
	);
    end Normal;

    procedure Normal (v : Byte_Vector_Type) is
    begin
	glNormal3bv(	v => To_Pointer(v'Address)	);
    end Normal;

    procedure Normal (v : Double_Vector_Type) is
    begin
	glNormal3dv(	v => To_Pointer(v'Address)	);
    end Normal;

    procedure Normal (v : Float_Vector_Type) is
    begin
	glNormal3fv(	v => To_Pointer(v'Address)	);
    end Normal;

    procedure Normal (v : Types.Integer_Vector_Type) is
    begin
	glNormal3iv(	v => To_Pointer(v'Address)	);
    end Normal;

    procedure Normal (v : Short_Vector_Type) is
    begin
	glNormal3sv(	v => To_Pointer(v'Address)	);
    end Normal;

    procedure Index (c : double) is
    begin
	glIndexd(	c => c	);
    end Index;

    procedure Index (c : float) is
    begin
	glIndexf(	c => c	);
    end Index;

    procedure Index (c : Types.Integer) is
    begin
	glIndexi(	c => c	);
    end Index;

    procedure Index (c : short) is
    begin
	glIndexs(	c => c	);
    end Index;

    procedure Index (c : Unsigned_Byte) is
    begin
	glIndexub(	c => c	);
    end Index;

    procedure Index (c : access double) is
    begin
	glIndexdv(	c => c	);
    end Index;

    procedure Index (c : Access Types.Float) is
    begin
	glIndexfv(	c => c	);
    end Index;

    procedure Index (c : Access Types.Integer) is
    begin
	glIndexiv(	c => c	);
    end Index;

    procedure Index (c : access short) is
    begin
	glIndexsv(	c => c	);
    end Index;

    procedure Index (c : access Unsigned_Byte) is
    begin
	glIndexubv(	c => c	);
    end Index;

    procedure Color (Red, Green, Blue : byte) is
    begin
	glColor3b(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue : double) is
    begin
	glColor3d(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue : Types.float) is
    begin
	glColor3f(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue : Types.Integer) is
    begin
	glColor3i(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue : short) is
    begin
	glColor3s(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue : Unsigned_Byte) is
    begin
	glColor3ub(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;


    procedure Color (Red, Green, Blue : Unsigned_Integer) is
    begin
	glColor3ui(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue : Unsigned_Short) is
    begin
	glColor3us(
		red   => Red,
		green => Green,
		blue  => Blue
	);
    end Color;

    procedure Color (Red, Green, Blue, Alpha : byte) is
    begin
	glColor4b(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;

    procedure Color (Red, Green, Blue, Alpha : double) is
    begin
	glColor4d(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;

    procedure Color (Red, Green, Blue, Alpha : Types.float) is
    begin
	glColor4f(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;


    procedure Color (Red, Green, Blue, Alpha : Types.Integer) is
    begin
	glColor4i(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;

    procedure Color (Red, Green, Blue, Alpha : short) is
    begin
	glColor4s(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;


    procedure Color (Red, Green, Blue, Alpha : Unsigned_Byte) is
    begin
	glColor4ub(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;

    procedure Color (Red, Green, Blue, Alpha : Unsigned_Integer) is
    begin
	glColor4ui(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;

    procedure Color (Red, Green, Blue, Alpha : Unsigned_Short) is
    begin
	glColor4us(
		red   => Red,
		green => Green,
		blue  => Blue,
		alpha => Alpha
	);
    end Color;

    procedure Color (v : Byte_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3bv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4bv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Double_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3dv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4dv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Float_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3fv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4fv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Types.Integer_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3iv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4iv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Short_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3sv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4sv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Unsigned_Byte_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3ubv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4ubv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Unsigned_Integer_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3uiv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4uiv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure Color (v : Unsigned_Short_Color) is
    begin
	case v'Length is
	When 3 =>	glColor3usv(	v => To_Pointer(v'Address)	);
	When 4 =>	glColor4usv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end Color;

    procedure TexCoord (s : double; t, r : double:= 0.0; q : double:= 1.0) is
    begin
	glTexCoord4d(
		s => s,
		t => t,
		r => r,
		q => q
	);
    end TexCoord;

    procedure TexCoord (s : Types.float; t, r : Types.float:= 0.0; q : Types.float:= 1.0) is
    begin
	glTexCoord4f(
		s => s,
		t => t,
		r => r,
		q => q
	);
    end TexCoord;

    procedure TexCoord (s : Types.Integer; t, r : Types.Integer:= 1; q : Types.Integer:= 0) is
    begin
	glTexCoord4i(
		s => s,
		t => t,
		r => r,
		q => q
	);
    end TexCoord;

    procedure TexCoord (s : short; t, r : short:= 1; q : short:= 0) is
    begin
	glTexCoord4s(
		s => s,
		t => t,
		r => r,
		q => q
	);
    end TexCoord;

    procedure TexCoord (v : Double_Vector_Type) is
    begin
	case v'Length is
	When 2 => glTexCoord2dv(	v => To_Pointer(v'Address)	);
	When 3 => glTexCoord3dv(	v => To_Pointer(v'Address)	);
	When 4 => glTexCoord4dv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end TexCoord;

    procedure TexCoord (v : Float_Vector_Type) is
    begin
	case v'Length is
	When 2 => glTexCoord2fv(	v => To_Pointer(v'Address)	);
	When 3 => glTexCoord3fv(	v => To_Pointer(v'Address)	);
	When 4 => glTexCoord4fv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end TexCoord;

    procedure TexCoord (v : Types.Integer_Vector_Type) is
    begin
	case v'Length is
	When 2 => glTexCoord2iv(	v => To_Pointer(v'Address)	);
	When 3 => glTexCoord3iv(	v => To_Pointer(v'Address)	);
	When 4 => glTexCoord4iv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end TexCoord;

    procedure TexCoord (v : Short_Vector_Type) is
    begin
	case v'Length is
	When 2 => glTexCoord2sv(	v => To_Pointer(v'Address)	);
	When 3 => glTexCoord3sv(	v => To_Pointer(v'Address)	);
	When 4 => glTexCoord4sv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end TexCoord;

    procedure RasterPos (x, y : double; z : double:= 0.0; w : double:= 1.0) is
    begin
	glRasterPos4d(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end RasterPos;

    procedure RasterPos (x, y : Types.float; z : Types.float:= 0.0; w : Types.float:= 1.0) is
    begin
	glRasterPos4f(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end RasterPos;

    procedure RasterPos (x, y : Types.Integer; z : Types.Integer:= 0; w : Types.Integer:= 1) is
    begin
	glRasterPos4i(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end RasterPos;

    procedure RasterPos (x, y : short; z : short:= 0; w : short:= 1) is
    begin
	glRasterPos4s(
		x => x,
		y => y,
		z => z,
		w => w
	);
    end RasterPos;

    procedure RasterPos (v : Double_Vector_Type) is
    begin
	case v'Length is
	When 2 => glRasterPos2dv(	v => To_Pointer(v'Address)	);
	When 3 => glRasterPos3dv(	v => To_Pointer(v'Address)	);
	When 4 => glRasterPos4dv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end RasterPos;

    procedure RasterPos (v : Float_Vector_Type) is
    begin
	case v'Length is
	When 2 => glRasterPos2fv(	v => To_Pointer(v'Address)	);
	When 3 => glRasterPos3fv(	v => To_Pointer(v'Address)	);
	When 4 => glRasterPos4fv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end RasterPos;

    procedure RasterPos (v : Types.Integer_Vector_Type) is
    begin
	case v'Length is
	When 2 => glRasterPos2iv(	v => To_Pointer(v'Address)	);
	When 3 => glRasterPos3iv(	v => To_Pointer(v'Address)	);
	When 4 => glRasterPos4iv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end RasterPos;

    procedure RasterPos (v : Short_Vector_Type) is
    begin
	case v'Length is
	When 2 => glRasterPos2sv(	v => To_Pointer(v'Address)	);
	When 3 => glRasterPos3sv(	v => To_Pointer(v'Address)	);
	When 4 => glRasterPos4sv(	v => To_Pointer(v'Address)	);
	When Others => Raise Constraint_Error;
	end case;
    end RasterPos;

    procedure Rect (x1, y1, x2, y2 : double) is
    begin
	glRectd(
		x1 => x1,
		y1 => y1,
		x2 => x2,
		y2 => y2
	);
    end Rect;

    procedure Rect (x1, y1, x2, y2 : Types.float) is
    begin
	glRectf(
		x1 => x1,
		y1 => y1,
		x2 => x2,
		y2 => y2
	);
    end Rect;

    procedure Rect (x1, y1, x2, y2 : Types.Integer) is
    begin
	glRecti(
		x1 => x1,
		y1 => y1,
		x2 => x2,
		y2 => y2
	);
    end Rect;

    procedure Rect (x1, y1, x2, y2 : short) is
    begin
	glRects(
		x1 => x1,
		y1 => y1,
		x2 => x2,
		y2 => y2
	);
    end Rect;

    procedure Rect (v1, v2 : Double_Vector_Type) is
    begin
	glRectdv(
		v1 => To_Pointer(v1'Address),
		v2 => To_Pointer(v2'Address)
	);
    end Rect;

    procedure Rect (v1, v2 : Float_Vector_Type) is
    begin
	glRectfv(
		v1 => To_Pointer(v1'Address),
		v2 => To_Pointer(v2'Address)
	);
    end Rect;

    procedure Rect (v1, v2 : Types.Integer_Vector_Type) is
    begin
	glRectiv(
		v1 => To_Pointer(v1'Address),
		v2 => To_Pointer(v2'Address)
	);
    end Rect;

    procedure Rect (v1, v2 : Short_Vector_Type) is
    begin
	glRectsv(
		v1 => To_Pointer(v1'Address),
		v2 => To_Pointer(v2'Address)
	);
    end Rect;

    procedure ShadeModel (mode : Shading_Technique) is
    begin
	glShadeModel(	mode => Convert(mode)	);
    end ShadeModel;

    procedure Light (light : Light_Source; pname : Lighting_Style; param : Types.float) is
    begin
	glLightf(
		light => Convert( light ),
		pname => Convert( pname ),
		param => param
	 );
    end Light;

    procedure Light (light : Light_Source; pname : Lighting_Style; param : Types.Integer) is
    begin
	glLighti(
		light => Convert( light ),
		pname => Convert( pname ),
		param => param
	 );
    end Light;

    procedure Light (light : Light_Source; pname : Lighting_Style; params : Float_Vector_Type) is
    begin
	glLightfv(
		light	=> Convert( light ),
		pname	=> Convert( pname ),
		params	=> To_Pointer(params'Address)
	 );
    end Light;

    procedure Light (light : Light_Source; pname : Lighting_Style; params : Types.Integer_Vector_Type) is
    begin
	glLightiv(
		light	=> Convert( light ),
		pname	=> Convert( pname ),
		params	=> To_Pointer(params'Address)
	 );
    end Light;

    function Get_Elements(Item : Lighting_Style) Return Natural is
    begin
	Return Value : Natural:= Natural'First do
	    case Item is
	    When SPOT_EXPONENT | SPOT_CUTOFF | CONSTANT_ATTENUATION |
		 LINEAR_ATTENUATION | QUADRATIC_ATTENUATION
		=> Value:= 1;
	    When SPOT_DIRECTION
		=> Value:= 3;
	    When Others
		=> Value:= 4;
	    end case;
	End Return;
    end Get_Elements;

    function GetLight (light : Light_Source; pname : Lighting_Style) return Float_Vector_Type is
    begin
	Return Result : Float_Vector_Type(1..Get_Elements(pname)) do
	glGetLightfv(
		light	=> Convert( light ),
		pname	=> Convert( pname ),
		params	=> To_Pointer( Result'Address )
	 );
	End Return;
    End GetLight;

    Function GetLight (light : Light_Source; pname : Lighting_Style) Return Types.Integer_Vector_Type is
    begin
	Return Result : Types.Integer_Vector_Type(1..Get_Elements(pname)) do
	glGetLightfv(
		light	=> Convert( light ),
		pname	=> Convert( pname ),
		params	=> To_Pointer( Result'Address )
	 );
	End Return;
    End GetLight;

    procedure LightModel (pname : Light_Model; param : Types.float) is
    begin
	glLightModelf(
		pname => Convert(pname),
		param => param
	);
    end LightModel;

    procedure LightModel (pname : Light_Model; param : Types.Integer) is
    begin
	glLightModeli(
		pname => Convert(pname),
		param => param
	);
    end LightModel;

    procedure LightModel (pname : Light_Model; params : float_vector_type) is
    begin
	glLightModelfv(
		pname  => Convert(pname),
		params => To_Pointer(params'Address)
	);
    end LightModel;

    procedure LightModel (pname : Light_Model; params : Types.Integer_vector_type) is
    begin
	glLightModeliv(
		pname  => Convert(pname),
		params => To_Pointer(params'Address)
	);
    end LightModel;

    procedure Material (face : Types.Face; param : Types.Float) is
    begin
	glMaterialf(
		face  => Convert(face),
		pname => Convert(SHININESS),
		param => param
	);
    end Material;

    procedure Material (face : Types.Face; param : Types.Integer) is
    begin
	glMateriali(
		face  => Convert(face),
		pname => Convert(SHININESS),
		param => param
	);
    end Material;

    Function Get_Elements( Item : Material_Parameter ) Return Natural is
    begin
	Return Values : Natural:= Natural'First do
	    case Item is
	    When  AMBIENT | DIFFUSE | SPECULAR | EMISSION | AMBIENT_AND_DIFFUSE
		=> Values:= 4;
	    When SHININESS
		=> Values:= 1;
	    When COLOR_INDEXES
		=> Values:= 3;
	    end case;
	End Return;
    end Get_Elements;

    procedure Material (face : Types.Face; pname : Material_Parameter; params : Float_Vector_Type) is
    begin
	if Get_Elements( pname ) /= params'Length then
		glMaterialfv(
			face	=> Convert(Face),
			pname	=> Convert(pname),
			params	=> To_Pointer( Params'Address )
		);
	else
	    Raise Constraint_Error;
	end if;
    end Material;


    procedure Material (face : Types.Face; pname : Material_Parameter; params : Types.Integer_Vector_Type) is
    begin
	if Get_Elements( pname ) /= params'Length then
		glMaterialiv(
			face	=> Convert(Face),
			pname	=> Convert(pname),
			params	=> To_Pointer( Params'Address )
		);
	else
	    Raise Constraint_Error;
	end if;
    end Material;

    function GetMaterial (face : Types.Face; pname : Material_Parameter) return Float_Vector_Type is
    begin
	Return Result : Float_Vector_Type(1..Get_Elements(pname)) do
	    glGetMaterialfv(
			face   => Convert( face ),
			pname  => Convert( pname ),
			params => To_Pointer( Result'Address )
		    );
	End Return;
    end GetMaterial;

    function GetMaterial (face : Types.Face; pname : Material_Parameter) return Types.Integer_Vector_Type is
    begin
	Return Result : Types.Integer_Vector_Type(1..Get_Elements(pname)) do
	    glGetMaterialiv(
			face   => Convert( face ),
			pname  => Convert( pname ),
			params => To_Pointer( Result'Address )
		    );
	End Return;
    end GetMaterial;

    procedure ColorMaterial (face : Types.Face; mode : Material_Color) is
    begin
	glColorMaterial(
		face => Convert( Face ),
		mode => Convert( mode )
	);
    end ColorMaterial;

    procedure PixelZoom (x_factor, y_factor : Types.float) is
    begin
	glPixelZoom(
		xfactor => x_factor,
		yfactor => y_factor
	);
    end PixelZoom;

    procedure PixelStore (pname : Pixel_Storage; param : Types.float) is
    begin
	glPixelStoref(
		pname => Convert(pname),
		param => param
	);
    end PixelStore;

    procedure PixelStore (pname : Pixel_Storage; param : Types.Integer) is
    begin
	glPixelStorei(
		pname => Convert(pname),
		param => param
	);
    end PixelStore;

    procedure PixelTransfer (pname : Transfer_Style; param : Types.float) is
    begin
	glPixelTransferf(
		pname => Convert(pname),
		param => param
	);
    end PixelTransfer;

    procedure PixelTransfer (pname : Transfer_Style; param : Types.Integer) is
    begin
	glPixelTransferi(
		pname => Convert(pname),
		param => param
	);
    end PixelTransfer;

    procedure PixelMap (map : Pixel_Mapping_Type; values : Float_Vector_Type) is
    begin
	glPixelMapfv(
		map     => Convert(map),
		mapsize => Values'Length,
		values  => To_Pointer( Values'Address )
	);
    end PixelMap;

    procedure PixelMap (map : Pixel_Mapping_Type; values : Unsigned_Integer_Vector_Type) is
    begin
	glPixelMapuiv(
		map     => Convert(map),
		mapsize => Values'Length,
		values  => To_Pointer( Values'Address )
	);
    end PixelMap;


    procedure PixelMap (map : Pixel_Mapping_Type; values : Unsigned_Short_Vector_Type) is
    begin
	glPixelMapusv(
		map     => Convert(map),
		mapsize => Values'Length,
		values  => To_Pointer( Values'Address )
	);
    end PixelMap;

    Function GetPixelMap (map : Pixel_Mapping_Type) return Float_Vector_Type is
	Length : Natural:= 2;
    begin
	Return Result : Float_Vector_Type(1..Length) do
		glGetPixelMapfv(
			map    => Convert(map),
			values => To_Pointer( Result'Address )
		);
	End Return;
    end GetPixelMap;

    Function GetPixelMap (map : Pixel_Mapping_Type) return Unsigned_Integer_Vector_Type is
	Length : Natural:= 2;
    begin
	Return Result : Unsigned_Integer_Vector_Type(1..Length) do
		glGetPixelMapuiv(
			map    => Convert(map),
			values => To_Pointer( Result'Address )
		);
	End Return;    end GetPixelMap;

    Function GetPixelMap (map : Pixel_Mapping_Type) return Unsigned_Short_Vector_Type is
	Length : Natural:= 2;
    begin
	Return Result : Unsigned_Short_Vector_Type(1..Length) do
		glGetPixelMapusv(
			map    => Convert(map),
			values => To_Pointer( Result'Address )
		);
	End Return;    end GetPixelMap;

    procedure Bitmap (x_origin, y_origin, x_move, y_move : Types.Float;
		      bitmap : Types.Bitmap) is
    begin
	glBitmap(
		width  => Bitmap'Length(1),
		height => Bitmap'Length(2),
		xorig  => x_origin,
		yorig  => y_origin,
		xmove  => x_move,
		ymove  => y_move,
		bitmap => To_Pointer( Bitmap'Address )
	);
    end Bitmap;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format
			 ) Return Byte_Vector_Type is
    begin
	Return Pixels : Byte_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_BYTE),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format
			 ) Return Short_Vector_Type is
    begin
	Return Pixels : Short_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_SHORT),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format
			 ) Return Integer_Vector_Type is
    begin
	Return Pixels : Integer_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_SHORT),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format
			 ) Return Float_Vector_Type is
    begin
	Return Pixels : Float_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_FLOAT),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type_8
			 ) Return Unsigned_Byte_Vector_Type is
    begin
	Return Pixels : Unsigned_Byte_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(Data_Type),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type_16
			 ) Return Unsigned_Short_Vector_Type is
    begin
	Return Pixels : Unsigned_Short_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(Data_Type),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    Function ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type_32
			 ) Return Unsigned_Integer_Vector_Type is
    begin
	Return Pixels: Unsigned_Integer_Vector_Type(1..Integer(width*height)) do
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(Data_Type),
		pixels => pixels'Address
	);
	End Return;
    end ReadPixels;

    procedure ReadPixels (	x, y : Types.Integer;
				width, height : Types.Size;
				Format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type;
				Pixels : System.Address) is
    begin
	glReadPixels(
		x      => x,
		y      => y,
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(Data_Type),
		pixels => pixels
	);
    end ReadPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				pixels : Byte_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_BYTE),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				pixels : Short_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_SHORT),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				pixels : Integer_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_INTEGER),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				pixels : Float_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => Convert(PDT_FLOAT),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type_8;
				pixels : Unsigned_Byte_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => convert(Data_Type),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type_16;
				pixels : Unsigned_Short_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => convert(Data_Type),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type_32;
				pixels : Unsigned_Integer_Vector_Type) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => convert(Data_Type),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure DrawPixels (	Width, Height : Types.Size;
				format : Pixel_Data_Format;
				Data_Type : Pixel_Data_Type;
				pixels : System.Address) is
    begin
	glDrawPixels(
		width  => width,
		height => height,
		format => Convert(Format),
		c_type => convert(Data_Type),
		pixels => pixels'Address
	);
    End DrawPixels;

    procedure CopyPixels (	X, Y : Types.Integer;
				Width, Height : Types.Size;
				Style : Pixel_Copy_Type) is
    begin
	glCopyPixels(
	      x      => X,
	      y      => Y,
	      width  => Width,
	      height => Height,
	      c_type => Convert( Style )
	);
    end CopyPixels;

    procedure StencilFunc (	func : Comparisions;
				reference : Types.Integer;
				mask : Unsigned_Integer) is
    begin
	glStencilFunc(
		func => Convert( Func ),
		ref  => reference,
		mask => mask
	);
    end StencilFunc;

    procedure StencilMask (mask : Bitfield) is
    begin
	glStencilMask(	mask => Convert(mask)	);
    end StencilMask;

    procedure StencilOp (fail, zfail, zpass : Stencil_Op_Type) is
    begin
	glStencilOp(
		fail  => Convert( Fail ),
		zfail => Convert( zfail ),
		zpass => Convert( zpass )
	);
    end StencilOp;

    procedure ClearStencil (s : Types.Integer) is
    begin
	glClearStencil(	s => s	);
    end ClearStencil;

    procedure TexGen (coord : Texture_Coordinate_Type; param : double) is
    begin
	glTexGend(
		coord => Convert( Coord ),
		pname => Types.Constants.GL_TEXTURE_GEN_MODE,
		param => param
	);
    end TexGen;

    procedure TexGen (coord : Texture_Coordinate_Type; param : Types.float) is
    begin
	glTexGenf(
		coord => Convert( Coord ),
		pname => Types.Constants.GL_TEXTURE_GEN_MODE,
		param => param
	);
    end TexGen;

    procedure TexGen (coord : Texture_Coordinate_Type; param : Types.Integer) is
    begin
	glTexGeni(
		coord => Convert( Coord ),
		pname => Types.Constants.GL_TEXTURE_GEN_MODE,
		param => param
	);
    end TexGen;

    procedure TexGen (	coord : Texture_Coordinate_Type;
			pname : Texture_Coordinate_Generation;
			params : Double_Vector_Type) is
    begin
	glTexGendv(
		coord  => Convert( coord ),
		pname  => Convert( pname ),
		params => To_Pointer(params'Address)
	);
    end TexGen;

    procedure TexGen (	coord : Texture_Coordinate_Type;
			pname : Texture_Coordinate_Generation;
			params : Float_Vector_Type) is
    begin
	glTexGenfv(
		coord  => Convert( coord ),
		pname  => Convert( pname ),
		params => To_Pointer(params'Address)
	);
    end TexGen;

    procedure TexGen (	coord : Texture_Coordinate_Type;
			pname : Texture_Coordinate_Generation;
			params : Integer_Vector_Type) is
    begin
	glTexGeniv(
		coord  => Convert( coord ),
		pname  => Convert( pname ),
		params => To_Pointer(params'Address)
	);
    end TexGen;

    Function Get_Elements(Item:Texture_Coordinate_Generation) Return Positive
	with inline;
    Function Get_Elements(Item:Texture_Coordinate_Generation) Return Positive is
    begin
	case Item is
	when TEXTURE_GEN_MODE		=> Return 1;
	when OBJECT_PLANE | EYE_PLANE	=> Return 4;
	end case;
    end Get_Elements;

    Function GetTexGen (	coord : Texture_Coordinate_Type;
				pname : Texture_Coordinate_Generation)
				Return Double_Vector_Type is
    begin
	Return Result : Double_Vector_Type(1..Get_Elements( pname )) do
		glGetTexGendv(
			coord  => Convert(coord),
			pname  => Convert(pname),
			params => To_Pointer( Result'Address )
		);
	End Return;
    end GetTexGen;

    Function GetTexGen (	coord : Texture_Coordinate_Type;
				pname : Texture_Coordinate_Generation)
				Return Float_Vector_Type is
    begin
	Return Result : Float_Vector_Type(1..Get_Elements( pname )) do
		glGetTexGendv(
			coord  => Convert(coord),
			pname  => Convert(pname),
			params => To_Pointer( Result'Address )
		);
	End Return;
    end GetTexGen;

    Function GetTexGen (	coord : Texture_Coordinate_Type;
				pname : Texture_Coordinate_Generation)
				Return Integer_Vector_Type is
    begin
	Return Result : Integer_Vector_Type(1..Get_Elements( pname )) do
		glGetTexGendv(
			coord  => Convert(coord),
			pname  => Convert(pname),
			params => To_Pointer( Result'Address )
		);
	End Return;
    end GetTexGen;

    procedure TexEnv (	target : Texture_Environment_Type;
			pname : Texture_Environ_Type;
			param : Texture_Environ_Parameter) is
    begin
	glTexEnvi(
		target => Convert(target),
		pname  => Convert(pname),
		param  => Types.Integer(Convert(param))
	);
    end TexEnv;

    procedure TexEnv (	target : Texture_Environment_Type;
			pname : Texture_Environ_Type;
			param : Types.Integer) is
    begin
	glTexEnvi(
		target => Convert(target),
		pname  => Convert(pname),
		param  => param
	);
    end TexEnv;

    procedure TexEnv (	target : Texture_Environment_Type;
			pname : Texture_Environ_Type;
			param : Float) is
    begin
	glTexEnvf(
		target => Convert(target),
		pname  => Convert(pname),
		param  => param
	);
    end TexEnv;

    Function GetTexEnv (	target : Texture_Environment_Type;
				pname : Texture_Environ_Type)
				Return Types.Float is
    begin
	Return Result : Types.Float do
		glGetTexEnvfv(
			target => Convert( Target ),
			pname  => Convert( Target ),
			params => To_Pointer(Result'Address)
		);
	End Return;
    end GetTexEnv;

    Function GetTexEnv (	target : Texture_Environment_Type;
				pname : Texture_Environ_Type)
				Return Types.Integer is
    begin
	Return Result : Types.Integer do
		glGetTexEnvfv(
			target => Convert( Target ),
			pname  => Convert( Target ),
			params => To_Pointer(Result'Address)
		);
	End Return;
    end GetTexEnv;

    procedure TexParameter (	target : Texture_Target;
				pname : Nonvector_Texture_Paramater_Type;
				param : Types.Float) is
    begin
	glTexParameterf(
		target => Convert( Target ),
		pname  => Convert( pname ),
		param  => param
	);
    end TexParameter;

    procedure TexParameter (	target : Texture_Target;
				pname : Nonvector_Texture_Paramater_Type;
				param : Types.Integer) is
    begin
	glTexParameteri(
		target => Convert( target ),
		pname  => Convert( pname ),
		param  => param
	);
    end TexParameter;

    procedure TexParameter (	target : Texture_Target;
				pname : Texture_Paramater_Type;
				params : Float_Vector_Type) is
    begin
	glTexParameterfv(
		target => Convert( target ),
		pname  => Convert( pname ),
		params  => To_Pointer(params'Address)
	);
    end TexParameter;

    procedure TexParameter (	target : Texture_Target;
				pname : Texture_Paramater_Type;
				params : Integer_Vector_Type) is
    begin
	glTexParameteriv(
		target => Convert( target ),
		pname  => Convert( pname ),
		params  => To_Pointer(params'Address)
	);
    end TexParameter;

    Function Get_Elements(Item:Texture_Paramater_Type) Return Positive
	with inline;
    Function Get_Elements(Item:Texture_Paramater_Type) Return Positive is
    begin
	Return Result : Positive:= Positive'First do
	    case Item is
	    When TEXTURE_BORDER_COLOR => Result:= 4;
	    When Others => null;
	    end case;
	End Return;
    end Get_Elements;

    Function GetTexParameter (	target : Texture_Target;
				pname : Texture_Paramater_Type)
				return Float_Vector_Type is
    begin
	Return Result : Float_Vector_Type(1..Get_Elements( pname )) do
		glGetTexParameterfv(
			target	=> Convert(target),
			pname	=> Convert(pname),
			params	=> To_Pointer( Result'Address )
		);
	End Return;
    end GetTexParameter;

    Function GetTexParameter (	target : Texture_Target;
				pname : Texture_Paramater_Type)
				return Integer_Vector_Type is
    begin
	Return Result : Integer_Vector_Type(1..Get_Elements( pname )) do
		glGetTexParameteriv(
			target	=> Convert(target),
			pname	=> Convert(pname),
			params	=> To_Pointer( Result'Address )
		);
	End Return;
    end GetTexParameter;

    Function Get_Elements(Item:Texture_Parameter) Return Positive
	with inline;
    Function Get_Elements(Item:Texture_Parameter) Return Positive is
    begin
	Return Result : Positive:= Positive'First do
	    case Item is
	    When RED_SIZE..DEPTH_SIZE => Raise Unimplemented;
	    When Others => Null;
	    end case;
	End Return;
    end Get_Elements;

    Function GetTexLevelParameter (	target : Extended_Texture_Target;
					level : Types.Size;
					pname : Texture_Parameter)
					return Float_Vector_Type is
    begin
	Return Result : Float_Vector_Type(1..Get_Elements( pname )) do
		glGetTexLevelParameterfv(
			target	=> Convert(target),
			level	=> Types.Integer(level),
			pname	=> Convert(pname),
			params	=> To_Pointer( Result'Address )
		);
	End Return;
    end GetTexLevelParameter;

    Function GetTexLevelParameter (	target : Extended_Texture_Target;
					level : Types.Size;
					pname : Texture_Parameter)
					return Integer_Vector_Type is
    begin
	Return Result : Integer_Vector_Type(1..Get_Elements( pname )) do
		glGetTexLevelParameteriv(
			target	=> Convert(target),
			level	=> Types.Integer(level),
			pname	=> Convert(pname),
			params	=> To_Pointer( Result'Address )
		);
	End Return;
    end GetTexLevelParameter;

    procedure TexImage1D (	target : Texture_Target_1D;
			  level : Types.Integer;
			  InternalFormat : Internal_Format_Type;
			  width : Types.Size;
			  border : Types.Boolean;
			  format : Texture_Pixel_Data_Format;
			  c_type : Pixel_Data_Type;
			  pixels : System.Address) is
    begin
	glTexImage1D(
		target         => Convert(target),
		level          => level,
		internalFormat => Types.Integer( Convert( InternalFormat ) ),
		width          => width,
		border         => Types.Integer(border),
		format         => Convert(Format),
		c_type         => Convert(c_type),
		pixels         => pixels
	);
    end TexImage1D;

    procedure TexImage2D (target : Texture_Target_2D;
			  level : Types.Integer;
			  InternalFormat : Internal_Format_Type;
			  width, height : Types.Size;
			  border : Types.Boolean;
			  format : Texture_Pixel_Data_Format;
			  c_type : Pixel_Data_Type;
			  pixels : System.Address) is
    begin
	glTexImage2D(
		target         => Convert(target),
		level          => level,
		internalFormat => Types.Integer( Convert( InternalFormat ) ),
		width          => width,
		height         => height,
		border         => Types.Integer(border),
		format         => Convert(Format),
		c_type         => Convert(c_type),
		pixels         => pixels
	);
    End TexImage2D;

    procedure GetTexImage (	target : Extended_Texture_Target;
				level : Types.Size;
				format : Texture_Pixel_Data_Format;
				c_type : Pixel_Data_Type;
				pixels : System.Address) is
    begin
	glGetTexImage(
			target => Convert( target ),
			level  => Types.Integer(Level),
			format => Convert( format ),
			c_type => Convert( c_type ),
			pixels => pixels
	);
    end GetTexImage;

    procedure Map1 (	target : Map1_Target;
			u1, u2 : double;
			stride : Types.Integer;
			order : Types.Size;
			points : Double_Vector_Type) is
    begin
	glmap1d(
		target => Convert( target ),
		u1     => u1,
		u2     => u2,
		stride => stride,
		order  => Types.Integer( order ),
		points => To_Pointer(points'Address)
	);
    end map1;

    procedure Map1 (	target : Map1_Target;
			u1, u2 : Types.Float;
			stride : Types.Integer;
			order : Types.Size;
			points : Float_Vector_Type) is
    begin
	glmap1f(
		target => Convert( target ),
		u1     => u1,
		u2     => u2,
		stride => stride,
		order  => Types.Integer( order ),
		points => To_Pointer(points'Address)
	);
    end map1;

    procedure Map2 (	target : Map2_Target;
			u1, u2, v1, v2 : double;
			ustride, vstride : Types.Integer;
			uorder, vorder : Types.Size;
			points : Double_Vector_Type) is
    begin
	glmap2d(
		target  => convert( Target ),
		u1      => u1,
		u2      => u2,
		ustride => ustride,
		uorder  => Types.Integer( uorder ),
		v1      => v1,
		v2      => v2,
		vstride => vstride,
		vorder  => Types.Integer( vorder ),
		points  => To_Pointer( points'Address )
	);
    end Map2;

    procedure Map2 (	target : Map2_Target;
			u1, u2, v1, v2 : Types.float;
			ustride, vstride : Types.Integer;
			uorder, vorder : Types.Size;
			points : Float_Vector_Type) is
    begin
	glmap2f(
		target  => convert( Target ),
		u1      => u1,
		u2      => u2,
		ustride => ustride,
		uorder  => Types.Integer( uorder ),
		v1      => v1,
		v2      => v2,
		vstride => vstride,
		vorder  => Types.Integer( vorder ),
		points  => To_Pointer( points'Address )
	);
    end Map2;

    procedure GetMap (	target : Map_Target;
			query : Map_Query;
			v : Double_Vector_Type) is
    begin
	glGetMapdv(
		target => Convert(target),
		query  => Convert(query),
		v      => To_Pointer(v'Address)
	);
    end GetMap;

    procedure GetMap (target : Map_Target; query : Map_Query; v : Float_Vector_Type) is
    begin
	glGetMapfv(
		target => Convert(target),
		query  => Convert(query),
		v      => To_Pointer(v'Address)
	);
    end GetMap;

    procedure GetMap (target : Map_Target; query : Map_Query; v : Integer_Vector_Type) is
    begin
	glGetMapiv(
		target => Convert(target),
		query  => Convert(query),
		v      => To_Pointer(v'Address)
	);
    end GetMap;

    procedure EvalCoord (u : double) is
    begin
	glEvalCoord1d(	u => u	);
    end EvalCoord;


    procedure EvalCoord (u : Types.float) is
    begin
	glEvalCoord1f(	u => u	);
    end EvalCoord;

    procedure EvalCoord (u, v : double) is
    begin
	glEvalCoord2d(
		u => u,
		v => v
	);
    end EvalCoord;

    procedure EvalCoord (u, v : Types.float) is
    begin
	glEvalCoord2f(
		u => u,
		v => v
	);
    end EvalCoord;

    procedure EvalCoord (u : Double_Vector_Type) is
    begin
	case u'Length is
	When 1 =>	glEvalCoord1dv(	u => to_pointer(u'Address)	);
	when 2 =>	glEvalCoord2dv(	u => to_pointer(u'Address)	);
	when others => Raise Program_Error;
	end case;
    end EvalCoord;

    procedure EvalCoord (u : Float_Vector_Type) is
    begin
	case u'Length is
	When 1 =>	glEvalCoord1fv(	u => to_pointer(u'Address)	);
	when 2 =>	glEvalCoord2fv(	u => to_pointer(u'Address)	);
	when others => Raise Program_Error;
	end case;
    end EvalCoord;

    procedure MapGrid (un : Types.Size; u1, u2 : double) is
    begin
	glMapGrid1d(
		un => Types.Integer(un),
		u1 => u1,
		u2 => u2
	);
    end MapGrid;

    procedure MapGrid (un : Types.Size; u1, u2 : Types.Float) is
    begin
	glMapGrid1f(
		un => Types.Integer(un),
		u1 => u1,
		u2 => u2
	);
    end MapGrid;

    procedure MapGrid (un, vn : Types.Size; u1, u2, v1, v2 : double) is
    begin
	glMapGrid2d(
		un => Types.Integer(un),
		vn => Types.Integer(vn),
		u1 => u1,
		u2 => u2,
		v1 => v1,
		v2 => v2
	);
    end MapGrid;

    procedure MapGrid (un, vn : Types.Size; u1, u2, v1, v2 : Types.Float) is
    begin
	glMapGrid2f(
		un => Types.Integer(un),
		vn => Types.Integer(vn),
		u1 => u1,
		u2 => u2,
		v1 => v1,
		v2 => v2
	);
    end MapGrid;

    procedure EvalPoint (i : Types.Integer) is
    begin
	glEvalPoint1(	i => i	);
    end EvalPoint;


    procedure EvalPoint (i, j : Types.Integer) is
    begin
	glEvalPoint2(
		i => i,
		j => j
	);
    end EvalPoint;

    procedure EvalMesh (mode : Raster_Mode; i1, i2 : Types.Integer) is
    begin
	glEvalMesh1(
		mode => Convert(Mode),
		i1   => i1,
		i2   => i2
	);
    end EvalMesh;

    procedure EvalMesh (mode : Raster_Mode; i1, i2, j1, j2 : Types.Integer) is
    begin
	glEvalMesh2(
		mode => Convert(Mode),
		i1   => i1,
		i2   => i2,
		j1   => j1,
		j2   => j2
	);
    end EvalMesh;

    procedure Fog (pname : Fog_Parameter; param : float) is
    begin
	glFogf(
		pname => Convert(pname),
		param => param
	);
    end Fog;

    procedure Fog (pname : Fog_Parameter; param : Types.Integer) is
    begin
	glFogi(
		pname => Convert(pname),
		param => param
	);
    end Fog;

    procedure Fog (pname : Fog_Parameter; params : Float_Vector_Type) is
    begin
	glFogfv(
		pname => Convert(pname),
		params => To_Pointer(params'Address)
	);
    end Fog;

    procedure Fog (pname : Fog_Parameter; params : Integer_Vector_Type) is
    begin
	glFogfv(
		pname => Convert(pname),
		params => To_Pointer(params'Address)
	);
    end Fog;

    procedure FeedbackBuffer (	size : Types.Size;
				c_type : Vertex_Info;
				buffer : Float_Vector_Type) is
    begin
	glFeedbackBuffer(
		size   => size,
		c_type => Convert(c_type),
		buffer => To_Pointer(buffer'Address)
	);
    end FeedbackBuffer;

    procedure PassThrough (token : float) is
    begin
	glPassThrough(	token => token	);
    end PassThrough;

    procedure SelectBuffer (buffer : in out Unsigned_Integer_Vector_Type) is
    begin
	glSelectBuffer(
		size   => Size( Buffer'Length ),
		buffer => To_Pointer(buffer'Address)
	);
    end SelectBuffer;

    procedure InitNames is
    begin
	glInitNames;
    end InitNames;

    procedure LoadName (name : Unsigned_Integer) is
    begin
	glLoadName(	name => name	);
    end LoadName;

    procedure PushName (name : Unsigned_Integer) is
    begin
	glPushName(	name => name	);
    end PushName;

    procedure PopName is
    begin
	glPopName;
    end PopName;

    procedure GenTextures (textures : Unsigned_Integer_Vector_Type) is
    begin
	glGenTextures(
		n        => textures'Length,
		textures => To_Pointer( textures'Address )
	);
    end GenTextures;

    procedure DeleteTextures (textures : Unsigned_Integer_Vector_Type) is
    begin
	glDeleteTextures(
		n        => textures'Length,
		textures => To_Pointer(textures'Address)
	);
    end DeleteTextures;

    procedure BindTexture (target : Texture_Target; texture : Unsigned_Integer) is
    begin
	glBindTexture(
		target  => Convert( Target ),
		texture => texture
	);
    end BindTexture;

    procedure PrioritizeTextures (	n : Types.Size;
				  	textures : Unsigned_Integer_Vector_Type;
					priorities : Clamped_Float_Vector_Type) is
    begin
	glPrioritizeTextures(
		n          => n,
		textures   => To_Pointer( textures'Address ),
		priorities => To_Pointer( textures'Address )
	);
    end PrioritizeTextures;

    function AreTexturesResident (	n : Types.Size;
					textures : Unsigned_Integer_Vector_Type;
					residences : Boolean_Vector_Type)
					return Types.Boolean is
    begin
	Return glAreTexturesResident(
			n          => n,
			textures   => To_Pointer(textures'Address),
			residences => To_Pointer(residences'Address)
		);
    end AreTexturesResident;

    function IsTexture (texture : Unsigned_Integer) return Types.Boolean is
    begin
	Return glIsTexture( 	texture => texture	);
    end IsTexture;

    procedure TexSubImage (	level, width : Types.Size;
				xoffset : Types.Integer;
				format : Texture_Pixel_Data_Format;
				c_type : Pixel_Data_Type;
				pixels : System.Address) is
    begin
	glTexSubImage1D(
		target  => Convert( Extended_Texture_Target'(TEXTURE_1D) ),
		level   => Types.Integer(level),
		xoffset => xoffset,
		width   => width,
		format  => convert(format),
		c_type  => convert(c_type),
		pixels  => pixels
	);
    end TexSubImage;

    procedure TexSubImage (	target : Texture_Target_2D;
				level, width, height : Types.Size;
				xoffset, yoffset : Types.Integer;
				format : Texture_Pixel_Data_Format;
				c_type : Pixel_Data_Type;
				pixels : System.Address) is
    begin
	glTexSubImage2D(
		target  => convert(target),
		level   => Types.Integer(level),
		xoffset => xoffset,
		yoffset => yoffset,
		width   => width,
		height  => height,
		format  => convert(format),
		c_type  => Convert(c_type),
		pixels  => pixels
	);
    end TexSubImage;

    procedure CopyTexImage (	level, width : Types.Size;
				Internalformat : Internal_Format_Type;
				x, y : Types.Integer;
				border : Types.Boolean) is
    begin
	glCopyTexImage1D(
		target         => Convert(Extended_Texture_Target'(TEXTURE_1D)),
		level          => Types.Integer( level ),
		internalformat => Convert(Internalformat),
		x              => x,
		y              => y,
		width          => width,
		border         => Types.Integer( border )
	);
    end CopyTexImage;

    procedure CopyTexImage (	target : Texture_Target_2D;
				level, width, height : Types.Size;
				Internalformat : Internal_Format_Type;
				x, y : Types.Integer;
				border : Types.Boolean) is
    begin
	glCopyTexImage2D(
		  target         => Convert( target ),
		  level          => Types.Integer( level ),
		  internalformat => Convert(Internalformat),
		  x              => x,
		  y              => y,
		  width          => width,
		  height         => height,
		  border         => Types.Integer( border )
		 );
    end CopyTexImage;

    procedure CopyTexSubImage (	level, width : Types.Size;
				xoffset, x, y : Types.Integer) is
    begin
	glCopyTexSubImage1D(
		target  => Convert(Extended_Texture_Target'(TEXTURE_1D)),
		level   => Types.Integer(level),
		xoffset => xoffset,
		x       => x,
		y       => y,
		width   => width
	);
    end CopyTexSubImage;

    procedure CopyTexSubImage(	target : Texture_Target_2D;
				level, width, height : Types.Size;
				xoffset, yoffset, x, y:Types.Integer) is
    begin
	glCopyTexSubImage2D(
		target  => Convert(target),
		level   => Types.Integer(level),
		xoffset => xoffset,
		yoffset => yoffset,
		x       => x,
		y       => y,
		width   => width,
		height  => height
	);
    end CopyTexSubImage;

    procedure VertexPointer (size, stride : Types.Size; v : Float_Vector_Type) is
    begin
	glVertexPointer(
		size   => Types.Integer(size),
		c_type => Types.Constants.GL_FLOAT,
		stride => stride,
		ptr    => v'Address
	);
    end VertexPointer;

    procedure VertexPointer (size, stride : Types.Size; v : Double_Vector_Type) is
    begin
	glVertexPointer(
		size   => Types.Integer(size),
		c_type => Types.Constants.GL_DOUBLE,
		stride => stride,
		ptr    => v'Address
	);
    end VertexPointer;

    procedure VertexPointer (size, stride : Types.Size; v : Short_Vector_Type) is
    begin
	glVertexPointer(
		size   => Types.Integer(size),
		c_type => Types.Constants.GL_SHORT,
		stride => stride,
		ptr    => v'Address
	);
    end VertexPointer;

    procedure VertexPointer (size, stride : Types.Size; v : Integer_Vector_Type) is
    begin
	glVertexPointer(
		size   => Types.Integer(size),
		c_type => Types.Constants.GL_INT,
		stride => stride,
		ptr    => v'Address
	);
    end VertexPointer;

    procedure NormalPointer (stride : Types.Size; v : Float_Vector_Type) is
    begin
	glNormalPointer(
		c_type => Types.Constants.GL_FLOAT,
		stride => stride,
		ptr    => v'Address
	);
    end NormalPointer;

    procedure NormalPointer (stride : Types.Size; v : Double_Vector_Type) is
    begin
	glNormalPointer(
		c_type => Types.Constants.GL_DOUBLE,
		stride => stride,
		ptr    => v'Address
	);
    end NormalPointer;

    procedure NormalPointer (stride : Types.Size; v : Short_Vector_Type) is
    begin
	glNormalPointer(
		c_type => Types.Constants.GL_SHORT,
		stride => stride,
		ptr    => v'Address
	);
    end NormalPointer;

    procedure NormalPointer (stride : Types.Size; v : Integer_Vector_Type) is
    begin
	glNormalPointer(
		c_type => Types.Constants.GL_INT,
		stride => stride,
		ptr    => v'Address
	);
    end NormalPointer;

    procedure ArrayElement (i : Types.Integer) is
    begin
	glArrayElement(	i => i	);
    end ArrayElement;

    procedure DrawArrays (	mode : Vertex_Interpretation;
				first : Types.Integer;
				count : Types.Size) is
    begin
	glDrawArrays(
		mode  => convert(mode),
		first => first,
		count => count
	);
    end DrawArrays;

    procedure DrawElements (mode : Vertex_Interpretation; vector : Unsigned_Byte_Vector_Type) is
    begin
	glDrawElements(
		mode    => Convert(mode),
		count   => Types.Size(vector'Length),
		c_type  => Types.Constants.GL_UNSIGNED_BYTE,
		indices => vector'Address
	);
    end DrawElements;

    procedure DrawElements (mode : Vertex_Interpretation; vector : Unsigned_Short_Vector_Type) is
    begin
	glDrawElements(
		mode    => Convert(mode),
		count   => Types.Size(vector'Length),
		c_type  => Types.Constants.GL_UNSIGNED_SHORT,
		indices => vector'Address
	);
    end DrawElements;

    procedure DrawElements (mode : Vertex_Interpretation; vector : Unsigned_Integer_Vector_Type) is
    begin
	glDrawElements(
		mode    => Convert(mode),
		count   => Types.Size(vector'Length),
		c_type  => Types.Constants.GL_UNSIGNED_INT,
		indices => vector'Address
	);
    end DrawElements;

    procedure InterleavedArrays (	format : Array_Format_Type;
					stride : Types.Size;
					pointer : System.Address) is
    begin
	glInterleavedArrays(
		format  => Convert(format),
		stride  => stride,
		pointer => pointer
	);
    end InterleavedArrays;

    ----------------------
    --  INLINE PRAGMAS  --
    ----------------------

    Pragma Inline( ClearColor		);
    Pragma Inline( Clear		);
    Pragma Inline( IndexMask		);
    Pragma Inline( ColorMask		);
    Pragma Inline( AlphaFunc		);
    Pragma Inline( BlendFunc		);
    Pragma Inline( LogicOp		);
    Pragma Inline( CullFace		);
    Pragma Inline( FrontFace		);
    Pragma Inline( PointSize		);
    Pragma Inline( LineWidth		);
    Pragma Inline( LineStipple		);
    Pragma Inline( PolygonMode		);
    Pragma Inline( PolygonOffset	);
    Pragma Inline( PolygonStipple	);
    Pragma Inline( GetPolygonStipple	);
    Pragma Inline( EdgeFlag		);
    Pragma Inline( Scissor		);
    Pragma Inline( ClipPlane		);
    Pragma Inline( DrawBuffer		);
    Pragma Inline( ReadBuffer		);
    Pragma Inline( Enable		);
    Pragma Inline( Disable		);
    Pragma Inline( IsEnabled		);
    Pragma Inline( EnableClientState	);
    Pragma Inline( DisableClientState	);
    Pragma Inline( Get			);
    Pragma Inline( PushAttrib		);
    Pragma Inline( PopAttrib		);
    Pragma Inline( PushClientAttrib	);
    Pragma Inline( PopClientAttrib	);
    Pragma Inline( RenderMode		);
    Pragma Inline( GetError		);
    Pragma Inline( GetString		);
    Pragma Inline( Finish		);
    Pragma Inline( Flush		);
    Pragma Inline( Hint			);
    Pragma Inline( ClearDepth		);
    Pragma Inline( DepthFunc		);
    Pragma Inline( DepthMask		);
    Pragma Inline( DepthRange		);
    Pragma Inline( ClearAccum		);
    Pragma Inline( Accum		);
    Pragma Inline( MatrixMode		);
    Pragma Inline( Ortho		);
    Pragma Inline( Frustum		);
    Pragma Inline( Viewport		);
    Pragma Inline( PushMatrix		);
    Pragma Inline( PopMatrix		);
    Pragma Inline( LoadIdentity		);
    Pragma Inline( LoadMatrix		);
    Pragma Inline( MultMatrix		);
    Pragma Inline( Rotate		);
    Pragma Inline( Scale		);
    Pragma Inline( Translate		);
    Pragma Inline( IsList		);
    Pragma Inline( DeleteLists		);
    Pragma Inline( GenLists		);
    Pragma Inline( NewList		);
    Pragma Inline( EndList		);
    Pragma Inline( CallList		);
    Pragma Inline( CallLists		);
    Pragma Inline( ListBase		);
    Pragma Inline( Start		);
    Pragma Inline( Stop 		);
    Pragma Inline( Vertex		);
    Pragma Inline( Normal		);
    Pragma Inline( Index		);
    Pragma Inline( Color		);
    Pragma Inline( TexCoord		);
    Pragma Inline( RasterPos		);
    Pragma Inline( Rect			);
    Pragma Inline( ShadeModel		);
    Pragma Inline( Light		);
    Pragma Inline( GetLight		);
    Pragma Inline( LightModel		);
    Pragma Inline( Material		);
    Pragma Inline( GetMaterial		);
    Pragma Inline( ColorMaterial	);
    Pragma Inline( PixelZoom		);
    Pragma Inline( PixelStore		);
    Pragma Inline( PixelTransfer	);
    Pragma Inline( PixelMap		);
    Pragma Inline( GetPixelMap		);
    Pragma Inline( Bitmap		);
    Pragma Inline( ReadPixels		);
    Pragma Inline( DrawPixels		);
    Pragma Inline( CopyPixels		);
    Pragma Inline( StencilFunc		);
    Pragma Inline( StencilMask		);
    Pragma Inline( StencilOp		);
    Pragma Inline( ClearStencil		);
    Pragma Inline( TexGen		);
    Pragma Inline( GetTexGen		);
    Pragma Inline( TexEnv		);
    Pragma Inline( GetTexEnv 		);
    Pragma Inline( TexParameter		);
    Pragma Inline( GetTexParameter	);
    Pragma Inline( GetTexLevelParameter	);
    Pragma Inline( TexImage1D		);
    Pragma Inline( TexImage2D		);
    Pragma Inline( GetTexImage		);
    Pragma Inline( Map1			);
    Pragma Inline( Map2			);
    Pragma Inline( GetMap		);
    Pragma Inline( EvalCoord		);
    Pragma Inline( MapGrid		);
    Pragma Inline( EvalPoint		);
    Pragma Inline( EvalMesh		);
    Pragma Inline( EvalMesh		);
    Pragma Inline( Fog			);
    Pragma Inline( FeedbackBuffer	);
    Pragma Inline( PassThrough		);
    Pragma Inline( SelectBuffer		);
    Pragma Inline( InitNames		);
    Pragma Inline( LoadName		);
    Pragma Inline( PushName		);
    Pragma Inline( PopName		);
    Pragma Inline( GenTextures		);
    Pragma Inline( DeleteTextures	);
    Pragma Inline( BindTexture		);
    Pragma Inline( PrioritizeTextures	);
    Pragma Inline( AreTexturesResident	);
    Pragma Inline( IsTexture		);
    Pragma Inline( TexSubImage		);
    Pragma Inline( CopyTexImage		);
    Pragma Inline( CopyTexSubImage	);
    Pragma Inline( VertexPointer	);
    Pragma Inline( ArrayElement		);
    Pragma Inline( DrawArrays		);
    Pragma Inline( DrawElements 	);
    Pragma Inline( InterleavedArrays	);


End TAO_GL.Functions;
