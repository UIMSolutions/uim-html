module uim.html.elements.samp;

import uim.html;

class DH5SAMP : DH5Obj {
	mixin(H5This!"SAMP");
}
mixin(FuncH5!"SAMP");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5SAMP == "<samp></samp>");
}
