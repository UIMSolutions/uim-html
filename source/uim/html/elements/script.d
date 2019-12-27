module uim.html.elements.script;

import uim.html;

class DH5Script : DH5Obj {
	mixin(H5This!"script");
}
mixin(H5Short!"Script");

unittest {
	assert(Assert(H5Script,"<script></script>"));
}
