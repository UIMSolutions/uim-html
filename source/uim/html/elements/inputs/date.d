module uim.html.elements.inputs.date;

import uim.html;

class DH5InputDATE : DH5Input {
	mixin(H5This!("Input", null, `["type":"date"]`, true)); 
}

unittest {
	

	assert((new DH5InputDATE).toString == "<input type=\"date\">");
}

