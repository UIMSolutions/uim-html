module uim.html.elements.inputs.checkbox;

import uim.html;

class DH5InputCheckbox : DH5Input {
	mixin(H5This!"Input"); 

	override string toString() {
		this["TYPE"] = "checkbox";
		return super.toString;
	}
}
mixin(H5Short!"InputCheckbox");

unittest {
	
}