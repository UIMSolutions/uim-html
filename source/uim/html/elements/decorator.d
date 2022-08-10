module uim.html.elements.decorator;

@safe:
import uim.html;

class DH5Decorator : DH5Obj {
	mixin(H5This!("decorator"));
}
mixin(H5Short!"Decorator");

unittest {
  version(test_uim_html) {
    assert(H5Decorator,"<decorator></decorator>"));
}}
