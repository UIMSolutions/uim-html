module uim.html.elements.inputs.color;

import uim.html;

@safe class DH5InputCOLOR : DH5Input {
	mixin(H5This!""); 

	override string toString() {
		this["TYPE"] = "color";
		return super.toString;
	}
}

unittest {
	
}