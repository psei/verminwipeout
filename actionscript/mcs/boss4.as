// BOSS 4 - green
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class boss4 extends MovieClip {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xdir:int=1;
		public var counter:int=0;
		public var deadcounter:int=0;
		public var myroot:MovieClip;
		public var health:int=350000;
		public var maxhealth:int=350000;
		public var attack:int=0;
		private var attackTime:int=0;
		private var playDeath:Array=new Array(true,true,true);
		private var idleFrame:int=1;
		public var adir:int=0;
		public function boss4(root_p:MovieClip) {
			this.name="boss4";
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=200;
			this.y=-100;
			
			this.attackTime = Math.floor(3*25 + Math.random() * 5*25);
			this.myroot.oefSubscribers.push(this);
		}
		public function oef(event:Event) {
			if (this.dead == 0) {
				var health_percentage = Math.round(this.health / this.maxhealth * 100);
				if (this.currentFrame == 1 || this.currentFrame == 219 || this.currentFrame == 469) {
					if (health_percentage < 70 && this.playDeath[1]) {
						this.gotoAndPlay(101);
						this.idleFrame=219;
						this.playDeath[1]=false;
					}
					else if (health_percentage < 50 && this.playDeath[2]) {
						this.gotoAndPlay(359);
						this.idleFrame=469;
						this.playDeath[2]=false;
					}
				}
				if (this.currentFrame == 1 || this.currentFrame == 219 || this.currentFrame == 469) {
					this.counter++;
				
					if (this.counter > attackTime) {
						this.attackTime = this.counter + Math.floor(3*25 + Math.random() * 5*25);
						if (health_percentage > 70) {
							// TONGUE
							this.attack=1;
							this.gotoAndPlay(2);
						}
						else if (health_percentage > 50) {
							// FLYs
							this.attack=2;
							this.gotoAndPlay(220);
						}
						else if (health_percentage > 30) {
							// FLAME THROWER
							this.attack=3;
							this.gotoAndPlay(470);
						} else {
							// GIFT WOLKE
							this.attack=4;
							this.gotoAndPlay(580);
						}
					}
				}
				this.releaseFlies();
				if (this.counter < 20) {
					this.y+= 15;
				} else if (this.currentFrame == 1 || this.currentFrame == 219 || this.currentFrame == 469) {
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
						this.myroot.mi4.mission4_end();
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
				this.myroot.credits_f(1000);
				this.gotoAndPlay(771);
				this.dead=1;
				this.myroot.kills++;
				
				var remove_nr: int = this.myroot.enemies_array.indexOf(this);
				this.myroot.enemies_array.splice(remove_nr,1);
			}
		}
		
		protected function releaseFlies() {
			// THE FLIEs ARE SWARMING
			if (this.currentFrame==480) {
				// fly wave 1
				var fly_1:fly2=new fly2(this.myroot,this.x-125,this.y-115,1);
				this.myroot.enemies_array.push(fly_1);
				this.myroot.enemies.addChild(fly_1);
				var fly_1a:fly2=new fly2(this.myroot,this.x-120,this.y-130,1);
				this.myroot.enemies_array.push(fly_1a);
				this.myroot.enemies.addChild(fly_1a);
			} else if (this.currentFrame==485) {
				// fly wave 2
				var fly_2:fly2=new fly2(this.myroot,this.x,this.y-50,2);
				this.myroot.enemies_array.push(fly_2);
				this.myroot.enemies.addChild(fly_2);
				var fly_2a:fly2=new fly2(this.myroot,this.x,this.y-70,2);
				this.myroot.enemies_array.push(fly_2a);
				this.myroot.enemies.addChild(fly_2a);
				var fly_2b:fly2=new fly2(this.myroot,this.x,this.y-90,2);
				this.myroot.enemies_array.push(fly_2b);
				this.myroot.enemies.addChild(fly_2b);
				var fly_2c:fly2=new fly2(this.myroot,this.x,this.y-100,2);
				this.myroot.enemies_array.push(fly_2c);
				this.myroot.enemies.addChild(fly_2c);
			} else if (this.currentFrame==490) {
				// fly wave 3
				var fly_3:fly2=new fly2(this.myroot,this.x+125,this.y-115,3);
				this.myroot.enemies_array.push(fly_3);
				this.myroot.enemies.addChild(fly_3);
				var fly_3a:fly2=new fly2(this.myroot,this.x+170,this.y-130,3);
				this.myroot.enemies_array.push(fly_3a);
				this.myroot.enemies.addChild(fly_3a);
				var fly_3b:fly2=new fly2(this.myroot,this.x+150,this.y-150,3);
				this.myroot.enemies_array.push(fly_3b);
				this.myroot.enemies.addChild(fly_3b);
			}else if (this.currentFrame==495) {
				// fly wave 4
				var fly_4:fly2=new fly2(this.myroot,this.x+125,this.y-115,3);
				this.myroot.enemies_array.push(fly_4);
				this.myroot.enemies.addChild(fly_4);
				var fly_4a:fly2=new fly2(this.myroot,this.x+100,this.y-100,3);
				this.myroot.enemies_array.push(fly_4a);
				this.myroot.enemies.addChild(fly_4a);
				var fly_4b:fly2=new fly2(this.myroot,this.x+80,this.y-90,3);
				this.myroot.enemies_array.push(fly_4b);
				this.myroot.enemies.addChild(fly_4b);
				var fly_4c:fly2=new fly2(this.myroot,this.x+60,this.y-70,3);
				this.myroot.enemies_array.push(fly_4c);
				this.myroot.enemies.addChild(fly_4c);
			}else if (this.currentFrame==500) {
				// fly wave 5
				var fly_5:fly2=new fly2(this.myroot,this.x+125,this.y-115,3);
				this.myroot.enemies_array.push(fly_5);
				this.myroot.enemies.addChild(fly_5);
				var fly_5a:fly2=new fly2(this.myroot,this.x+100,this.y-100,3);
				this.myroot.enemies_array.push(fly_5a);
				this.myroot.enemies.addChild(fly_5a);
				var fly_5b:fly2=new fly2(this.myroot,this.x+80,this.y-90,3);
				this.myroot.enemies_array.push(fly_5b);
				this.myroot.enemies.addChild(fly_5b);
				var fly_5c:fly2=new fly2(this.myroot,this.x+60,this.y-70,3);
				this.myroot.enemies_array.push(fly_5c);
				this.myroot.enemies.addChild(fly_5c);
			}
		}
	}
}