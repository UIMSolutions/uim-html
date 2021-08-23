module uim.html.elements.inputs.datetime;
@safe:
import uim.html;

@safe class DH5InputDATETIME : DH5Input {
	mixin(H5This!("Input", null, `["type":"datetime"]`, false)); 
}

unittest {
	
}