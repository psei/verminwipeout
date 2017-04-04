// BOSS 4a - Made
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class boss4a extends Boss {
		public var dead:int=0;
		public var myroot:MovieClip;
		public var health:int=100000;
		public var maxhealth:int=100000;
		private var rootcount:int;
		
		public function boss4a(root_p:MovieClip) {
			this.name="made";
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=200;
			this.y=200;
			this.rootcount = this.myroot.counter;
			this.myroot.zwischenbossmode=true;
		}
		
		public function oef(event:Event) {
			if (this.dead == 1) {
				//mini maden tod: lösche mich und spiel geht weiter.
				trace(this.myroot.enemies_array.length);

				if (this.myroot.enemies_array.length == 0) {
					var remove_nr = this.myroot.oefSubscribers.indexOf(this);
					if (remove_nr>-1) this.myroot.oefSubscribers.splice(remove_nr,1);
					this.myroot.counter = this.rootcount;
					this.myroot.zwischenbossmode = false;
					delete this;
				}
			}
		}
		
		public function kill(minushealth:int) {
			this.health-= minushealth;
			if (this.made.first_blood.currentFrame == 1) {
				this.made.first_blood.gotoAndPlay(2);
			}
			if (this.health < 0) {
				this.health=0;
			} else if (this.health < 20000) {
				this.made.head.eyes.eye2.gotoAndStop(1);
				this.made.head.eyes.eye2.eye2.gotoAndStop(2);
			} else if (this.health < 25000) {
				this.made.head.eyes.eye1.gotoAndStop(1);
				this.made.head.eyes.eye1.eye1.gotoAndStop(2);
			} else if (this.health < 30000) {
				this.gotoAndStop(14);
			} else if (this.health < 35000) {
				this.gotoAndStop(13);
			} else if (this.health < 40000) {
				this.gotoAndStop(12);
			} else if (this.health < 45000) {
				this.gotoAndStop(11);
			} else if (this.health < 50000) {
				this.gotoAndStop(10);
			} else if (this.health < 55000) {
				this.gotoAndStop(9);
			} else if (this.health < 60000) {
				this.gotoAndStop(8);
			} else if (this.health < 65000) {
				this.gotoAndStop(7);
			} else if (this.health < 70000) {
				this.gotoAndStop(6);
			} else if (this.health < 75000) {
				this.gotoAndStop(5);
			} else if (this.health < 80000) {
				this.gotoAndStop(4);
			} else if (this.health < 85000) {
				this.gotoAndStop(3);
			} else if (this.health < 90000) {
					this.gotoAndStop(2);
			}
			this.myroot.bosshealth.scaleX=this.health/this.maxhealth;
			this.myroot.bosshealth.gotoAndPlay(2);
			if (this.health == 0 && this.dead == 0) {
				this.myroot.credits_f(1000);
				this.dead=1;
				this.myroot.kills++;
				// Todes Animation. - Sie wird nicht abgespielt. Aaaaah!
				this.gotoAndPlay(15);
				this.myroot.enemies.removeChild(this);
				var remove_nr: int = this.myroot.enemies_array.indexOf(this);
				if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr,1);
				this.myroot.oefSubscribers.push(this);
				
				// erstelle random Mini-Maden.
				var stufeX: int = 10;
				var stufeY: int = 20;
				for(var i:int=0; i<60; i++)
				{
					//0 <= n < 1
					var x: int = (Math.floor(Math.random() * 100) % stufeX) * 180 / stufeX + 58;
					var y: int = (Math.floor(Math.random() * 100) % stufeY) * 280 / stufeY + 117;
					trace(x, y);
					this.addEnemy4a(new enemy_boss4a_children(this.myroot,x,y));
				}				
				/* // Der Code von den alten Mini-Maden.
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,180,180) );
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,200,200) );
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,180,210) );
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,190,190) );
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,210,160) );
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,163,190) );
				this.addEnemy4a( new enemy_boss4a_children(this.myroot,176,110) );
				*/
			}
		}
		
		public function addEnemy4a(enemy:enemy_boss4a_children) {
			this.myroot.enemies.addChild(enemy);
			this.myroot.enemies_array.push(enemy);
		}
	}
}