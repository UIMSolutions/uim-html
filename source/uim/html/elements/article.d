module uim.html.elements.article;

import uim.html;

class DH5Article : DH5Obj {
	mixin(H5This!"article");
}
mixin(FuncH5!"Article");

unittest {
	mixin(H5Test!("H5Article", "article"));
}
