module uim.html.elements.td;

import uim.html;

class DH5Td : DH5Obj {
	mixin(H5This!"td");
}
mixin(FuncH5!"Td");

unittest {
	assert(H5Td == "<td></td>");
}
