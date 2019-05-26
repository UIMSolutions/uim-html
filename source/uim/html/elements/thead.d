module uim.html.elements.thead;

import uim.html;

class DH5THEAD : DH5Obj {
	mixin(H5This!"THEAD");
	mixin(MyContent!("row", "H5TR"));
}
mixin(FuncH5!"THEAD");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5THEAD == "<thead></thead>");
}
