module uim.html.elements.i;

import uim.html;

@safe class DH5I : DH5Obj {
	mixin(H5This!"I");
}
mixin(H5Short!"I");

unittest {
	assert(Assert(H5I, "<i></i>"));
}
