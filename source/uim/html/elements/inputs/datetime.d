module uim.html.elements.inputs.datetime;

@safe:
import uim.html;

class DH5InputDATETIME : DH5Input {
	mixin(H5This!("Input", null, `["type":"datetime"]`, false)); 
}

unittest {
	version(test_uim_html) {
		// TODO Add Test
		}}