module uim.html.elements.dd;

import uim.html;

/* Dd-Elemente enthalten eine Beschreibung eines zu beschreibenden Ausdrucks in einer Beschreibungsliste (Dd = description list data) */
class DH5Dd : DH5Obj {
	mixin(H5This!"dd");
}
mixin(FuncH5!"Dd");

unittest {
	assert(H5Dd == "<dd></dd>");
}
