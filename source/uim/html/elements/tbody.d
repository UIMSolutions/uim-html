module uim.html.elements.tbody;

import uim.html;

class DH5TBODY : DH5Obj {
	mixin(H5This!"TBODY");
	mixin(MyContent!("row", "H5TR"));
}
mixin(H5Short!"H5TBODY");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TBODY == "<tbody></tbody>");
}
