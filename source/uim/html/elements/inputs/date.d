module uim.html.elements.inputs.date;

@safe:
import uim.html;

class DH5InputDate : DH5Input {
	mixin(H5This!("Input", null, `["type":"date"]`, true)); 
}
mixin(H5Short!"InputDate");

unittest {
  version(test_uim_html) {
    assert(Assert(new DH5InputDate, `<input type="date">`));
}}

