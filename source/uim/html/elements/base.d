module uim.html.elements.base;

import uim.html;

/**
 * Mithilfe des base-Elements kann die Basis für relative Verweise festgelegt werden. 
 */
class DH5Base : DH5Obj {
	mixin(H5This!("base"));
}
mixin(FuncH5!"Base");

unittest {
	assert(H5Base == "<base></base>");
}
