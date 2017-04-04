// barriere 6  RED pulse worm
package mcs {
	public class barriere6 extends Barriere {
		
		public function barriere6(root_p:MovieClip) {
			this.name="schranke6";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health=50000;
		}
	}
}