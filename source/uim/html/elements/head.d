module uim.html.elements.head;

import uim.html;

class DH5HEAD : DH5Obj {
protected:
	string _title;
public:
	mixin(H5This!("HEAD"));

	 DH5HEAD META(STRINGAA values) { this.add(H5META(values)); return this; }
	 	DH5HEAD BASE(STRINGAA values) { this.add(H5BASE(values)); return this; }
	 DH5HEAD LINK(STRINGAA values) { this.add(H5LINK(values)); return this; }
	 DH5HEAD LINK(string href, string media = "") { 
		if (media) return LINK(["rel":"stylesheet", "href": href, "type":"text/css", "media":media]);
		else return LINK(["rel":"stylesheet", "href": href, "type":"text/css"]);
	}
	 DH5HEAD TITLE(string content = null) { this.add(H5TITLE(content)); return this; }

	 O scripts(this O)(string[] links) { foreach(l; links) add(H5Script(["src":l])); return cast(O)this; }
	 O script(this O, T...)(T values) { add(H5Script(values)); return cast(O)this; }

}
 DH5HEAD H5HEAD() { return new DH5HEAD; }
//DH5HEAD H5HEAD(string[string] attributes) { return new DH5HEAD(attributes); }
////DH5HEAD H5HEAD(DOPObject[] elements...) { return new DH5HEAD(elements); }
//DH5HEAD H5HEAD(string[] texts...) { return new DH5HEAD(texts); }
////DH5HEAD H5HEAD(string[string] attributes, DOPObject[] elements...) { return new DH5HEAD(attributes, elements); }
//DH5HEAD H5HEAD(string[string] attributes, string[] texts...) { return new DH5HEAD(attributes, texts); }

unittest {
	
	
	assert(H5HEAD == "<head></head>");
}
