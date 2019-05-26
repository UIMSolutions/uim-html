module uim.html.elements.legend;

import uim.html;

class DH5LEGEND : DH5Obj {
	mixin(H5This!"LEGEND");
}
mixin(FuncH5!"LEGEND");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5LEGEND == "<legend></legend>");
}
