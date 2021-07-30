module uim.html.elements.param;
@safe:
import uim.html;

@safe class DH5Param : DH5Obj {
	mixin(H5This!"param");
}
mixin(H5Short!"Param");

unittest {
	assert(Assert(H5Param, "<param></param>"));
}
