module uim.html.elements.figcaption;

import uim.html;

/**
 * Grafiken werden oft von einem Untertitel ergänzt. 
 * Das HTML5-Element figure dient nun als semantisches Elternelement für eine zum Seiteninhalt gehörende Abbildung und das Element figcaption, das den Untertitel umschließt. 
 */
class DH5FIGCAPTION : DH5Obj {
	mixin(H5This!"FIGCAPTION");
}
mixin(FuncH5!"FIGCAPTION");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5FIGCAPTION == "<figcaption></figcaption>");
}


