module uim.html.elements.var;

import uim.html;

@safe class DH5Var : DH5Obj {
	mixin(H5This!"var");
}
mixin(H5Short!"Var");

unittest {
	assert(Assert(H5Var,"<var></var>"));
}
