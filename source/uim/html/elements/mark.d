module uim.html.elements.mark;
@safe:
import uim.html;

/// HTML5 "mark" @safe class
@safe class DH5Mark : DH5Obj {
	mixin(H5This!"Mark");
}
mixin(H5Short!"Mark");

unittest {
	assert(Assert(H5Mark,"<mark></mark>"));
}
