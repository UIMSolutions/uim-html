module uim.html.elements.content;

@safe:
import uim.html;

class DH5Content : DH5Obj {
	mixin(H5This!("content"));
}
mixin(H5Short!"Content");

unittest {
  version(test_uim_html) {
    assert(H5Content,"<content></content>"));
}}
