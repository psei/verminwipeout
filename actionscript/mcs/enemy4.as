// ENEMIE 4 - green biggie

package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy4 extends Enemy {
		
		public function enemy4(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 1500,4);
		}
	}
}