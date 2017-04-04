// DEBRIS 2  flubber
package mcs {
	import flash.display.MovieClip;
	public class debris2 extends Debris {
		
		public function debris2(root_p:MovieClip,typ_p:int) {
			this.name="debris2";
			this.myroot=root_p;
			this.typ=typ_p;
			this.sc=this.t1;
			this.x=4+Math.floor(1+Math.random()*380);
			this.y=-900+Math.floor(1+Math.random()*500);
			this.xpos=this.x;
			this.rotation=Math.floor(1+Math.random()*350);
			this.speed=+1+Math.floor(1+Math.random()*4);
		}
	}
}