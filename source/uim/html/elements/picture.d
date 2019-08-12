module uim.html.elements.picture;

import uim.html;

class DH5PICTURE : DH5Obj {
	mixin(H5This!"PICTURE");
}
mixin(FuncH5!"PICTURE");

unittest {
	
	
	assert(H5PICTURE == "<picture></picture>");
}
