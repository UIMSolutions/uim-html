module uim.html.elements.audio;
@safe:
import uim.html;

/*
 * The <audio> tag defines sound, such as music or other audio streams.
 */
@safe class DH5Audio : DH5Obj {
	mixin(H5This!"Audio");

	mixin(MyAttribute!"autoplay");
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
	

	mixin(H5Test!("H5Audio", "audio"));
	assert(Assert(H5Audio.source(["src":"horse.ogg", "type":"audio/ogg"]),`<audio><source src="horse.ogg" type="audio/ogg"></source></audio>`)); 
	assert(Assert(H5Audio.source(["src":"horse.ogg", "type":"audio/ogg"]).content("Your browser does not support the audio tag."),`<audio><source src="horse.ogg" type="audio/ogg"></source>Your browser does not support the audio tag.</audio>`)); 
}

/**
 *  <audio controls>
  <source src="horse.ogg" type="audio/ogg">
  <source src="horse.mp3" type="audio/mpeg">
  Your browser does not support the audio tag.
</audio> 
*/	
