﻿module uim.html.elements.strong;

@safe:
import uim.html;

// Wrapper for <strong> -  indicates that its contents have strong importance, seriousness, or urgency. 
class DH5Strong : DH5Obj {
	mixin(H5This!"strong");
}
mixin(H5Short!"Strong");

version(test_uim_html) { unittest {
    assert(H5Strong == "<strong></strong>");
}
