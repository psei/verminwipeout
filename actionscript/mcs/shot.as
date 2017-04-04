// STANDARD BLASTER
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class shot extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public function shot(root_p:MovieClip) {
			this.myroot=root_p;
			this.myroot.ss++;
			this.myroot.SoundEffect("w1");
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.y-= 15;
				if (this.y < -50) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
				if (this.visible) {
					for (var i:int=0; i < this.myroot.enemies_array.length; i++) {
						var target:MovieClip=this.myroot.enemies_array[i];
						var bossname:String=target.name;
						if (bossname.charAt(0) == "b") {
							if (target.body.ha.hitTestPoint(this.x,this.y,true)) {
								target.kill(50);
								this.myroot.sshit++;
								this.visible=false;
							}
						} else {
							if (target.hitTestPoint(this.x,this.y,true)) {
								target.kill(50);
								this.myroot.sshit++;
								this.visible=false;
							}
						}
					}
				}
			}
		}
	}
}