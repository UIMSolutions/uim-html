module uim.html.elements.meter;

import uim.html;

class DH5METER : DH5Obj {
	mixin(H5This!"METER");
}
mixin(FuncH5!"METER");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5METER == "<meter></meter>");
}
