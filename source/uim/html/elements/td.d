module uim.html.elements.td;
@safe:
import uim.html;

@safe class DH5Td : DH5Obj {
	mixin(H5This!"td");
}
mixin(H5Short!"Td");

unittest {
	assert(Assert(H5Td, "<td></td>"));
}
