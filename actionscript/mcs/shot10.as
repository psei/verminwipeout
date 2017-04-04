// BIG ROCKET 5000 WAFFE 10
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot10 extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var exploded:Number=0;
		public function shot10(root_p:MovieClip) {
			this.myroot=root_p;
			this.x=this.myroot.ship_mc.x+9;
			this.y=this.myroot.ship_mc.y+40;
			this.myroot.shots.addChild(this);
			this.myroot.sss++;
			this.myroot.SoundEffect("w10");
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.rf.play();
				this.y-=5;
				if (this.y<190) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
				if (this.y<200 && this.exploded==0) {
					this.exploded=1;
					for (var i:int=this.myroot.enemies_array.length-1; i>-1; i--) {
						var target:MovieClip = this.myroot.enemies_array[i];
						target.kill(5000);
					}
					var ex_mega:explosion_mega=new explosion_mega(this.myroot);
				}
			}else{
				this.rf.stop();
			}
		}
	}
}