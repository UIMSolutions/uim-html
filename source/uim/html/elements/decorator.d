module uim.html.elements.decorator;

@safe:
import uim.html;

class DH5Decorator : DH5Obj {
	mixin(H5This!("decorator"));
}
mixin(H5Short!"Decorator");

unittest {
  version(uim_html) {
    assert(Assert(H5Decorator,"<decorator></decorator>"));
}}
