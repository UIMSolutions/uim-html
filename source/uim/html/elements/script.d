module uim.html.elements.script;

import uim.html;

class DH5SCRIPT : DH5Obj {
	mixin(H5This!"SCRIPT");

	string type = "text/javascript";

	override public string toString() {
		if (type) _attributes["type"] = type;

		return super.toString;
	}
}
mixin(FuncH5!"SCRIPT");

unittest {
	
	
	assert(H5SCRIPT == "<script type=\"text/javascript\"></script>");
}
