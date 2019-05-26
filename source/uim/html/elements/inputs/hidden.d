module uim.html.elements.inputs.hidden;

import uim.html;

class DH5INPUTHIDDEN : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"hidden"]`, true)); 
}
mixin(FuncH5!"INPUTHIDDEN"); 

unittest {
	writeln("Testing ", __MODULE__);
}