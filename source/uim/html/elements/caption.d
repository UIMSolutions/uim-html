module uim.html.elements.caption;

@safe:
import uim.html;

class DH5Caption : DH5Obj {
	mixin(H5This!"caption");
}
mixin(H5Short!"Caption");

unittest {
  version(uim_html) {
    assert(Assert(H5Caption,"<caption></caption>"));
    }}
