﻿module uim.html.elements.bdo;

@safe:
import uim.html;

// Wrapper for the bdo tag - overrides the current directionality of text, so that the text within is rendered in a different direction.
class DH5Bdo : DH5Obj {
	mixin(H5This!"bdo");
}
mixin(H5Short!"Bdo");

unittest {
  assert(H5Bdo == "<bdo></bdo>");
}
