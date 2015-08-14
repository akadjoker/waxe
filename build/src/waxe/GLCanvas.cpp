#include "HaxeAPI.h"
#include <GLCheck.hpp>
#include <wx/glcanvas.h>
#include <RenderTarget.hpp>
#include <Shape.hpp>
#include <Drawable.hpp>
#include <Color.hpp>
#include <CircleShape.hpp>
#include <ConvexShape.hpp>
#include <Transform.hpp>
#include <RectangleShape.hpp>
#include <Image.hpp>
#include <Sprite.hpp>
#include <Texture.hpp>
#include <Text.hpp>
#include <Font.hpp>
#include <Vector2.hpp>
 


 
 


 template<typename T>
T ConvertFromValue(value ptr)
{
	
   T obj = reinterpret_cast<T>(static_cast<intptr_t>(ValueToLong(ptr)));

    if (obj == NULL)
     {
      printf("Invalid object ID passed\n!");
    }
   return obj;
}
 
 
template<typename T>
value ConvertToValue(T ptr)
{ 
return alloc_int(static_cast<long>(reinterpret_cast<intptr_t>(ptr)));
}  

/*
 


template<typename OBJ>
bool AbstractToFloatRect(value inValue, OBJ *&outObj)
{
   outObj = 0;
   if ( ! val_is_kind(inValue,gObjectKind) )      return false;
   sf::FloatRect* obj = (sf::FloatRect* )val_to_kind(inValue,gObjectKind);
   outObj = dynamic_cast<OBJ *>(obj);
   return outObj;
}
*/
// TODO: Manage this with in a window class...
wxGLContext *sgContext = 0;

value wx_glcanvas_create(value inParams)
{
	
	
	CreationParams params(inParams);
    int *attrs = 0;
    wxGLCanvas *window = new wxGLCanvas(params.parent,params.id, attrs,
			  params.position,params.size,params.flags);

    if (sgContext==0)
       sgContext = new wxGLContext(window, (wxGLContext *)0);

    int x,y;
    // Hack to fake a resize to get wxwindows to render before a reszie
    //window->GetParent()->GetSize(&x, &y);
    //window->GetParent()->SetSize(-1, -1, x + 1, y, wxSIZE_USE_EXISTING);
    //window->GetParent()->SetSize(-1, -1, x, y, wxSIZE_USE_EXISTING);

	
	
   return WXToValue(window);
}
DEFINE_PRIM(wx_glcanvas_create,1)

value wx_glcanvas_make_current(value inCanvas)
{
	wxGLCanvas *canvas;
	if (ValueToWX(inCanvas,canvas))
   {
		canvas->SetCurrent(*sgContext);
   }
     GLenum err = glewInit();
	if (GLEW_OK != err)
	{
		fprintf(stderr, "Error: %s\n", glewGetErrorString(err));
	}
	return alloc_null();
}
DEFINE_PRIM(wx_glcanvas_make_current,1)

value wx_glcanvas_flip(value inCanvas)
{
	wxGLCanvas *canvas;
	if (ValueToWX(inCanvas,canvas))
		canvas->SwapBuffers();
	return alloc_null();
}
DEFINE_PRIM(wx_glcanvas_flip,1)


//////////////////////////////////////////////////////////////////
//***************************************************************
value wx_gl_finish()
{
   glFinish();
   return alloc_null();
}
DEFINE_PRIM(wx_gl_finish,0);


value wx_gl_flush()
{
   glFlush();
   return alloc_null();
}
DEFINE_PRIM(wx_gl_flush,0);



// --- Stencil -------------------------------------------


value wx_gl_stencil_func(value func, value ref, value mask)
{
   glStencilFunc(val_int(func),val_int(ref),val_int(mask));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_stencil_func,3);






value wx_gl_stencil_mask(value mask)
{
   glStencilMask(val_int(mask));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_stencil_mask,1);




value wx_gl_stencil_op(value fail,value zfail, value zpass)
{
   glStencilOp(val_int(fail),val_int(zfail),val_int(zpass));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_stencil_op,3);





// --- Blend -------------------------------------------



value wx_gl_blend_func(value s, value d)
{
   glBlendFunc(val_int(s), val_int(d));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_blend_func,2);



// --- Windowing -------------------------------

value wx_gl_viewport(value inX, value inY, value inW,value inH)
{
   glViewport(val_int(inX),val_int(inY),val_int(inW),val_int(inH));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_viewport,4);


value wx_gl_scissor(value inX, value inY, value inW,value inH)
{
   glScissor(val_int(inX),val_int(inY),val_int(inW),val_int(inH));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_scissor,4);

value wx_gl_clear(value inMask)
{
   glClear(val_int(inMask));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_clear,1);


value wx_gl_clear_color(value r,value g, value b, value a)
{
   glClearColor(val_number(r),val_number(g),val_number(b),val_number(a));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_clear_color,4);



value wx_gl_clear_depth(value depth)
{
   #ifdef wx_GLES
   glClearDepthf(val_number(depth));
   #else
   glClearDepth(val_number(depth));
   #endif
   return alloc_null();
}
DEFINE_PRIM(wx_gl_clear_depth,1);


value wx_gl_clear_stencil(value stencil)
{
   glClearStencil(val_int(stencil));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_clear_stencil,1);


value wx_gl_color_mask(value r,value g, value b, value a)
{
   glColorMask(val_bool(r),val_bool(g),val_bool(b),val_bool(a));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_color_mask,4);



value wx_gl_depth_func(value func)
{
   glDepthFunc(val_int(func));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_depth_func,1);

value wx_gl_depth_mask(value mask)
{
   glDepthMask(val_bool(mask));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_depth_mask,1);



value wx_gl_depth_range(value inNear, value inFar)
{
   #ifdef wx_GLES
   glDepthRangef(val_number(inNear), val_number(inFar));
   #else
   glDepthRange(val_number(inNear), val_number(inFar));
   #endif
   return alloc_null();
}
DEFINE_PRIM(wx_gl_depth_range,2);


value wx_gl_cull_face(value mode)
{
   glCullFace(val_int(mode));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_cull_face,1);



value wx_gl_polygon_offset(value factor, value units)
{
   glPolygonOffset(val_number(factor), val_number(units));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_polygon_offset,2);


value wx_gl_read_pixels(value *arg, int argCount)
{
   enum { aX, aY, aWidth, aHeight, aFormat, aType, aBuffer, aOffset };
/*
   unsigned char *data = 0;
   ByteArray bytes( arg[aBuffer] );
   if (bytes.mValue)
      data = bytes.Bytes() + val_int(arg[aOffset]);

   glReadPixels( INT(aX), INT(aY),
                    INT(aWidth),   INT(aHeight),
                    INT(aFormat),  INT(aType),
                    data );
*/
   return alloc_null();
}
DEFINE_PRIM_MULT(wx_gl_read_pixels);


value wx_gl_pixel_storei(value pname, value param)
{
   glPixelStorei(val_int(pname), val_int(param));
   return alloc_null();
}
DEFINE_PRIM(wx_gl_pixel_storei,2);







// --- Texture -------------------------------------------



value wx_gl_bind_texture(value inTarget, value inTexture)
{
 
 //  int tid = val_is_int(inTexture) ? val_int(inTexture) : getResource(inTexture,resoTexture);
   glBindTexture(val_int(inTarget), val_int(inTexture) );
   return alloc_null();
}
DEFINE_PRIM(wx_gl_bind_texture,2);






value wx_gl_tex_parameterf(value inTarget, value inPName, value inVal)
{
   glTexParameterf(val_int(inTarget), val_int(inPName), val_number(inVal) );
   return alloc_null();
}
DEFINE_PRIM(wx_gl_tex_parameterf,3);


value wx_gl_tex_parameteri(value inTarget, value inPName, value inVal)
{
   glTexParameterf(val_int(inTarget), val_int(inPName), val_int(inVal) );
   return alloc_null();
}
DEFINE_PRIM(wx_gl_tex_parameteri,3);


value wx_gl_copy_tex_image_2d(value *arg, int argCount)
{
    enum { aTarget, aLevel, aInternalFormat, aX, aY, aWidth, aHeight, aBorder };

   glCopyTexImage2D( INT(aTarget), INT(aLevel), INT(aInternalFormat),
                     INT(aX), INT(aY), INT(aWidth), INT(aHeight), INT(aBorder) );
   return alloc_null();
}
DEFINE_PRIM_MULT(wx_gl_copy_tex_image_2d);


value wx_gl_copy_tex_sub_image_2d(value *arg, int argCount)
{
    enum { aTarget, aLevel, aXOffset, aYOffset, aX, aY, aWidth, aHeight };
   glCopyTexSubImage2D( INT(aTarget), INT(aLevel), INT(aXOffset), INT(aYOffset),
                        INT(aX), INT(aY), INT(aWidth), INT(aHeight) );
   return alloc_null();
}
DEFINE_PRIM_MULT(wx_gl_copy_tex_sub_image_2d);





value wx_gl_get_tex_parameter(value inTarget,value inPname)
{
   int result = 0;
   glGetTexParameteriv(val_int(inTarget), val_int(inPname), &result);
   return alloc_int(result);
}
DEFINE_PRIM(wx_gl_get_tex_parameter,2);


//****************************************************************************

value wx_create_rendertarget(value width, value height)
{
   sf::RenderTarget* render = new sf::RenderTarget(val_int( width), val_int(height));
   return ConvertToValue(render);
}
DEFINE_PRIM(wx_create_rendertarget,2);

value wx_pushStates_rendertarget(value p )
{
  
   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   render->pushGLStates();
   return alloc_null();
}
DEFINE_PRIM(wx_pushStates_rendertarget,1);

value wx_popStates_rendertarget(value p )
{
  
   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   render->popGLStates();
   return alloc_null();
}
DEFINE_PRIM(wx_popStates_rendertarget,1);


value wx_resetStates_rendertarget(value p )
{

   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   render->resetGLStates();
   return alloc_null();
}
DEFINE_PRIM(wx_resetStates_rendertarget,1);


value wx_applyCurrentView_rendertarget(value p )
{
 
   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   render->applyCurrentView();
   return alloc_null();
}
DEFINE_PRIM(wx_applyCurrentView_rendertarget,1);

value wx_clear_rendertarget(value p ,value color)
{
 
   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   render->clear(sf::Color(ValueToInt(color)));
   return alloc_null();
}
DEFINE_PRIM(wx_clear_rendertarget,2);


value wx_draw_rendertarget(value p ,value shape)
{
  
   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   sf::Drawable* draw = ConvertFromValue<sf::Drawable*>(shape);
   render->draw(*draw);
   return alloc_null();
}
DEFINE_PRIM(wx_draw_rendertarget,2);


value wx_drawBlend_rendertarget(value p ,value shape,value t)
{
  
   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   sf::Drawable* draw = ConvertFromValue<sf::Drawable*>(shape);
   sf::BlendMode blendmode =sf::BlendAlpha;
   
   int blendMode=ValueToInt(t);
   switch (blendMode)
   {
	   case 0:
	   {
		 blendmode=sf::BlendAlpha;   
		   break;
	   }
	    case 1:
	   {
		  blendmode=sf::BlendAdd;   
		   break;
	   }
	   case 2:
	   {
		  blendmode=sf::BlendMultiply;   
		break;   
	   }
	   
	   case 3:
	   {
		   blendmode=sf::BlendNone;   
		break;   
	   }
	   default:
	   {
		   blendmode=sf::BlendAlpha;  
		   break;
	   }
   }
   
   
   
   render->draw(*draw,blendmode);
   return alloc_null();
}
DEFINE_PRIM(wx_drawBlend_rendertarget,3);


value wx_applyTexture_rendertarget(value p ,value t)
{

   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);
   sf::Texture* texture = ConvertFromValue<sf::Texture*>(t);
   render->applyTexture(texture);
   return alloc_null();
}
DEFINE_PRIM(wx_applyTexture_rendertarget,2);


value wx_SetBlendMode_rendertarget(value p ,value t)
{

   sf::RenderTarget* render = ConvertFromValue<sf::RenderTarget*>(p);

   
   int blendMode=ValueToInt(t);
   switch (blendMode)
   {
	   case 0:
	   {
		   render->applyBlendMode(sf::BlendAlpha);   
		   break;
	   }
	    case 1:
	   {
		   render->applyBlendMode(sf::BlendAdd);   
		   break;
	   }
	   case 2:
	   {
		   render->applyBlendMode(sf::BlendMultiply);   
		break;   
	   }
	   
	   case 3:
	   {
		   render->applyBlendMode(sf::BlendNone);   
		break;   
	   }
	   default:
	   {
		   render->applyBlendMode(sf::BlendAlpha);  
		   break;
	   }
   }
   
	
   
 
   
   return alloc_null();
}
DEFINE_PRIM(wx_SetBlendMode_rendertarget,2);

   
//*************************************************************************************
//**************************************SHAPES******************************************
//*************************************************************************************

value wx_create_circleshape(value r ,value p)
{
   sf::CircleShape* shape = new sf::CircleShape(ValueToFloat(r),ValueToInt(p));
   return ConvertToValue(shape);
}
DEFINE_PRIM(wx_create_circleshape,2);

value wx_create_rectangleshape(value w,value h)
{
   sf::RectangleShape* shape = new sf::RectangleShape(sf::Vector2f( ValueToFloat(w),ValueToFloat(h)));
   return ConvertToValue(shape);
}
DEFINE_PRIM(wx_create_rectangleshape,2);


//*************************************************************************************
//**************************************IMAGE******************************************
//*************************************************************************************

value wx_create_image(value w,value h,value color)
{
   sf::Image* image = new sf::Image();
   image->create(ValueToInt(w),ValueToInt(h),sf::Color(ValueToLong(color)));
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_create_image,3);

value wx_createmask_image(value p,value color,value a)
{
   
    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    if(pointer)
    {
     pointer->createMaskFromColor(sf::Color(ValueToInt(color)),ValueToInt(a));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_createmask_image,3);


value wx_loadfromfile_image(value f)
{
   sf::Image* image = new sf::Image();
   image->loadFromFile(ValueToString(f));
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_loadfromfile_image,1);


value wx_savefromfile_image(value p,value f)
{

    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    if(pointer)
    {
     pointer->saveToFile(ValueToString(f));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_savefromfile_image,2);



value wx_copy_image(value* arg, int nargs)
{
 	enum { image, source, destx, desty, x, y,w,h,applyAlpha};

	 int dstX = ValueToInt(arg[destx]);
	 int dstY = ValueToInt(arg[desty]);
	 bool alpha = ValueToBool(arg[applyAlpha]);
	 

	    sf::Image* _image = ConvertFromValue<sf::Image*>(arg[image]);
		sf::Image* _source= ConvertFromValue<sf::Image*>(arg[source]);
	   
		if (_image && _source)
		{
		 sf::IntRect r1(ValueToInt(arg[x]),ValueToInt(arg[y]),ValueToInt(arg[w]),ValueToInt(arg[h]));
		_image->copy(*_source,dstX,dstY,r1,alpha);
		}
   
     
   return alloc_null();
}
DEFINE_PRIM_MULT(wx_copy_image);


value wx_width_image(value p)
{
	
    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    if(pointer)
    {
     return alloc_int(pointer->getSize().x);
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_width_image,1);

value wx_height_image(value p)
{
	
    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    if(pointer)
    {
     return alloc_int(pointer->getSize().y);
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_height_image,1);


value wx_flipHorizontally_image(value p)
{
	
    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    pointer->flipHorizontally();
   
   
   return alloc_null();
}
DEFINE_PRIM(wx_flipHorizontally_image,1);

value wx_flipVertically_image(value p)
{

    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
   
      pointer->flipVertically();
   
   
   return alloc_null();
}
DEFINE_PRIM(wx_flipVertically_image,1);

value wx_getpixel_image(value p,value x,value y)
{
 
    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    sf::Color color= pointer->getPixel(ValueToInt(x),ValueToInt(y));
    return alloc_int(color.toInteger());
   
  
}
DEFINE_PRIM(wx_getpixel_image,3);


value wx_setpixel_image(value p,value x,value y ,value color)
{

    sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
    pointer->setPixel(ValueToInt(x),ValueToInt(y),sf::Color(ValueToInt(color)));
   
   return alloc_null();
}
DEFINE_PRIM(wx_setpixel_image,4);
//*************************************************************************************
//**************************************SPRITE******************************************
//*************************************************************************************
value wx_create_sprite()
{
   sf::Sprite* sprite = new sf::Sprite();
   return ConvertToValue(sprite);
}
DEFINE_PRIM(wx_create_sprite,0);

value wx_createEx_sprite(value p)
{
   sf::Texture* pointer = ConvertFromValue<sf::Texture*>(p);
   sf::Sprite* sprite = new sf::Sprite(*pointer);
   return ConvertToValue(sprite);
}
DEFINE_PRIM(wx_createEx_sprite,1);

value wx_setTexture_sprite(value p ,value i, value resetRect)
{
  
    sf::Sprite* pointer = ConvertFromValue<sf::Sprite*>(p);
    sf::Texture* image = ConvertFromValue<sf::Texture*>(i);
    pointer->setTexture(*image,ValueToBool(resetRect));
    return alloc_null();
}
DEFINE_PRIM(wx_setTexture_sprite,3);

value wx_setColor_sprite(value p ,value color)
{
  
    sf::Sprite* pointer = ConvertFromValue<sf::Sprite*>(p);
    if(pointer)
    {
     pointer->setColor(sf::Color(ValueToInt(color)));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_setColor_sprite,2);



value wx_setTextureRect_sprite(value p,value x,value y,value w,value h)
{
   
 
   
    sf::Sprite* pointer = ConvertFromValue<sf::Sprite*>(p);
      sf::IntRect r1(ValueToInt(x),ValueToInt(y),ValueToInt(w),ValueToInt(h));
    pointer->setTextureRect(r1);
 
   return alloc_null();
}
DEFINE_PRIM(wx_setTextureRect_sprite,5);



value wx_getLocalBounds_sprite(value p)
{
 
    sf::Sprite* pointer = ConvertFromValue<sf::Sprite*>(p);  
    sf::FloatRect *bound = &pointer->getLocalBounds();
    return ConvertToValue(bound);
}
DEFINE_PRIM(wx_getLocalBounds_sprite,1);

value wx_getGlobalBounds_sprite(value p)
{
 
    sf::Sprite* pointer = ConvertFromValue<sf::Sprite*>(p);  
    sf::FloatRect *bound = &pointer->getGlobalBounds();
    return ConvertToValue(bound);
}
DEFINE_PRIM(wx_getGlobalBounds_sprite,1);
//*************************************************************************************
//**************************************TEXTURE******************************************
//*************************************************************************************
value wx_create_texture(value w,value h)
{
   sf::Texture* image = new sf::Texture();
   image->create(ValueToInt(w),ValueToInt(h));
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_create_texture,2);
value wx_width_texture(value p)
{
	
    sf::Texture* pointer = ConvertFromValue<sf::Texture*>(p);
    if(pointer)
    {
     return alloc_int(pointer->getSize().x);
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_width_texture,1);

value wx_setRepeated_texture(value p,value b)
{
	
    sf::Texture* pointer = ConvertFromValue<sf::Texture*>(p);
    if(pointer)
    {
      pointer->setRepeated(ValueToBool(b));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_setRepeated_texture,2);

value wx_setSmooth_texture(value p,value b)
{
	
    sf::Texture* pointer = ConvertFromValue<sf::Texture*>(p);
    if(pointer)
    {
      pointer->setSmooth(ValueToBool(b));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_setSmooth_texture,2);
value wx_height_texture(value p)
{
	
    sf::Texture* pointer = ConvertFromValue<sf::Texture*>(p);
    if(pointer)
    {
     return alloc_int(pointer->getSize().y);
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_height_texture,1);

value wx_getImage_texture(value p)
{
  
   sf::Texture* pointer = ConvertFromValue<sf::Texture*>(p);

   sf::Image *image = &pointer->copyToImage();
  //  sf::Image* image = new sf::Image();
   // image->create(65,65,sf::Color(255,0,255,100));
//printf(" %i %i \n", image->getSize().x, image->getSize().y);
 
   return ConvertToValue(image);

}
DEFINE_PRIM(wx_getImage_texture,1);


value wx_load_texture(value f)
{
   sf::Texture* image = new sf::Texture();
   image->loadFromFile(ValueToString(f));
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_load_texture,1);


value wx_loadclip_texture(value f,value x,value y,value w,value h)
{
   sf::Texture* image = new sf::Texture();
   sf::IntRect r1(ValueToInt(x),ValueToInt(y),ValueToInt(w),ValueToInt(h));
   image->loadFromFile(ValueToString(f),r1);
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_loadclip_texture,5);


value wx_loadFromImage_texture(value p)
{
  
   sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
   sf::Texture* image = new sf::Texture();
   image->loadFromImage(*pointer);
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_loadFromImage_texture,1);


value wx_loadFromImageclip_texture(value p,value x,value y,value w,value h)
{
  
   sf::Image* pointer = ConvertFromValue<sf::Image*>(p);
   sf::Texture* image = new sf::Texture();
   sf::IntRect r1(ValueToInt(x),ValueToInt(y),ValueToInt(w),ValueToInt(h));
   image->loadFromImage(*pointer,r1);
   return ConvertToValue(image);
}
DEFINE_PRIM(wx_loadFromImageclip_texture,5);

//*************************************************************************************
//**********************POLIGON
//*************************************************************************************

value wx_create_ConvexShape(value f)
{
   sf::ConvexShape* shape = new sf::ConvexShape(ValueToInt(f));

   return ConvertToValue(shape);
}
DEFINE_PRIM(wx_create_ConvexShape,1);

value wx_setPoint_ConvexShape(value f,value i,value x,value y)
{
   sf::ConvexShape* shape = ConvertFromValue< sf::ConvexShape*>(f);
   if(shape)
   {
	   shape->setPoint(ValueToInt(i),sf::Vector2f(ValueToFloat(x),ValueToFloat(y)));
   }
   return alloc_null();
}
DEFINE_PRIM(wx_setPoint_ConvexShape,4);

value wx_setPointCount_ConvexShape(value f,value i)
{
   sf::ConvexShape* shape = ConvertFromValue< sf::ConvexShape*>(f);
   if(shape)
   {
	   shape->setPointCount(ValueToInt(i));
   }
   return alloc_null();
}
DEFINE_PRIM(wx_setPointCount_ConvexShape,2);

value wx_getPointX_ConvexShape(value f,value i)
{
   sf::ConvexShape* shape = ConvertFromValue< sf::ConvexShape*>(f);
   if(shape)
   {
	   return alloc_float(shape->getPoint(ValueToInt(i)).x);
   }
   return alloc_float(-1);
}
DEFINE_PRIM(wx_getPointX_ConvexShape,2);
value wx_getPointY_ConvexShape(value f,value i)
{
   sf::ConvexShape* shape = ConvertFromValue< sf::ConvexShape*>(f);
   if(shape)
   {
	   return alloc_float(shape->getPoint(ValueToInt(i)).y);
   }
   return alloc_float(-1);
}
DEFINE_PRIM(wx_getPointY_ConvexShape,2);
//*************************************************************************************
//**********************SHAPE
//*************************************************************************************
value wx_setOutlineThickness_shape(value p ,value v)
{
  
    sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    if(pointer)
    {
     pointer->setOutlineThickness(ValueToFloat(v));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_setOutlineThickness_shape,2);

value wx_setFillColor_shape(value p ,value color)
{
  
    sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    if(pointer)
    {
     pointer->setFillColor(sf::Color(ValueToInt(color)));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_setFillColor_shape,2);

value wx_setOutlineColor_shape(value p ,value color)
{
 
    sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    if(pointer)
    {
     pointer->setOutlineColor(sf::Color(ValueToInt(color)));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_setOutlineColor_shape,2);

value wx_setTexture_shape(value p ,value i, value resetRect)
{
   
    sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    sf::Texture* image = ConvertFromValue<sf::Texture*>(i);
    pointer->setTexture(image,ValueToBool(resetRect));
    return alloc_null();
}
DEFINE_PRIM(wx_setTexture_shape,3);

value wx_setTextureRect_shape(value p,value x,value y,value w,value h)
{
   
 
  
    sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
      sf::IntRect r1(ValueToInt(x),ValueToInt(y),ValueToInt(w),ValueToInt(h));
    pointer->setTextureRect(r1);
 
   return alloc_null();
}
DEFINE_PRIM(wx_setTextureRect_shape,5);
 
//*************************************************************************************
//**********************TRANSFORM
//*************************************************************************************

value wx_setPosition_transfrom(value p ,value x, value y)
{
 
	 sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    pointer->setPosition(ValueToFloat(x),ValueToFloat(y));
   return alloc_null();
}
DEFINE_PRIM(wx_setPosition_transfrom,3);

value wx_setRotation_transfrom(value p ,value x)
{
  
   sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
   pointer->setRotation(ValueToFloat(x));

   return alloc_null();
}
DEFINE_PRIM(wx_setRotation_transfrom,2);

value wx_setScale_transfrom(value p ,value x, value y)
{
 
   sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
   pointer->setScale(ValueToFloat(x),ValueToFloat(y));
   return alloc_null();
}
DEFINE_PRIM(wx_setScale_transfrom,3);


value wx_setOrigin_transfrom(value p ,value x, value y)
{
  
	sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
   pointer->setOrigin(ValueToFloat(x),ValueToFloat(y));
   return alloc_null();
}
DEFINE_PRIM(wx_setOrigin_transfrom,3);


value wx_move_transfrom(value p ,value x, value y)
{
 
   sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    if(pointer)
    {
     pointer->move(ValueToFloat(x),ValueToFloat(y));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_move_transfrom,3);

value wx_rotate_transfrom(value p ,value x)
{
  
   sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    if(pointer)
    {
     pointer->rotate(ValueToFloat(x));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_rotate_transfrom,2);

value wx_scale_transfrom(value p ,value x, value y)
{
 
    sf::Shape* pointer = ConvertFromValue<sf::Shape*>(p);
    if(pointer)
    {
     pointer->scale(ValueToFloat(x),ValueToFloat(y));
    }
   
   return alloc_null();
}
DEFINE_PRIM(wx_scale_transfrom,3);
//*********************************************************************************
//*********************************************************************************
//*********************************************************************************

value wx_new_IntRect(value p)
{
	
   static int vx = val_id("x");
   static int vy = val_id("y");
   static int vw = val_id("width");
   static int vh = val_id("height");
   
  
   int x=ValueToInt(val_field(p,vx));
   int y=ValueToInt(val_field(p,vy));
   int w=ValueToInt(val_field(p,vw));
   int h=ValueToInt(val_field(p,vh));
 
 sf::IntRect *r = new sf::IntRect(x,y,w,h);
	
	return ConvertToValue(r);
}
DEFINE_PRIM(wx_new_IntRect,1);


//********************************************************

value wx_x_FloatRect(value p)
{
	
     sf::FloatRect *r =ConvertFromValue<sf::FloatRect*>(p);
	 if(r)
	 {
	 return alloc_float(r->left);
	 }
	 
	 return alloc_float(0);
}
DEFINE_PRIM(wx_x_FloatRect,1);
value wx_y_FloatRect(value p)
{
	
     sf::FloatRect *r =ConvertFromValue<sf::FloatRect*>(p);
	 if(r)
	 {
	 return alloc_float(r->top);
	 }
	 return alloc_float(0);
}
DEFINE_PRIM(wx_y_FloatRect,1);
value wx_width_FloatRect(value p)
{
	
     sf::FloatRect *r =ConvertFromValue<sf::FloatRect*>(p);
	 if(r)
	 {
	 return alloc_float(r->width);
     }
	 
	 return alloc_float(0);
}
DEFINE_PRIM(wx_width_FloatRect,1);
value wx_height_FloatRect(value p)
{
	
     sf::FloatRect *r =ConvertFromValue<sf::FloatRect*>(p);
	 if(r)
	 {
	 return alloc_float(r->height);
	 }
	 
	 return alloc_float(0);
}
DEFINE_PRIM(wx_height_FloatRect,1);

value wx_new_FloatRect(value p)
{
	
   static int vx = val_id("x");
   static int vy = val_id("y");
   static int vw = val_id("width");
   static int vh = val_id("height");
   
   float x=ValueToFloat(val_field(p,vx));
   float y=ValueToFloat(val_field(p,vy));
   float w=ValueToFloat(val_field(p,vw));
   float h=ValueToFloat(val_field(p,vh));
   

	sf::FloatRect *r = new sf::FloatRect(x,y,w,h);
	
	return ConvertToValue(r);
}
DEFINE_PRIM(wx_new_FloatRect,1);


value wx_setdata_FloatRect(value p,value d)
{
	
   static int vx = val_id("x");
   static int vy = val_id("y");
   static int vw = val_id("width");
   static int vh = val_id("height");
   
   float x=ValueToFloat(val_field(d,vx));
   float y=ValueToFloat(val_field(d,vy));
   float w=ValueToFloat(val_field(d,vw));
   float h=ValueToFloat(val_field(d,vh));
   
    
     sf::FloatRect *r =ConvertFromValue<sf::FloatRect*>(p);
	 r->left=x;
	 r->top=y;
	 r->width=w;
	 r->height=h;
 	 return ConvertToValue(r);
}
DEFINE_PRIM(wx_setdata_FloatRect,2);

//************************************************************************************
/////////////////////////////////FONT////////////////////////////////////////////////
//************************************************************************************
value wx_create_Font(value filename)
{
	sf::Font *font = new sf::Font();
	font->loadFromFile(ValueToString(filename));
    return ConvertToValue(font);
}
DEFINE_PRIM(wx_create_Font,1);

value wx_gettexture_Font(value p,value characterSize)
{
	sf::Font *font = ConvertFromValue<sf::Font*>(p);
	sf::Texture tex = font->getTexture(ValueToInt(characterSize));
    return ConvertToValue(&tex);
}
DEFINE_PRIM(wx_gettexture_Font,2);

//************************************************************************************
/////////////////////////////////TEXT////////////////////////////////////////////////
//************************************************************************************
value wx_create_Text(value f,value caption,value characterSize)
{
	sf::Font *font = ConvertFromValue<sf::Font*>(f);
	if(font)
	{
		sf::Text *text = new sf::Text(ValueToString(caption),*font,ValueToInt(characterSize));
	   return	ConvertToValue(text);
	}
	
    return alloc_null();
}
DEFINE_PRIM(wx_create_Text,3);


value wx_setfont_Text(value p,value f)
{
	sf::Text *text = ConvertFromValue<sf::Text*>(p);
	sf::Font *font = ConvertFromValue<sf::Font*>(f);
	
	if(text && font)
	{
		text->setFont(*font);
	}
	
	
  return alloc_null();
}
DEFINE_PRIM(wx_setfont_Text,2);


value wx_setstring_Text(value p,value f)
{
	sf::Text *text = ConvertFromValue<sf::Text*>(p);
	if(text )
	{
		text->setString(ValueToString(f));
	}
  return alloc_null();
}
DEFINE_PRIM(wx_setstring_Text,2);
value wx_setCharacterSize_Text(value p,value f)
{
	sf::Text *text = ConvertFromValue<sf::Text*>(p);
	if(text )
	{
		text->setCharacterSize(ValueToInt(f));
	}
  return alloc_null();
}
DEFINE_PRIM(wx_setCharacterSize_Text,2);
value wx_setStyle_Text(value p,value f)
{
	sf::Text *text = ConvertFromValue<sf::Text*>(p);
	if(text )
	{
		text->setStyle(ValueToInt(f));
	}
  return alloc_null();
}
DEFINE_PRIM(wx_setStyle_Text,2);
value wx_setColor_Text(value p,value f)
{
	sf::Text *text = ConvertFromValue<sf::Text*>(p);
	if(text )
	{
		text->setColor(sf::Color(ValueToInt(f)));
	}
  return alloc_null();
}
DEFINE_PRIM(wx_setColor_Text,2);
