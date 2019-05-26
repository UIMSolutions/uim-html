module uim.html.elements.inputs.range;

import uim.html;

class DH5INPUTRANGE : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"range"]`, true)); 
}
mixin(FuncH5!"INPUTRANGE"); 

unittest {
	writeln("Testing ", __MODULE__);
}