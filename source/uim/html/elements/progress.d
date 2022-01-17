module uim.html.elements.progress;

@safe:
import uim.html;

class DH5Progress : DH5Obj {
	mixin(H5This!"progress");
}
mixin(H5Short!"Progress");

unittest {
  version(test_uim_html) {
    assert(H5Progress == "<progress></progress>");
}}
