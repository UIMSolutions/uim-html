module uim.html.elements.inputs.button;

@safe:
import uim.html;

class DH5InputButton : DH5Input {
	mixin(H5This!("Input", null, `["type": "button"]`)); 
}
mixin(H5Short!"InputButton");

unittest {
	version(uim_html) {
		// TODO Add Test
		}}