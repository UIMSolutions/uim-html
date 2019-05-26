module uim.html.elements.inputs.image;

import uim.html;

class DH5INPUTIMAGE : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"image"]`, true)); 
}
mixin(FuncH5!"INPUTIMAGE"); 

unittest {
	writeln("Testing ", __MODULE__);
}