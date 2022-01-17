module uim.html.elements.big;

@safe:
import uim.html;

class DH5Big : DH5Obj {
	mixin(H5This!"Big");
}
mixin(H5Short!"Big");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Big,"<big></big>"));
    }} 

