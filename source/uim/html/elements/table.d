module uim.html.elements.table;

import uim.html;

class DH5Table : DH5Obj {
	mixin(H5This!"table");

	mixin(MyContent!("header", "H5THead"));
	mixin(MyContent!("body_", "H5TBody"));
	mixin(MyContent!("footer", "H5TFoot"));
	mixin(MyContent!("tr", "H5Tr"));
	mixin(MyContent!("row", "H5Tr"));
	mixin(MyContent!("colgroup", "H5Colgroup"));
	mixin(MyContent!("caption", "H5Caption"));
}
mixin(H5Short!"Table");

unittest {
	assert(H5Table == "<table></table>");
}
