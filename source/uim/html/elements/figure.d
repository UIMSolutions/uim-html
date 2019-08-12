module uim.html.elements.figure;

import uim.html;

/**
 * Grafiken werden oft von einem Untertitel ergänzt. 
 * Das HTML5-Element figure dient nun als semantisches Elternelement für eine zum Seiteninhalt gehörende Abbildung und das Element figcaption, das den Untertitel umschließt. 
 */
class DH5FIGURE : DH5Obj {
	mixin(H5This!"FIGURE");
}
mixin(FuncH5!"FIGURE");

unittest {
	
	
	assert(H5FIGURE == "<figure></figure>");
}
