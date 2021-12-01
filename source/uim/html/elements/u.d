module uim.html.elements.u;

@safe:
import uim.html;

class DH5U : DH5Obj {
	mixin(H5This!"u");
}
mixin(H5Short!"U");

unittest {
  version(uim_html) {
    assert(Assert(H5U,"<u></u>"));
}}
