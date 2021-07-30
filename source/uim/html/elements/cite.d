module uim.html.elements.cite;
@safe:
import uim.html;

@safe class DH5Cite : DH5Obj {
	mixin(H5This!"cite");
}
mixin(H5Short!"Cite");

unittest {
	assert(Assert(H5Cite,"<cite></cite>"));
}

