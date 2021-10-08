module uim.html.elements.object;
@safe:
import uim.html;

@safe class DH5Object : DH5Obj {
	mixin(H5This!"object");
}
mixin(H5Short!"Object");

unittest {
	assert(Assert(H5Object, "<object></object>"));
}
