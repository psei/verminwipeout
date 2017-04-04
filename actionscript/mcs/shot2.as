// STANDARD ROCKETs WAFFE 7
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot2 extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var typ:int;
		public function shot2(root_p:MovieClip,typ_p:int) {
			this.myroot=root_p;
			this.typ=typ_p;
			if (this.typ==1) {
				this.x=this.myroot.ship_mc.x-15;
				this.y=this.myroot.ship_mc.y+40+Math.floor(1+Math.random()*30);
			} else {
				this.x=this.myroot.ship_mc.x+34;
				this.y=this.myroot.ship_mc.y+30+Math.floor(1+Math.random()*30);
			}
			this.myroot.shots.addChild(this);
			this.myroot.SoundEffect("w7");
			this.myroot.sss+=1;
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.r2.rf.play();
				this.y-=10;
				if (this.y<-50) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
				if (this.visible==true) {
					for (var i:int=0; i<this.myroot.enemies_array.length; i++) {
						var target:MovieClip = this.myroot.enemies_array[i];
						var bossname:String=target.name;
						if (bossname.charAt(0) == "b") {

							if (target.body.ha.hitTestPoint(this.x,this.y,true)) {
								var ex1:explosion=new explosion(this.myroot,this.x,this.y);
								target.kill(200);
								this.visible=false;
							}
						} else {
							if (target.hitTestPoint(this.x,this.y,true)) {
								var ex3:explosion=new explosion(this.myroot,this.x,this.y);
								target.kill(200);
								this.visible=false;							
							}
						}
					}
				}
			}else{
				this.r2.rf.stop();
			}
		}
	}
}