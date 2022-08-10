module uim.html.elements.figure;

@safe:
import uim.html;

/**
 * Grafiken werden oft von einem Untertitel ergänzt. 
 * Das HTML5-Element figure dient nun als semantisches Elternelement für eine zum Seiteninhalt gehörende Abbildung und das Element figcaption, das den Untertitel umschließt. 
 */
class DH5Figure : DH5Obj {
	mixin(H5This!"figure");
}
mixin(H5Short!"Figure");

unittest {
  version(test_uim_html) {
    assert(H5Figure, "<figure></figure>"));
}}
