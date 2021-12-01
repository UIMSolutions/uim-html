module uim.html.elements.title;

@safe:
import uim.html;

class DH5Title : DH5Obj {
	mixin(H5This!("title"));
}
mixin(H5Short!"Title");

unittest {
  version(uim_html) {
    assert(Assert(H5Title, "<title></title>"));
}}
