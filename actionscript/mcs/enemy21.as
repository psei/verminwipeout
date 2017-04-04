// ENEMIE 21 - crystall star
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy21 extends Enemy {
		
		public function enemy21(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 6000,21);
		}
	}
}