module uim.html.elements.svg;

@safe:
import uim.html;

class DH5Svg : DH5Obj {
	mixin(H5This!"svg");
}
mixin(H5Short!"Svg");

unittest {
  version(test_uim_html) {
    assert(H5Svg, "<svg></svg>"));
}}
