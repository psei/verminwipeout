// ENEMIE 1a TECH
package mcs {	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy1a extends Enemy {
		
		public function enemy1a(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 30, 1);
		}	
	}
}