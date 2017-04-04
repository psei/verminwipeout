// BOSS
package mcs {
	import flash.display.MovieClip;
	public class Boss extends MovieClip {
		private var used_array:Array=new Array;
		private var usedCount=0;
		private var initial=true;
		private var lastAttack=-1;
		
		//example for max=5
		//returns 0, 1, 2, 3, 4, 5 on first 5 calls
		//returns 2, 1, 5, 0, 4, 3 on following 5 calls
		//returns 5, 2, 1, 4, 0, 3 on following 5 calls
		//...
		public function getAttack(max) {

			if (this.initial) {
				this.lastAttack++;
				if (this.lastAttack <= max) {
					return this.lastAttack;
				}
				this.initial = false;
				this.resetUsed(max);
			}
			
			if (this.usedCount == max+1) {
				this.resetUsed(max);
			}
			
			var randLimit = max+1 - this.usedCount;
			var rand      = Math.floor(Math.random()*randLimit);

			var i = -1;
			this.lastAttack=-1;
			while (i<rand) {
				this.lastAttack++;
				if (this.used_array[this.lastAttack]==false) {
					i++;
				}
			}
			this.used_array[this.lastAttack]=true;
			this.usedCount++;
			return this.lastAttack;
		}
		
		private function resetUsed(max) {
			for (var i:int=0; i<=max; i++) {
				this.used_array[i]=false;
			}
			this.usedCount=0;
		}
		
		public function resetAttack(max) {
			this.resetUsed(max);
			this.initial=true;
			this.lastAttack=-1;
		}
	}
}