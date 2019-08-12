module uim.html.elements.th;

import uim.html;

class DH5TH : DH5Obj {
	mixin(H5This!"TH");
}
mixin(FuncH5!"TH");

unittest {
	
	
	assert(H5TH == "<th></th>");
}
