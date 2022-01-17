module uim.html.elements.inputs.password;

@safe:
import uim.html;

class DH5InputPASSWORD : DH5Input {
	mixin(H5This!("Input", null, `["type":"password"]`, true)); 
}
mixin(H5Short!"InputPASSWORD"); 

unittest {
	version(test_uim_html) {
		// TODO Add Test
		}}