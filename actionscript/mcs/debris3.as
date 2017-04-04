// DEBRIS 3  ASTEROID ROCK
package mcs {
	import flash.display.MovieClip;
	public class debris3 extends Debris {
		
		public function debris3(root_p:MovieClip,typ_p:int) {
			this.name="debris3";
			this.myroot=root_p;
			this.typ=typ_p;
			this.sc=this.t1;
			this.x=4+Math.floor(1+Math.random()*380);
			this.y=-900+Math.floor(1+Math.random()*550);
			this.xpos=this.x;
			this.rotation=Math.floor(1+Math.random()*350);
			this.speed=+1+Math.floor(1+Math.random()*4);
		}
	}
}