// DEBRIS 8	  muecke
package mcs {
	import flash.display.MovieClip;
	public class debris8 extends Debris {
		
		public function debris8(root_p:MovieClip,typ_p:int) {
			this.name="debris8";
			this.myroot=root_p;
			this.typ=typ_p;
			this.sc=this.t1;
			this.x=4+Math.floor(1+Math.random()*380);
			this.y=-900+Math.floor(1+Math.random()*550);
			this.xpos=this.x;
			this.speed=+1+Math.floor(1+Math.random()*4);
		}
	}
}