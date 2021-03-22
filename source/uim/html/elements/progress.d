module uim.html.elements.progress;

import uim.html;

@safe class DH5Progress : DH5Obj {
	mixin(H5This!"progress");
}
mixin(H5Short!"Progress");

unittest {
	assert(Assert(H5Progress, "<progress></progress>"));
}
