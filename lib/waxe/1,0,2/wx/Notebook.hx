package wx;

import wx.Window;

class Notebook extends Window
{
   public static function create(inParent:Window, ?inID:Null<Int>,
                   ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
      if (inParent==null)
         throw Error.INVALID_PARENT;
		 
		 	 var a:Array<Dynamic> = [inParent.wxHandle,inID,"",inPosition,inSize, inStyle];
			 
      var handle = wx_notebook_create(a);
         
      return new Notebook(handle);
   }

   public function addPage(inWindow:Window,inText:String, inSelect:Bool = false, inImageId:Int = -1) : Bool
   {
      return wx_notebook_add_page(wxHandle,inWindow.wxHandle, inText, inSelect, inImageId);
   }

   static var wx_notebook_add_page = Loader.load("wx_notebook_add_page",5);
   static var wx_notebook_create = Loader.load("wx_notebook_create",1);
}

