module uim.html.elements.inputs.text;

import uim.html;

class DH5INPUTTEXT : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"text"]`, true)); 
}
mixin(FuncH5!"INPUTTEXT"); 

unittest {
	writeln("Testing ", __MODULE__);
}