module uim.html.elements.s;

import uim.html; 

@safe class DH5S : DH5Obj {
	mixin(H5This!"s");
}
mixin(H5Short!"S");

unittest {
	assert(Assert(H5S,"<s></s>"));
}
