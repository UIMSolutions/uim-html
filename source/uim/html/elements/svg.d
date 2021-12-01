module uim.html.elements.svg;

@safe:
import uim.html;

class DH5Svg : DH5Obj {
	mixin(H5This!"svg");
}
mixin(H5Short!"Svg");

unittest {
  version(uim_html) {
    assert(Assert(H5Svg, "<svg></svg>"));
}}
