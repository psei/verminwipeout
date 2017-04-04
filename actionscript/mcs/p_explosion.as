// PHALANX EXPLOSION 
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class p_explosion extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var counter:Number=0;
		public function p_explosion(root_p:MovieClip) {
			this.myroot=root_p;
			this.x=0;
			this.y=0;
			this.gotoAndStop(1+Math.floor(Math.random()*10));
			this.myroot.explo.addChild(this);
			this.myroot.oefSubscribers.push(this);
		}
		public function oef(event:Event) {
			counter++;
			if (this.counter==15) {
				var remove_nr: int = this.myroot.oefSubscribers.indexOf(this);
				if (remove_nr>-1) this.myroot.oefSubscribers.splice(remove_nr, 1);
				this.myroot.explo.removeChild(this);
				delete this;
			}
		}
	}
}