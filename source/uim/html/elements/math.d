module uim.html.elements.math;

@safe:
import uim.html;

class DH5Math : DH5Obj {
	mixin(H5This!"math");
}
mixin(H5Short!"Math");

unittest {
  version(uim_html) {
    assert(Assert(H5Math,"<math></math>"));
}}
