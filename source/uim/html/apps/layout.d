module uim.html.apps.layout;

import uim.html;

/// Page layout
 class DH5AppLayout : DH5AppObj {
	this() { super(); }
	this(DH5App anApp) { this().app(anApp); }

	mixin(XString!("preHead"));
	mixin(XString!("postHead"));
	mixin(XString!("preContent"));
	mixin(XString!("postContent"));
	mixin(XStringArray!("requires"));
	
	mixin(OString!("title"));
	
	string[] _metas;
	O metas(this O)(string value, string[] values...) { _metas ~= value; _metas ~= values; return cast(O)this;}
	O metas(this O)(string[] values) { _metas ~= values; return cast(O)this;}
	string[] metas() { 
		string[] results = _metas;
		return results;
	 }
	unittest {
		/// TODO
	}

	string[] _styles;
	O styles(this O)(string value, string[] values...) { _styles ~= value; _styles ~= values; return cast(O)this;}
	O styles(this O)(string[] values) { _styles ~= values; return cast(O)this;}
	string[] styles() { 
		string[] results = _styles;
		return results;
	 }
	unittest {
		/// TODO
	}

	string[] _libraries;
	O library(this O)(string libName, string libVersion, string libFile) { _libraries ~= `<script src="/lib/%s/%s/%s"></script>`.format(libName, libVersion, libFile); return cast(O)this;}
	O libraries(this O)(string value, string[] values...) { _libraries ~= value; _libraries ~= values; return cast(O)this;}
	O libraries(this O)(string[] values) { _libraries ~= values; return cast(O)this;}
	string[] libraries() { 
		string[] results = _libraries;
		return results;
	 }
	unittest {
		/// TODO
	}

	mixin(XString!("headPart"));
	mixin(XString!("bodyPart"));

	string opCall() { return toString(null); }
	string opCall(string content, string[string] parameters = null) { return toString(content, parameters); }
	string toString(string content, string[string] parameters = null) {
		auto result = "<!doctype html>";
		result ~= `<html lang="`~("lang" in parameters ? parameters["lang"] : "en")~`">`;
		result ~= `<html><head>`~preHead;
		result ~= postHead~`</head>`;
		result ~= `<body>`~_preContent~content~_postContent~`</body></html>`;
//		return result;

	return `<!DOCTYPE html>
<html>
  <head>
    `~this.metas.join()~("metas" in parameters ? parameters["metas"] : "")~`
    `~this.styles.join()~("styles" in parameters ? parameters["styles"] : "")~`
    <title>`~("title" in parameters ? parameters["title"] : this.title)~`</title>
  </head>
  <body>
    `~content~`    
    `~this.libraries.join()~("libraries" in parameters ? parameters["libraries"] : "")~`
  </body>
</html>`;

/*    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>*/
	}
	override string toString() {
		return toString(null, null);
	}
}
auto H5AppLayout() { return new DH5AppLayout(); }

unittest {
	/*assert(H5AppLayout()() == `<!doctype html><html lang="en"><html><head></head><body></body></html>`);
	assert(H5AppLayout()(null, ["lang":"de"]) == `<!doctype html><html lang="de"><html><head></head><body></body></html>`);
	assert(H5AppLayout()("---") == `<!doctype html><html lang="en"><html><head></head><body>---</body></html>`);
	assert(H5AppLayout().preContent("123").postContent("xyz")("---", ["lang":"de"]) == `<!doctype html><html lang="de"><html><head></head><body>123---xyz</body></html>`);
/*	assert(H5AppLayout.toString("") == "");
	assert(H5AppLayout()("") == "");
	assert(H5AppLayout.toString("test") == "test");
	assert(H5AppLayout()("test") == "test"): */
}
