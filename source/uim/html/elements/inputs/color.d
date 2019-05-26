module uim.html.elements.inputs.color;

import uim.html;

class DH5INPUTCOLOR : DH5INPUT {
	mixin(H5This!""); 

	override string toString() {
		this["TYPE"] = "color";
		return super.toString;
	}
}

unittest {
	writeln("Testing ", __MODULE__);
}