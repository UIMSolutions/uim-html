module uim.html.elements.article;

@safe:
import uim.html;

class DH5Article : DH5Obj {
	mixin(H5This!"article");
}
mixin(H5Short!"Article");

unittest {
	mixin(H5Test!("H5Article", "article"));
}
