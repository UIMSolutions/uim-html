module uim.html.elements.meter;

@safe:
import uim.html;

class DH5Meter : DH5Obj {
	mixin(H5This!"meter");
}
mixin(H5Short!"Meter");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Meter, "<meter></meter>"));
}}
