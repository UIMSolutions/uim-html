module uim.html.elements.ruby;

import uim.html; 

@safe class DH5Ruby : DH5Obj {
	mixin(H5This!"ruby");
}
mixin(H5Short!"Ruby");

unittest {
	assert(Assert(H5Ruby,"<ruby></ruby>"));
}
