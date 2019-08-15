module uim.html.elements.pre;

import uim.html;

/* Das Element pre erlaubt es, Text so darzustellen, wie er im Editor eingegeben wird, pre steht dabei für preformatted, also präformatiert, vorformatiert. 
 */
class DH5Pre : DH5Obj {
	mixin(H5This!("pre"));
}
mixin(FuncH5!"Pre");

unittest {
	assert(H5Pre == "<pre></pre>");
}
