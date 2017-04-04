// BOSS 7 - crank2
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class boss7 extends Boss {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xdir:int=1;
		public var counter:int=0;
		public var deadcounter:int=0;
		public var myroot:MovieClip;
		public var health:int=600000;
		public var maxhealth:int=600000;
		public var attack:int=0;
		private var attackTime:int=0;
		public var adir:int=0;
		public function boss7(root_p:MovieClip) {
			this.name="boss7";
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=200;
			this.y=-100;
			
			this.attackTime = Math.floor(3*25 + Math.random() * 5*25);
			this.myroot.oefSubscribers.push(this);
		}
		public function oef(event:Event) {
			if (this.dead == 0) {
				if (this.currentFrame == 1) {
					this.counter++;
				
					if (this.counter > attackTime) {
						var attack = this.getAttack(5);
						this.attackTime = this.counter + Math.floor(3*25 + Math.random() * 5*25);
						
						if (attack == 0) {
							// ROCKETS
							this.gotoAndPlay(2);
						} else if (attack == 1) {
							// SPEAR
							this.gotoAndPlay(250);
						} else if (attack == 2) {
							// SCHNETZEL
							this.gotoAndPlay(390);
						} else if (attack == 3) {
							// SCHALL
							this.gotoAndPlay(680);
						} else if (attack == 4) {
							// LASER
							this.gotoAndPlay(900);
						} else if (attack == 5) {
							// STECHEN
							this.gotoAndPlay(1100);
						}
					}
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
				if (this.currentFrame == this.totalFrames) {
					this.deadcounter++;
					if (this.deadcounter == 21) {
						this.visible=false;
					}
					if (this.deadcounter == 70) {
						this.myroot.mi6.mission6_end();
						this.myroot.enemies.removeChild(this);
						var remove_nr: int = this.myroot.oefSubscribers.indexOf(this);
						this.myroot.oefSubscribers.splice(remove_nr,1);
						delete this;
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
			}
			this.myroot.bosshealth.scaleX=this.health / this.maxhealth;
			this.myroot.bosshealth.gotoAndPlay(2);
			if (this.health == 0 && this.dead == 0) {
				this.myroot.credits_f(2000);
				this.gotoAndPlay(1360);
				this.myroot.kills++;
				this.dead=1;
				
				var remove_nr: int = this.myroot.enemies_array.indexOf(this);
				this.myroot.enemies_array.splice(remove_nr,1);
			}
		}
	}
}