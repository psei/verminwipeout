// BOSS 6a - bone zwischengegner
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class boss6a extends MovieClip {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xdir:int=1;
		public var counter:int=0;
		public var deadcounter:int=0;
		public var myroot:MovieClip;
		public var health:int=100000;
		public var maxhealth:int=100000;
		public var attack:int=0;
		public var adir:int=0;
		public function boss6a(root_p:MovieClip) {
			this.name="boss6a";
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.addEventListener(Event.ENTER_FRAME,this.oef);
			this.x=200;
			this.y=-100;
		}
		public function oef(event:Event) {
			if (this.dead == 0) {
				this.counter++;
				if (this.counter % 250 == 0) {
					this.attack=Math.floor(Math.random() * 6);
					if (this.attack == 0) {
						// shots
						this.gotoAndPlay(2);
					} else if (this.attack == 1) {
						// accid
						this.gotoAndPlay(150);
					} else if (this.attack == 2) {
						// head spear (throat)
						this.gotoAndPlay(410);
					} else if (this.attack == 3) {
						// schnapp schnapp flying
						this.gotoAndPlay(500);
					} else if (this.attack == 4) {
						// augenlaser
						this.gotoAndPlay(730);
					} else if (this.attack == 5) {
						// knochenspucke
						this.gotoAndPlay(850);
					}
					/*else if (this.attack == 6) {
					// all - pissed off
					this.gotoAndPlay(1090);
					} 
					*/


				}
				if (this.counter < 20) {
					this.y+= 15;
				} else if (this.counter > 20 && this.currentFrame == 1) {
					this.x+= 4 * this.xdir;
					if (this.x > 350) {
						this.xdir=-1;
					} else if (this.x < 50) {
						this.xdir=1;
					}
				}
			} else {
				if (this.deadcounter < 20) {
					this.deadcounter++;
					this.y+= 5;

					if (this.x < 400 && this.x > 220) {
						this.x-= 15;
						if (this.x < 220) {
							this.x=200;
						}
					}
					if (this.x < 180) {
						this.x+= 15;
						if (this.x > 180) {
							this.x=200;
						}
					}
				}
				if (this.currentFrame == 1400) {
					//trace(this.currentFrame);
					trace(this.deadcounter);
					this.deadcounter++;
					if (this.deadcounter == 21) {
						this.visible=false;

					}
					if (this.deadcounter == 70) {
						this.myroot.mi6.mission6_end();
						this.myroot.enemies.removeChild(this);
						this.removeEventListener(Event.ENTER_FRAME,this.oef);
					}
				}
			}
		}
		public function kill(minushealth:int) {
			this.health-= minushealth;
			if (this.first_blood.currentFrame == 1) {
				this.first_blood.gotoAndPlay(2);
			}
			if (this.health < 0) {
				this.health=0;
			} else if (this.health < 21000) {

			} else if (this.health < 22000) {

			} else if (this.health < 23000) {

			} else if (this.health < 24000) {

			} else if (this.health < 25000) {

			} else if (this.health < 26000) {

			} else if (this.health < 27000) {
				trace("boss damage 2");
			} else if (this.health < 28000) {

				trace("boss damage 1");
			}
			this.myroot.bosshealth.scaleX=this.health / this.maxhealth;
			this.myroot.bosshealth.gotoAndPlay(2);
			if (this.health == 0 && this.dead == 0) {
				this.myroot.credits_f(1000);
				this.gotoAndPlay(1200);
				this.dead=1;
				this.myroot.kills++;
				for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
					if (this.myroot.enemies_array[i] == this) {
						this.myroot.enemies_array.splice(i,1);
					}
				}
			}
		}
	}
}