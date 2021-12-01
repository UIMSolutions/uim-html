module uim.html.elements.em;

@safe:
import uim.html;

class DH5Em: DH5Obj {
	mixin(H5This!"em");
}
mixin(H5Short!"Em");

unittest {
  version(uim_html) {
    assert(Assert(H5Em,"<em></em>"));
}}