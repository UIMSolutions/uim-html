module uim.html.elements.inputs.date;

import uim.html;

@safe class DH5InputDate : DH5Input {
	mixin(H5This!("Input", null, `["type":"date"]`, true)); 
}
mixin(H5Short!"InputDate");

unittest {
	assert(Assert(new DH5InputDate, `<input type="date">`));
}

