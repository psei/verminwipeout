// BOSS 2 PURPLE
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class boss2 extends Boss {
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
		private var attackTime:int=0;
		public function boss2(root_p:MovieClip) {
			this.name="boss2";
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
						var attack = this.getAttack(2);
						this.attackTime = this.counter + Math.floor(3*25 + Math.random() * 5*25);
						
						if (attack==0) {
							// SLIME 
							this.gotoAndPlay(2);
						} else if (attack==1) {
							// Fly Attack
							this.gotoAndPlay(100);
						} else if (attack==2) {
							// MJAM MJAM
							this.gotoAndPlay(180);
						}
					}
				}
				if (this.currentFrame==110) {
					// fly 1
					var fly1:fly=new fly(this.myroot,this.x-125,this.y-115,1);
					this.myroot.enemies_array.push(fly1);
					this.myroot.enemies.addChild(fly1);
					// swap depths
				} else if (this.currentFrame==120) {
					// fly 2
					var fly2:fly=new fly(this.myroot,this.x,this.y-50,2);
					this.myroot.enemies_array.push(fly2);
					this.myroot.enemies.addChild(fly2);			
					// swap depths
				} else if (this.currentFrame==130) {
					// fly 3
					var fly3:fly=new fly(this.myroot,this.x+125,this.y-115,3);
					this.myroot.enemies_array.push(fly3);
					this.myroot.enemies.addChild(fly3);				
					// swap depths
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
				if (this.currentFrame == 421) {
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
					if (this.deadcounter==70) {
						this.myroot.mi2.mission2_end();
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
			if (this.body.first_blood.currentFrame==1) {
				this.body.first_blood.gotoAndPlay(2);
			}
			if (this.health < 0) {
				this.health=0;
			} else if (this.health < 30) {

			} else if (this.health < 70) {

			}
			this.myroot.bosshealth.scaleX=this.health/this.maxhealth;
			this.myroot.bosshealth.gotoAndPlay(2);			
			if (this.health == 0 && this.dead==0) {
				this.myroot.credits_f(1000);
				this.gotoAndPlay(420);				
				this.dead=1;
				this.myroot.kills++;
				
				var remove_nr: int = this.myroot.enemies_array.indexOf(this);
				this.myroot.enemies_array.splice(remove_nr,1);
			}
		}
	}
}