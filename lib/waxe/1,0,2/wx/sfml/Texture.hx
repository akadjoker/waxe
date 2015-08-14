package wx.sfml;

import wx.Loader;
import wx.Rect;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Texture
{

	public var Handle:Dynamic;
	public var width:Int;
	public var height:Int;

	public function new() 
	{
		Handle = null;
		width = 0;
		height = 0;
	}
	
	
	
	public static function Create(w:Int, h:Int):Texture
	{
		var i:Texture = new Texture();
		i.Handle = wx_create_texture(w, h);
		i.getWidth();
		i.getHeight();
		return i;
	}
	
	
	public static function Load(filename:String):Texture
	{
		var i:Texture = new Texture();
		i.Handle = wx_load_texture(filename);
		i.getWidth();
		i.getHeight();
		return i;
	}
	public static function LoadEx(filename:String,rect:Rect):Texture
	{
		var i:Texture = new Texture();
		i.Handle = wx_loadclip_texture(filename, rect.x, rect.y, rect.width, rect.height);
		i.getWidth();
		i.getHeight();
		return i;
	}
	public static function LoadFromImage(image:Image):Texture
	{
		var i:Texture = new Texture();
		i.Handle = wx_loadFromImage_texture(image.Handle);
		i.getWidth();
		i.getHeight();
		return i;
	}
	
	public static function LoadFromImageEx(image:Image,rect:Rect):Texture
	{
		var i:Texture = new Texture();
		i.Handle = wx_loadFromImageclip_texture(image.Handle, rect.x, rect.y, rect.width, rect.height);
		i.getWidth();
		i.getHeight();
		return i;
	}
	
	public function getWidth():Int
	{
		width = wx_width_texture(Handle);
		return width;
	}
	public function getHeight():Int
	{
		height = wx_height_texture(Handle);
		return height;
	}
	public function setRepeat(b:Bool):Void
	{
		wx_setRepeated_texture(Handle, b);
	}
	public function setSmooth(b:Bool):Void
	{
		wx_setSmooth_texture(Handle, b);
	}	
	
		private static var wx_create_texture = Loader.load( "wx_create_texture", 2);
		private static var wx_setRepeated_texture = Loader.load( "wx_setRepeated_texture", 2);
		private static var wx_setSmooth_texture = Loader.load( "wx_setSmooth_texture", 2);
		private static var wx_load_texture = Loader.load( "wx_load_texture", 1);
		private static var wx_loadclip_texture = Loader.load( "wx_loadclip_texture", 5);
		private static var wx_loadFromImage_texture = Loader.load( "wx_loadFromImage_texture", 1);
		private static var wx_loadFromImageclip_texture = Loader.load( "wx_loadFromImageclip_texture", 5);
		private static var wx_width_texture = Loader.load( "wx_width_texture", 1);
		private static var wx_height_texture = Loader.load( "wx_height_texture", 1);
		
	
		
		
		
		

}