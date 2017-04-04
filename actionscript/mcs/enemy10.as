// ENEMIE 10 orange - Whurm
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy10 extends Enemy {
		
		public function enemy10(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 3000,10);
		}
	}
}