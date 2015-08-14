package wx.sfml;

import wx.Loader;
import wx.Rect;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Shape extends Drawable
{

	public function new() 
	{
		super();
	}
	
	public function setFillColor(color:Int ):Void
	{
		if (Handle == null) return;
		wx_setFillColor_shape(Handle,color);
	}
	public function setOutlineColor(color:Int ):Void
	{
		if (Handle == null) return;
		wx_setOutlineColor_shape(Handle, color);
	}
	public function setTexture(texture:Texture, ?resetRect:Bool= false ):Void
	{
		if (Handle == null) return;
		wx_setTexture_shape(Handle, texture.Handle,resetRect);
	}
	public function setTextureRect(rect:Rect):Void
	{
		if (Handle == null) return;
		wx_setTextureRect_shape(Handle, rect.x,rect.y,rect.width,rect.height);
	}
	public function setOutlineThickness(v:Float):Void
	{
		if (Handle == null) return;
		wx_setOutlineThickness_shape(Handle,v);
	}
	private static var wx_setFillColor_shape = Loader.load( "wx_setFillColor_shape", 2);
	private static var wx_setOutlineColor_shape = Loader.load( "wx_setOutlineColor_shape", 2);
	private static var wx_setOutlineThickness_shape = Loader.load( "wx_setOutlineThickness_shape", 2);
	private static var wx_setTexture_shape = Loader.load( "wx_setTexture_shape", 3);
	private static var wx_setTextureRect_shape = Loader.load( "wx_setTextureRect_shape", 5);
	
	
	
	
}