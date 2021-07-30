module uim.html.elements.kbd;
@safe:
import uim.html;

@safe class DH5Kbd : DH5Obj {
	mixin(H5This!"kbd");
}
mixin(H5Short!"Kbd");

unittest {
	assert(Assert(H5Kbd, "<kbd></kbd>"));
}
