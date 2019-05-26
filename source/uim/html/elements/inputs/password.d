module uim.html.elements.inputs.password;

import uim.html;

class DH5INPUTPASSWORD : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"password"]`, true)); 
}
mixin(FuncH5!"INPUTPASSWORD"); 

unittest {
	writeln("Testing ", __MODULE__);
}