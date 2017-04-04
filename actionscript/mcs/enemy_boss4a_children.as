// Mini-Maden 
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class enemy_boss4a_children extends MovieClip {
		public var dead:int=0;
		public var myroot:MovieClip;
		public var health:int=300;
		public function enemy_boss4a_children(root_p:MovieClip,xp:Number,yp:Number) {
			this.myroot=root_p;
			this.x=xp;
			this.y=yp;
			this.rotation=Math.floor(1+Math.random()*350);
		}
		public function oef(event:Event) {
			if (this.currentFrame == this.totalFrames) {
				this.myroot.enemies.removeChild(this);
				var remove_nr = this.myroot.enemies_array.indexOf(this);
				if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
				delete this;
			}
		}
		public function kill(minushealth:int) {
			if (this.dead == 0) {
				this.health-= minushealth;
				this.myroot.sshit++;
				if (this.health < 0) {
					this.health=0;
				} 
				if (this.health == 0) {
					this.myroot.kills++;
					this.myroot.credits_f(100);
					this.dead=1;
					this.gotoAndPlay(14);
				}
			}
		}
	}
}