﻿// ENEMIE 20 - crystall schlaengel
package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class enemy20 extends Enemy {
		
		public function enemy20(root_p:MovieClip, typ_p:int, xp:Number, yp:Number, t1_p:Number) {
			super(root_p, typ_p, xp, yp, t1_p, 3500,20);
		}
	}
}