module uim.html.elements.em;
@safe:
import uim.html;

@safe class DH5Em: DH5Obj {
	mixin(H5This!"em");
}
mixin(H5Short!"Em");

unittest {
	assert(Assert(H5Em,"<em></em>"));
}

