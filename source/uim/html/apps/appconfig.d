module uim.html.apps.appconfig;

@safe:
import uim.html;

class DH5AppConfig {
  this() {    
  }

  // Full path to the application, e.g. 'app.cms.admin'.
  // This attribute defines which application the configuration applies to. It must be set in all DH5AppConfig subclasses.
  // It must be unique across a  project.
  mixin(OProperty!("string", "name"));

  // Short name for the application, e.g. 'admin'
  // This attribute allows relabeling an application when two applications have conflicting labels. 
  /// It defaults to the last component of name. It should be a valid D identifier and must be unique across a project
  mixin(OProperty!("string", "label"));

  // Human-readable name for the application, e.g. “Administration”.
  // This attribute defaults to label.title()
  mixin(OProperty!("string", "verbose_name"));

  // Filesystem path to the application directory, e.g. '/apps/cms/apps'.
  // In most cases, using traits can automatically detect and set this, 
  // but you can also provide an explicit override as a class attribute on your AppConfig subclass. In a few situations this is required; 
  // for instance if the app package is a namespace package with multiple paths.
  mixin(OProperty!("string", "path"));

  // Set this attribute to False to prevent app from selecting a configuration class automatically. 
  // This is useful when apps.py defines only one AppConfig subclass but you don’t want app to use it by default.
  // Set this attribute to True to tell app to select a configuration class automatically. 
  // This is useful when apps.py defines more than one AppConfig subclass and you want app to use one of them by default.
  // By default, this attribute isn’t set.
  mixin(OProperty!("bool", "defaultConfig"));

  // The implicit primary key type to add to models within this app. You can use this to keep AutoField as the primary key type for third party applications.
  // By default, this is the value of DEFAULT_AUTO_FIELD.
  mixin(OProperty!("string", "default_auto_field"));

  // Root module for the application, e.g. <module 'django.contrib.admin' from 'django/contrib/admin/__init__.py'>.
  @property string moduleName() { return ""; }

  // Module containing the models, e.g. <module 'django.contrib.admin.models' from 'django/contrib/admin/models.py'>.
  // It may be None if the application doesn’t contain a models module. Note that the database related signals such as pre_migrate and post_migrate are only emitted for applications that have a models module.
  @property string subModules() { return []; } 

  // Returns an iterable of Model classes for this application.
  // Requires the app registry to be fully populated.
  auto models() { return null; }

  // Returns the Model with the given model_name. model_name is case-insensitive.
  // Raises LookupError if no such model exists in this application.
  // Requires the app registry to be fully populated unless the require_ready argument is set to False. require_ready behaves exactly as in apps.get_model().
  auto model(string modelName, bool requireReady = true) { return null; }
  
  // Subclasses can override this method to perform initialization tasks such as registering signals. It is called as soon as the registry is fully populated.
  // Although you can’t import models at the module-level where AppConfig classes are defined, you can import them in ready(), using either an import statement or get_model().
  // If you’re registering model signals, you can refer to the sender by its string label instead of using the model class itself.
  bool ready() { return false; } 
}