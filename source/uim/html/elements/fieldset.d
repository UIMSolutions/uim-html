module uim.html.elements.fieldset;

@safe:
import uim.html;

class DH5Fieldset : DH5Obj {
	mixin(H5This!"fieldset");
}
mixin(H5Short!"Fieldset");

unittest {
  version(test_uim_html) {
    assert(H5Fieldset,"<fieldset></fieldset>"));
}}
