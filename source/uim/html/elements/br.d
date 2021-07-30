module uim.html.elements.br;
@safe:
import uim.html;

@safe class DH5Br : DH5Obj {
	mixin(H5This!("br", null, null, true));
}
mixin(H5Short!("Br"));
alias Br = H5Br;

unittest {
	assert(Assert(H5Br,"<br>"));
}
