module uim.html.elements.dialog;

@safe:
import uim.html;

class DH5Dialog : DH5Obj {
	mixin(H5This!"dialog");
}
mixin(H5Short!"Dialog");

unittest {
  version(uim_html) {
    assert(H5Dialog == "<dialog></dialog>");
}}
