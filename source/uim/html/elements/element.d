module uim.html.elements.element;

@safe:
import uim.html;

class DH5Element : DH5Obj {
	mixin(H5This!"element");
}
mixin(H5Short!"Element");

unittest {
	version(uim_html) {
		assert(Assert(H5Element,"<element></element>"));
		}}