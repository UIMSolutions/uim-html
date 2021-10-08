module uim.html.elements.inputs.text;
@safe:
import uim.html;

@safe class DH5InputText : DH5Input {
	mixin(H5This!("Input", null, `["type":"text"]`, true)); 
}
mixin(H5Short!"InputText"); 

unittest {
	
}