module uim.html.elements.q;

@safe:
import uim.html;

// Wrapper for <q> - indicates that the enclosed text is a short inline quotation.
class DH5Q : DH5Obj {
	mixin(H5This!"Q");
}
mixin(H5Short!"Q");

unittest {
    assert(H5Q == "<q></q>");
}
