module uim.html.elements.inputs.range;
@safe:
import uim.html;

@safe class DH5InputRANGE : DH5Input {
	mixin(H5This!("Input", null, `["type":"range"]`, true)); 
}
mixin(H5Short!"InputRANGE"); 

unittest {
	
}