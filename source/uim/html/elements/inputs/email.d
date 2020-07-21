module uim.html.elements.inputs.email;

import uim.html;

class DH5InputEmail : DH5Input {
	mixin(H5This!("Input", null, `["type":"email"]`, true)); 
}
mixin(H5Short!"InputEmail");

unittest {
	assert(Assert(new DH5InputEmail, `<input type="email">`));
}