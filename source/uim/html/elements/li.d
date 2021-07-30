module uim.html.elements.li;
@safe:
import uim.html;

// List item
@safe class DH5Li : DH5Obj {
	mixin(H5This!"li");

//	mixin(H5ShortCut!"A");
}
mixin(H5Short!"Li");

unittest {
	assert(Assert(H5Li, "<li></li>"));
}
