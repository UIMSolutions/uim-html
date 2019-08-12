module uim.html.elements.body_;

import uim.html;

class DH5BODY : DH5Obj {
	mixin(H5This!("BODY"));

	O scripts(this O)(string[] links) { foreach(l; links) add(H5SCRIPT(["src":l])); return cast(O)this; }
	O script(this O, T...)(T values) { add(H5SCRIPT(values)); return cast(O)this; }
}
mixin(FuncH5!"BODY");

unittest {
	

	assert(H5BODY == "<body></body>");
}
