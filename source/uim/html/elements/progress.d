module uim.html.elements.progress;

import uim.html;

class DH5Progress : DH5Obj {
	mixin(H5This!"progress");
}
mixin(FuncH5!"Progress");

unittest {
	assert(H5Progress == "<progress></progress>");
}
