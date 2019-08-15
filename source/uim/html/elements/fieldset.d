module uim.html.elements.fieldset;

import uim.html;

class DH5Fieldset : DH5Obj {
	mixin(H5This!"fieldset");
}
mixin(FuncH5!"Fieldset");

unittest {
	
	
	assert(H5Fieldset == "<fieldset></fieldset>");
}
