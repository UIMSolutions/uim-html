module uim.html.elements.table;

import uim.html;

class DH5TABLE : DH5Obj {
	mixin(H5This!"TABLE");

//	mixin(H5ShortCut!"TBODY");
//	mixin(H5ShortCut!"THEAD");
//	mixin(H5ShortCut!"TR");
//	mixin(H5ShortCut!"TFOOT");
//	mixin(H5ShortCut!"CAPTION");
}
mixin(FuncH5!"TABLE");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TABLE == "<table></table>");
}
