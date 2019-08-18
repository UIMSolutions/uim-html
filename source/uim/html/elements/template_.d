module uim.html.elements.template_;

import uim.html;

class DH5Template : DH5Obj {
	mixin(H5This!"template");
}
mixin(FuncH5!"Template");

unittest {
	assert(H5Template == "<template></template>");
}
