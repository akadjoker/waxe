package wx;

/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Style
{



	
	// style flags
public static inline var LC_VRULES          = 0x0001;
public static inline var LC_HRULES          = 0x0002;

public static inline var LC_ICON            = 0x0004;
public static inline var LC_SMALL_ICON      = 0x0008;
public static inline var LC_LIST            = 0x0010;
public static inline var LC_REPORT          = 0x0020;

public static inline var LC_ALIGN_TOP       = 0x0040;
public static inline var LC_ALIGN_LEFT      = 0x0080;
public static inline var LC_AUTOARRANGE     = 0x0100;
public static inline var LC_VIRTUAL         = 0x0200;
public static inline var LC_EDIT_LABELS     = 0x0400;
public static inline var LC_NO_HEADER       = 0x0800;
public static inline var LC_NO_SORT_HEADER  = 0x1000;
public static inline var LC_SINGLE_SEL      = 0x2000;
public static inline var LC_SORT_ASCENDING  = 0x4000;
public static inline var LC_SORT_DESCENDING = 0x8000;

public static inline var LC_MASK_TYPE    =   (LC_ICON | LC_SMALL_ICON | LC_LIST | LC_REPORT);
public static inline var LC_MASK_ALIGN   =   (LC_ALIGN_TOP | LC_ALIGN_LEFT);
public static inline var LC_MASK_SORT    =   (LC_SORT_ASCENDING | LC_SORT_DESCENDING);

// for compatibility only
public static inline var LC_USER_TEXT    =   LC_VIRTUAL;



// Mask flags to tell app/GUI what fields of ListItem are valid
public static inline var LIST_MASK_STATE           = 0x0001;
public static inline var LIST_MASK_TEXT            = 0x0002;
public static inline var LIST_MASK_IMAGE           = 0x0004;
public static inline var LIST_MASK_DATA            = 0x0008;
public static inline var LIST_SET_ITEM             = 0x0010;
public static inline var LIST_MASK_WIDTH           = 0x0020;
public static inline var LIST_MASK_FORMAT          = 0x0040;

// State flags for indicating the state of an item
public static inline var LIST_STATE_DONTCARE       = 0x0000;
public static inline var LIST_STATE_DROPHILITED    = 0x0001;      // MSW only
public static inline var LIST_STATE_FOCUSED        = 0x0002;
public static inline var LIST_STATE_SELECTED       = 0x0004;
public static inline var LIST_STATE_CUT            = 0x0008;      // MSW only
public static inline var LIST_STATE_DISABLED       = 0x0010;      // OS2 only
public static inline var LIST_STATE_FILTERED       = 0x0020;      // OS2 only
public static inline var LIST_STATE_INUSE          = 0x0040;      // OS2 only
public static inline var LIST_STATE_PICKED         = 0x0080;      // OS2 only
public static inline var LIST_STATE_SOURCE         = 0x0100;      // OS2 only

// Hit test flags, used in HitTest
public static inline var LIST_HITTEST_ABOVE            = 0x0001;  // Above the client area.
public static inline var LIST_HITTEST_BELOW            = 0x0002;  // Below the client area.
public static inline var LIST_HITTEST_NOWHERE          = 0x0004;  // In the client area but below the last item.
public static inline var LIST_HITTEST_ONITEMICON       = 0x0020;  // On the bitmap associated with an item.
public static inline var LIST_HITTEST_ONITEMLABEL      = 0x0080;  // On the label (string) associated with an item.
public static inline var LIST_HITTEST_ONITEMRIGHT      = 0x0100;  // In the area to the right of an item.
public static inline var LIST_HITTEST_ONITEMSTATEICON  = 0x0200;  // On the state icon for a tree view item that is in a user-defined state.
public static inline var LIST_HITTEST_TOLEFT           = 0x0400;  // To the left of the client area.
public static inline var LIST_HITTEST_TORIGHT          = 0x0800;  // To the right of the client area.

public static inline var LIST_HITTEST_ONITEM = (LIST_HITTEST_ONITEMICON | LIST_HITTEST_ONITEMLABEL | LIST_HITTEST_ONITEMSTATEICON);

	
	
}