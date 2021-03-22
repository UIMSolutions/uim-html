﻿module uim.html.elements.comment;

import uim.html;

@safe class DH5Comment : DH5Obj {
	mixin(H5This!"comment");

	override string toString() {
//		auto content = "";
//		foreach(obj; objects) content ~= obj.toString;
//		return   "<!-- %s -->".format(content);
		return super.toString;
	}
}
mixin(H5Short!"Comment");

unittest {
	assert(Assert(H5Comment,"<comment></comment>"));
}
