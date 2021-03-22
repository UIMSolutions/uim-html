module uim.html.elements.inputs.month;

import uim.html;

@safe class DH5InputMONTH : DH5Input {
	mixin(H5This!("Input", null, `["type":"month"]`, true)); 
}
mixin(H5Short!"InputMONTH"); 

unittest {
	
}