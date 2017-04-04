// E 3 Cutterfly
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy3 extends Enemy {
		
		public function enemy3(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 10,3);
		}		
	}
}