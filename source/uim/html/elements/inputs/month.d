module uim.html.elements.inputs.month;

import uim.html;

class DH5InputMONTH : DH5Input {
	mixin(H5This!("Input", null, `["type":"month"]`, true)); 
}
mixin(FuncH5!"InputMONTH"); 

unittest {
	
}