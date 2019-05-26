module uim.html.elements.nav;

import uim.html;

/**
 * NAV
 * Das nav-Element umschließt Navigationsleisten und Menüs, wobei es neben einer unsortierten Liste mit den Verweisen auch eine Überschrift oder ähnliches enthalten kann. 
 */
class DH5NAV : DH5Obj {
	mixin(H5This!("NAV"));
}
mixin(FuncH5!"NAV");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5MAP == "<map></map>");
}
 