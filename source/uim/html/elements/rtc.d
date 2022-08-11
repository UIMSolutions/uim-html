module uim.html.elements.rtc;

@safe:
import uim.html;

class DH5Rtc : DH5Obj {
	mixin(H5This!"rtc");
}
mixin(H5Short!"Rtc");

version(test_uim_html) { unittest {
    assert(H5Rtc == "<rtc></rtc>");
}}
