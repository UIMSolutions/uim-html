module uim.html.elements.p;

@safe:
import uim.html;

class DH5P : DH5Obj {
	mixin(H5This!("P"));
}
mixin(H5Short!"P");

unittest {
  version(uim_html) {
    assert(H5P == "<p></p>");
}}