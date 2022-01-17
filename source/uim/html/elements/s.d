module uim.html.elements.s;

@safe:
import uim.html; 

class DH5S : DH5Obj {
	mixin(H5This!"s");
}
mixin(H5Short!"S");

unittest {
  version(test_uim_html) {
    assert(H5S == "<s></s>");
}}
