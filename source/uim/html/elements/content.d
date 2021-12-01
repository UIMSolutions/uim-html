module uim.html.elements.content;

@safe:
import uim.html;

class DH5Content : DH5Obj {
	mixin(H5This!("content"));
}
mixin(H5Short!"Content");

unittest {
  version(uim_html) {
    assert(Assert(H5Content,"<content></content>"));
}}
