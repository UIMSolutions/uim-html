module uim.html.helpers;

@safe:@safe:
import uim.html;

/* auto pagesByNames(DH5AppPage[] pages, string[] names...) {
  return pagesByNames(pages, names); }
unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
  assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
* /}

// Get pages by names
auto pagesByNames(DH5AppPage[] pages, string[] names) {
  DH5AppPage[] results;  
  foreach(name; names) if (auto page = pageByName(pages, name)) results ~= page;
  return results; }
unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
  assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
* /
}

auto pagesByNames(DH5AppPage[string] pages, string[] names...) {
  return pagesByNames(pages, names); }
// Get pages by names
auto pagesByNames(DH5AppPage[string] pages, string[] names) {
  DH5AppPage[] results;  
  foreach(name; names) if (auto page = pageByName(pages, name)) results ~= page;
  return results; }
unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
  assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
* /
}

// Get page by name
auto pageByName(DH5AppPage[] pages, string name) {
  foreach(page; pages) if (page.name == name) return page;
  return null; }
unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
  assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
* /
}
// Get page by name
auto pageByName(DH5AppPage[string] pages, string name) {
  foreach(route, page; pages) if (page.name == name) return page;
  return null; }
unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
  assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
* /}

/* void redirectCheck(string[string] parameters) {
	writeln("Has Redirect? ", parameters.get("redirect", ""));
	if ("redirect" in parameters) redirect(parameters["redirect"]);
} */

string readLoginId(HTTPServerRequest request, STRINGAA parameters) {
  return readKeyValue("loginId", request, parameters);
}

string readSessionId(Json json, STRINGAA parameters) {
  return readKeyValue("sessionId", json, parameters);
}
string readSessionId(HTTPServerRequest request, STRINGAA parameters) {
  return readKeyValue("sessionId", request, parameters);
}

string readSiteId(Json json, STRINGAA parameters) {
  return readKeyValue("siteId", json, parameters);
}
string readSiteId(HTTPServerRequest request, STRINGAA parameters) {
  return readKeyValue("siteId", request, parameters);
}

string readKeyValue(string key, Json json, STRINGAA parameters) {
  string keyvalue;
  if (json != Json(null) && key in json) keyvalue = json[key].get!string;
  if (key in parameters) keyvalue = parameters[key];

  parameters[key] = keyvalue;
  return keyvalue;
}

string readKeyValue(string key, HTTPServerRequest request, STRINGAA parameters) {
  string keyvalue;
  if (request.session && request.session.isKeySet(key)) keyvalue = request.session.get!string(key, "");
  if (key in parameters) keyvalue = parameters[key];

  if (request.session) request.session.set(key, keyvalue);
  parameters[key] = keyvalue;
  return keyvalue;
}