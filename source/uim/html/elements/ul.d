module uim.html.elements.ul;

import uim.html;

class DH5UL : DH5Obj {
	mixin(H5This!"UL");

	mixin(ObjValue!("DH5LI", "li", "Li"));
	mixin(MyContent!("item", "H5LI"));
	O link(this O)(string id, string[] linkClasses, string src, string title) {
		this.item(id, linkClasses, ["src":src], title); 
		return cast(O)this;
	}
}
mixin(FuncH5!"UL");

unittest {
	
	
	assert(H5UL == "<ul></ul>");
}
