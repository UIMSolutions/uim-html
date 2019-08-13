module uim.html.elements.inputs.time;

import uim.html;

class DH5InputTIME : DH5Input {
	mixin(H5This!("Input", null, `["type":"time"]`, true)); 
}
mixin(FuncH5!"InputTIME"); 

unittest {
	
}