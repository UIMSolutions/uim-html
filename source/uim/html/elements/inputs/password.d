﻿module uim.html.elements.inputs.password;

import uim.html;

@safe class DH5InputPASSWORD : DH5Input {
	mixin(H5This!("Input", null, `["type":"password"]`, true)); 
}
mixin(H5Short!"InputPASSWORD"); 

unittest {
	
}