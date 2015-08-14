package wx.sfml;

import wx.Loader;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class FloatRect
{
	public var handle:Dynamic;
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	
	public function new() 
	{
	    this.x = 0;
		this.y = 0;
		this.width = 0;
		this.height = 0;
		handle = null;
	}
	public  function set(_x:Float, _y:Float, w:Float, h:Float):Void
	{
		
		this.x = _x;
		this.y = _y;
		this.width = w;
		this.height = h;
		this.handle = wx_new_FloatRect(this);
	}
	public static function create(_x:Float, _y:Float, w:Float, h:Float):FloatRect
	{
		var rect:FloatRect = new FloatRect();
		rect.x = _x;
		rect.y = _y;
		rect.width = w;
		rect.height = h;
		rect.handle = wx_new_FloatRect(rect);
		return rect;
	}
	public  function Copy(h:Dynamic):Void
	{
		this.handle = h;
		this.x = wx_x_FloatRect(h);	
		this.y = wx_y_FloatRect(h);	
	    this.width = wx_width_FloatRect(h);	
	    this.height = wx_height_FloatRect(h);	
	  
	}
	public function setData() :Void
	{
	    wx_setdata_FloatRect(handle, this);
	}

	public function getX():Float
	{
	
	     x = wx_x_FloatRect(handle);	
	     return x;
		
	}
    public function getY():Float
	{
	  y = wx_y_FloatRect(handle);	
	  return y;
	}
     public function getWidth():Float
	{
	  width = wx_width_FloatRect(handle);	
	  return width;
	}
	  public function getHeight():Float
	{
	  height = wx_height_FloatRect(handle);	
	  return height;
	}
		private static var wx_new_FloatRect = Loader.load( "wx_new_FloatRect", 1);
		private static var wx_setdata_FloatRect = Loader.load( "wx_setdata_FloatRect", 2);
		private static var wx_x_FloatRect = Loader.load( "wx_x_FloatRect", 1);
	    private static var wx_y_FloatRect = Loader.load( "wx_y_FloatRect", 1);
	    private static var wx_width_FloatRect = Loader.load( "wx_width_FloatRect", 1);
	    private static var wx_height_FloatRect = Loader.load( "wx_height_FloatRect", 1);
		
}