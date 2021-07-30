module uim.html.elements.inputs.email;
@safe:
import uim.html;

@safe class DH5InputEmail : DH5Input {
	mixin(H5This!("Input", null, `["type":"email"]`, true)); 
}
mixin(H5Short!"InputEmail");

unittest {
	assert(Assert(new DH5InputEmail, `<input type="email">`));
}