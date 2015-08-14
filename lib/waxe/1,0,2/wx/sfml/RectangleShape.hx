package wx.sfml;

import wx.Loader;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class RectangleShape extends Shape
{
	public var width:Float;
	public var height:Float;
	public function new(w:Float,h:Float) 
	{
		super();
		width  = w;
		height = h;
		Handle = wx_create_rectangleshape(w, h);
	}
		private static var wx_create_rectangleshape = Loader.load( "wx_create_rectangleshape", 2);
}