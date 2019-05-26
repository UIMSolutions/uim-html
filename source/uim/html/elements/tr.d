module uim.html.elements.tr;

import uim.html;

class DH5TR : DH5Obj {
	mixin(H5This!"TR");

//	mixin(H5ShortCut!"TH");
//	mixin(H5ShortCut!"TD");
}
mixin(FuncH5!"TR");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TR == "<tr></tr>");
}
