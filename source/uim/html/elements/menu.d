module uim.html.elements.menu;

@safe:
import uim.html;

class DH5Menu : DH5Obj {
	mixin(H5This!"menu");
}
mixin(H5Short!"Menu");

version(test_uim_html) { unittest {
    assert(H5Menu == "<menu></menu>");
}
