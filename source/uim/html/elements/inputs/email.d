module uim.html.elements.inputs.email;

import uim.html;

class DH5INPUTEMAIL : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"email"]`, true)); 
}
mixin(FuncH5!"INPUTEMAIL");

unittest {
	writeln("Testing ", __MODULE__);
}