module uim.html.elements.comment;

import uim.html;

class DH5COMMENT : DH5Obj {
	mixin(H5This!"COMMENT");

	override string toString() {
//		auto content = "";
//		foreach(obj; objects) content ~= obj.toString;
//		return   "<!-- %s -->".format(content);
		return super.toString;
	}
}

mixin(FuncH5!"COMMENT");

unittest {
	

	assert(H5COMMENT == "<comment></comment>");
}
