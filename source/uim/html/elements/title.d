module uim.html.elements.title;

import uim.html;

class DH5Title : DH5Obj {
	mixin(H5This!("title"));
}
mixin(FuncH5!"Title");

unittest {
	assert(H5Title == "<title></title>");
}
