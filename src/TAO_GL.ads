--  TAO_GL: The Ada Open-GL
--  By E.Fish
--
--  This library is free for non-comertial and comertial usage, though this
--  license may change in future releases.
--
--  Referenced Resources:
--	http://www.opengl.org/sdk/docs/man/xhtml/
--	http://docs.factorcode.org/content/vocab-opengl.gl.html
--	http://doc.coin3d.org/Coin/gl_8h_source.html
--	http://www.opensource.apple.com/source/X11server/X11server-85/mesa/Mesa-7.2/include/GL/gl.h
--
--
--  Varsion 0.1:	Initial conversion of C-headers to Ada.
--  Varsion 0.2:	Conversion of basic types: Enum, Folat, Size, Byte, etc.
--  Varsion 0.3:	Added Types to eleminate incorrect enumeration params.
--  Version 0.4:	Ensure proper linking, via the External_Name aspect.
--  Version 0.5:	Addition of this comment, as well as several TODOs.

With Interfaces;

Package TAO_GL is
Pragma Pure;

    -- Unimplemented is raised when some feature is not implemented, these are
    -- the few places where the conversion/translation truly baffled me; I will
    -- endevor to remove the 2 instances (both in the Functions child package)
    -- in future releases.
    Unimplemented	: Exception;
End TAO_GL;
