module uim.html.elements.col;

@safe:
import uim.html;

class DH5Col : DH5Obj {
	mixin(H5This!"col");
}
mixin(H5Short!"Col");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Col,"<col></col>"));
    }}
