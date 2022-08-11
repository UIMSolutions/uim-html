module uim.html.elements.dfn;

@safe:
import uim.html;

class DH5Dfn : DH5Obj {
	mixin(H5This!"dfn");
}
mixin(H5Short!"Dfn");

unittest {
  testH5Obj(H5Dfn, "dfn");
}
