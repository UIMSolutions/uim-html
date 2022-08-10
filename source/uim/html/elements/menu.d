module uim.html.elements.menu;

@safe:
import uim.html;

class DH5Menu : DH5Obj {
	mixin(H5This!"menu");
}
mixin(H5Short!"Menu");

unittest {
  version(test_uim_html) {
    assert(H5Menu,"<menu></menu>"));
}}
