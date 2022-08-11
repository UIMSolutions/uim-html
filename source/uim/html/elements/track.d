module uim.html.elements.track;

@safe:
import uim.html;

class DH5Track : DH5Obj {
	mixin(H5This!"track");
	
	mixin(MyAttribute!("isDefault", "default"));
	version(test_uim_html) { unittest {
			assert(H5Track.isDefault("true"),`<track default></track>`);
	}}

  mixin(MyAttribute!"label");
	version(test_uim_html) { unittest {
			assert(H5Track.label("aValue"),`<track label="aValue"></track>`);
	}}

  mixin(MyAttribute!"src");
	version(test_uim_html) { unittest {
			assert(H5Track.src("aValue"),`<track src="aValue"></track>`);
	}}

    mixin(MyAttribute!"srclang");
	version(test_uim_html) { unittest {
			assert(H5Track.srclang("aValue"),`<track srclang="aValue"></track>`);
	}}
}
mixin(H5Short!"Track");

version(test_uim_html) { unittest {
    assert(H5Track,`<track></track>`);
}}
