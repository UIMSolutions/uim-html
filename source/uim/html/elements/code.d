module uim.html.elements.code;

@safe:
import uim.html;

class DH5Code : DH5Obj {
	mixin(H5This!"code");
}
mixin(H5Short!"Code");

unittest {
  version(test_uim_html) {
    assert(H5Code,"<code></code>"));
    }}
