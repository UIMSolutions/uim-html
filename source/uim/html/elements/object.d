module uim.html.elements.object;

import uim.html;

class DH5OBJECT : DH5Obj {
	mixin(H5This!"OBJECT");
}
mixin(FuncH5!"OBJECT");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5OBJECT == "<object></object>");
}
