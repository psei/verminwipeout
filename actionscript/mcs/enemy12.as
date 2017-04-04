// ENEMIE 12 - green smallest
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy12 extends Enemy {
		
		public function enemy12(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 3000,12);
		}
	}
}