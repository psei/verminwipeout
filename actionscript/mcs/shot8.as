// PHALANX MISSILES  WAFFE 8
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot8 extends MovieClip {
		public var speed:Number;
		public var exploded:int=0;
		//public var nr:int;
		public var myroot:MovieClip;
		public function shot8(root_p:MovieClip) {
			this.myroot=root_p;
			this.x=this.myroot.ship_mc.x+9;
			this.y=this.myroot.ship_mc.y+40;
			this.myroot.shots.addChild(this);
			this.myroot.SoundEffect("w8");
			this.myroot.sss+2;
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				if(this.currentFrame<10 || (this.currentFrame>19 && this.currentFrame<25)){
					this.play();
				}
				if (this.currentFrame==25) {
					for (var i:int=this.myroot.enemies_array.length-1; i>-1; i--) {
						var target:MovieClip = this.myroot.enemies_array[i];
						if (target.y<285) {
							target.kill(3000);
						}
					}
					var ex_mega:p_explosion=new p_explosion(this.myroot);
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
				if (this.y<200 && this.exploded==0) {					
					this.exploded=1;
					this.gotoAndPlay(20);	
				}
				if(this.exploded==0){
					this.y-=8;
				}
			}else{
				if(this.currentFrame<10 || (this.currentFrame>19 && this.currentFrame<25)){
					this.stop();
				}
			}
		}
	}
}