module uim.html.elements.figure;
@safe:
import uim.html;

/**
 * Grafiken werden oft von einem Untertitel ergänzt. 
 * Das HTML5-Element figure dient nun als semantisches Elternelement für eine zum Seiteninhalt gehörende Abbildung und das Element figcaption, das den Untertitel umschließt. 
 */
@safe class DH5Figure : DH5Obj {
	mixin(H5This!"figure");
}
mixin(H5Short!"Figure");

unittest {
	assert(Assert(H5Figure, "<figure></figure>"));
}
