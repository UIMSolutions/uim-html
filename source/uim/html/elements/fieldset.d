module uim.html.elements.fieldset;

import uim.html;

class DH5FIELDSET : DH5Obj {
	mixin(H5This!"FIELDSET");
}
mixin(FuncH5!"FIELDSET");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5FIELDSET == "<fieldset></fieldset>");
}
