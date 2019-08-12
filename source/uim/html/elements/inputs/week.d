module uim.html.elements.inputs.week;

import uim.html;

class DH5INPUTWEEK : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"week"]`, true)); 
}
mixin(FuncH5!"INPUTWEEK"); 

unittest {
	
}