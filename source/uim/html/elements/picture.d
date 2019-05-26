module uim.html.elements.picture;

import uim.html;

class DH5PICTURE : DH5Obj {
	mixin(H5This!"PICTURE");
}
mixin(FuncH5!"PICTURE");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5PICTURE == "<picture></picture>");
}
