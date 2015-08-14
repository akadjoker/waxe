package;

import neko.Lib;
import wx.BoxSizer;
import wx.DC;
import wx.ListCtrl;
import wx.Style;
import wx.PropertyGrid;

import wx.GridBagSizer;
import wx.GridSizer;
import wx.Point;
import wx.Rect;
import wx.StaticBox;
import wx.StaticBoxSizer;


import wx.sfml.CircleShape;
import wx.sfml.Image;
import wx.sfml.RectangleShape;
import wx.sfml.Texture;
import wx.sfml.Sprite;
import wx.sfml.Render;
import wx.sfml.FloatRect;
import wx.sfml.IntRect;
import wx.sfml.Text;
import wx.sfml.Font;


import wx.Timer;

import wx.App;
import wx.Button;
import wx.EventID;
import wx.FileDialog;
import wx.Frame;
import wx.Sizer;
import wx.Window;
import wx.Panel;
import wx.StaticText;
import wx.EventHandler;
import wx.GLCanvas;




/**
 * ...
 * @author Luis Santos AKA DJOKER
 */
class Main 
{
	var mFrame : Frame;
    var mWindow : Window;
    var mDrawArea : Window;
	var time:Timer;
	var canvas:GLCanvas;
	
	var sprite:Sprite;
	var render:Render;
	var circle:CircleShape;
	var rectangle:RectangleShape;
	var step:Float;
		  var tex:Texture;
		  var label:Text;
	
	public function new ()
	{
		trace("new");
		
		
				var W:Int = 800;
				var H:Int = 600;		
				
		  mFrame = wx.Frame.create(null,0,"NME Frame",{x:0,y:0},{width:W,height:H});
		  
		//  mFrame.onPaint = paint;
		  mFrame.onClose = Close;
		  //mFrame.setHandler
		//  mFrame.setHandler(	wx.EventID.CLOSE_WINDOW, Close);
		 mFrame.setHandler(	EventID.IDLE, Idle);
	//	 mFrame.setHandler(	EventID.MOTION, MouseMove);
		 mFrame.setHandler(EventID.LEFT_DOWN, MouseDown);
		 
		  
		 var list:ListCtrl = ListCtrl.create(mFrame, 500, "List", { x:100, y:100 }, { width:100, height:150 }, Style.LC_REPORT | Style.LC_SINGLE_SEL);
		 //list.InsetItem(0, "luis");
		 list.InsertColumn(0, "filename", ListCtrl.LIST_FORMAT_LEFT, 50);
		 list.InsertColumn(1, "Path", ListCtrl.LIST_FORMAT_LEFT, 50);

		  list.addItm("labels 1");
		 list.addItm("labels 1");
		 list.addItm("labels 1");
		 list.addItm("labels 1");
		
		 var prop:PropertyGrid = PropertyGrid.create(mFrame, 501, "propertygrid", { x:100, y:250 }, { width:200, height:150 } ,
		         PropertyGrid.PG_AUTO_SORT | // Automatic sorting after items added
        PropertyGrid.PG_SPLITTER_AUTO_CENTER | // Automatically center splitter until user manually adjusts it
        // Default style
        PropertyGrid.PG_DEFAULT_STYLE );
		
		prop.addBool("scale", false);
		prop.addBool("enable", false);
		prop.addFloat("pos x", 0);
		prop.addFloat("pos y", 0);
		prop.addFloat("angle", 0);
		prop.addInt("width", 20);
		prop.addInt("height", 40);
		prop.addColor("color", 0xff00ff);
		
		
		
		
		 
		 Button.create(mFrame, 501, "butt");
		 
		 var font:Font = new Font("arial.ttf");
		 
		 label = new Text(font, "Caption");
		 label.setColor(0xff00ffff);
		 label.setStyle(  Text.BOLD | Text.INDERLINE | Text.STRIKETHROUGH);
	    

		
		 
		 App.setTopWindow(mFrame);
         mFrame.shown = true;
		
		  canvas = GLCanvas.create(mFrame, 1, { x:0, y:0 }, { width:W, height:H } );
		  canvas.shown = true;
		  canvas.setHandler(	EventID.MOTION, MouseMove);
		  canvas.makeCurrent();
      
		  render = new Render(W,H);
		  
		  circle = new CircleShape(20);
		  circle.setPosition( 150, 50);
		  circle.setScale(2, 2);
	
		  
		  rectangle = new RectangleShape(90, 40);
	
		  rectangle.setPosition(80, 10);
		  rectangle.setOrigin(90 / 2, 40 / 2);
		 
		  
		  
		   var img1:Image = Image.Load("Entities.png");
		   var img2:Image = Image.Create(45, 65, 0);
		  
		//  img1.flipHorizontally();

		  
		img2.copy(img1, 0, 0, Rect.Create(0, 0, 45, 65));
		
		  //tex = Texture.LoadFromImageEx(img1, Rect.Create(0, 0, 45, 65));
		  tex = Texture.LoadFromImage(img2);
		  tex.setRepeat(false);
		  tex.setSmooth(true);
		  
		  
		  
		  
		  sprite =  Sprite.CreateFromTexture(tex);
		  sprite.setPosition(100, 100);
		  
		  circle.setTexture(tex);
		  rectangle.setTexture(tex);
	      rectangle.setTextureRect(Rect.Create(0, 0,25, 25));
		 
		  

		  time = new Timer(mFrame);
		  time.start(100);
		  mFrame.setHandler(EventID.TIMER, Update );
		  
		step = 0;
		
     //   var staticText = StaticText.create(mFrame, null, 'Hello Waxe!', { x:20, y: 10 } );
		
	}
	public function paint(dc:DC):Void
	{
	//	dc.drawCircle(50, 50, 12);
		
	}
	
	//update by time
	public function Update(event:Dynamic):Void
	{

		step += 1;
	
		//rectangle.setPosition(step, 100);

		//trace(step);
		 
		//		circle.setPosition( step,50);
		
	}
	//update by windo idle
	public function Idle(event:Dynamic):Void
	{
		
	
		
		render.applyCurrentView();
		
		
		render.clear(0x0000aa00);
	 

		
		render.applyTexture(tex);

		
		render.draw(label);
		

		rectangle.setRotation(step);
		sprite.setRotation(step);
	
	
		render.drawBlend(circle,Render.BlendAdd);
		render.drawBlend(rectangle,Render.BlendMultiply);
		

		render.draw(sprite);
	
		 
		canvas.flip();
		
	}
	public function Close(event:Dynamic):Void
	{

			Sys.exit(0);
	}
	public function MouseMove(event:Dynamic):Void
	{
	//	var event:MouseEvent =new MouseEvent() cast(event, MouseEvent);
	//	trace(event);
		var x:Int = event.x;
		var y:Int = event.y;
	//	trace(x + ", " +y);
		
		sprite.setPosition( x,y);
	}
		public function MouseDown(event:Dynamic):Void
	{
	//	var event:MouseEvent =new MouseEvent() cast(event, MouseEvent);
	//	trace(event);
		var x:Int = event.x;
		var y:Int = event.y;
		trace(x + ", " +y);
	}
	static function main() 
	{
		App.boot( function() { new Main(); } );
		
		trace("application end");
	}
	
}