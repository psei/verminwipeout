// DEBRIS
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class Debris extends MovieClip {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xpos:Number=0;
		public var xdir:int=1;
		public var sc:Number=0;
		public var t1:Number=0;
		public var typ:int;
		public var counter:int=0;
		public var score:int=0;
		public var myroot:MovieClip;
		public var health:int=1;
		
		public function oef(event:Event) {
			if(this.myroot.gp==0){
				if (this.dead == 0) {
					this.counter++;
					if(this.currentFrame>1 && this.currentFrame<this.totalFrames){
						this.play();
					}else if(this.currentFrame==1){
						//todo: fixme this.ani.play();
					}
					if (this.typ == 0) {
						// WENIG
						this.y+= speed;
					} else if (this.typ == 1) {
						// VIEL 
						this.y+= speed;
					}
					if (this.y > 600 || this.x < -100 || this.x > 500) {
						this.myroot.enemies.removeChild(this);
						var remove_nr: int = this.myroot.enemies_array.indexOf(this);
						if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
						delete this;
					}
				} else {
					if (this.currentFrame == this.totalFrames) {
						this.myroot.enemies.removeChild(this);
						remove_nr = this.myroot.enemies_array.indexOf(this);
						if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
						delete this;
					}
				}
			}
		}
		public function kill(minushealth:int) {
			if (this.dead == 0) {
				this.health-= minushealth;
				if (this.health < 0) {
					this.health=0;
				} else {
				}
				if (this.health == 0) {
					this.myroot.kills++;
					this.myroot.credits_f(10);
					this.gotoAndPlay(2);
					this.dead=1;
				}
			}
		}
	}
}