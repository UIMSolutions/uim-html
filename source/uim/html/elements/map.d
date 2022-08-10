module uim.html.elements.map;

@safe:
import uim.html;

class DH5Map : DH5Obj {
	mixin(H5This!("map"));
}
mixin(H5Short!"Map");

unittest {
  version(test_uim_html) {
    assert(H5Map,"<map></map>"));
}}
