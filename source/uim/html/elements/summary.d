module uim.html.elements.summary;

@safe:
import uim.html;

class DH5Summary : DH5Obj {
	mixin(H5This!"summary");
}
mixin(H5Short!"Summary");

unittest {
  version(uim_html) {
    assert(Assert(H5Summary,"<summary></summary>"));
}}
