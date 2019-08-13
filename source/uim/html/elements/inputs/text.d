module uim.html.elements.inputs.text;

import uim.html;

class DH5InputTEXT : DH5Input {
	mixin(H5This!("Input", null, `["type":"text"]`, true)); 
}
mixin(FuncH5!"InputTEXT"); 

unittest {
	
}