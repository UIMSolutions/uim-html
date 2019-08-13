module uim.html.elements.table;

import uim.html;

class DH5Table : DH5Obj {
	mixin(H5This!"table");

//	mixin(H5ShortCut!"TBODY");
//	mixin(H5ShortCut!"THEAD");
//	mixin(H5ShortCut!"TR");
//	mixin(H5ShortCut!"TFOOT");
//	mixin(H5ShortCut!"CAPTION");
}
mixin(FuncH5!"Table");

unittest {
	assert(H5Table == "<table></table>");
}
