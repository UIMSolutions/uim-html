module uim.html.elements.strong;

@safe:
import uim.html;

class DH5Strong : DH5Obj {
	mixin(H5This!"strong");
}
mixin(H5Short!"Strong");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Strong,"<strong></strong>"));
}}
