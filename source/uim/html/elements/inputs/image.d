module uim.html.elements.inputs.image;

import uim.html;

@safe class DH5InputIMAGE : DH5Input {
	mixin(H5This!("Input", null, `["type":"image"]`, true)); 
}
mixin(H5Short!"InputIMAGE"); 

unittest {
	
}