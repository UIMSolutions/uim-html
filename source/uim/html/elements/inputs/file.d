module uim.html.elements.inputs.file;

@safe:
import uim.html;

class DH5InputFile : DH5Input {
	mixin(H5This!("Input", null, `["type":"file"]`, true)); 
}
mixin(H5Short!"InputFile"); 

unittest {
	version(uim_html) {
		// TODO Add Test
		}}