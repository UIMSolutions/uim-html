module uim.html.apps.manifest;
@safe:
import uim.html;

  @safe class DH5AppManifest : DH5AppObj {
	this() { super(); }
	this(DH5App anApp) { this().app(anApp); }
	this(string aName) { this().name(aName); }
	this(DH5App anApp, string aName) { this().app(anApp).name(aName); }

	/**
	 * backgroundColor
	 * Type: string
	 * Description: A placeholder background color for the application page to display before its stylesheet is loaded. 
	 * This value is used by the user agent to draw the background color of a shortcut when the manifest is available before the stylesheet has loaded.
	 */
	mixin(OProperty!("string", "backgroundColor"));
	unittest {
		assert(H5AppManifest.backgroundColor("blue").backgroundColor == "blue");
		assert(H5AppManifest.backgroundColor("blue").backgroundColor("red").backgroundColor == "red");
	}

	/**
	 * categories - defining the names of categories that the application supposedly belongs to. 
	 * Examples for categories (W3C) are "books", "business", "education", "entertainment", "finance", "fitness",
	 * "food", "games", "government", "health", "kids", "lifestyle", "magazines", "medical", "music", "navigation",
	 * "news", "personalization", "photo", "politics", "productivity", "security", "shopping", "social", "sports",
	 * "travel", "utilities", "weather" and vendor-specific values.
	 */
	protected string[] _categories;
	/* protected O category(this O)(string addCategory) { if (!_categories.has(addCategory)) _categories ~= addCategory; return cast(O)this; }
	/// Work with categories
	auto categories() { return _categories; } 
	O categories(this O)(string[] addCategories...) { foreach(cat; addCategories) this.category(cat); return cast(O)this; }
	O categories(this O)(string[] addCategories) { foreach(cat; addCategories) this.category(cat); return cast(O)this; }
	O clearCategories(this O)() { _categories = null; return cast(O)this; }
	unittest {
		assert(H5AppManifest.categories(["tool", "www"]).categories == ["tool", "www"]);
		assert(H5AppManifest.categories(["tool", "www"]).categories("map").categories == ["tool", "www", "map"]);
	}
*/
	/**
	 * description - string in which developers can explain what the application does. 
	 * description is directionality-capable
	 */
	mixin(OProperty!("string", "description"));
	unittest {
		assert(H5AppManifest.description("This is an app").description == "This is an app");
		assert(H5AppManifest.description("This is an app").description("This is a second app").description == "This is a second app");
	}
		
	/**
	 * dir - base direction in which to display direction-capable members of the manifest.
	 * Direction-capable members are name, short_name and _description
	 * Valid values are "auto", "ltr" and "rtl"
	 */
	mixin(OProperty!("string", "dir"));
	unittest {
		assert(H5AppManifest.dir("auto").dir == "auto");
	}
		
	/**
	 * display - determines the developers’ preferred display mode for the website.
	 * Valid values are
	 *   "fullscreen"	- All of the available display area is used and no user agent chrome is shown.
	 *   "standalone"	- Application will look and feel like a standalone application. This can include the application having a different window, its own icon in the application launcher, etc. 
	 *                  In this mode, the user agent will exclude UI elements for controlling navigation, but can include other UI elements such as a status bar.	
   *   "minimal-ui"	- Application will look and feel like a standalone application, but will have a minimal set of UI elements for controlling navigation. The elements will vary by browser.	
   *   "browser"	  - (Default) Application opens in a conventional browser tab or new window, depending on the browser and platform. 	
	 */
	mixin(OProperty!("string", "display"));
	unittest {
		assert(H5AppManifest.display("fullscreen").display == "fullscreen");
	}
		
	/**
	 * iarcRatingId - string that represents the International Age Rating Coalition (IARC) certification code of the web application. 
	 * It is intended to be used to determine which ages the web application is appropriate for.
	 */
	protected string _iarcRatingId;
	auto iarcRatingId() { return _iarcRatingId; } 
	O iarcRatingId(this O)(UUID newIarcRatingId) { iarcRatingId(newIarcRatingId.toString); return cast(O)this; }
	O iarcRatingId(this O)(string newIarcRatingId) { _iarcRatingId = newIarcRatingId; return cast(O)this; }
	unittest {
		assert(H5AppManifest.iarcRatingId("1768d43e-73a7-41c7-90fe-fe2e5ea3b7a2").iarcRatingId == "1768d43e-73a7-41c7-90fe-fe2e5ea3b7a2");
	}

	/**
	 * icons - specifies an array of objects representing image files that can serve as application icons for different contexts.
	 *         Object members are
	 *         # sizes   - A string containing space-separated image dimensions. 
	 *         # src	   - The path to the image file. If src is a relative URL, the base URL will be the URL of the manifest.
	 *         # type	   - A hint as to the media type of the image. The purpose of this member is to allow a user agent to quickly ignore images with media types it does not support.
	 *         # purpose - Defines the purpose of the image, for example if the image is intended to serve some special purpose in the context of the host OS (i.e., for better integration).
	 *                     Valid values are 
	 *                     "badge": A user agent can present this icon where space constraints and/or color requirements differ from those of the application icon.
	 *                     "maskable": The image is designed with icon masks and safe zone in mind, such that any part of the image outside the safe zone can safely be ignored and masked away by the user agent.
	 *                     "any": (Default) The user agent is free to display the icon in any context.
	 */
	protected string[string][] _icons;
	auto icons() { return _icons; } 
	O icons(this O)(string[string][] addIcons...) { _icons ~= addIcons; return cast(O)this; }
	O icons(this O)(string[string][] addIcons) { _icons ~= addIcons; return cast(O)this; }
	O clearIcons(this O)() { _icons = null; return cast(O)this; }
	unittest {
		assert(H5AppManifest.icons(["sizes":"1280x794"]).icons == [["sizes":"1280x794"]]);
	}
		
	/**
	 * lang - string containing a single language tag. 
	 *        It specifies the primary language for the values of the manifest's directionality-capable members, 
	 *        and together with  dir determines their directionality.
	 */
	protected string _lang;
	auto lang() { return _lang; } 
	O lang(this O)(string newLang) { _lang = newLang; return cast(O)this; }
	unittest {
			assert(H5AppManifest.lang("DE-de").lang == "DE-de");
	}

		
	/**
	 * orientation - defines the default orientation for all the website's top-level browsing contexts.
	 *               Valid values are "any", "natural", "landscape", "landscape-primary", "landscape-secondary", "portrait", "portrait-primary", "portrait-secondary"
	 */
	protected string _orientation;
	auto orientation() { return _orientation; } 
	O orientation(this O)(string newOrientation) { _orientation = newOrientation; return cast(O)this; }
	unittest {
		assert(H5AppManifest.orientation("any").orientation == "any");
	}
		
	/**
	 * preferRelatedApplications - specifies that applications listed in related_applications should be preferred over the web application. 
	 * If the prefer_related_applications member is set to true, the user agent might
	 * suggest installing one of the related applications instead of this web app.
	 */
	protected bool	_preferRelatedApplications;
	auto preferRelatedApplications() { return _preferRelatedApplications; } 
	O preferRelatedApplications(this O)(bool newPreferRelatedApplications) { _preferRelatedApplications = newPreferRelatedApplications; return cast(O)this; }
	unittest {
		assert(H5AppManifest.preferRelatedApplications(true).preferRelatedApplications);
	}
		
	/**
	 * relatedApplications - array of objects specifying native applications that are installable by, or accessible to, the underlying platform
	 *                       Object members are
	 *                       "platform" -	The platform on which the application can be found.
	 *                       "url"      -	The URL at which the application can be found.
	 *                       "id"	      -The ID used to represent the application on the specified platform.
	 */
	protected string[string][] _relatedApplications;
	auto relatedApplications() { return _relatedApplications; } 
	O relatedApplications(this O)(string[string] addRelatedApplication) { _relatedApplications ~= addRelatedApplication; return cast(O)this; }
	O clearRelatedApplications(this O)() { _relatedApplications = null; return cast(O)this; }
	unittest {
		assert(H5AppManifest.relatedApplications(["id":"1768d43e-73a7-41c7-90fe-fe2e5ea3b7a2"]).relatedApplications == [["id":"1768d43e-73a7-41c7-90fe-fe2e5ea3b7a2"]]);
	}
		
	/**
	 * scope - defines the navigation scope of this web application's application context. 
	 *         It restricts what web pages can be viewed while the manifest is applied. 
	 *         If the user navigates outside the scope, it reverts to a normal web page inside a browser tab or window.
	 */
	protected string _scope;
	auto navScope() { return _scope; } 
	O navScope(this O)(string newScope) { _scope = newScope; return cast(O)this; }
	unittest {
		assert(H5AppManifest.navScope("/app").navScope == "/app");
	}
		
	/**
	 * screenshots - array of screenshots intended to showcase the application.
	  "src": "screenshot.webp",
    "sizes": "1280x720",
    "type": "image/webp"
	 */
	protected string[string][] _screenshots;
	auto screenshots() { return _screenshots; } 
	O screenshots(this O)(string[string][] addScreenshots...) { _screenshots ~= addScreenshots; return cast(O)this; }
	O screenshots(this O)(string[string][] addScreenshots) { _screenshots ~= addScreenshots; return cast(O)this; }
	O clearScreenshots(this O)() { _screenshots = null; return cast(O)this; }
	unittest {
		assert(H5AppManifest.screenshots(["sizes":"1280x720"]).screenshots == [["sizes":"1280x720"]]);
		assert(H5AppManifest.screenshots([["sizes":"1280x720"]]).screenshots == [["sizes":"1280x720"]]);
	}
		
	/**
	 * serviceworker - describes a service worker that the developer intends to install to control the PWA.
				src	The URL to download the service worker script from. This is the only required member of the serviceworker member.
			scope	A string representing a URL that defines a service worker's registration scope; that is, what range of URLs a service worker can control. This is usually a relative URL, relative to the base URL of the application. By default, the scope value for a service worker registration is set to the directory where the service worker script is located.
			type	?
			update_via_cache	
			Whether the user agent cache should be bypassed when fetching the service worker.
	 */
	protected string[string] _serviceworker;
	auto serviceworker() { return _serviceworker; } 
	O serviceworker(this O)(string[string] newServiceworker) { _serviceworker = newServiceworker; return cast(O)this; }
	unittest {
		assert(H5AppManifest.serviceworker(["src":"/app/sw.js"]).serviceworker == ["src":"/app/sw.js"]);
	}

	/**
	 * shortName - represents the name of the web application displayed to the user if there is not enough space to display name 
	 *             shortName is directionality-capable
	 */
  protected string _shortName;
	auto shortName() { return _shortName; } 
	O shortName(this O)(string newShortName) { _shortName = newShortName; return cast(O)this; }
	unittest {
		assert(H5AppManifest.shortName("test").shortName == "test");
	}

	/**
	 * startUrl - represents the start URL of the web application — the prefered URL that should be loaded when the user launches the web application 
	 */
	protected string _startUrl;
	auto startUrl() { return _startUrl; } 
	O startUrl(this O)(string newStartUrl) { _startUrl = newStartUrl; return cast(O)this; }
	unittest {
		assert(H5AppManifest.startUrl("/app").startUrl == "/app");
	}

	/**
	 * themeColor - defines the default theme color for the application
	 */
	protected string _themeColor;
	auto themeColor() { return _themeColor; } 
	O themeColor(this O)(string newThemeColor) { _themeColor = newThemeColor; return cast(O)this; }
	unittest {
		assert(H5AppManifest.themeColor("red").themeColor == "red");
	}

  override string toString() {
		Json values;
		if (_backgroundColor) values["background-color"] = _backgroundColor;
		if (_categories) values["categories"] = _categories.toJson;
		if (_description) values["description"] = _description;
		if (_dir) values["dir"] = _dir;
		if (_display) values["display"] = _display;
		if (_iarcRatingId) values["iarc_rating_id"] = _iarcRatingId;
		if (_icons) values["icons"] = _icons.toJson;
		if (_lang) values["lang"] = _lang;
		if (_name) values["name"] = _name;
		if (_orientation) values["orientation"] = _orientation;
		if (_preferRelatedApplications) values["prefer_related_applications"] = _preferRelatedApplications;
		if (_relatedApplications) values["related_applications"] = _relatedApplications.toJson;
		if (_scope) values["scope"] = _scope;
		if (_screenshots) values["screenshots"] = _screenshots.toJson;
		if (_serviceworker) values["serviceworker"] = _serviceworker.toJson;
		if (_shortName) values["short_name"] = _shortName;
		if (_startUrl) values["start_url"] = _startUrl;
		if (_themeColor) values["theme_color"] = _themeColor;

		return values.toString;
	}
}
auto H5AppManifest() { return new DH5AppManifest(); }
auto H5AppManifest(DH5App anApp) { return new DH5AppManifest(anApp); }
auto H5AppManifest(string aName) { return new DH5AppManifest(aName); }
auto H5AppManifest(DH5App anApp, string aName) { return new DH5AppManifest(anApp, aName); }

unittest {
	assert(H5AppManifest);
}
