// ENEMIE 7 orange - Crustclaw
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy7 extends Enemy {
		
		public function enemy7(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 10000,7);
		}
	}
}