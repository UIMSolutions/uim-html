module uim.html.elements.meter;

import uim.html;

@safe class DH5Meter : DH5Obj {
	mixin(H5This!"meter");
}
mixin(H5Short!"Meter");

unittest {
	assert(Assert(H5Meter, "<meter></meter>"));
}
