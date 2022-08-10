module uim.html.elements.list;

@safe:
import uim.html;

class DH5List : DH5Obj {
	mixin(H5This!("list"));

//	this(string tag, string[] texts...) { this(tag); Add(texts); }
//	this(string tag, DOPObject[] elems...) { this(tag); Add(elems); }
	
//	this(string tag, STRINGAA atts, string[] texts...) { this(tag); set(atts); Add(texts); }
//	this(string tag, STRINGAA atts, DOPObject[] elems...) { this(tag); set(atts); Add(elems); }

	//	DH5LI[] _items; // listitems
//	@property void items(DH5LI[] values) { _items = values; }
//	@property DH5LI[] items() { return _items; }	
	override string toString() {
//		foreach(i, item; _items) add(item);
//		
		return super.toString;
	}
}
mixin(H5Short!"List");

unittest {
  version(test_uim_html) {
    assert(H5List,"<list></list>"));
}}
