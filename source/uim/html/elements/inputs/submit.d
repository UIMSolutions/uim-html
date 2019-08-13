module uim.html.elements.inputs.submit;

import uim.html;

class DH5InputSUBMIT : DH5Input {
	mixin(H5This!("Input", null, `["type":"submit"]`, true)); 
}
mixin(FuncH5!"InputSUBMIT"); 

unittest {
	
}