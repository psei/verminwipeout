// MISSION 7 - FINAL BOSS - CRANK 2
package missions{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class mission7 extends Mission {
		public var wave:int=0;
		public var total_waves=3;
		public var times:Array=new Array(200,500,900);
		public function mission7(root_p:MovieClip) {
			super(root_p);
		}
		public function mission_0() {
			this.stationLeaveMainPlay();
			
			// this.myroot.schild8.gotoAndPlay(2);
			this.addEnemy(new enemy25(this.myroot,0,200,0,0));
		}
		public function mission_1() {
			// barriere bein single
			var b10:barriere10=new barriere10(this.myroot);
			this.myroot.enemies.addChild(b10);
			this.myroot.enemies_array.push(b10);

			// barriere bein single
			var b8:barriere8=new barriere8(this.myroot);
			this.myroot.enemies.addChild(b8);
			this.myroot.enemies_array.push(b8);

			// DEBRIS 1 Scrap
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var e1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(e1);
				this.myroot.enemies_array.push(e1);
			}
			// DEBRIS 2 Clump
			var da2:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da2; j++) {
				var e2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
			}
		}
		public function mission_2() {
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss7.visible=true;
			this.myroot.name_boss7.gotoAndPlay(1);
			// BOSS
			var e1:boss7=new boss7(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
		}
		public function mission7_end() {
			this.myroot.bossmode=false;
			this.myroot.stats.stats_check();
			this.myroot.stats_mc.visible=true;
			this.myroot.zustand=1;
			this.myroot.w2_heat=0;
			this.myroot.w2.heat.scaleX=0;
			this.myroot.matsch.gotoAndStop(1);
			this.myroot.matsch_zustand=0;
			for (var i:int=0; i<10; i++) {
				this.myroot["w" + (i + 1)].w_selected.visible=false;
			}
		}
		public function reset_mission() {
			this.wave=0;
		}
	}
}