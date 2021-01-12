module uim.html.elements.img;

import uim.html;

class DH5Img : DH5Obj {
	mixin(H5This!("img", null, null, true));
}
mixin(H5Short!("Img"));

unittest {
	assert(Assert(H5Img, "<img>"));
}

class DH5Image : DH5Obj {
	mixin(H5This!("img", null, null, true));
}
mixin(H5Short!("Image"));

unittest {
	assert(Assert(H5Image, "<img>"));
}
