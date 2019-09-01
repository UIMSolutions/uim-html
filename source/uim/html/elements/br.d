module uim.html.elements.br;

import uim.html;

class DH5Br : DH5Obj {
	mixin(H5This!("br", null, null, true));
}
mixin(H5Short!("Br"));
alias Br = H5Br;

unittest {
	

	assert(H5Br == "<br>");
}
