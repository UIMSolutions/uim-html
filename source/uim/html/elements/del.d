module uim.html.elements.del;

@safe:
import uim.html;

class DH5Del : DH5Obj {
	mixin(H5This!"del");
}
mixin(H5Short!"Del");

unittest {
  version(test_uim_html) {
    assert(H5Del,"<del></del>"));
}}
