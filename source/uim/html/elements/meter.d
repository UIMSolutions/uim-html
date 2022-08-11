﻿module uim.html.elements.meter;

@safe:
import uim.html;

// Wrapper for <meter> - represents either a scalar value within a known range or a fractional value.
class DH5Meter : DH5Obj {
	mixin(H5This!"meter");
}
mixin(H5Short!"Meter");

version(test_uim_html) { unittest {
    // testH5Obj(H5Meter, "meter");
}}
