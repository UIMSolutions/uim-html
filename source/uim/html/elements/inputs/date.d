﻿module uim.html.elements.inputs.date;

@safe:
import uim.html;

class DH5InputDate : DH5Input {
	mixin(H5This!("Input", null, `["type":"date"]`, true)); 
}
mixin(H5Short!"InputDate");

unittest {
    assert(H5InputDate == `<input type="date">`);
}

