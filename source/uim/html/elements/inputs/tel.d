module uim.html.elements.inputs.tel;

import uim.html;

class DH5INPUTTEL: DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"tel"]`, true)); 
}
mixin(FuncH5!"INPUTTEL"); 

unittest {
	writeln("Testing ", __MODULE__);
}