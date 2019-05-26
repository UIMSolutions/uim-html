module uim.html.elements.content;

import uim.html;

class DH5CONTENT : DH5Obj {
	mixin(H5This!("CONTENT"));
}
mixin(FuncH5!"CONTENT");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5CONTENT == "<content></content>");
}
