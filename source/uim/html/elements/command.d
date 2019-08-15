module uim.html.elements.command;

import uim.html;

class DH5Command : DH5Obj {
	mixin(H5This!("command"));
}
mixin(FuncH5!"Command");

unittest {
	

	assert(H5Command == "<command></command>");
}

