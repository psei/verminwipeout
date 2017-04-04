// barriere 4 GREEN
package mcs {
	public class barriere4 extends Barriere {
		
		public function barriere4(root_p:MovieClip) {
			this.name="schranke4";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health = 50000;
		}
		
		override public function kill(minushealth:int) {
			if(this.dead==0){
				this.health-= minushealth;
				if (this.health < 0) {
					this.health=0;
					
				} else if(this.health>0){
					if (this.health<45000 && this.zustand==0) {
						this.loch1.gotoAndPlay(2);
						this.zustand=1;
					} else if (this.health<40000 && this.zustand==1) {
						this.loch2.gotoAndPlay(2);
						this.zustand=2;
					} else if (this.health<35000 && this.zustand==2) {
						this.loch3.gotoAndPlay(2);
						this.zustand=3;
					} else if (this.health<25000 && this.zustand==3) {
						this.loch4.gotoAndPlay(2);
						this.zustand=4;
					} else if (this.health<15000 && this.zustand==4) {
						this.loch5.gotoAndPlay(2);
						this.zustand=5;
					}
					
					this.shake();
					this.first_blood.play();
				}
				if (this.health == 0) {
					
					this.myroot.kills++;
					this.myroot.credits_f(20);
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
}