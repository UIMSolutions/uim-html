module uim.html.elements.inputs.image;

@safe:
import uim.html;

class DH5InputIMAGE : DH5Input {
	mixin(H5This!("Input", null, `["type":"image"]`, true)); 
}
mixin(H5Short!"InputIMAGE"); 

unittest {
	version(uim_html) {
		// TODO Add Test
		}}