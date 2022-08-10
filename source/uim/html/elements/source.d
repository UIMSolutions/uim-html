module uim.html.elements.source;

@safe:
import uim.html;

class DH5Source : DH5Obj {
	mixin(H5This!"source");
	
	mixin(MyAttribute!"sizes");
	unittest {
  	version(test_uim_html) {
		assert(H5Source.sizes("aValue"),`<source sizes="aValue"></source>`));
	}}

  mixin(MyAttribute!"src");
	unittest {
	  version(test_uim_html) {		
			assert(H5Source.src("aValue"),`<source src="aValue"></source>`));
	}}

  mixin(MyAttribute!"srcset");
	unittest {
  	version(test_uim_html) {
			assert(H5Source.srcset("aValue"),`<source srcset="aValue"></source>`));
	}}

  mixin(MyAttribute!"type");
	unittest {
  	version(test_uim_html) {
			assert(H5Source.type("aValue"),`<source type="aValue"></source>`));
	}}

  mixin(MyAttribute!"media"); 
	unittest {
	  version(test_uim_html) {		
			assert(H5Source.media("aValue"),`<source media="aValue"></source>`));
	}}
}
mixin(H5Short!"Source");

unittest {
  version(test_uim_html) {
    assert(H5Source == `<source></source>`);
}}
