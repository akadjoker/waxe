#include <wx/wx.h>
#include <wx/propgrid/propgrid.h>
#include <wx/propgrid/advprops.h>
#include <wx/image.h>

#include <stdio.h>

#define NEKO_COMPATIBLE
#define IMPLEMENT_API

#include <hx/CFFI.h>
#include "HaxeAPI.h"


class Simple : public wxFrame
{
public:
    Simple(const wxString& title);

};

Simple::Simple(const wxString& title)
       : wxFrame(NULL, wxID_ANY, title, wxDefaultPosition, wxSize(250, 150))
{
	
	  wxButton *window = new wxButton(this,wxID_OK,wxT("OK"),wxPoint(10,10),wxDefaultSize);

										  
  Centre();
}

// --- Bootstrap Object ---------------------------

static value sgOnInit;

class wxWidgetsApp : public wxApp
{
public:
    wxWidgetsApp() { }
    virtual ~wxWidgetsApp() { }
    virtual bool OnInit()
    {
       wxImage::AddHandler(new wxGIFHandler);
       wxImage::AddHandler(new wxBMPHandler);

	   
	     //	wxWindow  *window = new  	wxWindow ();
		
	  //  Simple *simple = new Simple(wxT("Simple"));
       // simple->Show(true);
	   
	 //  wxFrame *frame = new wxFrame(this,wxID_OK,wxT("WINDOW"),wxPoint(10,10),wxSize(200,200));
	
       val_call0(sgOnInit);

       SetExitOnFrameDelete(true);

       return true;
    }

};

IMPLEMENT_APP_NO_MAIN(wxWidgetsApp)


// --- Interface ---------------------------------

value wx_boot(value inOnInit)
{
  sgOnInit = inOnInit;
  wchar_t *prog[] = { (wchar_t *)0};
  int argc = 0;
  int result =  wxEntry(argc,prog);
  return alloc_int(result);
}
DEFINE_PRIM(wx_boot,1)

value wx_quit()
{
   wxTheApp->ExitMainLoop();
   return val_null;
}
DEFINE_PRIM(wx_quit,0)

value wx_set_top_window(value inWindow)
{
	wxTopLevelWindow *window;
	if (ValueToWX(inWindow,window))
   	wxTheApp->SetTopWindow(window);
   return val_null;
}
DEFINE_PRIM(wx_set_top_window,1)

//************************************************************************************************


value wx_propertygrid_create(value inParams)
{
	CreationParams params(inParams);
wxPropertyGrid *window = new wxPropertyGrid(params.parent,params.id,
              params.position,params.size,params.flags,params.text);
			  
			//  window->Append(new wxBoolProperty("true", wxPG_LABEL, false));
             // window->Append(new wxFloatProperty("size", wxPG_LABEL, 0.2f));
	
   return WXToValue(window);
}
DEFINE_PRIM(wx_propertygrid_create,1)


value wx_propertygrid_Appendbool(value inWindow,value name,value v)
{
	wxPropertyGrid *window; 

		
	wxBoolProperty *prop = new wxBoolProperty(Val2Str(name), wxPG_LABEL, Val2Bool(v));
	
	window->Append(prop);
	
   return WXToValue(prop);   
}
DEFINE_PRIM(wx_propertygrid_Appendbool,3)

value wx_propertygrid_Appendfloat(value inWindow,value name,value v)
{
	wxPropertyGrid *window; 
	if (ValueToWX(inWindow,window))
   window->Append(new wxFloatProperty(Val2Str(name), wxPG_LABEL, Val2Float(v)));
   return val_null;
}
DEFINE_PRIM(wx_propertygrid_Appendfloat,3)

value wx_propertygrid_Appendint(value inWindow,value name,value v)
{
	wxPropertyGrid *window; 
	if (ValueToWX(inWindow,window))
   window->Append(new wxIntProperty(Val2Str(name), wxPG_LABEL, Val2Int(v)));
   return val_null;
}
DEFINE_PRIM(wx_propertygrid_Appendint,3)

value wx_propertygrid_Appenddir(value inWindow,value name,value v)
{
	wxPropertyGrid *window; 
	if (ValueToWX(inWindow,window))
   window->Append(new wxDirProperty(Val2Str(name), wxPG_LABEL, Val2Str(v)));
   return val_null;
}
DEFINE_PRIM(wx_propertygrid_Appenddir,3)

value wx_propertygrid_Appendfile(value inWindow,value name,value v)
{
	wxPropertyGrid *window; 
	if (ValueToWX(inWindow,window))
   window->Append(new wxFileProperty(Val2Str(name), wxPG_LABEL, Val2Str(v)));
   return val_null;
}
DEFINE_PRIM(wx_propertygrid_Appendfile,3)

value wx_propertygrid_Appendcolor(value inWindow,value name,value v)
{
	wxPropertyGrid *window; 
	if (ValueToWX(inWindow,window))
   window->Append(new wxColourProperty(Val2Str(name), wxPG_LABEL, wxColour(Val2Int(v))));
   return val_null;
}
DEFINE_PRIM(wx_propertygrid_Appendcolor,3)
