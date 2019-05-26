module uim.html.elements.div;

import uim.html;

class DH5DIV : DH5Obj {
	mixin(H5This!"DIV");
}
mixin(FuncH5!"DIV");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DIV == "<div></div>");
	assert(H5DIV("content") == `<div>content</div>`);
}
