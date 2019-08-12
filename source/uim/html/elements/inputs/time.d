module uim.html.elements.inputs.time;

import uim.html;

class DH5INPUTTIME : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"time"]`, true)); 
}
mixin(FuncH5!"INPUTTIME"); 

unittest {
	
}