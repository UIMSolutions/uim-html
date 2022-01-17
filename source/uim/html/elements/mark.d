module uim.html.elements.mark;

@safe:
import uim.html;

/// HTML5 "mark" class
class DH5Mark : DH5Obj {
	mixin(H5This!"Mark");
}
mixin(H5Short!"Mark");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Mark,"<mark></mark>"));
}}
