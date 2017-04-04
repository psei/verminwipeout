// barriere  7  WRACK
package mcs{
	public class barriere7 extends Barriere {
		
		public function barriere7(root_p:MovieClip) {
			this.name="schranke7";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=110;
			this.y=-400;
			this.health = 5000;
		}
	}
}