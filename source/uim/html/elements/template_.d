module uim.html.elements.template_;

@safe:
import uim.html;

class DH5Template : DH5Obj {
	mixin(H5This!"template");
}
mixin(H5Short!"Template");

unittest {
  version(uim_html) {
    assert(Assert(H5Template, "<template></template>"));
}}
