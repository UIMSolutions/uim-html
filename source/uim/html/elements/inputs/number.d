module uim.html.elements.inputs.number;

import uim.html;

class DH5INPUTNUMBER : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"number"]`, true)); 
}
mixin(FuncH5!"INPUTNUMBER"); 

unittest {
	
}