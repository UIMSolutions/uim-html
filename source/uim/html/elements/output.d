module uim.html.elements.output;

import uim.html;

class DH5OUTPUT : DH5Obj {
	mixin(H5This!"OUTPUT");
}
mixin(FuncH5!"OUTPUT");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5OUTPUT == "<output></output>");
}
