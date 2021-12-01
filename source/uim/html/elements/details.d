module uim.html.elements.details;

@safe:
import uim.html;

class DH5Details: DH5Obj {
	mixin(H5This!"details");
}
mixin(H5Short!"Details");

unittest {
  version(uim_html) {
    assert(Assert(H5Details,"<details></details>"));
}}
