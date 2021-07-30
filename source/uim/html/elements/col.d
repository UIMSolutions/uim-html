module uim.html.elements.col;
@safe:
import uim.html;

@safe class DH5Col : DH5Obj {
	mixin(H5This!"col");
}
mixin(H5Short!"Col");

unittest {
	assert(Assert(H5Col,"<col></col>"));
}
