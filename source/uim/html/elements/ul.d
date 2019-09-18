module uim.html.elements.ul;

import uim.html;

class DH5Ul : DH5Obj {
	mixin(H5This!"ul");

	mixin(ObjValue!("DH5LI", "li", "Li"));
	mixin(MyContent!("item", "H5Li"));
	O link(this O)(string id, string[] linkClasses, string src, string title) {
		this.item(id, linkClasses, ["src":src], title); 
		return cast(O)this;
	}
}
mixin(H5Short!"Ul");

unittest {
	
	
	assert(H5Ul == "<ul></ul>");
}
