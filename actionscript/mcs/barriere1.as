// barriere1
package mcs {
	public class barriere1 extends Barriere {
		
		public function barriere1(root_p:MovieClip) {
			this.name="schranke1";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health = 5000;
		}
		
		override public function kill(minushealth:int) {
			this.health-= minushealth;
			if (this.health < 0) {
				this.health=0;
			} else {
				if (this.health<3500 && this.zustand==0) {
					this.b1.gotoAndPlay(2);
					this.zustand=1;
				}
				this.shake();
				this.first_blood.play();
			}
			if (this.health == 0) {
				this.myroot.kills++;
				this.myroot.credits_f(20);
				this.b2.gotoAndPlay(2);
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