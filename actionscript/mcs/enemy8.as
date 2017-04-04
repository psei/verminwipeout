// ENEMIE 8 orange - Crusteele
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy8 extends Enemy {
		
		public function enemy8(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 15000, 8);
		}
	}
}