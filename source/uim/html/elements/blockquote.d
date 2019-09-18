module uim.html.elements.blockquote;

import uim.html;

/**
 * Mithilfe des Elements blockquote können Zitate z.B. von Fremdautoren in einem anders formatierten Absatz hervorgehoben werden. 
 */
class DH5Blockquote : DH5Obj {
	mixin(H5This!"blockquote");
}
mixin(H5Short!"Blockquote");

unittest {
	assert(H5Blockquote == "<blockquote></blockquote>");
}
