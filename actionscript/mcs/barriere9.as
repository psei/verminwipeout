// barriere 9  RED single beinchen right
package mcs {
	public class barriere9 extends Barriere {
		
		public function barriere9(root_p:MovieClip) {
			this.name="schranke9";			
			this.myroot=root_p;
			this.myroot.enemy_count++;
			this.x=0;
			this.y=-400;
		}
	}
}