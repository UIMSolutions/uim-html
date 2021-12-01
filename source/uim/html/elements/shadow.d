module uim.html.elements.shadow;

@safe:
import uim.html;

class DH5Shadow : DH5Obj {
	mixin(H5This!"shadow");
}
mixin(H5Short!"Shadow");

unittest {
  version(uim_html) {
    assert(Assert(H5Shadow, "<shadow></shadow>"));
}}
