﻿module uim.html.elements.nav;

import uim.html;

/**
 * Nav
 * Das nav-Element umschließt Navigationsleisten und Menüs, wobei es neben einer unsortierten Liste mit den Verweisen auch eine Überschrift oder ähnliches enthalten kann. 
 */
@safe class DH5Nav : DH5Obj {
	mixin(H5This!("nav"));
}
mixin(H5Short!"Nav");

unittest {
	assert(Assert(H5Nav,"<nav></nav>"));
}
 