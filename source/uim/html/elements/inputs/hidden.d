module uim.html.elements.inputs.hidden;

import uim.html;

@safe class DH5InputHIDDEN : DH5Input {
	mixin(H5This!("Input", null, `["type":"hidden"]`, true)); 
}
mixin(H5Short!"InputHIDDEN"); 

unittest {
	
}