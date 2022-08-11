module uim.html.elements.var;

@safe:
import uim.html;

class DH5Var : DH5Obj {
	mixin(H5This!"var");
}
mixin(H5Short!"Var");

unittest {
    assert(H5Var,"<var></var>");
}
