package wx;

import wx.Window;

class StaticBox extends Window
{
   public static function create(inParent:Window, ?inID:Null<Int>, inText:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
			
			var params:Array<Dynamic> = [inParent.wxHandle, inID,inText, inPosition, inSize, inStyle];
           
			 
	  
      var handle = wx_static_box_create(params);
	   
      

      return new StaticBox(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

   static var wx_static_box_create = Loader.load("wx_static_box_create",1);
}
