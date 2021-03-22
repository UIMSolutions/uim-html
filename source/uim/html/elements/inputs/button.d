module uim.html.elements.inputs.button;

import uim.html;

@safe class DH5InputButton : DH5Input {
	mixin(H5This!("Input", null, `["type": "button"]`)); 
}
mixin(H5Short!"InputButton");

unittest {
	
}