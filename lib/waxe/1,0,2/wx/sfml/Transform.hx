package wx.sfml;
import wx.Loader;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Transform
{
		public var Handle:Dynamic;

	public function new() 
	{
		Handle = null;
		
	}
	public function setPosition(x:Float ,y :Float):Void 
	{
		//if (Handle == null) return;
    	wx_setPosition_transfrom(Handle, x, y);
	}
	public function setOrigin(x:Float ,y :Float):Void 
	{
		//if (Handle == null) return;
    	wx_setOrigin_transfrom(Handle, x, y);
	}
	public function move(x:Float ,y :Float):Void 
	{
		//if (Handle == null) return;
    	wx_move_transfrom(Handle, x, y);
	}
	public function setRotation(angle:Float ):Void 
	{
	//	if (Handle == null) return;
    	wx_setRotation_transfrom(Handle, angle);
	}
	public function rotate(angle:Float ):Void 
	{
		//if (Handle == null) return;
    	wx_rotate_transfrom(Handle, angle);
	}
	public function setScale(factorX:Float ,factorY :Float):Void 
	{
		//if (Handle == null) return;
    	wx_setScale_transfrom(Handle, factorX, factorY);
	}
	public function Scale(factorX:Float ,factorY :Float):Void 
	{
		//if (Handle == null) return;
    	wx_scale_transfrom(Handle, factorX, factorY);
	}
	
	private static var wx_setPosition_transfrom = Loader.load( "wx_setPosition_transfrom", 3);
	private static var wx_setRotation_transfrom = Loader.load( "wx_setRotation_transfrom", 2);
	private static var wx_setScale_transfrom = Loader.load( "wx_setScale_transfrom", 3);
	private static var wx_setOrigin_transfrom = Loader.load( "wx_setOrigin_transfrom", 3);
	private static var wx_move_transfrom = Loader.load( "wx_move_transfrom", 3);
	private static var wx_rotate_transfrom = Loader.load( "wx_rotate_transfrom", 2);
	private static var wx_scale_transfrom = Loader.load( "wx_scale_transfrom", 3);
	
	
}