﻿module uim.html.elements.inputs.checkbox;

@safe:
import uim.html;

class DH5Checkbox : DH5Input {
	mixin(H5This!("Input", null, `["type":"checkbox"]`)); 
}
mixin(H5Short!"Checkbox");

unittest {
	version(uim_html) {
		// TODO Add Test
		}}