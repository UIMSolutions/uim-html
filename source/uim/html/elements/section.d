module uim.html.elements.section;

import uim.html;

class DH5SECTION : DH5Obj {
	mixin(H5This!("SECTION"));
}
mixin(FuncH5!"SECTION");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5SECTION == "<section></section>");
}
