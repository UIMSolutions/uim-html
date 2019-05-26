module uim.html.elements.footer;

import uim.html;

class DH5FOOTER : DH5Obj {
	mixin(H5This!("FOOTER"));
}
mixin(FuncH5!"FOOTER");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5FOOTER == "<footer></footer>");
}
