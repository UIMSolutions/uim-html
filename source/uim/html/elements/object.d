module uim.html.elements.object;

@safe:
import uim.html;

class DH5Object : DH5Obj {
	mixin(H5This!"object");
}
mixin(H5Short!"Object");

unittest {
  version(test_uim_html) {
    assert(H5Object, "<object></object>"));
}}
