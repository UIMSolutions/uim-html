module uim.html.elements.body_;

@safe:
import uim.html;

class DH5Body : DH5Obj {
	mixin(H5This!("body"));

	O scripts(this O)(string[] links) { foreach(l; links) add(H5Script(["src":l])); return cast(O)this; }
	O script(this O, T...)(T values) { add(H5Script(values)); return cast(O)this; }
}
mixin(H5Short!"Body");

unittest {
  version(uim_html) {
    assert(Assert(H5Body,"<body></body>"));
		}}
