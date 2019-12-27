module uim.html.elements.ul;

import uim.html;

class DH5Ul : DH5Obj {
	mixin(H5This!"ul");

	mixin(MyContent!("li", "H5Li"));
	unittest {
		assert(Assert(H5Ul.li, "<ul><li></li></ul>"));
	}

	mixin(MyContent!("item", "H5Li"));
	unittest {
		assert(Assert(H5Ul.item, "<ul><li></li></ul>"));
	}

	O link(this O)(string id, string[] linkClasses, string src, string title) {
		this.item(id, linkClasses, ["src":src], title); 
		return cast(O)this;
	}
}
mixin(H5Short!"Ul");

unittest {
	assert(Assert(H5Ul, "<ul></ul>"));
}
