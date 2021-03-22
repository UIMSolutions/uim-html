module uim.html.elements.content;

import uim.html;

@safe class DH5Content : DH5Obj {
	mixin(H5This!("content"));
}
mixin(H5Short!"Content");

unittest {
	assert(Assert(H5Content,"<content></content>"));
}
