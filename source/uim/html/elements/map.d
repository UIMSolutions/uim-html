﻿module uim.html.elements.map;

@safe:
import uim.html;

class DH5Map : DH5Obj {
	mixin(H5This!("map"));
}
mixin(H5Short!"Map");

unittest {
    testH5Obj(H5Map, "map");
}
