﻿module uim.html.elements.b;

import uim.html;

/*
 * The <b> tag specifies bold text.*/
@safe class DH5B : DH5Obj {
	mixin(H5This!"b");
}	
mixin(H5Short!"B");

unittest {
	assert(Assert(H5B,"<b></b>"));
}

