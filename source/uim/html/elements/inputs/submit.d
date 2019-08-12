module uim.html.elements.inputs.submit;

import uim.html;

class DH5INPUTSUBMIT : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"submit"]`, true)); 
}
mixin(FuncH5!"INPUTSUBMIT"); 

unittest {
	
}