module uim.html.elements.dialog;
@safe:
import uim.html;

@safe class DH5Dialog : DH5Obj {
	mixin(H5This!"dialog");
}
mixin(H5Short!"Dialog");

unittest {
	assert(Assert(H5Dialog,"<dialog></dialog>"));
}
