module uim.html.elements.inputs.search;

import uim.html;

class DH5InputSEARCH : DH5Input {
	mixin(H5This!("Input", null, `["type":"search"]`, true)); 
}
mixin(FuncH5!"InputSEARCH"); 

unittest {
	
}