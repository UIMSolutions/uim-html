﻿module uim.html.elements.td;

@safe:
import uim.html;

class DH5Td : DH5Obj {
	mixin(H5This!"td");
}
mixin(H5Short!"Td");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Td, "<td></td>"));
}}
