package wx;
import haxe.io.Bytes;
import haxe.Resource;
import haxe.io.Bytes;

class Bitmap
{
   public var wxHandle:Dynamic;

   function new(inHandle:Dynamic) { wxHandle = inHandle; }

   public static function fromBytes(inBytes:Bytes)
   {
      if (inBytes==null)         throw("Bad bitmap data");
      return new Bitmap( wx_bitmap_from_bytes(inBytes.getData()) );
   }

   public static function fromResource(inResorceName:String)
   {
	   
       return fromBytes( haxe.Resource.getBytes(inResorceName));
   }

   static var wx_bitmap_from_bytes = Loader.load("wx_bitmap_from_bytes",1);
}
