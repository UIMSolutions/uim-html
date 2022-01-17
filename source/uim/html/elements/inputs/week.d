module uim.html.elements.inputs.week;

@safe:
import uim.html;

class DH5InputWEEK : DH5Input {
	mixin(H5This!("Input", null, `["type":"week"]`, true)); 
}
mixin(H5Short!"InputWEEK"); 

unittest {
	version(test_uim_html) {
		// TODO Add Test
		}}