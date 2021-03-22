module uim.html.elements.legend;

import uim.html;

@safe class DH5Legend : DH5Obj {
	mixin(H5This!"legend");
}
mixin(H5Short!"Legend");

unittest {
	assert(Assert(H5Legend,"<legend></legend>"));
}
