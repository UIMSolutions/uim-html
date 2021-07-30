module uim.html.elements.embed;
@safe:
import uim.html;

@safe class DH5Embed : DH5Obj {
	mixin(H5This!"embed");
}
mixin(H5Short!"Embed");

unittest {
	assert(Assert(H5Embed,"<embed></embed>"));
}
