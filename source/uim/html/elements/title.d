module uim.html.elements.title;

import uim.html;

class DH5TITLE : DH5Obj {
	mixin(H5This!("TITLE"));
}
mixin(FuncH5!"TITLE");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TITLE == "<title></title>");
}
