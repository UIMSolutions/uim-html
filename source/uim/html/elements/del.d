module uim.html.elements.del;

@safe:
import uim.html;

class DH5Del : DH5Obj {
	mixin(H5This!"del");
}
mixin(H5Short!"Del");

unittest {
  testH5Obj(H5Del, "del");
}
