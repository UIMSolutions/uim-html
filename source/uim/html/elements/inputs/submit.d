module uim.html.elements.inputs.submit;

@safe:
import uim.html;

class DH5InputSUBMIT : DH5Input {
	mixin(H5This!("Input", null, `["type":"submit"]`, true)); 
}
mixin(H5Short!"InputSUBMIT"); 

unittest {
	version(test_uim_html) {
		// TODO Add Test
		}}