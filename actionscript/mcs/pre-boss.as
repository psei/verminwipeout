// PRE BOSS
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class preboss extends MovieClip {
		public var speed:Number;
		//public var nr:int;
		public var dead:int=0;
		public var t:Number=20;
		public var xpos:Number=0;
		public var xdir:int=1;
		public var t1:int=0;
		public var typ:int;
		public var counter:int=0;
		public var score:int=0;
		public var myroot:MovieClip;
		public var health:int=100;
		public function preboss(root_p:MovieClip,typ_p:int,xp:Number,yp:Number,t1_p:int) {
			this.myroot=root_p;
			this.typ=typ_p;
			this.t1=t1_p;
			this.x=xp;
			this.y=-100 - yp;
			this.xpos=this.x;
			this.scaleX=Math.random() * 0.3 + 0.7;
			this.scaleY=Math.random() * 0.3 + 0.7;
			this.addEventListener(Event.ENTER_FRAME,this.oef);
			if (this.typ == 1) {
				this.rotation = -30;
			} else if (this.typ == 2) {
				this.rotation = +30;
			}
		}
		public function oef(event:Event) {

			if (this.dead == 0) {
				this.myroot.counter=1282;
				this.counter++;
				if (this.typ == 0) {
					this.y+= 7;

				} else if (this.typ == 1) {
					this.y+= 7;
					this.x+= 4;
				} else if (this.typ == 2) {
					this.y+= 7;
					this.x-= 4;
				}
				if (this.y > 600 || this.x < -100 || this.x > 500) {
					this.removeEventListener(Event.ENTER_FRAME,this.oef);
					for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
						if (this.myroot.enemies_array[i] == this) {
							this.myroot.enemies_array.splice(i,1);
						}
					}
					this.myroot.enemies.removeChild(this);
				}
			} else {
				if (this.currentFrame == this.totalFrames) {
					this.removeEventListener(Event.ENTER_FRAME,this.oef);
					this.myroot.enemies.removeChild(this);
				}
			}
		}
		public function kill(minushealth:int) {
			this.health-= minushealth;
			if (this.health < 0) {
				this.health=0;
			} else {
				this.first_blood.play();
			}
			if (this.health == 0) {
				this.myroot.credits_f(20);
				//this.myroot.score+=20;
				this.gotoAndPlay(2);
				this.dead=1;
				this.myroot.matsch_f();
				for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
					if (this.myroot.enemies_array[i] == this) {
						this.myroot.enemies_array.splice(i,1);
					}
				}
			}
		}
	}
}