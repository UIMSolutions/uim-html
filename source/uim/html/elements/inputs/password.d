﻿module uim.html.elements.inputs.password;

import uim.html;

class DH5InputPASSWORD : DH5Input {
	mixin(H5This!("Input", null, `["type":"password"]`, true)); 
}
mixin(FuncH5!"InputPASSWORD"); 

unittest {
	
}