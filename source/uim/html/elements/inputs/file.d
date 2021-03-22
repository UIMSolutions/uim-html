module uim.html.elements.inputs.file;

import uim.html;

@safe class DH5InputFile : DH5Input {
	mixin(H5This!("Input", null, `["type":"file"]`, true)); 
}
mixin(H5Short!"InputFile"); 

unittest {
	
}