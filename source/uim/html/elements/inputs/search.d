module uim.html.elements.inputs.search;

import uim.html;

class DH5INPUTSEARCH : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"search"]`, true)); 
}
mixin(FuncH5!"INPUTSEARCH"); 

unittest {
	
}