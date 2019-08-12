module uim.html.elements.summary;

import uim.html;

class DH5SUMMARY : DH5Obj {
	mixin(H5This!"SUMMARY");
}
mixin(FuncH5!"SUMMARY");

unittest {
	
	
	assert(H5SUMMARY == "<summary></summary>");
}
