module uim.html.elements.comment;

@safe:
import uim.html;

class DH5Comment : DH5Obj {
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
  testH5Obj(H5Comment, "comment");
}
