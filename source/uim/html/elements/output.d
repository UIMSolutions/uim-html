module uim.html.elements.output;
@safe:
import uim.html;

@safe class DH5Output : DH5Obj {
	mixin(H5This!"output");
}
mixin(H5Short!"Output");

unittest {
	assert(Assert(H5Output,"<output></output>"));
}
