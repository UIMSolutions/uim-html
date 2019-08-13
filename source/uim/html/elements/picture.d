module uim.html.elements.picture;

import uim.html;

class DH5Picture : DH5Obj {
	mixin(H5This!"picture");
}
mixin(FuncH5!"Picture");

unittest {
	assert(H5Picture == "<picture></picture>");
}
