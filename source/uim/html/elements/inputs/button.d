module uim.html.elements.inputs.button;

import uim.html;

class DH5InputButton : DH5Input {
	mixin(H5This!("Input", null, `["type": "button"]`)); 
}
mixin(FuncH5!"InputButton");

unittest {
	
}