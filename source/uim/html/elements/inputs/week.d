module uim.html.elements.inputs.week;

import uim.html;

class DH5InputWEEK : DH5Input {
	mixin(H5This!("Input", null, `["type":"week"]`, true)); 
}
mixin(FuncH5!"InputWEEK"); 

unittest {
	
}