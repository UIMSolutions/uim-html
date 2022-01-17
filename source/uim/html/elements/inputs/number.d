module uim.html.elements.inputs.number;

@safe:
import uim.html;

class DH5InputNUMBER : DH5Input {
	mixin(H5This!("Input", null, `["type":"number"]`, true)); 
}
mixin(H5Short!"InputNUMBER"); 

unittest {
	version(test_uim_html) {
		// TODO Add Test
		}}