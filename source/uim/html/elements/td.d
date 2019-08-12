module uim.html.elements.td;

import uim.html;

class DH5TD : DH5Obj {
	mixin(H5This!"TD");
}
mixin(FuncH5!"TD");

unittest {
	
	
	assert(H5TD == "<td></td>");
}
