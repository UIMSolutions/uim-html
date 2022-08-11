module uim.html.elements.u;

@safe:
import uim.html;

class DH5U : DH5Obj {
	mixin(H5This!"u");
}
mixin(H5Short!"U");

version(test_uim_html) { unittest {
    // assert(H5U,"<u></u>");
}}
