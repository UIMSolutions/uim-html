module uim.html.elements.inputs.image;

import uim.html;

class DH5InputIMAGE : DH5Input {
	mixin(H5This!("Input", null, `["type":"image"]`, true)); 
}
mixin(FuncH5!"InputIMAGE"); 

unittest {
	
}