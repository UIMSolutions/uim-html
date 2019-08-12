module uim.html.elements.br;

import uim.html;

class DH5BR : DH5Obj {
	mixin(H5This!("BR", null, null, true));
}
mixin(FuncH5!("BR"));
alias BR = H5BR;

unittest {
	

	assert(H5BR == "<br>");
}
