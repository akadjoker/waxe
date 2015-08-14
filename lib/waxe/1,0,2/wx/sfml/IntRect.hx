package wx.sfml;

import wx.Loader;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class IntRect
{
    public var handle:Dynamic;
	public var x:Int;
	public var y:Int;
	public var width:Int;
	public var height:Int;
	
	public function new(_x:Int,_y:Int,w:Int,h:Int) 
	{
		this.x = _x;
		this.y = _y;
		this.width = w;
		this.height = h;
		handle = wx_new_IntRect(this);
	}
	
	
		private static var wx_new_IntRect = Loader.load( "wx_new_IntRect", 1);
	   
	
}