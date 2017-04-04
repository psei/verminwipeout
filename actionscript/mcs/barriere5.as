// barriere5  CRYSTAL
package mcs {
	public class barriere5 extends Barriere {
		
		public function barriere5(root_p:MovieClip) {
			this.name="schranke5";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
			this.health=50000;
		}
	}
}