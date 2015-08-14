package wx;

class MDIParentFrame extends Frame
{

   public static function create(inParent:Window, ?inID:Int, inTitle:String="",
						?inPosition:{x:Float,y:Float},
                   ?inSize:{width:Int,height:Int}, ?inStyle:Int )
   {
   var a:Array<Dynamic> = [inParent==null ? null : inParent.wxHandle,inID,inTitle,inPosition,inSize, inStyle] );
   
      var handle = wx_mdi_parent_frame_create(a);
		
      return new MDIParentFrame(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

   static var wx_mdi_parent_frame_create = Loader.load("wx_mdi_parent_frame_create",1);

}
