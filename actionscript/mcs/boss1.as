// BOSS 1
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class boss1 extends Boss {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xdir:int=1;
		public var counter:int=0;
		public var deadcounter:int=0;
		public var myroot:MovieClip;
		public var health:int=15000;
		public var maxhealth:int=15000;
		private var attackTime:int=0;
		public function boss1(root_p:MovieClip) {
			this.name="boss1";
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=200;
			this.y=-100;
			
			this.attackTime = Math.floor(3*25 + Math.random() * 5*25);
			this.myroot.oefSubscribers.push(this);
		}
		public function oef(event:Event) {
			if(this.myroot.gp==0){
				if (this.dead == 0) {
					if (this.currentFrame == 1) {
						this.counter++;
						if (this.counter >= attackTime) {
							var attack = this.getAttack(3);
							this.attackTime = this.counter + Math.floor(3*25 + Math.random() * 5*25);
							
							if (attack==0) {
								// SPEAR
								this.gotoAndPlay(2);
							} else if (attack==1) {
								// ACCID BALLS
								this.gotoAndPlay(120);
							} else if (attack==2) {
								// SCHNAPP
								this.gotoAndPlay(270);
							}else if (attack==3) {
								// DOTS
								this.gotoAndPlay(450);
							}
						}
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
					//organs
					if (this.currentFrame == 635) {
						for(var i:int=0;i<4;i++){
							var org:organs_main = new organs_main(this.myroot,i);
							this.myroot.enemies.addChildAt(org,0);
							this.myroot.enemies_array.push(org);
						}					
					}
					if (this.currentFrame == this.totalFrames) {
						this.deadcounter++;
						if (this.deadcounter==21) {
							this.visible=false;
						}
						if (this.deadcounter==80) {
							this.myroot.mi1.mission1_end();
							this.myroot.enemies.removeChild(this);
							
							var remove_nr: int = this.myroot.oefSubscribers.indexOf(this);
							this.myroot.oefSubscribers.splice(remove_nr,1);
							delete this;
						}
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
			}			
			this.myroot.bosshealth.scaleX=this.health/this.maxhealth;
			this.myroot.bosshealth.gotoAndPlay(2);
			if (this.health == 0 && this.dead==0) {
				this.myroot.credits_f(1000);
				this.myroot.kills++;
				this.gotoAndPlay(580);
				this.dead=1;
				
				var remove_nr: int = this.myroot.enemies_array.indexOf(this);
				this.myroot.enemies_array.splice(remove_nr,1);
			}
		}
	}
}