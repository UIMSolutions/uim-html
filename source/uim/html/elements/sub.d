module uim.html.elements.sub;
@safe:
import uim.html;

@safe class DH5Sub : DH5Obj {
	mixin(H5This!"sub");
}
mixin(H5Short!"Sub");

unittest {
	assert(Assert(H5Sub, "<sub></sub>"));
}
