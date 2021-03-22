module uim.html.elements.inputs.search;

import uim.html;

@safe class DH5InputSEARCH : DH5Input {
	mixin(H5This!("Input", null, `["type":"search"]`, true)); 
}
mixin(H5Short!"InputSEARCH"); 

unittest {
	
}