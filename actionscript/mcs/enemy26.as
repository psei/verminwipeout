﻿// ENEMIE 26 - small bone 3
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy26 extends Enemy {
		
		public function enemy26(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 4000,26);
		}
	}
}