package wx.sfml;

import wx.Loader;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Render
{
	public static var BlendAlpha         = 0;
	public static var BlendAdd         = 1;
	public static var BlendMultiply         = 2;
	public static var BlendNone         = 3;
	
	public var Handle:Dynamic;
	public function new(width:Int,height:Int) 
	{
		Handle = wx_create_rendertarget(width, height);
	}
	public function clear(color:Int):Void 
	{
		if (Handle == null) return;
		wx_clear_rendertarget(Handle, color);
	}
	public function draw(shape:Drawable):Void
	{if (Handle == null) return;
		wx_draw_rendertarget(Handle, shape.Handle);
	}
	public function drawBlend(shape:Drawable,blend:Int):Void
	{if (Handle == null) return;
		wx_drawBlend_rendertarget(Handle, shape.Handle,blend);
	}
	public function pushStates():Void
	{if (Handle == null) return;
		wx_pushStates_rendertarget(Handle);
	}
    public function popStates():Void
	{if (Handle == null) return;
		wx_popStates_rendertarget(Handle);
	}
	public function resetStates():Void
	{if (Handle == null) return;
		wx_resetStates_rendertarget(Handle);
	}
	public function applyCurrentView():Void
	{if (Handle == null) return;
		wx_applyCurrentView_rendertarget(Handle);
	}
	public function applyTexture(tex:Texture):Void
	{if (Handle == null) return;
		wx_applyTexture_rendertarget(Handle,tex.Handle);
	}

	public function setBlendMode(b:Int):Void
	{
		wx_SetBlendMode_rendertarget(Handle,b);
	}

	private static var wx_create_rendertarget = Loader.load( "wx_create_rendertarget", 2);
	private static var wx_clear_rendertarget = Loader.load( "wx_clear_rendertarget", 2);
	
	private static var wx_draw_rendertarget = Loader.load( "wx_draw_rendertarget", 2);
	private static var wx_drawBlend_rendertarget = Loader.load( "wx_drawBlend_rendertarget", 3);
	
	private static var wx_pushStates_rendertarget = Loader.load( "wx_pushStates_rendertarget", 1);
	private static var wx_popStates_rendertarget = Loader.load( "wx_popStates_rendertarget", 1);
	private static var wx_resetStates_rendertarget = Loader.load( "wx_resetStates_rendertarget", 1);
	private static var wx_applyCurrentView_rendertarget = Loader.load( "wx_resetStates_rendertarget", 1);
	private static var wx_applyTexture_rendertarget = Loader.load( "wx_applyTexture_rendertarget", 2);
	private static var wx_SetBlendMode_rendertarget = Loader.load( "wx_SetBlendMode_rendertarget", 2);
	
	

	

	
	
}