// SHOT_DRONE
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot_drone extends MovieClip {
		public var myroot:MovieClip;
		public var ang:Number=0;
		public var counter:int=0;
		public var angp:Number=0;
		public function shot_drone(root_p:MovieClip) {
			this.visible=false;
			this.myroot=root_p;
		}
		public function activate() {
			this.visible=true;
			this.myroot.oefSubscribers.push(this);
		}
		public function deactivate() {
			this.visible=false;
			var remove_nr: int = this.myroot.oefSubscribers.indexOf(this);
			if (remove_nr>-1) this.myroot.oefSubscribers.splice(remove_nr, 1);
		}
		public function oef(event:Event) {

			if (this.myroot.gp==0) {
				this.counter++;			
				var shoot = false;
				if (this.counter%3==0) {
					for (var i=1; i<this.myroot.enemies.numChildren; i++) {
						if (   this.myroot.enemies.getChildAt(i).y > 0 
							&& this.myroot.enemies.getChildAt(i).y < this.y 
							&& this.myroot.enemies.getChildAt(i).x < this.x+140
							&& this.myroot.enemies.getChildAt(i).x > this.x-140
							) {
							shoot = true;
							break;
						}
					}
				}
				if (shoot) {
					var myshot1:shot_drone_plasma=new shot_drone_plasma(this.myroot);
					myshot1.x=this.x;
					myshot1.y=this.y-15;
					this.myroot.shots.addChild(myshot1);
					this.myroot.shots_array.push(myshot1);
					this.counter=0;
				}
				this.ang += 0.3;
				this.angp=this.ang / (2 * Math.PI);
				this.x=this.myroot.ship_mc.x+20+Math.cos(this.angp) * 60;
				this.y=this.myroot.ship_mc.y+20+Math.sin(this.angp) * 60;
			}
		}
	}
}