module uim.html.elements.inputs.checkbox;

import uim.html;

class DH5INPUTCHECKBOX : DH5INPUT {
	mixin(H5This!"INPUT"); 

	override string toString() {
		this["TYPE"] = "checkbox";
		return super.toString;
	}
}
mixin(FuncH5!"INPUTCHECKBOX");

unittest {
	writeln("Testing ", __MODULE__);
}