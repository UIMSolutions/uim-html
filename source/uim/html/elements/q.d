module uim.html.elements.q;

@safe:
import uim.html;

class DH5Q : DH5Obj {
	mixin(H5This!"Q");
}
mixin(H5Short!"Q");

unittest {
  version(uim_html) {
    assert(H5Q == "<q></q>");
}}
