module uim.html.elements.inputs.date;

import uim.html;

class DH5INPUTDATE : DH5INPUT {
	mixin(H5This!("INPUT", null, `["type":"date"]`, true)); 
}

unittest {
	

	assert((new DH5INPUTDATE).toString == "<input type=\"date\">");
}

