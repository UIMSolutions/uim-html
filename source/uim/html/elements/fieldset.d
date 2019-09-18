module uim.html.elements.fieldset;

import uim.html;

class DH5Fieldset : DH5Obj {
	mixin(H5This!"fieldset");
}
mixin(H5Short!"Fieldset");

unittest {
	
	
	assert(H5Fieldset == "<fieldset></fieldset>");
}
