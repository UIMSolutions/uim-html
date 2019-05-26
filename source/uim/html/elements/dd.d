module uim.html.elements.dd;

import uim.html;

/* dd-Elemente enthalten eine Beschreibung eines zu beschreibenden Ausdrucks in einer Beschreibungsliste (dd = description list data) */
class DH5DD : DH5Obj {
	mixin(H5This!"DD");
}
mixin(FuncH5!"DD");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DD == "<dd></dd>");
}
