module uim.html.elements.list;

import uim.html;

class DH5LIST : DH5Obj {
	mixin(H5This!("LIST"));

//	this(string tag, string[] texts...) { this(tag); Add(texts); }
//	this(string tag, DOPObject[] elems...) { this(tag); Add(elems); }
	
//	this(string tag, STRINGAA atts, string[] texts...) { this(tag); set(atts); Add(texts); }
//	this(string tag, STRINGAA atts, DOPObject[] elems...) { this(tag); set(atts); Add(elems); }

	//	DH5LI[] _items; // listitems
//	@property void items(DH5LI[] values) { _items = values; }
//	@property DH5LI[] items() { return _items; }ss	
	override string toString() {
//		foreach(i, item; _items) add(item);
//		
		return super.toString;
	}
}
mixin(FuncH5!"LIST");

unittest {
	
	
	assert(H5LIST == "<list></list>");
}
