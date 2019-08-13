module uim.html.elements.legend;

import uim.html;

class DH5Legend : DH5Obj {
	mixin(H5This!"legend");
}
mixin(FuncH5!"Legend");

unittest {
	
	
	assert(H5Legend == "<legend></legend>");
}
