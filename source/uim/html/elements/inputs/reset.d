module uim.html.elements.inputs.reset;

import uim.html;

class DH5INPUTRESET : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"reset"]`, true)); 
}
mixin(FuncH5!"INPUTRESET"); 

unittest {
	writeln("Testing ", __MODULE__);
}