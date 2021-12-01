module uim.html.elements.inputs.text;

@safe:
import uim.html;

class DH5InputText : DH5Input {
	mixin(H5This!("Input", null, `["type":"text"]`, true)); 
}
mixin(H5Short!"InputText"); 

unittest {
	version(uim_html) {
		// TODO Add Test
		}}