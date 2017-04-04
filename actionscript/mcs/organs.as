// ORGANS
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class organs extends MovieClip {
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
		public var health:int=30;
		public var t:int=20;
		public function organs(root_p:MovieClip,xp:Number,yp:Number,t1_p:Number) {
			this.name="organs";
			this.myroot=root_p;
			this.t1=t1_p;
			this.sc=this.t1;
			this.x=xp;
			this.y=yp;
			this.xpos=this.x;
			this.addEventListener(Event.ENTER_FRAME,this.oef);
		}
		public function oef(event:Event) {
			if (this.dead == 0) {
				this.counter++;
				this.y+= 2;
				this.x-= (this.x-this.myroot.ship_mc.x)/80;
				if (this.y > 600 || this.x < -100 || this.x > 500) {
					this.removeEventListener(Event.ENTER_FRAME,this.oef);
					for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
						if (this.myroot.enemies_array[i] == this) {
							this.myroot.enemies_array.splice(i,1);
						}
					}
					this.myroot.enemies.removeChild(this);
				}
			} else {
				if (this.currentFrame == this.totalFrames) {
					this.removeEventListener(Event.ENTER_FRAME,this.oef);
					this.myroot.enemies.removeChild(this);
				}
			}
		}
		public function kill(minushealth:int) {
			this.health-= minushealth;
			this.myroot.sshit++;
			if (this.health < 0) {
				this.health=0;
			} else {
				//this.first_blood.play();
			}
			if (this.health == 0) {
				var distance:Number=this.myroot.ship_mc.y-this.y;
				if (distance<150 && distance>=0) {
					this.myroot.matsch_f();
				}
				this.myroot.kills++;

				this.myroot.credits_f(20);
				//this.myroot.score+=20;
				this.gotoAndPlay(2);
				this.dead=1;
				for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
					if (this.myroot.enemies_array[i] == this) {
						this.myroot.enemies_array.splice(i,1);
					}
				}
			}
		}
	}
}