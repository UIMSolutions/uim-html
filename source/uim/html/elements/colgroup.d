module uim.html.elements.colgroup;

@safe:
import uim.html;

class DH5Colgroup : DH5Obj {
	mixin(H5This!"Colgroup");
}
mixin(H5Short!"Colgroup");

unittest {
  testH5Obj(H5Colgroup, "colgroup");
}
