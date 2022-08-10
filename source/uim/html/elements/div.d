module uim.html.elements.div;

@safe:
import uim.html;

class DH5Div : DH5Obj {
	mixin(H5This!"div");
}
mixin(H5Short!"Div");

unittest {
  version(test_uim_html) {
    assert(H5Div,"<div></div>"));
  	assert(H5Div("content"),`<div>content</div>`));
}}
