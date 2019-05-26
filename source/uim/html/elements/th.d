module uim.html.elements.th;

import uim.html;

class DH5TH : DH5Obj {
	mixin(H5This!"TH");
}
mixin(FuncH5!"TH");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TH == "<th></th>");
}
