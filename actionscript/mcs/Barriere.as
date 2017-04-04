package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Barriere extends MovieClip {
		
		public var speed:Number;
		public var dead:int=0;
		public var counter:int=0;
		public var myroot:MovieClip;
		public var health:int=2500;
		public var zustand:int=0;
		
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				if (this.dead == 0) {
					if(this.currentFrame>1 && this.currentFrame<this.totalFrames){
						this.play();
					}
					this.counter++;
					this.y+= 2;
					if (this.y > 600) {
						for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
							if (this.myroot.enemies_array[i] == this) {
								this.myroot.enemies_array.splice(i,1);
							}
						}
						this.myroot.enemies.removeChild(this);
					}
				} else {
					if (this.currentFrame==this.totalFrames) {
						this.myroot.enemies.removeChild(this);
					}
				}
			}else{
				if(this.currentFrame>1 && this.currentFrame<this.totalFrames){
						this.stop();
				}
			}
		}
		
		public function kill(minushealth:int) {
			if (this.dead == 0) {
				this.health-= minushealth;
				if (this.health < 0) {
					this.health=0;
				} else {
					this.shake();
	//				this.first_blood.play();
				}
				if (this.health == 0) {
					this.myroot.kills++;
					this.myroot.credits_f(200);
					this.gotoAndPlay(2);
					this.dead=1;
					
					var remove_nr: int = this.myroot.enemies_array.indexOf(this);
					if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
				}
			}
		}
		
		public var shake_counter:int=0;
		public function shake() {
			if (this.shake_counter==0) {
				this.addEventListener(Event.ENTER_FRAME,this.shake_oef);
			}
		}
		
		public function shake_oef(event:Event) {
			this.shake_counter++;
			if (this.shake_counter==1) {
				this.x=-2;
			} else if (this.shake_counter==2) {
				this.x=2;
			} else if (this.shake_counter==3) {
				this.x=0;
				this.shake_counter=0;
				this.removeEventListener(Event.ENTER_FRAME,this.shake_oef);
			}
		}
	}
}