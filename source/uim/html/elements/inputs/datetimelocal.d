module uim.html.elements.inputs.datetimelocal;

import uim.html;

class DH5InputDATETIMELOCAL : DH5Input {
	mixin(H5This!("Input", null, `["type":"datetime-local"]`)); 
}
mixin(FuncH5!"InputDATETIMELOCAL");

