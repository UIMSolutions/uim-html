module uim.html.elements.main_;

import uim.html;

class DH5MAIN : DH5Obj {
	mixin(H5This!("MAIN"));
}
mixin(FuncH5!"MAIN");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5MAIN == "<main></main>");
}
