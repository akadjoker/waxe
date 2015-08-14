package wx;

import wx.Window;

class ListCtrl extends Window
{
	public static inline var LIST_FORMAT_LEFT  = 0;
	public static inline var LIST_FORMAT_RIGHT =  1;
	public static inline var LIST_FORMAT_CENTRE = 2;
	


   public static function create(inParent:Window, ?inID:Null<Int>, inText:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int ):ListCtrl
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
			
				 var a:Array<Dynamic> = [inParent.wxHandle,inID,inText,inPosition,inSize, inStyle];
				 
      var handle = wx_listctrl_create(a);
		
      return new ListCtrl(handle);
   }

   public function addItm(item:String):Int
   {
	   InsetItem(getItemCount(), item);
	   return getItemCount() - 1;
   }
   public function InsetItem(index:Int, item:String):Void
   {
	   wx_listctrk_InsertItem(wxHandle, index, item);
   }
   public function SetItemState(index:Int, state:Int,flags:Int):Void
   {
	   wx_listctrk_SetItemState(wxHandle, index,state, flags);
   }
   
   public function getItemCount():Int
   {
	   return wx_listctrk_GetItemCount(wxHandle);
   
	   }
	   
  public function getNextItem(item:Int,flags:Int):Int
   {
	   return wx_listctrk_GetNextItem(wxHandle,item,flags);
   }
   
   public function InsertColumn(index:Int, item:String, format:Int,width:Int):Void
   {
	   wx_listctrk_InsertColumn(wxHandle, index, item, format,width);
   }
   
   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }




   static var wx_listctrl_create = Loader.load("wx_listctrl_create", 1);
   static var wx_listctrk_InsertItem = Loader.load("wx_listctrk_InsertItem", 3);
   static var wx_listctrk_GetItemCount = Loader.load("wx_listctrk_GetItemCount", 1);
   static var wx_listctrk_SetItemState = Loader.load("wx_listctrk_SetItemState", 4);
   static var wx_listctrk_GetNextItem = Loader.load("wx_listctrk_GetNextItem", 3);
   static var wx_listctrk_InsertColumn = Loader.load("wx_listctrk_InsertColumn", 5);
   

}
