module uim.html.elements.caption;

import uim.html;

class DH5Caption : DH5Obj {
	mixin(H5This!"caption");
}
mixin(H5Short!"Caption");

unittest {
	assert(Assert(H5Caption,"<caption></caption>"));
}
