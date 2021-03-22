module uim.html.elements.menuitem;

import uim.html;

@safe class DH5Menuitem : DH5Obj {
	mixin(H5This!"menuitem");
}
mixin(H5Short!"Menuitem");

unittest {
	assert(Assert(H5Menuitem, "<menuitem></menuitem>"));
}
