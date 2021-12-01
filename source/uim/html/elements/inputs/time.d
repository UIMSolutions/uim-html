module uim.html.elements.inputs.time;

@safe:
import uim.html;

class DH5InputTIME : DH5Input {
	mixin(H5This!("Input", null, `["type":"time"]`, true)); 
}
mixin(H5Short!"InputTIME"); 

unittest {
	version(uim_html) {
		// TODO Add Test
		}}