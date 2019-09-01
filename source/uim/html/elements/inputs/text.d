module uim.html.elements.inputs.text;

import uim.html;

class DH5InputTEXT : DH5Input {
	mixin(H5This!("Input", null, `["type":"text"]`, true)); 
}
mixin(H5Short!"InputTEXT"); 

unittest {
	
}