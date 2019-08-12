module uim.html.elements.command;

import uim.html;

class DH5COMMAND : DH5Obj {
	mixin(H5This!("COMMAND"));
}
mixin(FuncH5!"COMMAND");

unittest {
	

	assert(H5COMMAND == "<command></command>");
}

