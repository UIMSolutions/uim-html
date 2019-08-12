module uim.html.elements.option;

import uim.html;

class DH5OPTION : DH5Obj {
	mixin(H5This!"OPTION");
}
mixin(FuncH5!"OPTION");


enum option_modes : string {
	Default = "",
	Selected = "selected",
	Disabled = "disabled"
}

unittest {
	
	
	assert(H5OPTION == "<option></option>");
}

