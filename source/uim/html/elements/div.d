module uim.html.elements.div;

@safe:
import uim.html;

class DH5Div : DH5Obj {
	mixin(H5This!"div");
}
mixin(H5Short!"Div");

unittest {
  testH5Obj(H5Div, "div");
  
	mixin(TestH5Double!("H5Div", "div", true));	
	mixin(TestH5DoubleClasses!("H5Div", "div", true));	
}
