// BARRIERE 1
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class bar1 extends MovieClip {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xdir:int=1;
		public var counter:int=0;
		public var deadcounter:int=0;
		public var myroot:MovieClip;
		public var health:int=1000;
		public var maxhealth:int=1000;
		public var attack:int=0;
		public function bar1(root_p:MovieClip) {
			this.name="bar1";
			this.myroot=root_p;
			this.x=200;
			this.y=-100;
		}
		public function oef(event:Event) {
			if (this.dead == 0) {
				this.counter++;
				if (this.counter < 20) {
					this.y+=15;
				} else if (this.counter > 20 && this.currentFrame==1) {
					this.x+= 4 * this.xdir;
					if (this.x > 350) {
						this.xdir=-1;
					} else if (this.x < 50) {
						this.xdir=1;
					}
				}
			} else {
				if (this.deadcounter<20) {
					this.deadcounter++;
					this.y+=5;
					if (this.x<400 && this.x>220) {
						this.x-=15;
						if (this.x<220) {
							this.x=200;
						}
					}
					if (this.x<180) {
						this.x+=15;
						if (this.x>180) {
							this.x=200;
						}
					}
				}
				if (this.b2currentFrame == 80) {
					this.deadcounter++;
					if (this.deadcounter==21) {
						this.visible=false;
					}
					if (this.deadcounter==80) {
						this.myroot.enemies.removeChild(this);
					}
				}
			}
		}
		public function kill(minushealth:int) {
			this.health-= minushealth;
			if (this.body.first_blood.currentFrame==1) {
				this.body.first_blood.gotoAndPlay(2);
			}
			if (this.health < 0) {
				this.health=0;
			} else if (this.health < 500) {
				this.b2.gotoAndPlay(2);
			}
			this.myroot.bosshealth.scaleX=this.health/this.maxhealth;
			this.myroot.bosshealth.gotoAndPlay(2);
			if (this.health == 0 && this.dead==0) {
				this.myroot.credits_f(1000);
				this.b1.gotoAndPlay(2);
				this.organs.gotoAndStop(1);
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