module uim.html.elements.template_;

import uim.html;

@safe class DH5Template : DH5Obj {
	mixin(H5This!"template");
}
mixin(H5Short!"Template");

unittest {
	assert(Assert(H5Template, "<template></template>"));
}
