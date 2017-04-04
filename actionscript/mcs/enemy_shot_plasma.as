// ENEMY SHOT PLASMA
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class enemy_shot_plasma extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public function enemy_shot_plasma(root_p:MovieClip) {
			this.myroot=root_p;
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.y+= 10;
				if (this.y > 600) {
					this.kill(1);
				}
			}
		}
		
		public function kill(minushealth:int) {
			this.myroot.shots.removeChild(this);
			var remove_nr:int=this.myroot.enemies_array.indexOf(this);
			if (remove_nr > -1) this.myroot.enemies_array.splice(remove_nr, 1);
			delete this;
		}
	}
}