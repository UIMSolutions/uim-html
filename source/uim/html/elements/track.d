module uim.html.elements.track;

@safe:
import uim.html;

class DH5Track : DH5Obj {
	mixin(H5This!"track");
	
	mixin(MyAttribute!("isDefault", "default"));
	unittest {
		version(test_uim_html) {
			assert(Assert(H5Track.isDefault("true"),`<track default></track>`));
	}}

  mixin(MyAttribute!"label");
	unittest {
	  version(test_uim_html) {
			assert(Assert(H5Track.label("aValue"),`<track label="aValue"></track>`));
	}}

  mixin(MyAttribute!"src");
	unittest {
		version(test_uim_html) {
			assert(Assert(H5Track.src("aValue"),`<track src="aValue"></track>`));
	}}

    mixin(MyAttribute!"srclang");
	unittest {
	  version(test_uim_html) {
			assert(Assert(H5Track.srclang("aValue"),`<track srclang="aValue"></track>`));
	}}
}
mixin(H5Short!"Track");

unittest {
  version(test_uim_html) {
    assert(Assert(H5Track,`<track></track>`));
}}
