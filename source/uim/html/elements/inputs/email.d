module uim.html.elements.inputs.email;

import uim.html;

class DH5InputEMAIL : DH5Input {
	mixin(H5This!("Input", null, `["type":"email"]`, true)); 
}
mixin(FuncH5!"InputEMAIL");

unittest {
	
}