module uim.html.elements.strong;

import uim.html;

class DH5STRONG : DH5Obj {
	mixin(H5This!"STRONG");
}
mixin(FuncH5!"STRONG");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5STRONG == "<strong></strong>");
}
