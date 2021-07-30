module uim.html.elements.main_;
@safe:
import uim.html;

@safe class DH5Main : DH5Obj {
	mixin(H5This!("main"));
}
mixin(H5Short!"Main");

unittest {
	assert(Assert(H5Main, "<main></main>"));
}
