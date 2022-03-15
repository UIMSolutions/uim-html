module uim.html.elements.option;

@safe:
import uim.html;

class DH5Option : DH5Obj {
	mixin(H5This!"option");

	mixin(MyAttribute!("disabled", "disabled"));
	mixin(MyAttribute!("selected", "selected"));
	mixin(MyAttribute!("value", "value"));
}
mixin(H5Short!"Option");

enum option_modes : string {
	Default = "",
	Selected = "selected",
	Disabled = "disabled"
}

unittest {
  version(test_uim_html) {
    assert(H5Option == "<option></option>");
}}

