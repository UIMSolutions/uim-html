module uim.html.elements.mixins;



template H5Test(string className, string tag) {
	const char[] H5Test = `
assert(Assert(`~className~`, "<`~tag~`></`~tag~`>"));`;
//
//assert(Assert(`~className~`.id("newID") == "<`~tag~` id=\"newID\"></`~tag~`>");
//assert(Assert(`~className~`.id("newID").classes(["classA", "classB"]) == "<`~tag~` id=\"newID\" class=\"classA classB\"></`~tag~`>");
//assert(Assert(`~className~`.id("newID").classes("classA", "classB") == "<`~tag~` id=\"newID\" class=\"classA classB\"></`~tag~`>");
//assert(Assert(`~className~`.id("newID").classes("classA", "classB").attributes(["a":"b"]) == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\"></`~tag~`>");
//assert(Assert(`~className~`.id("newID").classes("classA", "classB").attributes(["a":"b"]).content("content") == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\">content</`~tag~`>");
//assert(Assert(`~className~`.id("newID").attributes(["a":"b"]) == "<`~tag~` id=\"newID\" a=\"b\"></`~tag~`>");
//assert(Assert(`~className~`.id("newID").attributes(["a":"b"]).content("content") == "<`~tag~` id=\"newID\" a=\"b\">content</`~tag~`>");
//
//assert(Assert(`~className~`("someContent") == "<`~tag~`>someContent</`~tag~`>");
//assert(Assert(`~className~`(H5DIV("a"), H5DIV("b")) == "<`~tag~`><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//assert(Assert(`~className~`("newID", ["classA", "classB"]) == "<`~tag~` id=\"newID\" class=\"classA classB\"></`~tag~`>");
//assert(Assert(`~className~`("newID", ["classA", "classB"], "someContent") == "<`~tag~` id=\"newID\" class=\"classA classB\">someContent</`~tag~`>");
//assert(Assert(`~className~`("newID", ["classA", "classB"], H5DIV("a"), H5DIV("b")) == "<`~tag~` id=\"newID\" class=\"classA classB\"><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//assert(Assert(`~className~`("newID", ["a":"b", "c":"d"]) == "<`~tag~` id=\"newID\" a=\"b\" c=\"d\"></`~tag~`>");
//assert(Assert(`~className~`("newID", ["a":"b", "c":"d"], "someContent") == "<`~tag~` id=\"newID\" a=\"b\" c=\"d\">someContent</`~tag~`>");
//assert(Assert(`~className~`("newID", ["a":"b", "c":"d"], H5DIV("a"), H5DIV("b")) == "<`~tag~` id=\"newID\" a=\"b\" c=\"d\"><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//assert(Assert(`~className~`("newID", ["classA", "classB"], ["a":"b", "c":"d"]) == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\" c=\"d\"></`~tag~`>");
//assert(Assert(`~className~`("newID", ["classA", "classB"], ["a":"b", "c":"d"], "someContent") == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\" c=\"d\">someContent</`~tag~`>");
//assert(Assert(`~className~`("newID", ["classA", "classB"], ["a":"b", "c":"d"], H5DIV("a"), H5DIV("b")) == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\" c=\"d\"><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//assert(Assert(`~className~`(["classA", "classB"]) == "<`~tag~` class=\"classA classB\"></`~tag~`>");
//assert(Assert(`~className~`(["classA", "classB"], "someContent") == "<`~tag~` class=\"classA classB\">someContent</`~tag~`>");
//assert(Assert(`~className~`(["classA", "classB"], H5DIV("a"), H5DIV("b")) == "<`~tag~` class=\"classA classB\"><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//assert(Assert(`~className~`(["classA", "classB"], ["a":"b", "c":"d"]) == "<`~tag~` class=\"classA classB\" a=\"b\" c=\"d\"></`~tag~`>");
//assert(Assert(`~className~`(["classA", "classB"], ["a":"b", "c":"d"], "someContent") == "<`~tag~` class=\"classA classB\" a=\"b\" c=\"d\">someContent</`~tag~`>");
//assert(Assert(`~className~`(["classA", "classB"], ["a":"b", "c":"d"], H5DIV("a"), H5DIV("b")) == "<`~tag~` class=\"classA classB\" a=\"b\" c=\"d\"><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//assert(Assert(`~className~`(["a":"b", "c":"d"]) == "<`~tag~` a=\"b\" c=\"d\"></`~tag~`>");
//assert(Assert(`~className~`(["a":"b", "c":"d"], "someContent") == "<`~tag~` a=\"b\" c=\"d\">someContent</`~tag~`>");
//assert(Assert(`~className~`(["a":"b", "c":"d"], H5DIV("a"), H5DIV("b")) == "<`~tag~` a=\"b\" c=\"d\"><div id=\"a\"></div><div id=\"b\"></div></`~tag~`>");
//
//auto h5 = `~className~`;
//assert(Assert(h5.id("newID") == "<`~tag~` id=\"newID\"></`~tag~`>");
//assert(Assert(h5.id("newID").classes(["classA", "classB"]) == "<`~tag~` id=\"newID\" class=\"classA classB\"></`~tag~`>");
//assert(Assert(h5.id("newID").classes("classA", "classB") == "<`~tag~` id=\"newID\" class=\"classA classB\"></`~tag~`>");
//assert(Assert(h5.id("newID").classes("classA", "classB").attributes(["a":"b"]) == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\"></`~tag~`>");
//assert(Assert(h5.id("newID").classes("classA", "classB").attributes(["a":"b"]).content("content") == "<`~tag~` id=\"newID\" class=\"classA classB\" a=\"b\">content</`~tag~`>");
//
//assert(Assert(cast(D`~className~`)`~className~`);
//assert(Assert(cast(D`~className~`)`~className~`.id("newID"));
//assert(Assert(cast(D`~className~`)`~className~`.classes("classA", "classB"));
//	`;
//	pragma(msg, H5Test);
}
