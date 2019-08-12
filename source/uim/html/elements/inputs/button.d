module uim.html.elements.inputs.button;

import uim.html;

class DH5INPUTButton : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type": "button"]`)); 
}
mixin(FuncH5!"INPUTButton");

unittest {
	
}