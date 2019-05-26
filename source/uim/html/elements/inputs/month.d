module uim.html.elements.inputs.month;

import uim.html;

class DH5INPUTMONTH : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"month"]`, true)); 
}
mixin(FuncH5!"INPUTMONTH"); 

unittest {
	writeln("Testing ", __MODULE__);
}