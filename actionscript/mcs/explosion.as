// EXPLOSION
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class explosion extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var counter:Number=0;
		public function explosion(root_p:MovieClip,xpos_p:Number,ypos_p:Number) {
			this.myroot=root_p;
			this.x=Math.floor(xpos_p);
			this.y=Math.floor(ypos_p);
			this.myroot.explo.addChild(this);
			this.myroot.oefSubscribers.push(this);
		}
		public function oef(event:Event) {
			if (this.currentFrame==this.totalFrames) {
				var remove_nr: int = this.myroot.oefSubscribers.indexOf(this);
				if (remove_nr>-1) this.myroot.oefSubscribers.splice(remove_nr, 1);
				this.myroot.explo.removeChild(this);
				delete this;
			}
		}
	}
}