module uim.html.elements.inputs.radio;

import uim.html;

class DH5INPUTRADIO : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"radio"]`, true)); 
}
mixin(FuncH5!"INPUTRADIO"); 

unittest {
	
}