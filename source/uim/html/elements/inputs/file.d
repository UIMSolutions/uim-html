module uim.html.elements.inputs.file;

import uim.html;

class DH5INPUTFILE : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"file"]`, true)); 
}
mixin(FuncH5!"INPUTFILE"); 

unittest {
	writeln("Testing ", __MODULE__);
}