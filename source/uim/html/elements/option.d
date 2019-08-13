module uim.html.elements.option;

import uim.html;

class DH5Option : DH5Obj {
	mixin(H5This!"option");
}
mixin(FuncH5!"Option");


enum option_modes : string {
	Default = "",
	Selected = "selected",
	Disabled = "disabled"
}

unittest {
	
	
	assert(H5Option == "<option></option>");
}

