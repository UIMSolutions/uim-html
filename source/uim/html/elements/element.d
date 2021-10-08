module uim.html.elements.element;
@safe:
import uim.html;

@safe class DH5Element : DH5Obj {
	mixin(H5This!"element");
}
mixin(H5Short!"Element");

unittest {
	assert(Assert(H5Element,"<element></element>"));
}