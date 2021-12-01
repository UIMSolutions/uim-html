module uim.html.elements.b;

@safe:
import uim.html;

/*
 * The <b> tag specifies bold text.*/
class DH5B : DH5Obj {
	mixin(H5This!"b");
}	
mixin(H5Short!"B");

unittest {
  version(uim_html) {
    assert(Assert(H5B,"<b></b>"));
    }}

