// ENEMIE 25 - small bone 2
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy25 extends Enemy {
		
		public function enemy25(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 4000,25);
		}
	}
}