module uim.html.elements.script;

import uim.html;

class DH5Script : DH5Obj {
	mixin(H5This!"script");
}
mixin(FuncH5!"Script");

unittest {
	assert(H5Script == "<script></script>");
}
