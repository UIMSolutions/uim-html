module uim.html.elements.del;

import uim.html;

class DH5Del : DH5Obj {
	mixin(H5This!"del");
}
mixin(H5Short!"Del");

unittest {
	assert(H5Del == "<del></del>");
}
