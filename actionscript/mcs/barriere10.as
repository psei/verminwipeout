// barriere 10  RED single beinchen right
package mcs {
	import flash.display.MovieClip;
	import flash.events.*;
	public class barriere10 extends Barriere {
		public function barriere10(root_p:MovieClip) {
			this.name="schranke10";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health=2500;
		}
	}
}