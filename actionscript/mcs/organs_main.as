// ENEMIE 1
package mcs{	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class organs_main extends MovieClip {
		public var nr:int=0;
		public var myroot:MovieClip;
		public var health:int;
		public var dead:int = 0;
		public var t:int = 20;
		public function organs_main(root_p:MovieClip,nr_p:int) {
			this.name="organs";
			this.myroot=root_p;
			this.nr=nr_p;
			this.x=140;
			this.y=85;
			this.health=50;
			this.gotoAndStop(1+Math.floor(Math.random()*this.totalFrames));
			if(this.nr==0){
				this.x-=10;
				this.y-=10;
			}else if(this.nr==1){
				this.x+=10;
				this.y-=10;
			}else if(this.nr==2){
				this.x-=10;
				this.y+=10;
			}else if(this.nr==3){
				this.x+=10;
				this.y+=10;
			}
			this.addEventListener(Event.ENTER_FRAME, this.oef);
		}
		public function oef(event:Event) {
			if (this.dead == 0) {
				this.y+=2;
				if(this.nr==0){
					this.y-=1;
					this.x-=1;
				}else if(this.nr==1){
					this.x+=1;
					this.y-=1;
				}else if(this.nr==2){
					this.x-=1;
				}else if(this.nr==3){
					this.x+=1;
				}
			} else {
				if (this.bo.o.currentFrame == this.bo.o.totalFrames) {
					this.removeEventListener(Event.ENTER_FRAME,this.oef);
					this.myroot.enemies.removeChild(this);
					delete this;
				}
			}
		}
		public function kill(minushealth:int) {
			if(this.dead==0){
				this.health-= minushealth;
				if (this.health < 0) {
					this.health=0;
				} else {
					//MovieClip(this.getChildByName('first_blood')).play();
				}
				if (this.health == 0) {
					this.bo.o.play();
					this.myroot.kills++;
					this.myroot.credits_f(10);
					//this.gotoAndPlay(2);
					this.dead = 1;
					var remove_nr:int=this.myroot.enemies_array.indexOf(this);
					if (remove_nr > -1) this.myroot.enemies_array.splice(remove_nr, 1);
				}
			}
		}
	}
}