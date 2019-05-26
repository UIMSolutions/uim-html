module uim.html.templ;

import uim.html;

class DH5Template : DH5Obj {
	mixin(H5This!"T");
}

unittest {
	writeln("Testing ", __MODULE__);
}
