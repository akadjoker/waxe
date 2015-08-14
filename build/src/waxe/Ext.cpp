#include "HaxeAPI.h"

#include <wx/wx.h>
#include <wx/listctrl.h>


value wx_listctrl_create(value inParams)
{
	CreationParams params(inParams);


wxListCtrl *window = new wxListCtrl(params.parent,params.id,
              params.position,params.size,params.flags,wxDefaultValidator,params.text);

   return WXToValue(window);
}
DEFINE_PRIM(wx_listctrl_create,1)






value wx_listctrk_InsertItem(value inWindow,value index, value item) 
{ 
	wxListCtrl *window; 
	if (!ValueToWX(inWindow,window)) 		val_throw(alloc_string("Invalid wxListCtrl")); 
	window->InsertItem(Val2Int(index), Val2Str(item)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_listctrk_InsertItem,3);

value wx_listctrk_GetItemCount(value inWindow) 
{ 
	wxListCtrl *window; 
	if (!ValueToWX(inWindow,window)) 		val_throw(alloc_string("Invalid wxListCtrl")); 
	return alloc_int(window->GetItemCount());
} 
DEFINE_PRIM(wx_listctrk_GetItemCount,1);

value wx_listctrk_SetItemState(value inWindow,value index,value state, value flags) 
{ 
	wxListCtrl *window; 
	if (!ValueToWX(inWindow,window)) 		val_throw(alloc_string("Invalid wxListCtrl")); 
	window->SetItemState(Val2Int(index),Val2Int(state),Val2Int(flags));
	//select wxLIST_STATE_SELECTED, wxLIST_STATE_SELECTED
	//deselect  wxLIST_STATE_SELECTED | wxLIST_STATE_FOCUSED
	return alloc_null();
} 
DEFINE_PRIM(wx_listctrk_SetItemState,4);


value wx_listctrk_GetNextItem(value inWindow,value item,value flags) 
{ 
	wxListCtrl *window; 
	if (!ValueToWX(inWindow,window)) 		val_throw(alloc_string("Invalid wxListCtrl")); 
	return alloc_int(window->GetNextItem(Val2Int(item),Val2Int(flags)));//wxLIST_NEXT_ALL, wxLIST_STATE_SELECTED
} 
DEFINE_PRIM(wx_listctrk_GetNextItem,3);

value wx_listctrk_InsertColumn(value inWindow,value index,value item, value format,value width) 
{ 
	wxListCtrl *window; 
	if (!ValueToWX(inWindow,window)) 		val_throw(alloc_string("Invalid wxListCtrl")); 
	window->InsertColumn(Val2Int(index),Val2Str(item),Val2Int(format),Val2Int(width));
	return alloc_null();
} 
DEFINE_PRIM(wx_listctrk_InsertColumn,5);
//************************************************************************************************************







	