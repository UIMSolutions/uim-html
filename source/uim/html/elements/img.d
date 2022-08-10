module uim.html.elements.img;

@safe:
import uim.html;

class DH5Img : DH5Obj {
	mixin(H5This!("img", null, null, true));
}
mixin(H5Short!("Img"));

unittest {
  version(test_uim_html) {
    assert(H5Img, "<img>"));
}}

class DH5Image : DH5Obj {
	mixin(H5This!("img", null, null, true));
}
mixin(H5Short!("Image"));

unittest {
  version(test_uim_html) {
    assert(H5Image, "<img>"));
}}
