module uim.html.elements.label;
@safe:
import uim.html;

@safe class DH5Label : DH5Obj {
	mixin(H5This!"label");

	mixin(MyAttribute!("forId", "for"));
	unittest {
		assert(Assert(H5Label.forId("anID"), `<label for="anID"></label>`));
		assert(Assert(H5Label.forId("anID").content("text"), `<label for="anID">text</label>`));
	}
	
	mixin(MyAttribute!("form"));
	unittest {
		assert(H5Label.form("aForm") == `<label form="aForm"></label>`);
		assert(Assert(H5Label.form("aForm").content("text"), `<label form="aForm">text</label>`));
	}
}
mixin(H5Short!"Label");

unittest {
	assert(Assert(H5Label, `<label></label>`));
}
