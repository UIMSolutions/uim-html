module uim.html.elements.inputs.datetimelocal;

import uim.html;

class DH5INPUTDATETIMELOCAL : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"datetime-local"]`)); 
}
mixin(FuncH5!"INPUTDATETIMELOCAL");

