module uim.html.elements.inputs.button;

import uim.html;

class DH5INPUTBUTTON : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type": "button"]`)); 
}
mixin(FuncH5!"INPUTBUTTON");

unittest {
	writeln("Testing ", __MODULE__);
}