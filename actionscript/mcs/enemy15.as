// ENEMIE 15 - green tighty
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy15 extends Enemy {
		
		public function enemy15(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 4000,15);
		}
	}
}