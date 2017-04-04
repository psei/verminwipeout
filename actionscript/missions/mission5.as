// MISSION 5 - CRYSTALL

// Needs some mofo extra waves and shootingstars

package missions{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class mission5 extends Mission {
		public var wave:int=0;
		public var total_waves=24;
		public var times:Array=new Array(80,320,400,500,600,700,800,900,1000,1100,
										 1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,
										 2200,2300,2400,2700);
		public function mission5(root_p:MovieClip) {
			super(root_p);
		}
		public function mission_0() {
			this.stationLeaveMainPlay();
			
			// Crystal-Barriere
			var b1:barriere5=new barriere5(this.myroot);
			this.myroot.enemies.addChild(b1);
			this.myroot.enemies_array.push(b1);					

			
			// DEBRIS 1 - Scrap
			var da1:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da1; i++) {
				var d1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 9 - MeshBall
			var da9:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da9; j++) {
				var d2:debris9=new debris9(this.myroot,0);
				this.myroot.enemies.addChild(d2);
				this.myroot.enemies_array.push(d2);
			}
			// DEBRIS 10 - MeshFlake
			var da10:int=Math.floor(2+Math.random()*8);
			for (var k:int=0; k < da10; k++) {
				var d3:debris10=new debris10(this.myroot,0);
				this.myroot.enemies.addChild(d3);
				this.myroot.enemies_array.push(d3);
			}		
			this.addEnemy(new enemy20(this.myroot,0,270,40,0));
		}
		public function mission_1() {
			
			
			// WRACK needs extra wave
			var b2:barriere7=new barriere7(this.myroot);
			this.myroot.enemies.addChild(b2);
			this.myroot.enemies_array.push(b2);	
			
			// DEBRIS 1 Scrap wich is floating around the wrack
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			

			// snowflake with smalls
			// mitte
			this.addEnemy(new enemy17(this.myroot,0,270,40,0));
			this.addEnemy(new enemy17(this.myroot,0,250,50,0));
			this.addEnemy(new enemy17(this.myroot,0,250,100,0));
			this.addEnemy(new enemy17(this.myroot,0,250,150,0));
			this.addEnemy(new enemy17(this.myroot,0,250,200,0));
			this.addEnemy(new enemy17(this.myroot,0,250,250,0));
			// reihe links
			this.addEnemy(new enemy17(this.myroot,0,200,120,0));
			this.addEnemy(new enemy17(this.myroot,0,200,170,0));
			// reihe rechts
			this.addEnemy(new enemy17(this.myroot,0,300,120,0));
			this.addEnemy(new enemy17(this.myroot,0,300,170,0));
			// reihe links 2
			this.addEnemy(new enemy17(this.myroot,0,150,90,0));
			this.addEnemy(new enemy17(this.myroot,0,150,200,0));
			// reihe rechts 2
			this.addEnemy(new enemy17(this.myroot,0,350,90,0));
			this.addEnemy(new enemy17(this.myroot,0,350,200,0));
			// reihe links 3
			this.addEnemy(new enemy17(this.myroot,0,100,60,0));
			this.addEnemy(new enemy17(this.myroot,0,100,230,0));
			// reihe rechts 3
			this.addEnemy(new enemy17(this.myroot,0,400,60,0));
			this.addEnemy(new enemy17(this.myroot,0,400,230,0));
			// reihe links 4
			this.addEnemy(new enemy17(this.myroot,0,50,30,0));
			this.addEnemy(new enemy17(this.myroot,0,50,260,0));
			// reihe rechts 4
			this.addEnemy(new enemy17(this.myroot,0,430,30,0));
			this.addEnemy(new enemy17(this.myroot,0,430,260,0));
		}
		public function mission_2() {
			// small 2   spears
			this.addEnemy(new enemy18(this.myroot,0,200,50,0));
			this.addEnemy(new enemy18(this.myroot,0,240,0,0));
			this.addEnemy(new enemy18(this.myroot,0,280,40,0));

			this.addEnemy(new enemy18(this.myroot,0,40,170,0));
			this.addEnemy(new enemy18(this.myroot,0,80,130,0));
			this.addEnemy(new enemy18(this.myroot,0,120,162,0));

			this.addEnemy(new enemy18(this.myroot,0,230,180,0));
			this.addEnemy(new enemy18(this.myroot,0,280,143,0));
			this.addEnemy(new enemy18(this.myroot,0,323,170,0));
			
			this.addEnemy(new enemy18(this.myroot,0,190,370,0));
			this.addEnemy(new enemy18(this.myroot,0,240,330,0));
			this.addEnemy(new enemy18(this.myroot,0,290,380,0));
			this.addEnemy(new enemy18(this.myroot,0,340,420,0));
		}
		public function mission_3() {
			// single small again
			this.addEnemy(new enemy18(this.myroot,0,50,255,0));
			this.addEnemy(new enemy18(this.myroot,0,130,153,0));
			this.addEnemy(new enemy18(this.myroot,0,220,4,0));
			this.addEnemy(new enemy18(this.myroot,0,320,150,0));
			this.addEnemy(new enemy18(this.myroot,0,400,250,0));
		}
		public function mission_4() {
			// smalls spear and one biggie following
			this.addEnemy(new enemy18(this.myroot,0,40,390,0));
			this.addEnemy(new enemy18(this.myroot,0,50,255,0));
			this.addEnemy(new enemy18(this.myroot,0,130,153,0));
			this.addEnemy(new enemy18(this.myroot,0,220,4,0));
			this.addEnemy(new enemy18(this.myroot,0,320,150,0));
			this.addEnemy(new enemy18(this.myroot,0,400,250,0));
			this.addEnemy(new enemy18(this.myroot,0,410,380,0));
			// single biggie - same speed
			this.addEnemy(new enemy21(this.myroot,0,227,250,0));
		}
		public function mission_5() {
			// smalls big bow
			this.addEnemy(new enemy18(this.myroot,0,20,5,50));
			this.addEnemy(new enemy18(this.myroot,0,61,33,50));
			this.addEnemy(new enemy18(this.myroot,0,102,52,50));
			this.addEnemy(new enemy18(this.myroot,0,140,70,50));
			this.addEnemy(new enemy18(this.myroot,0,180,69,50));
			this.addEnemy(new enemy18(this.myroot,0,220,55,50));
			this.addEnemy(new enemy18(this.myroot,0,260,43,50));
			this.addEnemy(new enemy18(this.myroot,0,300,30,50));
			this.addEnemy(new enemy18(this.myroot,0,342,20,50));
			this.addEnemy(new enemy18(this.myroot,0,380,9,0));
			this.addEnemy(new enemy18(this.myroot,0,420,0,0));
		}
		public function mission_6() {
			// schlawengel
			this.addEnemy(new enemy18(this.myroot,0,20,5,50));
			this.addEnemy(new enemy18(this.myroot,0,61,33,50));
			this.addEnemy(new enemy18(this.myroot,0,102,52,50));
			this.addEnemy(new enemy18(this.myroot,0,140,70,50));
			this.addEnemy(new enemy18(this.myroot,0,180,69,50));
			this.addEnemy(new enemy18(this.myroot,0,220,64,50));
			this.addEnemy(new enemy18(this.myroot,0,260,33,50));
			this.addEnemy(new enemy18(this.myroot,0,300,15,50));
			this.addEnemy(new enemy18(this.myroot,0,342,0,50));
			this.addEnemy(new enemy18(this.myroot,0,380,9,0));
			this.addEnemy(new enemy18(this.myroot,0,420,30,0));	
		}
		public function mission_7() {
			// little snowflake - x
			this.addEnemy(new enemy17(this.myroot,0,320,20,0));
			this.addEnemy(new enemy17(this.myroot,0,100,0,0));
			this.addEnemy(new enemy17(this.myroot,0,200,50,0));
			this.addEnemy(new enemy17(this.myroot,0,300,90,0));
			this.addEnemy(new enemy17(this.myroot,0,110,100,0));	
			// up n down
			this.addEnemy(new enemy17(this.myroot,6,250,20,0));
			this.addEnemy(new enemy17(this.myroot,6,300,0,0));
		}
		public function mission_8() {
			// schild9 - kugel - fliegt vorbei
			this.myroot.schild9.gotoAndPlay(2);			
			// little spear - small 3
			this.addEnemy(new enemy18(this.myroot,0,400,70,0));
			this.addEnemy(new enemy18(this.myroot,0,300,0,0));
			this.addEnemy(new enemy18(this.myroot,0,200,50,0));	
		}
		public function mission_9() {
			// small 3 rudel - double line
			// wand 1 	
			this.addEnemy(new enemy19(this.myroot,0,40,0,0));
			this.addEnemy(new enemy19(this.myroot,0,80,30,0));
			this.addEnemy(new enemy19(this.myroot,0,120,30,0));
			this.addEnemy(new enemy19(this.myroot,0,160,20,0));
			this.addEnemy(new enemy19(this.myroot,0,200,0,0));
			this.addEnemy(new enemy19(this.myroot,0,240,0,0));
			this.addEnemy(new enemy19(this.myroot,0,280,0,0));
			this.addEnemy(new enemy19(this.myroot,0,320,40,0));
			this.addEnemy(new enemy19(this.myroot,0,360,30,0));
			this.addEnemy(new enemy19(this.myroot,0,400,0,0));
			// wand 2 
			this.addEnemy(new enemy19(this.myroot,19,40,400,0));
			this.addEnemy(new enemy19(this.myroot,19,80,430,0));
			this.addEnemy(new enemy19(this.myroot,19,120,430,0));
			this.addEnemy(new enemy19(this.myroot,19,160,400,0));
			this.addEnemy(new enemy19(this.myroot,19,200,400,0));			
			this.addEnemy(new enemy19(this.myroot,19,240,400,0));
			this.addEnemy(new enemy19(this.myroot,19,280,400,0));
			this.addEnemy(new enemy19(this.myroot,19,320,430,0));
			this.addEnemy(new enemy19(this.myroot,19,360,430,0));
			this.addEnemy(new enemy19(this.myroot,19,400,400,0));
		}
		public function mission_10() {
			// spear - like zusel mouse cursor
			// dreieck
			this.addEnemy(new enemy17(this.myroot,0,250,0,50));
			this.addEnemy(new enemy17(this.myroot,0,200,50,50));			
			this.addEnemy(new enemy17(this.myroot,0,150,100,50));
			this.addEnemy(new enemy17(this.myroot,0,100,150,50));
			this.addEnemy(new enemy17(this.myroot,0,50,200,50));
			this.addEnemy(new enemy17(this.myroot,0,30,250,50)); 

			this.addEnemy(new enemy17(this.myroot,0,300,40,50));
			this.addEnemy(new enemy17(this.myroot,0,350,110,50));
			this.addEnemy(new enemy17(this.myroot,0,400,170,50));
			this.addEnemy(new enemy17(this.myroot,0,420,220,50));
			// schwanz
			this.addEnemy(new enemy17(this.myroot,3,250,50,0));
			this.addEnemy(new enemy17(this.myroot,3,250,100,0.1));
			this.addEnemy(new enemy17(this.myroot,3,250,150,0.2));
			this.addEnemy(new enemy17(this.myroot,3,250,200,0.2));
			this.addEnemy(new enemy17(this.myroot,3,250,250,0.1));
			this.addEnemy(new enemy17(this.myroot,3,250,300,0.2));
			this.addEnemy(new enemy17(this.myroot,3,250,350,0.1));
			this.addEnemy(new enemy17(this.myroot,3,250,400,0.2));
		}
		public function mission_11() {
			// zick zack crew
			this.addEnemy(new enemy19(this.myroot,23,250,0,20));
			this.addEnemy(new enemy19(this.myroot,23,150,60,30));
			this.addEnemy(new enemy19(this.myroot,23,300,50,40));

			this.addEnemy(new enemy19(this.myroot,23,300,200,35));
			this.addEnemy(new enemy19(this.myroot,23,230,210,35));
		}
		public function mission_12() {
			// fattie
			this.addEnemy(new enemy23(this.myroot,0,250,0,15));
		}
		public function mission_13() {
			// small spear - schraeg
			this.addEnemy(new enemy17(this.myroot,2,470,30,0));
			this.addEnemy(new enemy17(this.myroot,2,400,20,0));
			this.addEnemy(new enemy17(this.myroot,2,400,110,0));
		}
		public function mission_14() {
			// schmal-biggie - single
			this.addEnemy(new enemy22(this.myroot,0,220,0,0));
		}
		public function mission_15() {
			// schmale juenger
			this.addEnemy(new enemy18(this.myroot,0,250,0,0));
			this.addEnemy(new enemy18(this.myroot,0,180,20,0));
			this.addEnemy(new enemy18(this.myroot,0,140,40,0));
			this.addEnemy(new enemy18(this.myroot,0,100,60,0));
			this.addEnemy(new enemy18(this.myroot,0,60,100,0));
		}
		public function mission_16() {
			// schmal-biggies
			this.addEnemy(new enemy22(this.myroot,0,300,0,0));
			
			this.addEnemy(new enemy22(this.myroot,0,200,20,0));
			this.addEnemy(new enemy22(this.myroot,0,120,60,0));
			this.addEnemy(new enemy22(this.myroot,0,60,100,0));
		}
		public function mission_17() {
			// schmal fans
			this.addEnemy(new enemy18(this.myroot,0,250,0,50));
			this.addEnemy(new enemy18(this.myroot,0,200,50,50));
			this.addEnemy(new enemy18(this.myroot,0,150,100,50));
			this.addEnemy(new enemy18(this.myroot,0,100,150,50));
			this.addEnemy(new enemy18(this.myroot,0,50,200,50));
			this.addEnemy(new enemy18(this.myroot,0,30,250,50));

			this.addEnemy(new enemy18(this.myroot,0,300,40,50));
			this.addEnemy(new enemy18(this.myroot,0,350,110,50));
			this.addEnemy(new enemy18(this.myroot,0,400,170,50));
			this.addEnemy(new enemy18(this.myroot,0,420,220,50));
		}
		public function mission_18() {
			//	
		}
		public function mission_19() {
			// circle
			this.addEnemy(new enemy19(this.myroot,0,220,0,0));
			this.addEnemy(new enemy19(this.myroot,0,180,20,0));
			this.addEnemy(new enemy19(this.myroot,0,140,40,0));
			this.addEnemy(new enemy19(this.myroot,0,100,60,0));
			this.addEnemy(new enemy19(this.myroot,0,60,100,0));

			this.addEnemy(new enemy19(this.myroot,0,250,10,0));
			
			this.addEnemy(new enemy19(this.myroot,0,300,20,0));
			this.addEnemy(new enemy19(this.myroot,0,340,30,0));
			this.addEnemy(new enemy19(this.myroot,0,380,40,0));

			// oben
			this.addEnemy(new enemy19(this.myroot,0,400,160,0));
			this.addEnemy(new enemy19(this.myroot,0,360,190,0));
			this.addEnemy(new enemy19(this.myroot,0,320,220,0));
			this.addEnemy(new enemy19(this.myroot,0,260,240,0));
			this.addEnemy(new enemy19(this.myroot,0,220,270,0));
			this.addEnemy(new enemy19(this.myroot,0,180,290,0));
			this.addEnemy(new enemy19(this.myroot,0,140,260,0));
			this.addEnemy(new enemy19(this.myroot,0,100,230,0));
			this.addEnemy(new enemy19(this.myroot,0,60,200,0));
		}
		public function mission_20() {
			//
		}
		public function mission_21() {
			// biggie with some spear first
			this.addEnemy(new enemy22(this.myroot,2,250,110,0));

			this.addEnemy(new enemy19(this.myroot,0,250,0,50));
			this.addEnemy(new enemy19(this.myroot,0,200,50,50));
			this.addEnemy(new enemy19(this.myroot,0,150,100,50));
			this.addEnemy(new enemy19(this.myroot,0,100,150,50));
			this.addEnemy(new enemy19(this.myroot,0,50,200,50));
			this.addEnemy(new enemy19(this.myroot,0,30,250,50));

			this.addEnemy(new enemy19(this.myroot,0,300,40,50));
			this.addEnemy(new enemy19(this.myroot,0,350,110,50));
			this.addEnemy(new enemy19(this.myroot,0,400,170,50));
			this.addEnemy(new enemy19(this.myroot,0,420,220,50));
		}
		public function mission_22() {
			// fattie
			this.addEnemy(new enemy23(this.myroot,0,250,0,14));
		}
		public function mission_23() {
			// single small 
			this.addEnemy(new enemy19(this.myroot,0,220,0,0));
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss5.visible=true;
			this.myroot.name_boss5.gotoAndPlay(1);
			// BOSS
			var e1:boss5=new boss5(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
		}		
		public function mission5_end() {
			this.myroot.bossmode=false;
			trace("boss dead - stats appear - matsch 0 - heat 0 - no weapon selected");
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