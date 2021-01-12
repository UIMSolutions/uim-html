module uim.html.helpers;

import uim.html;

	auto pagesByNames(DH5AppPage[] pages, string[] names...) {
		return pagesByNames(pages, names); }
	unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
 */}

	// Get pages by names
	auto pagesByNames(DH5AppPage[] pages, string[] names) {
    DH5AppPage[] results;  
		foreach(name; names) if (auto page = pageByName(pages, name)) results ~= page;
		return results; }
	unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
 */
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
 */
  }

	// Get page by name
	auto pageByName(DH5AppPage[] pages, string name) {
		foreach(page; pages) if (page.name == name) return page;
		return null; }
	unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
 */
  }
 	// Get page by name
	auto pageByName(DH5AppPage[string] pages, string name) {
		foreach(route, page; pages) if (page.name == name) return page;
		return null; }
	unittest {
/* 		assert(H5App.pages("test", "testcontent").pages.pageByName("test").name == "test");	
		assert(H5App.pages("test", "testcontent").pages("test2", "testcontent").pages.pageByName("test").name == "test");	
 */}
