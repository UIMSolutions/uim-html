module uim.html.elements.inputs.reset;

@safe:
import uim.html;

class DH5InputRESET : DH5Input {
	mixin(H5This!("Input", null, `["type":"reset"]`, true)); 
}
mixin(H5Short!"InputRESET"); 

unittest {
	version(uim_html) {
		// TODO Add Test
		}}