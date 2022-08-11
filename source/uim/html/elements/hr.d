﻿module uim.html.elements.hr;

@safe:
import uim.html;

class DH5Hr : DH5Obj {
	mixin(H5This!"hr");
}
mixin(H5Short!"Hr");
alias Hr = H5Hr;

unittest {
  testH5Obj(H5Hr, "hr");
}
