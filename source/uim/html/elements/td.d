module uim.html.elements.td;

import uim.html;

class DH5TD : DH5Obj {
	mixin(H5This!"TD");
}
mixin(FuncH5!"TD");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TD == "<td></td>");
}
