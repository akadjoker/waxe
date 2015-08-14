package wx.sfml;
import wx.Loader;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Sprite extends Drawable
{

	public function new() 
	{
		super();
		Handle = wx_create_sprite();
	}
	
	public static function CreateFromTexture(texture:Texture,?resetRect:Bool= false) :Sprite
	{
		var spr:Sprite = new Sprite();
		spr.setTexture(texture, resetRect);
		return spr;
	}
	public function setColor(color:Int ):Void
	{
		if (Handle == null) return;
		wx_setColor_sprite(Handle, color);
	}
	
	public function setTexture(texture:Texture, ?resetRect:Bool= false ):Void
	{
		if (Handle == null) return;
		wx_setTexture_sprite(Handle, texture.Handle,resetRect);
	}
	public function setTextureRect(rect:Rect):Void
	{
		if (Handle == null) return;
		wx_setTextureRect_sprite(Handle, rect.x,rect.y,rect.width,rect.height);
	}

	public function getLocalBounds():FloatRect
	{
		var r:FloatRect =  new FloatRect();
		r.Copy( wx_getLocalBounds_sprite(Handle));
		return r;
	
		
	}
	public function getGlobalBounds():FloatRect
	{
		var r:FloatRect =  new FloatRect();
		r.Copy( wx_getGlobalBounds_sprite(Handle));
		return r;
	}
	
	private static var wx_create_sprite = Loader.load( "wx_create_sprite", 0);
	private static var wx_createEx_sprite = Loader.load( "wx_createEx_sprite", 1);
	private static var wx_setColor_sprite = Loader.load( "wx_setFillColor_shape", 2);
	private static var wx_setTexture_sprite = Loader.load( "wx_setTexture_sprite", 3);
	
	private static var wx_setTextureRect_sprite = Loader.load( "wx_setTextureRect_shape", 5);
	private static var wx_getLocalBounds_sprite = Loader.load( "wx_getLocalBounds_sprite", 1);
	private static var wx_getGlobalBounds_sprite = Loader.load( "wx_getGlobalBounds_sprite", 1);

	

	
}