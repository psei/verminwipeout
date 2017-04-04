// FLY - GREEN
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class fly3 extends MovieClip {
		public var speed:Number;
		public var dead:int=0;
		public var t:Number=20;
		public var xpos:Number=0;
		public var xdir:int=1;
		public var sc:Number=0;
		public var t1:Number=0;
		public var typ:int;
		public var counter:int=0;
		public var score:int=0;
		public var myroot:MovieClip;
		public var health:int=500;
		public function fly3(root_p:MovieClip,xp:Number,yp:Number,t1_p:Number) {
			this.myroot=root_p;
			this.t1=t1_p;
			this.sc=this.t1;
			
			this.x=xp;
			this.y=yp;
			this.xpos=this.x;
		}
		public function oef(event:Event) {
			if(this.myroot.gp==0){
				if (this.dead == 0) {
					this.counter++;
					if(this.currentFrame>9 && this.currentFrame<this.totalFrames){
						this.play();
					}else if(this.currentFrame<9){
						this.play();
					}
					this.y+= 12;
					this.x-= (this.x-this.myroot.ship_mc.x)/80;
					if (this.y > 600 || this.x < -100 || this.x > 500) {
						this.myroot.enemies.removeChild(this);
						var remove_nr: int = this.myroot.enemies_array.indexOf(this);
						if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
						delete this;
					}
				} else {
					if (this.currentFrame == this.totalFrames) {
						this.myroot.enemies.removeChild(this);
						remove_nr = this.myroot.enemies_array.indexOf(this);
						if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
						delete this;
					}
				}
			}
		}
		public function kill(minushealth:int) {
			if (this.dead == 0) {
				this.health-= minushealth;
				this.myroot.sshit++;
				if (this.health < 0) {
					this.health=0;
				} else {
					this.first_blood.play();
				}
				if (this.health == 0) {
					var distance:Number=this.myroot.ship_mc.y-this.y;
					if (distance<150 && distance>=0) {
						this.myroot.matsch_f();
					}
					this.myroot.kills++;
	
					this.myroot.credits_f(100);
					//this.myroot.score+=20;
					this.gotoAndPlay(10);
					this.dead=1;
				}
			}
		}
	}
}