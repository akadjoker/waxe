package wx;

import wx.Window;

//toddo : events 
class PropertyGrid extends Window
{
	
public static inline var PG_BASE_EVT_PRE_ID = 1775;
public static inline var EVT_PG_SELECTED = 1775;
public static inline var EVT_PG_CHANGING = 1776;
        public static inline var EVT_PG_CHANGED= 1777;
        public static inline var EVT_PG_HIGHLIGHTED= 1778;
        public static inline var EVT_PG_RIGHT_CLICK= 1779;
        public static inline var EVT_PG_PAGE_CHANGED= 1780;
        public static inline var EVT_PG_ITEM_COLLAPSED= 1781;
        public static inline var EVT_PG_ITEM_EXPANDED= 1782;
        public static inline var EVT_PG_DOUBLE_CLICK = 1783;
        public static inline var EVT_PG_LABEL_EDIT_BEGIN = 1784;
        public static inline var EVT_PG_LABEL_EDIT_ENDIN= 1785;
        public static inline var EVT_PG_COL_BEGIN_DRAG= 1786;
        public static inline var EVT_PG_COL_DRAGGING= 1787;
        public static inline var EVT_PG_COL_END_DRAG= 1788;
	
	
	
	
public static inline var	PG_DEFAULT_STYLE = 0;



/** This will cause Sort() automatically after an item is added.
    When inserting a lot of items in this mode, it may make sense to
    use Freeze() before operations and Thaw() afterwards to increase
    performance.
*/
public static inline var PG_AUTO_SORT                      = 0x00000010;

/** Categories are not initially shown (even if added).
    IMPORTANT NOTE: If you do not plan to use categories, then this
    style will waste resources.
    This flag can also be changed using wxPropertyGrid::EnableCategories method.
*/
public static inline var PG_HIDE_CATEGORIES                = 0x00000020;

/* This style combines non-categoric mode and automatic sorting.
*/
public static inline var  PG_ALPHABETIC_MODE                = (PG_HIDE_CATEGORIES | PG_AUTO_SORT);

/** Modified values are shown in bold font. Changing this requires Refresh()
    to show changes.
*/
public static inline var PG_BOLD_MODIFIED                  = 0x00000040;

/** Using this style, the column splitters move automatically based on column
    proportions (default is equal proportion for every column). This behaviour
    stops once the user manually moves a splitter, and returns when a
    splitter is double-clicked.

    @see wxPropertyGridInterface::SetColumnProportion().
*/
public static inline var PG_SPLITTER_AUTO_CENTER           = 0x00000080;

/** Display tooltips for cell text that cannot be shown completely. If
    wxUSE_TOOLTIPS is 0, then this doesn't have any effect.
*/
public static inline var PG_TOOLTIPS                       = 0x00000100;

/** Disables margin and hides all expand/collapse buttons that would appear
    outside the margin (for sub-properties). Toggling this style automatically
    expands all collapsed items.
*/
public static inline var  PG_HIDE_MARGIN                    = 0x00000200;

/** This style prevents user from moving the splitter.
*/
public static inline var PG_STATIC_SPLITTER                = 0x00000400;

/** Combination of other styles that make it impossible for user to modify
    the layout.
*/
public static inline var PG_STATIC_LAYOUT                  = (PG_HIDE_MARGIN | PG_STATIC_SPLITTER);

/** Disables wxTextCtrl based editors for properties which
    can be edited in another way.

    Equals calling wxPropertyGrid::LimitPropertyEditing for all added
    properties.
*/
public static inline var PG_LIMITED_EDITING                = 0x00000800;

/** wxPropertyGridManager only: Show toolbar for mode and page selection. */
public static inline var PG_TOOLBAR                        = 0x00001000;

/** wxPropertyGridManager only: Show adjustable text box showing description
    or help text, if available, for currently selected property.
*/
public static inline var PG_DESCRIPTION                    = 0x00002000;

/** wxPropertyGridManager only: don't show an internal border around the
    property grid. Recommended if you use a header.
*/
public static inline var PG_NO_INTERNAL_BORDER             = 0x00004000;

   public static function create(inParent:Window, ?inID:Null<Int>, inText:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int ):PropertyGrid
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
			
				 var a:Array<Dynamic> = [inParent.wxHandle,inID,inText,inPosition,inSize, inStyle];
				 
      var handle = wx_propertygrid_create(a);
		
      return new PropertyGrid(handle);
   }

  
   
   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }


   public function addBool(name:String, value:Bool):Void
   {
	   wx_propertygrid_Appendbool(wxHandle, name, value);
   }
    public function addFloat(name:String, value:Float):Void
   {
	   wx_propertygrid_Appendfloat(wxHandle, name, value);
   }
   public function addInt(name:String, value:Int):Void
   {
	   wx_propertygrid_Appendint(wxHandle, name, value);
   }
   public function addColor(name:String, value:Int):Void
   {
	   wx_propertygrid_Appendcolor(wxHandle, name, value);
   }
   public function addDir(name:String, value:String):Void
   {
	   wx_propertygrid_Appenddir(wxHandle, name, value);
   }
   public function addPath(name:String, value:String):Void
   {
	   wx_propertygrid_Appendfile(wxHandle, name, value);
   }

   static var wx_propertygrid_create = Loader.load("wx_propertygrid_create", 1);
   
   static var wx_propertygrid_Appendbool = Loader.load("wx_propertygrid_Appendbool", 3);
   static var wx_propertygrid_Appendfloat = Loader.load("wx_propertygrid_Appendfloat", 3);
   static var wx_propertygrid_Appendint = Loader.load("wx_propertygrid_Appendint", 3);
   static var wx_propertygrid_Appenddir = Loader.load("wx_propertygrid_Appenddir", 3);
   static var wx_propertygrid_Appendfile = Loader.load("wx_propertygrid_Appendfile", 3);
   static var wx_propertygrid_Appendcolor = Loader.load("wx_propertygrid_Appendcolor", 3);

}
