module uim.html.elements.inputs.submit;

import uim.html;

@safe class DH5InputSUBMIT : DH5Input {
	mixin(H5This!("Input", null, `["type":"submit"]`, true)); 
}
mixin(H5Short!"InputSUBMIT"); 

unittest {
	
}