package wx.sfml;

import wx.Loader;


/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class CircleShape extends Shape
{
	
	public function new(r:Int,?points:Int=30) 
	{
		super();
    	Handle =	wx_create_circleshape(r, points);
	}
	
	private static var wx_create_circleshape = Loader.load( "wx_create_circleshape", 2);
}