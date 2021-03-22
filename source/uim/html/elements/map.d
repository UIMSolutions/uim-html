module uim.html.elements.map;

import uim.html;

@safe class DH5Map : DH5Obj {
	mixin(H5This!("map"));
}
mixin(H5Short!"Map");

unittest {
	assert(Assert(H5Map,"<map></map>"));
}
