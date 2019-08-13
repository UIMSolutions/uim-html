module uim.html.elements.inputs.radio;

import uim.html;

class DH5InputRADIO : DH5Input {
	mixin(H5This!("Input", null, `["type":"radio"]`, true)); 
}
mixin(FuncH5!"InputRADIO"); 

unittest {
	
}