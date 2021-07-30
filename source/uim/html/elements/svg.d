module uim.html.elements.svg;
@safe:
import uim.html;

@safe class DH5Svg : DH5Obj {
	mixin(H5This!"svg");
}
mixin(H5Short!"Svg");

unittest {
	assert(Assert(H5Svg, "<svg></svg>"));
}
