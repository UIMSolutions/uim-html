module uim.html.elements.dialog;

import uim.html;

class DH5DIALOG : DH5Obj {
	mixin(H5This!"DIALOG");
}
mixin(FuncH5!"DIALOG");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DIALOG == "<dialog></dialog>");
}
