package missions {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class Mission extends MovieClip {
		
		public var myroot:MovieClip;

		public function Mission(root_p:MovieClip) {
			this.myroot=root_p;
		}
		
		protected function addEnemy(enemy:Enemy) {
			this.myroot.enemies.addChild(enemy);
			this.myroot.enemies_array.push(enemy);
		}
		
		public function stationEnterMainPlay() {
			//show station text
			this.myroot.station_enter.visible=true;
			this.myroot.station_enter.gotoAndPlay(1);
			
			//set station welcome text
			this.myroot.station_enter.getChildByName("txt1").text = this.myroot.langs[this.myroot.chl]["station_enter_head_" + this.myroot.mission_nr];
			this.myroot.station_enter.getChildByName("txt2").text = this.myroot.langs[this.myroot.chl]["station_enter_subs_" + this.myroot.mission_nr];
			
			//show station
			this.myroot["station" + this.myroot.mission_nr].visible=true;
			this.myroot["station" + this.myroot.mission_nr].gotoAndPlay(2);
		}
		
		public function stationLeaveMainPlay() {
			//show station text
			this.myroot.station_leave.visible=true;
			this.myroot.station_leave.gotoAndPlay(1);
			
			//set station goodbye text
			this.myroot.station_leave.getChildByName("txt1").text = this.myroot.langs[this.myroot.chl]["station_leave_head_" + (this.myroot.mission_nr-1)];
			this.myroot.station_leave.getChildByName("txt2").text = this.myroot.langs[this.myroot.chl]["station_leave_subs_" + (this.myroot.mission_nr-1)];
		}
		
	}
	
}