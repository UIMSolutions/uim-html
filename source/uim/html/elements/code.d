module uim.html.elements.code;

@safe:
import uim.html;

class DH5Code : DH5Obj {
	mixin(H5This!"code");
}
mixin(H5Short!"Code");

unittest {
  version(uim_html) {
    assert(Assert(H5Code,"<code></code>"));
    }}
