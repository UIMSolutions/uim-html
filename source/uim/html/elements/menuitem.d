module uim.html.elements.menuitem;

import uim.html;

class DH5MENUITEM : DH5Obj {
	mixin(H5This!"MENUITEM");
}
mixin(FuncH5!"MENUITEM");

unittest {
	
	
	assert(H5MENUITEM == "<menuitem></menuitem>");
}
