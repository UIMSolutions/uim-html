module uim.html.elements.inputs.color;

@safe:
import uim.html;

class DH5InputCOLOR : DH5Input {
	mixin(H5This!""); 

	override string toString() {
		this["TYPE"] = "color";
		return super.toString;
	}
}

unittest {
	version(uim_html) {
		// TODO Add Test
		}}