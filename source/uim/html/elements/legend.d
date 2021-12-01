module uim.html.elements.legend;

@safe:
import uim.html;

class DH5Legend : DH5Obj {
	mixin(H5This!"legend");
}
mixin(H5Short!"Legend");

unittest {
  version(uim_html) {
    assert(Assert(H5Legend,"<legend></legend>"));
}}
