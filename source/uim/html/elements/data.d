module uim.html.elements.data;

import uim.html;

@safe class DH5Data : DH5Obj {
	mixin(H5This!"data");
}
mixin(H5Short!"Data");

unittest {
	assert(Assert(H5Data,"<data></data>"));
}
