module uim.html.elements.option;

import uim.html;

class DH5Option : DH5Obj {
	mixin(H5This!"option");
}
mixin(H5Short!"Option");


enum option_modes : string {
	Default = "",
	Selected = "selected",
	Disabled = "disabled"
}

unittest {
	assert(Assert(H5Option,"<option></option>"));
}

