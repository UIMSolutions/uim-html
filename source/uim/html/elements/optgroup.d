module uim.html.elements.optgroup;

@safe:
import uim.html;

class DH5Optgroup : DH5Obj {
	mixin(H5This!"optgroup");

//	O option(this O)() {
//
//	}
}
mixin(H5Short!"Optgroup");

unittest {
  version(uim_html) {
    assert(Assert(H5Optgroup,"<optgroup></optgroup>"));
}}
