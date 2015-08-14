package wx.sfml;

import wx.Loader;
import wx.Rect;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Image
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
	public function saveToFile(filename:String):Void
	{
		if (Handle == null) return;
		 wx_savefromfile_image(Handle, filename);
	}
	public static function Create(w:Int, h:Int, color:Int):Image
	{
		var i:Image = new Image();
		i.Handle = wx_create_image(w, h, color);
		i.getWidth();
		i.getHeight();
		return i;
	}
	
	public static function CreateFromTexture(tex:Texture):Image
	{
	     var img:Image = new Image();
		 if (tex.Handle != null)
		 {
	 	 img.Handle = wx_getImage_texture(tex.Handle);
		 } else{
		 img.Handle = wx_create_image(65, 65, 0);
		 }
		 img.getWidth();
		 img.getHeight();

		 return img;
	}
	
	public static function Load(filename:String):Image
	{
		var i:Image = new Image();
		i.Handle = wx_loadfromfile_image(filename);
		i.getWidth();
		i.getHeight();
		return i;
	}
	public function getWidth():Int
	{
		width = wx_width_image(Handle);
		return width;
	}
	public function getHeight():Int
	{
		height = wx_height_image(Handle);
		return height;
	}
	public  function createMaskFromColor(color:Int,?a:Int=0):Void
	{
		wx_createmask_image(Handle, color, a);
	}
	public  function getPixl(x:Int,y:Int):Int
	{
		return wx_getpixel_image(Handle, x,y);
	}
	public  function setPixl(x:Int,y:Int,color:Int):Void
	{
		 wx_setpixel_image(Handle, x,y,color);
	}
	public function flipHorizontally():Void
	{
		wx_flipHorizontally_image(Handle);
		
	}
	public function flipVertically():Void
	{
		wx_flipVertically_image(Handle);
	}
	
	
	public function copy(source:Image,dstX:Int,dstY:Int,sourceRect:Rect,?applyAlpha:Bool=false):Void
	{
		wx_copy_image(Handle,source.Handle,dstX,dstY,sourceRect.x,sourceRect.y,sourceRect.width,sourceRect.height,applyAlpha);
	}


		private static var wx_create_image = Loader.load( "wx_create_image", 3);
		private static var wx_loadfromfile_image = Loader.load( "wx_loadfromfile_image", 1);
		private static var wx_savefromfile_image = Loader.load( "wx_savefromfile_image", 2);
		private static var wx_width_image = Loader.load( "wx_width_image", 1);
		private static var wx_height_image = Loader.load( "wx_height_image", 1);
		private static var wx_getImage_texture = Loader.load( "wx_getImage_texture", 1);
		private static var wx_createmask_image = Loader.load( "wx_createmask_image", 3);
		private static var wx_flipHorizontally_image = Loader.load( "wx_flipHorizontally_image", 1);
		private static var wx_flipVertically_image = Loader.load( "wx_flipVertically_image", 1);
		private static var wx_getpixel_image = Loader.load( "wx_getpixel_image", 3);
		private static var wx_setpixel_image = Loader.load( "wx_setpixel_image", 4);
		private static var wx_copy_image = Loader.load( "wx_copy_image", -1);
		
		
		
		
		
		
}