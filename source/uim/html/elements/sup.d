module uim.html.elements.sup;
@safe:
import uim.html;

@safe class DH5Sup : DH5Obj {
	mixin(H5This!"sup");
}
mixin(H5Short!"Sup");

unittest {
	assert(Assert(H5Sup, "<sup></sup>"));
}
