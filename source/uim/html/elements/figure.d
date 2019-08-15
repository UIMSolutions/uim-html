module uim.html.elements.figure;

import uim.html;

/**
 * Grafiken werden oft von einem Untertitel ergänzt. 
 * Das HTML5-Element figure dient nun als semantisches Elternelement für eine zum Seiteninhalt gehörende Abbildung und das Element figcaption, das den Untertitel umschließt. 
 */
class DH5Figure : DH5Obj {
	mixin(H5This!"figure");
}
mixin(FuncH5!"Figure");

unittest {
	assert(H5Figure == "<figure></figure>");
}
