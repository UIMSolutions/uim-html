module uim.html.elements.inputs.tel;

@safe:
import uim.html;

class DH5InputTEL: DH5Input {
	mixin(H5This!("Input", null, `["type":"tel"]`, true)); 
}
mixin(H5Short!"InputTEL"); 

unittest {
	version(test_uim_html) {
		// TODO Add Test
		}}