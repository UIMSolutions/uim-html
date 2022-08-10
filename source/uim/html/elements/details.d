module uim.html.elements.details;

@safe:
import uim.html;

class DH5Details: DH5Obj {
	mixin(H5This!"details");
}
mixin(H5Short!"Details");

unittest {
  version(test_uim_html) {
    assert(H5Details,"<details></details>"));
}}
