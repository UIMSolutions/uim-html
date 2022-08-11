module uim.html.elements.div;

@safe:
import uim.html;

class DH5Div : DH5Obj {
	mixin(H5This!"div");
}
mixin(H5Short!"Div");

unittest {
  testH5Obj(H5Div, "div");
  	
	assert(H5Div("content"),`<div>content</div>`);
}
