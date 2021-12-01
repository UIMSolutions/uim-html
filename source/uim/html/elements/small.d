module uim.html.elements.small;

@safe:
import uim.html;

class DH5Small : DH5Obj {
	mixin(H5This!"small");
}
mixin(H5Short!"Small");

unittest {
  version(uim_html) {
    assert(Assert(H5Small,"<small></small>"));
}}

