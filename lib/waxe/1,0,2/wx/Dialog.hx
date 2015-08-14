package wx;

class Dialog extends TopLevelWindow
{
   public static inline var DEFAULT_STYLE = (Window.CAPTION | Window.SYSTEM_MENU | Window.CLOSE_BOX);

   public static function create(inParent:Window, ?inID:Int, inTitle:String="",
						?inPosition:{x:Float,y:Float},
                   ?inSize:{width:Int,height:Int}, ?inStyle:Int )
   {
      var a:Array<Dynamic> = [inParent==null ? null : inParent.wxHandle,inID,inTitle,inPosition,inSize, inStyle]
      var handle = wx_dialog_create(a);
      return new Frame(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

   static var wx_dialog_create = Loader.load("wx_dialog_create",1);

}
