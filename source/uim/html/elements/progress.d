module uim.html.elements.progress;

import uim.html;

class DH5PROGRESS : DH5Obj {
	mixin(H5This!"PROGRESS");
}
mixin(FuncH5!"PROGRESS");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5PROGRESS == "<progress></progress>");
}
