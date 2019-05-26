module uim.html.elements.q;

import uim.html;

class DH5Q : DH5Obj {
	mixin(H5This!"Q");
}
mixin(FuncH5!"Q");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5Q == "<q></q>");
}
