module uim.html.elements.base;

import uim.html;

/**
 * Mithilfe des base-Elements kann die Basis für relative Verweise festgelegt werden. 
 */
class DH5BASE : DH5Obj {
	mixin(H5This!("BASE"));
}
mixin(FuncH5!"BASE");

unittest {
	

	assert(H5BASE == "<base></base>");
}
