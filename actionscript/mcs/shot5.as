//  Lightning Electrocutioner WAFFE 5
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot5 extends MovieClip {
		public var counter:int;
		public var myroot:MovieClip;
		public function shot5(root_p:MovieClip) {
			this.myroot=root_p;
			this.myroot.ss++;
			this.addEventListener(Event.ADDED_TO_STAGE,this.init);
			this.myroot.shots.addChild(this);
			this.myroot.SoundEffect("w5");
		}
		public function init(event:Event) {
			this.x=this.myroot.ship_mc.x;
			this.y=this.myroot.ship_mc.y;
			this.gotoAndStop(1+Math.floor(Math.random()*this.totalFrames));
			this.rotation=Math.random()*90-45;
			this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.counter++;
				if (this.counter==1) {
					for (var i:int=0; i<this.myroot.enemies_array.length; i++) {
						var target:MovieClip = this.myroot.enemies_array[i];
						var hits:int=0;
						for (var j:int=0; j<20; j++) {
							if (hits==0) {
								if (target.hitTestObject(this["h"+j]) && target.y>0) {
									hits++;
									target.kill(1500);
								}
							}
						}
					}
				} else if (this.counter==3) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
			}
		}
	}
}