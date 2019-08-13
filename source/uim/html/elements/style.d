module uim.html.elements.style;

import uim.html;

class DH5Style : DH5Obj {
	mixin(H5This!("style"));
}
mixin(FuncH5!"Style");

unittest {
	
	
	writeln(H5Style);
	assert(H5Style == "<style></style>");
}
