module uim.html.elements.bdo;

@safe:
import uim.html;

class DH5Bdo : DH5Obj {
	mixin(H5This!"bdo");
}
mixin(H5Short!"Bdo");

unittest {
  version(test_uim_html) {
    assert(H5Bdo,"<bdo></bdo>"));
    }}
