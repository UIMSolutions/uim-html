module uim.html.elements.data;

@safe:
import uim.html;

class DH5Data : DH5Obj {
	mixin(H5This!"data");
}
mixin(H5Short!"Data");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Data,"<data></data>"));
}}
