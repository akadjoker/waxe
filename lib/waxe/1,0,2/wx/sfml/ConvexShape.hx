package wx.sfml;

import wx.Loader;
import wx.Rect;
/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class ConvexShape extends Shape
{

	public function new(numPoints:Int) 
	{
		super();
		Handle = wx_create_ConvexShape(numPoints);
	}
	public function addPoint(index:Int, x:Float, y:Float):Void
	{
	wx_setPoint_ConvexShape(Handle, index, x, y);
	}
	public function setPointCount(c:Int):Void
	{
	wx_setPointCount_ConvexShape(Handle, c);
	}
	public function getPointX(c:Int):Float
	{
	 return wx_getPointX_ConvexShape(Handle, c);
	}
	public function getPointY(c:Int):Float
	{
	 return wx_getPointY_ConvexShape(Handle, c);
	}
	private static var wx_create_ConvexShape = Loader.load( "wx_create_ConvexShape", 1);
	private static var wx_setPoint_ConvexShape = Loader.load( "wx_setPoint_ConvexShape", 4);
	private static var wx_setPointCount_ConvexShape = Loader.load( "wx_setPointCount_ConvexShape", 2);
	private static var wx_getPointX_ConvexShape = Loader.load( "wx_getPointX_ConvexShape", 2);
	private static var wx_getPointY_ConvexShape = Loader.load( "wx_getPointY_ConvexShape", 2);
	
}