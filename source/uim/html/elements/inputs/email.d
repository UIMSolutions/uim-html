module uim.html.elements.inputs.email;

@safe:
import uim.html;

class DH5InputEmail : DH5Input {
	mixin(H5This!("Input", null, `["type":"email"]`, true)); 
}
mixin(H5Short!"InputEmail");

unittest {
  version(uim_html) {
    assert(Assert(new DH5InputEmail, `<input type="email">`));
}}