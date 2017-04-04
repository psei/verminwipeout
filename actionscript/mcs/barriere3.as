// barriere  3  CORALL REEF
package mcs {
	public class barriere3 extends Barriere {

		public function barriere3(root_p:MovieClip) {
			this.name="schranke3";
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health = 15000;
		}
	}
}