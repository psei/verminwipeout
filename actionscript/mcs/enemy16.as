// ENEMIE 16 - green fattie
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy16 extends Enemy {
		
		public function enemy16(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 15000,16);
		}
	}
}