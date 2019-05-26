module uim.html.elements.style;

import uim.html;

class DH5STYLE : DH5Obj {
	mixin(H5This!("STYLE"));
}
mixin(FuncH5!"STYLE");

unittest {
	writeln("Testing ", __MODULE__);
	
	writeln(H5STYLE);
	assert(H5STYLE == "<style></style>");
}
