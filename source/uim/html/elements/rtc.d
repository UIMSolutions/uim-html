module uim.html.elements.rtc;

@safe:
import uim.html;

class DH5Rtc : DH5Obj {
	mixin(H5This!"rtc");
}
mixin(H5Short!"Rtc");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Rtc, "<rtc></rtc>"));
}}
