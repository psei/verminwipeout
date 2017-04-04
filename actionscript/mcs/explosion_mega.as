// EXPLOSION _ MEGA
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class explosion_mega extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var counter:Number=0;
		public function explosion_mega(root_p:MovieClip) {
			this.myroot=root_p;
			this.x=0;
			this.y=0;
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