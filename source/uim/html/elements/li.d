module uim.html.elements.li;

@safe:
import uim.html;

// List item
class DH5Li : DH5Obj {
	mixin(H5This!"li");

//	mixin(H5ShortCut!"A");
}
mixin(H5Short!"Li");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Li, "<li></li>"));
}}
