module uim.html.elements.header;

@safe:
import uim.html;

class DH5Header : DH5Obj {
	mixin(H5This!("header"));
}
mixin(H5Short!"Header");

unittest {
  version(uim_html) {
    assert(H5Header == "<header></header>");
}}
