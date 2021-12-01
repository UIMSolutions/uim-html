module uim.html.elements.map;

@safe:
import uim.html;

class DH5Map : DH5Obj {
	mixin(H5This!("map"));
}
mixin(H5Short!"Map");

unittest {
  version(uim_html) {
    assert(Assert(H5Map,"<map></map>"));
}}
