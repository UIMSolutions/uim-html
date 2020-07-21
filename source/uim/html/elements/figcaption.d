module uim.html.elements.figcaption;

import uim.html;

/**
 * Grafiken werden oft von einem Untertitel ergänzt. 
 * Das HTML5-Element figure dient nun als semantisches Elternelement für eine zum Seiteninhalt gehörende Abbildung und das Element figcaption, das den Untertitel umschließt. 
 */
class DH5Figcaption : DH5Obj {
	mixin(H5This!"figcaption");
}
mixin(H5Short!"Figcaption");

unittest {
	assert(Assert(H5Figcaption,"<figcaption></figcaption>"));
}


