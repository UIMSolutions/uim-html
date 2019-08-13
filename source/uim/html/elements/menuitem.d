module uim.html.elements.menuitem;

import uim.html;

class DH5Menuitem : DH5Obj {
	mixin(H5This!"menuitem");
}
mixin(FuncH5!"Menuitem");

unittest {
	
	
	assert(H5Menuitem == "<menuitem></menuitem>");
}
