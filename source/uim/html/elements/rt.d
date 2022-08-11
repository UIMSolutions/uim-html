module uim.html.elements.rt;

@safe:
import uim.html;

class DH5Rt : DH5Obj {
	mixin(H5This!"rt");
}
mixin(H5Short!"Rt");

version(test_uim_html) { unittest {
    assert(H5Rt,"<rt></rt>");
}}
