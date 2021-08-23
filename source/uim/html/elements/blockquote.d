module uim.html.elements.blockquote;
@safe:
import uim.html;

/**
 * Mithilfe des Elements blockquote können Zitate z.B. von Fremdautoren in einem anders formatierten Absatz hervorgehoben werden. 
 */
@safe class DH5Blockquote : DH5Obj {
	mixin(H5This!"blockquote");
}
mixin(H5Short!"Blockquote");

unittest {
	assert(Assert(H5Blockquote,"<blockquote></blockquote>"));
}
