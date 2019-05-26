module uim.html.elements.blockquote;

import uim.html;

/**
 * Mithilfe des Elements blockquote können Zitate z.B. von Fremdautoren in einem anders formatierten Absatz hervorgehoben werden. 
 */
class DH5BLOCKQUOTE : DH5Obj {
	mixin(H5This!"BLOCKQUOTE");
}
mixin(FuncH5!"BLOCKQUOTE");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5BLOCKQUOTE == "<blockquote></blockquote>");
}
