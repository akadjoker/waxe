package wx.sfml;
import wx.Loader;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Font
{

	public var handle:Dynamic;
	public function new(filename:String) 
	{
		handle = wx_create_Font(filename);
	}
	public function getTexture(characterSize:Int):Texture
	{
		var tex:Texture = new Texture();
		tex.Handle = wx_gettexture_Font(handle, characterSize);
		tex.getWidth();
		tex.getHeight();
		return tex;
	}
	
	private static var wx_create_Font = Loader.load( "wx_create_Font", 1);
	private static var wx_gettexture_Font = Loader.load( "wx_gettexture_Font", 2);
	
}