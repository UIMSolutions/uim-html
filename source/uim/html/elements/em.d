module uim.html.elements.em;

@safe:
import uim.html;

class DH5Em: DH5Obj {
	mixin(H5This!"em");
}
mixin(H5Short!"Em");

unittest {
  version(test_uim_html) {
    assert(H5Em,"<em></em>"));
}}