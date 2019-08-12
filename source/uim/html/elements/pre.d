module uim.html.elements.pre;

import uim.html;

/* Das Element pre erlaubt es, Text so darzustellen, wie er im Editor eingegeben wird, pre steht dabei für preformatted, also präformatiert, vorformatiert. 
 */
class DH5PRE : DH5Obj {
	mixin(H5This!("PRE"));
}
mixin(FuncH5!"PRE");

unittest {
	
	
	assert(H5PRE == "<pre></pre>");
}
