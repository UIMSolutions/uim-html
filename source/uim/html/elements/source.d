module uim.html.elements.source;

import uim.html;

@safe class DH5Source : DH5Obj {
	mixin(H5This!"source");
	
	mixin(MyAttribute!"sizes");
	unittest {
		assert(Assert(H5Source.sizes("aValue"),`<source sizes="aValue"></source>`));
	}

    mixin(MyAttribute!"src");
	unittest {
		assert(Assert(H5Source.src("aValue"),`<source src="aValue"></source>`));
	}

    mixin(MyAttribute!"srcset");
	unittest {
		assert(Assert(H5Source.srcset("aValue"),`<source srcset="aValue"></source>`));
	}

    mixin(MyAttribute!"type");
	unittest {
		assert(Assert(H5Source.type("aValue"),`<source type="aValue"></source>`));
	}

    mixin(MyAttribute!"media"); 
	unittest {
		assert(Assert(H5Source.media("aValue"),`<source media="aValue"></source>`));
	}
}
mixin(H5Short!"Source");

unittest {
	assert(Assert(H5Source,`<source></source>`));
}
