module uim.html.elements.math;

import uim.html;

@safe class DH5Math : DH5Obj {
	mixin(H5This!"math");
}
mixin(H5Short!"Math");

unittest {
	assert(Assert(H5Math,"<math></math>"));
}
