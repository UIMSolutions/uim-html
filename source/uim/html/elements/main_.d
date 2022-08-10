module uim.html.elements.main_;

@safe:
import uim.html;

class DH5Main : DH5Obj {
	mixin(H5This!("main"));
}
mixin(H5Short!"Main");

unittest {
  version(test_uim_html) {
    assert(H5Main, "<main></main>"));
}}
