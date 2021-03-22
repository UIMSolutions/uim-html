module uim.html.elements.inputs.checkbox;

import uim.html;

@safe class DH5Checkbox : DH5Input {
	mixin(H5This!("Input", null, `["type":"checkbox"]`)); 
}
mixin(H5Short!"Checkbox");

unittest {
	
}