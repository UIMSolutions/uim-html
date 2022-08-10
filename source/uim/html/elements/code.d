module uim.html.elements.code;

@safe:
import uim.html;

// Wrapper for code tag - displays its contents styled in a fashion intended to indicate that the text is a short fragment of computer code.
class DH5Code : DH5Obj {
	mixin(H5This!"code");
}
mixin(H5Short!"Code");

unittest {
  assert(H5Code);
  assert(H5Code == "<code></code>");
}
