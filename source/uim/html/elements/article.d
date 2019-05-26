module uim.html.elements.article;

import uim.html;

class DH5ARTICLE : DH5Obj {
	mixin(H5This!"ARTICLE");
}
mixin(FuncH5!"ARTICLE");

unittest {
	writeln("Testing ", __MODULE__);

	mixin(H5Test!("H5ARTICLE", "article"));
}
