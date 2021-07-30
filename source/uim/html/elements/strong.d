module uim.html.elements.strong;
@safe:
import uim.html;

@safe class DH5Strong : DH5Obj {
	mixin(H5This!"strong");
}
mixin(H5Short!"Strong");

unittest {
	assert(Assert(H5Strong,"<strong></strong>"));
}
