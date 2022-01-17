module uim.html.elements.output;

@safe:
import uim.html;

class DH5Output : DH5Obj {
	mixin(H5This!"output");
}
mixin(H5Short!"Output");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Output,"<output></output>"));
}}
