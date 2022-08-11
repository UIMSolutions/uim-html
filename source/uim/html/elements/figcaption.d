﻿module uim.html.elements.figcaption;

@safe:
import uim.html;

// Wrapper for figcaption tag - represents a caption or legend describing the rest of the contents of its parent <figure> element.
class DH5Figcaption : DH5Obj {
	mixin(H5This!"figcaption");
}
mixin(H5Short!"Figcaption");

unittest {
  testH5Obj(H5Figcaption, "figcaption");
}
