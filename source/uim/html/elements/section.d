module uim.html.elements.section;

@safe:
import uim.html;

class DH5Section : DH5Obj {
	mixin(H5This!("section"));
}
mixin(H5Short!"Section");

unittest {
  version(uim_html) {
    assert(Assert(H5Section,"<section></section>"));
}}
