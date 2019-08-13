module uim.html.elements.canvas;

import std.stdio;
import std.conv;
import std.string;
import uim.html;

alias STRINGAA = string[string];

class DH5Canvas : DH5Obj {
	string pre = "context.";
	mixin(H5This!"canvas");

	this(string id, int width, int height, string style = "") { 
		super("CANVAS"); 
		_attributes(["id":id, "width":to!string(width), "height":to!string(height), "style": style]); /* clean; */ }

//	override void clean() {
//		super.clean();
//		//_js;
//	}

//	// add
//	alias add = DH5Root.add;
//	override DOPObject add(string val) { js.add(val); return this; }

//	DOPObject Method(string name, bool parameter) { add(pre~name~"("~(parameter ? "TRUE" : "FALSE" )~");"); return this; } 
//	DOPObject Method(string name, int parameter) { add(pre~name~"("~to!string(parameter)~");"); return this; } 
//	DOPObject Method(string name, double parameter) { add(pre~name~"("~to!string(parameter)~");"); return this; } 
//	DOPObject Method(string name, string parameter) { add(pre~name~"("~parameter~");"); return this; } 
//	DOPObject Method(string name, string[] parameters) { add(pre~name~"("~parameters.join(",")~");"); return this; } 
//
//	DOPObject Set(string name, bool value) { add("%s = %s;".format(name, value ? "TRUE" : "FALSE")); return this; }
//	DOPObject Set(string name, int value) { add("%s = %s;".format(name, value)); return this; }
//	DOPObject Set(string name, double value) { add("%s = %s;".format(name, value)); return this; }
//	DOPObject Set(string name, string value) { add("%s = %s;".format(name, value)); return this; }
//
//	DOPObject SetVar(string name, bool value) { add("var %s = %s;".format(name, value ? "TRUE" : "FALSE")); return this; }
//	DOPObject SetVar(string name, int value) { add("var %s = %s;".format(name, value)); return this; }
//	DOPObject SetVar(string name, double value) { add("var %s = %s;".format(name, value)); return this; }
//	DOPObject SetVar(string name, string value) { add("var %s = %s;".format(name, value)); return this; }
//
//	// Colors, Styles, and Shadows
//	//FillStyle 	Sets or returns the color, gradient, or pattern used to fill the drawing
//	//	DOPObject FillStyle() { add(pre~"fillStyle"); return this; }
//	@Register DOPObject FillStyle(string[] style...) { Set(pre~"fillStyle", style[0]); return this; }
//
//	// StrokeStyle 	Sets or returns the color, gradient, or pattern used for strokes
//	DOPObject StrokeStyle() { add(pre~"strokeStyle");  return this; }
//	DOPObject StrokeStyle(string style) { Set(pre~"strokeStyle", style); return this;  }
//
//	// ShadowColor 	Sets or returns the color to use for shadows
//	DOPObject ShadowColor() { add(pre~"shadowColor"); return this;  }
//	DOPObject ShadowColor(string color) { Set(pre~"shadowColor", color); return this;  }
//
//	// ShadowBlur 	Sets or returns the blur level for shadows
//	DOPObject ShadowBlur() { add(pre~"shadowBlur"); return this; }
//	DOPObject ShadowBlur(T)(T value) { Set(pre~"shadowBlur", value); return this;  }
//
//	// ShadowOffsetX 	Sets or returns the horizontal distance of the shadow from the shape
//	DOPObject ShadowOffsetX() { add(pre~"shadowOffsetX"); return this;  }
//	DOPObject ShadowOffsetX(T)(T value) { return Set(pre~"shadowOffsetX", value); return this;  }
//
//	// ShadowOffsetY 	Sets or returns the vertical distance of the shadow from the shape
//	DOPObject ShadowOffsetY() { add(pre~"shadowOffsetY"); return this;  }
//	DOPObject ShadowOffsetY(T)(T value) { return Set(pre~"shadowOffsetY", value); return this;  }
//
//	// CreateLinearGradient() 	Creates a linear gradient (to use on canvas content)
//	DOPObject CreateLinearGradient() { add(pre~"createLinearGradient();"); return this;  }
//
//	// CreatePattern() 	Repeats a specified element in the specified direction
//	DOPObject CreatePattern() { add(pre~"createPattern();"); return this;  }
//
//	// CreateRadialGradient() 	Creates a radial/circular gradient (to use on canvas content)
//	DOPObject CreateRadialGradient() { add(pre~"createRadialGradient();"); return this;  }
//
//	// AddColorStop() 	Specifies the colors and stop positions in a gradient object
//	DOPObject AddColorStop() { add(pre~"addColorStop();"); return this; }
//
//	// ----- Line Styles
//	// LineCap 	Sets or returns the style of the end caps for a line
//	DOPObject LineCap() { add(pre~"lineCap"); return this;  }
//	DOPObject LineCap(string value) { add(pre~"lineCap = %s;".format(value)); return this;  }
//
//	// LineJoin 	Sets or returns the type of corner created, when two lines meet
//	DOPObject LineJoin() { add(pre~"lineJoin"); return this;  }
//	DOPObject LineJoin(string value) { add(pre~"lineJoin = %s;".format(value)); return this;  }
//
//	// lineWidth 	Sets or returns the current line width
//	DOPObject LineWidth() { add(pre~"lineWidth"); return this;  }
//	DOPObject LineWidth(double value) { add(pre~"lineWidth = %s;".format(value)); return this;  }
//	DOPObject LineWidth(string value) { add(pre~"lineWidth = %s;".format(value)); return this;  }
//
//	// MiterLimit 	Sets or returns the maximum miter length
//	DOPObject MiterLimit(double number) { add(pre~"miterLimit(%s);".format(number)); return this;  }
//	DOPObject MiterLimit(string number) { add(pre~"miterLimit(%s);".format(number)); return this;  }
//
//	// ----- Rectangles
//	//	Rect() 	Creates a rectangle
//	@Register DOPObject Rect(double[] values...) { add(pre~"rect(%s, %s, %s, %s);".format(values)); return this;  }
//	@Register DOPObject Rect(string[] values...) { add(pre~"rect(%s, %s, %s, %s);".format(values)); return this;  }
//
//	// FillRect() 	Draws a "filled" rectangle (x, y, w, h)
//	//	@Register DOPObject FillRect(double[] values...) { add(pre~"fillRect(%s, %s, %s, %s);".format(	values));  }
//	@Register DOPObject FillRect(string[] values...) { add(pre~"fillRect(%s, %s, %s, %s);".format(values)); return this;  }
//
//	// StrokeRect() 	Draws a rectangle (no fill)
//	@Register DOPObject StrokeRect(double[] values...) { add(pre~"strokeRect(%s, %s, %s, %s);".format(values)); return this;  }
//	@Register DOPObject StrokeRect(string[] values...) { add(pre~"strokeRect(%s, %s, %s, %s);".format(values)); return this;  }
//
//	// ClearRect() 	Clears the specified pixels within a given rectangle (x, y, w, h)
//	@Register DOPObject ClearRect(double[] values...) { add(pre~"clearRect(%s, %s, %s, %s);".format(values)); return this; }
//	@Register DOPObject ClearRect(string[] values...) { add(pre~"clearRect(%s, %s, %s, %s);".format(values)); return this; }
//
//	// ----- Paths
//	// Fill() 	Fills the current drawing (path)
//	@Register DOPObject Fill() { add(pre~"fill();"); return this; }
//
//	// Stroke() 	Actually draws the path you have defined
//	@Register DOPObject Stroke() { add(pre~"stroke();"); return this; }
//
//	// BeginPath() 	Begins a path, or resets the current path
//	@Register DOPObject BeginPath() { add(pre~"beginPath();"); return this; }
//
//	// MoveTo() 	Moves the path to the specified point in the canvas, without creating a line
//	DOPObject MoveTo(double x, double y) { add(pre~"moveTo(%s, %s);".format(x, y)); return this; }
//	DOPObject MoveTo(string x, string y) { add(pre~"moveTo(%s, %s);".format(x, y)); return this; }
//	@Register DOPObject MoveTo(string[] values) { add(pre~"moveTo(%s, %s);".format(values[0], values[1])); return this; }
//
//	// ClosePath() 	Creates a path from the current point back to the starting point
//	@Register DOPObject ClosePath() { add(pre~"closePath();"); return this; }
//
//	// LineTo() 	Adds a new point and creates a line from that point to the last specified point in the canvas (x, y)
//	@Register DOPObject LineTo(double[] values) { add(pre~"lineTo(%s, %s);".format(values)); return this;  }
//	@Register DOPObject LineTo(string[] values) { add(pre~"lineTo(%s, %s);".format(values)); return this;  }
//
//	// Clip() 	Clips a region of any shape and size from the original canvas
//	@Register DOPObject Clip() { add(pre~"clip();"); return this;  }
//
//	// QuadraticCurveTo() 	Creates a quadratic Bézier curve
//	DOPObject QuadraticCurveTo(double x, double y, double w, double h) { add(pre~"quadraticCurveTo(%s, %s, %s, %s);".format(x, y, w, h)); return this;  }
//	DOPObject QuadraticCurveTo(string x, string y, string w, string h) { add(pre~"quadraticCurveTo(%s, %s, %s, %s);".format(x, y, w, h)); return this;  }
//
//	// BezierCurveTo() 	Creates a cubic Bézier curve
//	DOPObject BezierCurveTo(double x, double y, double w, double h, double r, double b) { add(pre~"bezierCurveTo(%s, %s, %s, %s, %s, %s);".format(x, y, w, h, r, b)); return this;  }
//	DOPObject BezierCurveTo(string x, string y, string w, string h, string r, string b) { add(pre~"bezierCurveTo(%s, %s, %s, %s, %s, %s);".format(x, y, w, h, r, b)); return this;  }
//
//	// Arc() 	Creates an arc/curve (used to create circles, or parts of circles)
//	DOPObject Arc(double x, double y, double r, double sAngle, double eAngle, bool b = false) { add(pre~"arc(%s, %s, %s, %s, %s, %s);".format(x, y, r, sAngle, eAngle, b ? "true" : "false")); return this;  }
//	DOPObject Arc(string x, string y, string r, string sAngle, string eAngle, bool b = false) { add(pre~"arc(%s, %s, %s, %s, %s, %s);".format(x, y, r, sAngle, eAngle, b ? "true" : "false")); return this;  }
//	DOPObject Arc(string[] values...) { add(pre~"arc(%s, %s, %s, %s, %s, %s);".format(values)); return this;  }
//
//	// ArcTo() 	Creates an arc/curve between two tangents
//	DOPObject ArcTo(double x1, double y1, double x2, double y2, double r) { add(pre~"arcTo(%s, %s, %s, %s, %s, %s);".format(x1, y1, x2, y2, r)); return this;  }
//	DOPObject ArcTo(string[] values...) { add(pre~"arcTo(%s, %s, %s, %s, %s, %s);".format(values)); return this;  }
//
//	// IsPointInPath() 	Returns true if the specified point is in the current path, otherwise false
//	DOPObject IsPointInPath(double x, double y) { add(pre~"isPointInPath(%s, %s);".format(x, y)); return this;  }
//	DOPObject IsPointInPath(string x, string y) { add(pre~"isPointInPath(%s, %s);".format(x, y)); return this;  }
//
//	// ----- Transformations
//	// Scale() 	Scales the current drawing bigger or smaller
////	DOPObject Scale(double scalewidth, double scaleheight) { add(pre~"scale(%s, %s);".format(scalewidth, scaleheight));  }
//	@Register DOPObject Scale(string[] values... /* scalewidth, string scaleheight */) { add(pre~"scale(%s, %s);".format(values)); return this;  }
//
//	// Rotate() 	Rotates the current drawing
////	DOPObject Rotate(double angle) { add(pre~"rotate(%s);".format(angle));  }
//	DOPObject Rotate(string angle) { add(pre~"rotate(%s);".format(angle)); return this;  }
//
//	// Translate() 	Remaps the (0,0) position on the canvas
//	DOPObject Translate(double x, double y) { add(pre~"translate(%s, %s);".format(x, y)); return this;  }
//	DOPObject Translate(string x, string y) { add(pre~"translate(%s, %s);".format(x, y)); return this;  }
//	@Register DOPObject Translate(string[] values...) { add(pre~"translate(%s, %s);".format(values)); return this;  }
//
//	// Transform() 	Replaces the current transformation matrix for the drawing
//	DOPObject Transform(double a, double b, double c, double d, double e, double f) { add(pre~"transform(%s, %s, %s, %s, %s, %s);".format(a, b, c, d, e, f)); return this;  }
//	@Register DOPObject Transform(string[] values...) { add(pre~"transform(%s, %s, %s, %s, %s, %s);".format(values)); return this;  }
//	
//	// SetTransform() 	Resets the current transform to the identity matrix. Then runs transform()
//	DOPObject SetTransform(double a, double b, double c, double d, double e, double f) { add(pre~"setTransform(%s, %s, %s, %s, %s, %s);".format(a, b, c, d, e, f)); return this;  }
//	@Register DOPObject SetTransform(string[] values...) { add(pre~"setTransform(%s, %s, %s, %s, %s, %s);".format(values)); return this;  }
//
//	// ----- Text
//	// Font 	Sets or returns the current font properties for text content
//	//	DOPObject Font() { add(pre~"font");  }
//	@Register DOPObject Font(string[] values... /* name */) { add(pre~"font = %s;".format(values)); return this;  }
//
//	// TextAlign 	Sets or returns the current alignment for text content
//	enum TextAligns : string { 
//		Start = "start", // Default. The text starts at the specified position
//		End = "end", // The text ends at the specified position 
//		Center = "center", // The center of the text is placed at the specified position 	
//		Left = "left", // The text starts at the specified position 	
//		Right = "right" // The text ends at the specified position 
//	}
//	//	DOPObject TextAlign(TextAligns anAlign) { add(pre~"textAlign = '%s';".format(anAlign));  }
//	@Register DOPObject TextAlign(string[] values... /* anAlign */) { add(pre~"textAlign = %s;".format(values)); return this;  }

	// TextBaseline 	Sets or returns the current text baseline used when drawing text
	enum TextBaselines : string { 
		ALphabetic = "alphabetic", // Default. The text baseline is the normal alphabetic baseline 
		Top = "top", // The text baseline is the top of the em square 
		Hanging = "hanging", // The text baseline is the hanging baseline 
		Middle = "middle", // 	The text baseline is the middle of the em square 
		Ideographic = "ideographic", // The text baseline is the ideographic baseline 
		Bottom = "bottom" // The text baseline is the bottom of the bounding box
	}
//	DOPObject TextBaseline(TextBaselines aBaseline) { add(pre~"textBaseline = '%s';".format(aBaseline));  }
//	@Register DOPObject TextBaseline(string[] values... /* aBaseline */) { add(pre~"textBaseline = %s;".format(values)); return this;  }
//
//	// FillText() 	Draws "filled" text on the canvas
//	//	DOPObject FillText(string text, double x, double y) { add(pre~"fillText(%s, %s, %s);".format(text, x, y));  }
//	//	DOPObject FillText(string text, double x, double y, double maxWidth) { add(pre~"fillText(%s, %s, %s, %s);".format(text, x, y, maxWidth));  }
//	@Register DOPObject FillText(string[] values.../* text, x, y, [maxWidth] */ ) { 
//		if (values.length > 3) 
//			add(pre~"fillText(%s, %s, %s, %s);".format(values));  
//		else 
//			add(pre~"fillText(%s, %s, %s);".format(values));  
//		return this;
//	}
//
//	// StrokeText() 	Draws text on the canvas (no fill)
//	DOPObject StrokeText(string text, double x, double y) { add(pre~"strokeText(%s, %s, %s);".format(text, x, y)); return this;  }
//	DOPObject StrokeText(string text, string x, string y) { add(pre~"strokeText(%s, %s, %s);".format(text, x, y)); return this;  }
//	DOPObject StrokeText(string text, double x, double y, double maxWidth) { add(pre~"strokeText(%s, %s, %s, %s);".format(text, x, y, maxWidth)); return this;  }
//	DOPObject StrokeText(string text, string x, string y, string maxWidth) { add(pre~"strokeText(%s, %s, %s, %s);".format(text, x, y, maxWidth)); return this;  }
//
//	// MeasureText() 	Returns an object that contains the width of the specified text
//	DOPObject MeasureText(string text) { add(pre~"measureText(%s).width".format(text)); return this;  }
//
//	// ----- Image Drawing
//	// DrawImage() 	Draws an image, canvas, or video onto the canvas
//	DOPObject DrawImage(string image, double x, double y) { add(pre~"drawImage(%s, %s, %s);".format(image, x, y)); return this;  }
//	DOPObject DrawImage(string image, string x, string y) { add(pre~"drawImage(%s, %s, %s);".format(image, x, y)); return this;  }
//	DOPObject DrawImage(string image, double x, double y, double width, double height) { add(pre~"drawImage(%s, %s, %s, %s, %s);".format(image, x, y, width, height)); return this;  }
//	DOPObject DrawImage(string image, string x, string y, string width, string height) { add(pre~"drawImage(%s, %s, %s, %s, %s);".format(image, x, y, width, height)); return this;  }
//	DOPObject DrawImage(string image, double sx, double sy, double sWidth, double sHeight, double x, double y, double width, double height) { add(pre~"drawImage(%s, %s, %s, %s, %s, %s, %s, %s, %s);".format(image, sx, sy, sWidth, sHeight, x, y, width, height)); return this;  }
//	@Register DOPObject DrawImage(string[] values...) { add(pre~"drawImage(%s, %s, %s, %s, %s, %s, %s, %s, %s);".format(values)); return this;  }
//
//	// ----- Pixel Manipulation
//	//			width 	Returns the width of an ImageData object
//	//			height 	Returns the height of an ImageData object
//	//			data 	Returns an object that contains image data of a specified ImageData object
//
//	// CreateImageData() 	Creates a new, blank ImageData object
//	DOPObject CreateImageData(double width, double height) { add(pre~"createImageData(%s, %s)".format(width, height));  return this; }
//	DOPObject CreateImageData(string width, string height) { add(pre~"createImageData(%s, %s)".format(width, height)); return this;  }
//	DOPObject CreateImageData(string image) { add(pre~"createImageData(%s)".format(image)); return this;  }
//
//	// GetImageData() 	Returns an ImageData object that copies the pixel data for the specified rectangle on a canvas
//	DOPObject GetImageData(double x, double y, double width, double height) { add(pre~"getImageData(%s, %s, %s, %s)".format(x, y, width, height)); return this;  }
//	DOPObject GetImageData(string x, string y, string width, string height) { add(pre~"getImageData(%s, %s, %s, %s)".format(x, y, width, height)); return this;  }
//
//	// PutImageData() 	Puts the image data (from a specified ImageData object) back onto the canvas
////	DOPObject PutImageData(string image, double x, double y) { add(pre~"putImageData(%s, %s, %s);".format(image, x, y));  }
////	DOPObject PutImageData(string image, string x, string y) { add(pre~"putImageData(%s, %s, %s);".format(image, x, y));  }
////	DOPObject PutImageData(string image, double x, double y, double dirtyX, double dirtyY, double dirtyWidth, double dirtyHeight) { add(pre~"putImageData(%s, %s, %s, %s, %s, %s, %s);".format(image, x, y, dirtyX, dirtyY, dirtyWidth, dirtyHeight));  }
//	@Register DOPObject PutImageData(string[] values... /* image, x, y, [dirtyX], [dirtyY], [dirtyWidth], [dirtyHeight] */) { 
//		if (values.length > 3)
//			add(pre~"putImageData(%s, %s, %s, %s, %s, %s, %s);".format(values));  
//		else
//			add(pre~"putImageData(%s, %s, %s);".format(values));  
//		return this;
//	}
//
//	// ----- Compositing
//	// GlobalAlpha 	Sets or returns the current alpha or transparency value of the drawing
//	//	DOPObject GlobalAlpha() { add(pre~"globalAlpha()");  }
//	//	DOPObject GlobalAlpha(double number) { add(pre~"globalAlpha(%s);".format(number));  }
//	@Register DOPObject GlobalAlpha(string[] values... /* number */) { add(pre~"globalAlpha(%s);".format(values)); return this;  }
//
//	// globalCompositeOperation 	Sets or returns how a new image are drawn onto an existing image
//	enum CompositeOperations : string {
//		SourceOver = "source-over", // 	Default. Displays the source image over the destination image 	
//		SourceATop = "source-atop", // 	Displays the source image on top of the destination image. The part of the source image that is outside the destination image is not shown 	
//		SourceIn = "source-in", // 	Displays the source image in to the destination image. Only the part of the source image that is INSIDE the destination image is shown, and the destination image is transparent 	
//		SourceOut = "source-out", // 	Displays the source image out of the destination image. Only the part of the source image that is OUTSIDE the destination image is shown, and the destination image is transparent 	
//		DestinationOver = "destination-over", // 	Displays the destination image over the source image 	
//		DestinationATop = "destination-atop", // 	Displays the destination image on top of the source image. The part of the destination image that is outside the source image is not shown 	
//		DestinationIn = "destination-in", // 	Displays the destination image in to the source image. Only the part of the destination image that is INSIDE the source image is shown, and the source image is transparent 	
//		DestinationOut = "destination-out", // 	Displays the destination image out of the source image. Only the part of the destination image that is OUTSIDE the source image is shown, and the source image is transparent 	
//		Lighter = "lighter", // 	Displays the source image + the destination image 	
//		Copy = "copy", // 	Displays the source image. The destination image is ignored 	
//		Xor = "xor" // 	The source image is combined by using an exclusive OR with the destination image
//	}
//	//	DOPObject GlobalCompositeOperation(CompositeOperations operation) { add(pre~"globalCompositeOperation = '%s';".format(operation));  }
//	@Register DOPObject GlobalCompositeOperation(string[] values... /* operation */ ) { add(pre~"globalCompositeOperation = %s;".format(values)); return this; }
//
//	// ----- Other
//	// Save() 	Saves the state of the current context
//	@Register DOPObject Save() { add(pre~"save();"); return this;  }
//
//	// Restore() 	Returns previously saved path state and attributes
//	@Register DOPObject Restore() { add(pre~"restore();"); return this;  }
}
mixin(FuncH5!"Canvas");
auto H5Canvas(string id, int width, int height, string style = "") { 
	return new DH5Canvas(id, width, height, style); 
}

unittest {
	assert(H5Canvas == "<canvas></canvas>");
}
