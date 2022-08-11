module uim.html.elements.audio;

@safe:
import uim.html;

/*
 * The <audio> tag defines sound, such as music or other audio streams.
 */
class DH5Audio : DH5Obj {
	mixin(H5This!"Audio");

	mixin(MyAttribute!"autoplay");
    unittest {
        assert(H5Obj.autoplay("true").autoplay == "true");
        writeln(H5Obj.autoplay("true"));
    }

    mixin(MyAttribute!"buffered");
    mixin(MyAttribute!"controls");
	mixin(MyAttribute!"loop");
    mixin(MyAttribute!"mozCurrentSampleOffset");
    mixin(MyAttribute!"muted");
    mixin(MyAttribute!"played");
    mixin(MyAttribute!"preload");
    mixin(MyAttribute!"src");
    mixin(MyAttribute!"volume");

	mixin(MyContent!("source", "H5Source"));
	mixin(MyContent!("track", "H5Track"));
}
mixin(H5Short!"Audio");

unittest {
	assert(H5Audio == "<audio></audio>");
	assert(H5Audio.source(["src":"horse.ogg", "type":"audio/ogg"]) == `<audio><source src="horse.ogg" type="audio/ogg"></source></audio>`); 
	assert(H5Audio.source(["src":"horse.ogg", "type":"audio/ogg"])("Your browser does not support the audio tag.") == `<audio><source src="horse.ogg" type="audio/ogg"></source>Your browser does not support the audio tag.</audio>`); 
}

/**
 *  <audio controls>
  <source src="horse.ogg" type="audio/ogg">
  <source src="horse.mp3" type="audio/mpeg">
  Your browser does not support the audio tag.
</audio> 
*/	
