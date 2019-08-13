module uim.html.elements.inputs.checkbox;

import uim.html;

class DH5InputCHECKBOX : DH5Input {
	mixin(H5This!"Input"); 

	override string toString() {
		this["TYPE"] = "checkbox";
		return super.toString;
	}
}
mixin(FuncH5!"InputCHECKBOX");

unittest {
	
}