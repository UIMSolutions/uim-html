module uim.html.elements.small;
@safe:
import uim.html;

@safe class DH5Small : DH5Obj {
	mixin(H5This!"small");
}
mixin(H5Short!"Small");

unittest {
	assert(Assert(H5Small,"<small></small>"));
}

