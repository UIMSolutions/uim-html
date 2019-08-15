module uim.html.elements.summary;

import uim.html;

class DH5Summary : DH5Obj {
	mixin(H5This!"summary");
}
mixin(FuncH5!"Summary");

unittest {
	assert(H5Summary == "<summary></summary>");
}
