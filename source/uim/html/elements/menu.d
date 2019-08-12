module uim.html.elements.menu;

import uim.html;

class DH5MENU : DH5Obj {
	mixin(H5This!"MENU");
}
mixin(FuncH5!"MENU");

unittest {
	
	
	assert(H5MENU == "<menu></menu>");
}
