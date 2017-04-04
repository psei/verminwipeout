// PLASMA BURNER WAFFE 3
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot_plasma extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var distance:Number=0;
		public function shot_plasma(root_p:MovieClip) {
			this.myroot=root_p;
			this.myroot.ss++;
			this.distance=this.myroot.ship_mc.y - 200;
			this.y=this.myroot.ship_mc.y;
			this.x=this.myroot.ship_mc.x;
			this.myroot.shots.addChild(this);
			this.myroot.SoundEffect("w3");
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.play();
				this.y-= (this.y - this.distance)/ 10;
				if (this.y < this.distance + 10) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}				
				for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
					var target:MovieClip=this.myroot.enemies_array[i];
					var bossname:String=target.name;
					if (bossname.charAt(0) == "b") {
						if (target != null && target.body.ha.hitTestObject(this)) {
							target.kill(150);
							this.myroot.sshit++;
						}
					} else {
						if (target != null && target.hitTestObject(this)) {
							target.kill(150);
							this.myroot.sshit++;
						}
					}
				}
				
			}else{
				this.stop();
			}
			
		}
	}
}