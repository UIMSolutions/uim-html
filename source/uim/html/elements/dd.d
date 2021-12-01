module uim.html.elements.dd;

@safe:
import uim.html;

/* Dd-Elemente enthalten eine Beschreibung eines zu beschreibenden Ausdrucks in einer Beschreibungsliste (Dd = description list data) */
class DH5Dd : DH5Obj {
	mixin(H5This!"dd");
}
mixin(H5Short!"Dd");

unittest {
  version(uim_html) {
    assert(Assert(H5Dd,"<dd></dd>"));
}}
