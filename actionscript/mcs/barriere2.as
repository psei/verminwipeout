// barriere 2 SCHROTT
package mcs {
	public class barriere2 extends Barriere {

		public function barriere2(root_p:MovieClip) {
			this.name="schranke2";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health = 10000;
		}
	}
}