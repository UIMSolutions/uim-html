module uim.html.elements.wbr;

import uim.html;

class DH5WBR : DH5Obj {
	mixin(H5This!"WBR");
}
mixin(FuncH5!"WBR");

unittest {
	writeln("Testing ", __MODULE__);

	mixin(H5Test!("H5WBR", "wbr"));
}
