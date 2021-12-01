module uim.html.elements.menu;

@safe:
import uim.html;

class DH5Menu : DH5Obj {
	mixin(H5This!"menu");
}
mixin(H5Short!"Menu");

unittest {
  version(uim_html) {
    assert(Assert(H5Menu,"<menu></menu>"));
}}
