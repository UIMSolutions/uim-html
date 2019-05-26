module uim.html.elements.command;

import uim.html;

class DH5COMMAND : DH5Obj {
	mixin(H5This!("COMMAND"));
}
mixin(FuncH5!"COMMAND");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5COMMAND == "<command></command>");
}

