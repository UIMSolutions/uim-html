module uim.html.elements.inputs.time;

import uim.html;

class DH5InputTIME : DH5Input {
	mixin(H5This!("Input", null, `["type":"time"]`, true)); 
}
mixin(H5Short!"InputTIME"); 

unittest {
	
}