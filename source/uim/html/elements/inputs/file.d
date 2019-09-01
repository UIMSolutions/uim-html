module uim.html.elements.inputs.file;

import uim.html;

class DH5InputFILE : DH5Input {
	mixin(H5This!("Input", null, `["type":"file"]`, true)); 
}
mixin(H5Short!"InputFILE"); 

unittest {
	
}