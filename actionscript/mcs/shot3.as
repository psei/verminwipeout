// GATLIN LASER WAFFE 6
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot3 extends MovieClip {
		public var speed:Number;
		public var nr:Number;
		public var myroot:MovieClip;
		public var counter:Number=0;
		public function shot3(root_p:MovieClip,nr_p:Number) {
			this.nr=nr_p;
			this.myroot=root_p;
			this.myroot.ss++;
			this.addEventListener(Event.ADDED_TO_STAGE,this.init);
			this.myroot.shots.addChild(this);
			//this.myroot.SoundEffect("w6");
		}
		public function init(event:Event) {
			if (this.nr==1) {
				this.x=this.myroot.ship_mc.x-8;
			} else {
				this.x=this.myroot.ship_mc.x+20;
			}
			this.y=this.myroot.ship_mc.y-5;
			for (var i:int=0; i<this.myroot.enemies_array.length; i++) {
				var target:MovieClip = this.myroot.enemies_array[i];
				if (target.hitTestObject(this) && target.y>0) {
					target.kill(2200);
					//this.laser.height=this.myroot.ship_mc.y-target.y-target.t;
					this.laser.height=this.myroot.ship_mc.y-target.y;
				}
			}
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.counter++;
				if (this.counter==1) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
			}
		}
	}
}