// barriere 8  RED single beinchen left
package mcs {
	public class barriere8 extends Barriere {
		
		public function barriere8(root_p:MovieClip) {
			this.name="schranke8";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
		}
	}
}