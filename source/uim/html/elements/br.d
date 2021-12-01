module uim.html.elements.br;

@safe:
import uim.html;

class DH5Br : DH5Obj {
	mixin(H5This!("br", null, null, true));
}
mixin(H5Short!("Br"));
alias Br = H5Br;

unittest {
  version(uim_html) {
    assert(Assert(H5Br,"<br>"));
    }}
