﻿module uim.html.elements.script;

import uim.html;

class DH5Script : DH5Obj {
	mixin(H5This!"Script");

	string type = "text/javascript";

	override public string toString() {
		if (type) _attributes["type"] = type;

		return super.toString;
	}
}
mixin(FuncH5!"Script");

unittest {
	
	
	assert(H5Script == "<script type=\"text/javascript\"></script>");
}
