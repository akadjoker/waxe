package wx.sfml;

import wx.Loader;
import wx.Rect;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Text extends Drawable
{
	
	public static var REGULAR         = 0;
	public static var BOLD            = 1 << 0;
	public static var ITALIC          = 1 << 1;
	public static var INDERLINE       = 1 << 2;
	public static var STRIKETHROUGH   = 1 << 3;

	public function new( font:Font,caption:String,?characterSize:Int=30) 
	{
		super();
		Handle = wx_create_Text(font.handle, caption, characterSize);
	}
	public function setFont(font:Font):Void
	{
		wx_setfont_Text(Handle, font.handle);
	}
	public function setString(text:String):Void
	{
		wx_setstring_Text(Handle, text);
	}
	public function setColor(c:Int):Void
	{
	wx_setColor_Text(Handle, c);	
	}
	public function setStyle(c:Int):Void
	{
	wx_setStyle_Text(Handle, c);	
	}
	public function setCharacterSize(c:Int):Void
	{
		wx_setColor_Text(Handle, c);
	}

	private static var wx_create_Text = Loader.load( "wx_create_Text", 3);
	private static var wx_setfont_Text = Loader.load( "wx_setfont_Text", 2);
	private static var wx_setstring_Text = Loader.load( "wx_setstring_Text", 2);
	private static var wx_setCharacterSize_Text = Loader.load( "wx_setCharacterSize_Text", 2);
	private static var wx_setStyle_Text = Loader.load( "wx_setStyle_Text", 2);
	private static var wx_setColor_Text = Loader.load( "wx_setColor_Text", 2);
}