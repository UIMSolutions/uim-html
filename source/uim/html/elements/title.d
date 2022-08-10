module uim.html.elements.title;

@safe:
import uim.html;

class DH5Title : DH5Obj {
	mixin(H5This!("title"));
}
mixin(H5Short!"Title");

unittest {
  version(test_uim_html) {
    assert(H5Title, "<title></title>"));
}}
