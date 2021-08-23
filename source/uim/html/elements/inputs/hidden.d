module uim.html.elements.inputs.hidden;
@safe:
import uim.html;

@safe class DH5InputHidden : DH5Input {
	mixin(H5This!("Input", null, `["type":"hidden"]`, true)); 
}
mixin(H5Short!"InputHidden"); 

unittest {
	
}