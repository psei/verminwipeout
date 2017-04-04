// MISSION 6 - BONE
package missions{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class mission6 extends Mission {
		public var wave:int=0;
		public var total_waves=35;
		public var times:Array=new Array(100,200,300,400,500,600,700,800,900,1000,
										 1100,1200,1400,1550,1600,1700,1800,1900,2000,2100,
										 2200,2300,2400,2500,2600,2700,2800,2900,3100,3200,
										 3300,3500,3600,3700,3800);
		public function mission6(root_p:MovieClip) {
			super(root_p);
		}
		public function mission_0() {
			this.stationLeaveMainPlay();
			
			var b1:barriere6=new barriere6(this.myroot);
			this.myroot.enemies.addChild(b1);
			this.myroot.enemies_array.push(b1);		
			// single small
			this.addEnemy(new enemy24(this.myroot,0,260,10,0));
			
			// DEBRIS 11 Centiworm
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris11=new debris11(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 12 Blobb
			var da12:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da12; j++) {
				var d12:debris12=new debris12(this.myroot,0);
				this.myroot.enemies.addChild(d12);
				this.myroot.enemies_array.push(d12);
			}
			
		}
		public function mission_1() {
			// small spear - schraeg
			this.addEnemy(new enemy24(this.myroot,2,370,30,0));
			this.addEnemy(new enemy24(this.myroot,2,300,20,0));
			this.addEnemy(new enemy24(this.myroot,2,300,80,0));
		}
		public function mission_2() {
			
			// WORM JAW ani TEST
			this.myroot.wormjaw.gotoAndPlay(2);
			
			
			// small - knochen
			this.addEnemy(new enemy24(this.myroot,0,60,0,0));
			this.addEnemy(new enemy24(this.myroot,0,50,80,0));
			this.addEnemy(new enemy24(this.myroot,0,100,70,0));
			this.addEnemy(new enemy24(this.myroot,0,150,100,0));
			this.addEnemy(new enemy24(this.myroot,0,200,130,0));
			this.addEnemy(new enemy24(this.myroot,0,250,172,0));
			this.addEnemy(new enemy24(this.myroot,0,300,210,0));
			this.addEnemy(new enemy24(this.myroot,0,350,250,0));
			this.addEnemy(new enemy24(this.myroot,0,370,290,0));
			this.addEnemy(new enemy24(this.myroot,0,410,360,0));
			this.addEnemy(new enemy24(this.myroot,0,400,310,0));
			this.addEnemy(new enemy24(this.myroot,0,415,250,0));
		}
		public function mission_3() {
			// small - knochen again
			this.addEnemy(new enemy24(this.myroot,0,60,0,0));
			this.addEnemy(new enemy24(this.myroot,0,50,80,0));
			this.addEnemy(new enemy24(this.myroot,0,100,70,0));
			this.addEnemy(new enemy24(this.myroot,0,150,100,0));
			this.addEnemy(new enemy24(this.myroot,0,200,130,0));
			this.addEnemy(new enemy24(this.myroot,0,250,172,0));
			this.addEnemy(new enemy24(this.myroot,0,300,210,0));
			this.addEnemy(new enemy24(this.myroot,0,350,250,0));
			this.addEnemy(new enemy24(this.myroot,0,370,290,0));
			this.addEnemy(new enemy24(this.myroot,0,410,360,0));
			this.addEnemy(new enemy24(this.myroot,0,400,310,0));	
			this.addEnemy(new enemy24(this.myroot,0,415,250,0));
		}
		public function mission_4() {
			// schlaengel 
			this.addEnemy(new enemy24(this.myroot,0,20,5,50));
			this.addEnemy(new enemy24(this.myroot,0,61,33,50));
			this.addEnemy(new enemy24(this.myroot,0,102,52,50));
			this.addEnemy(new enemy24(this.myroot,0,140,70,50));
			this.addEnemy(new enemy24(this.myroot,0,180,69,50));
			this.addEnemy(new enemy24(this.myroot,0,220,64,50));
			this.addEnemy(new enemy24(this.myroot,0,260,33,50));
			this.addEnemy(new enemy24(this.myroot,0,300,15,50));
			this.addEnemy(new enemy24(this.myroot,0,342,0,50));
			this.addEnemy(new enemy24(this.myroot,0,380,9,0));
			this.addEnemy(new enemy24(this.myroot,0,420,30,0));
		}
		public function mission_5() {
			// bow 
			this.addEnemy(new enemy24(this.myroot,0,20,5,50));
			this.addEnemy(new enemy24(this.myroot,0,61,33,50));
			this.addEnemy(new enemy24(this.myroot,0,102,52,50));
			this.addEnemy(new enemy24(this.myroot,0,140,70,50));
			this.addEnemy(new enemy24(this.myroot,0,180,69,50));
			this.addEnemy(new enemy24(this.myroot,0,220,55,50));
			this.addEnemy(new enemy24(this.myroot,0,260,43,50));
			this.addEnemy(new enemy24(this.myroot,0,300,30,50));
			this.addEnemy(new enemy24(this.myroot,0,342,20,50));
			this.addEnemy(new enemy24(this.myroot,0,380,9,0));
			this.addEnemy(new enemy24(this.myroot,0,420,0,0));
		}
		public function mission_6() {
			// sinus line smalls
			this.addEnemy(new enemy25(this.myroot,3,250,60,0.2));
			this.addEnemy(new enemy25(this.myroot,3,250,120,0.5));
			this.addEnemy(new enemy25(this.myroot,3,250,180,0.2));
			this.addEnemy(new enemy25(this.myroot,3,250,240,0.2));
			this.addEnemy(new enemy25(this.myroot,3,250,300,0.2));
			this.addEnemy(new enemy25(this.myroot,3,250,360,0.4));
			this.addEnemy(new enemy25(this.myroot,3,250,420,0.2));
			this.addEnemy(new enemy25(this.myroot,3,250,480,0.3));
			this.addEnemy(new enemy25(this.myroot,3,250,520,0.2));
			this.addEnemy(new enemy25(this.myroot,3,250,0,0.1)); 
		}
		public function mission_7() {
			// bow  - monster formation
			this.addEnemy(new enemy24(this.myroot,0,20,5,50));
			this.addEnemy(new enemy24(this.myroot,0,61,33,50));
			this.addEnemy(new enemy24(this.myroot,0,102,52,50));

			this.addEnemy(new enemy24(this.myroot,0,120,2,50));

			this.addEnemy(new enemy24(this.myroot,0,140,70,50));
			this.addEnemy(new enemy24(this.myroot,0,180,69,50));
			this.addEnemy(new enemy24(this.myroot,0,220,55,50));

			this.addEnemy(new enemy24(this.myroot,0,240,0,50));

			this.addEnemy(new enemy24(this.myroot,0,260,43,50));
			this.addEnemy(new enemy24(this.myroot,0,300,30,50));
			this.addEnemy(new enemy24(this.myroot,0,342,20,50));
			this.addEnemy(new enemy24(this.myroot,0,380,9,0));
			this.addEnemy(new enemy24(this.myroot,0,420,0,0));
		}
		public function mission_8() {
			// schlaengel - with lines
			this.addEnemy(new enemy24(this.myroot,0,20,5,50));
			this.addEnemy(new enemy24(this.myroot,0,61,33,50));
			this.addEnemy(new enemy24(this.myroot,0,102,52,50));
			this.addEnemy(new enemy24(this.myroot,0,140,70,50));
			this.addEnemy(new enemy24(this.myroot,0,180,69,50));
			this.addEnemy(new enemy24(this.myroot,0,220,64,50));
			this.addEnemy(new enemy24(this.myroot,0,260,33,50));
			this.addEnemy(new enemy24(this.myroot,0,300,15,50));
			this.addEnemy(new enemy24(this.myroot,0,342,0,50));
			this.addEnemy(new enemy24(this.myroot,0,380,9,0));
			this.addEnemy(new enemy24(this.myroot,0,420,30,0));
			// following line 1			
			this.addEnemy(new enemy24(this.myroot,0,61,70,0));
			this.addEnemy(new enemy24(this.myroot,0,68,110,0));
			this.addEnemy(new enemy24(this.myroot,0,63,150,0));
			this.addEnemy(new enemy24(this.myroot,0,65,190,0));
			this.addEnemy(new enemy24(this.myroot,0,63,240,0));
			this.addEnemy(new enemy24(this.myroot,0,65,290,0));
			this.addEnemy(new enemy24(this.myroot,0,63,350,0));
			this.addEnemy(new enemy24(this.myroot,0,65,400,0));
			// following line 2
			this.addEnemy(new enemy24(this.myroot,0,217,100,50));
			this.addEnemy(new enemy24(this.myroot,0,222,150,50));
			this.addEnemy(new enemy24(this.myroot,0,226,200,50));
			this.addEnemy(new enemy24(this.myroot,0,230,250,50));
			this.addEnemy(new enemy24(this.myroot,0,222,300,50));
			this.addEnemy(new enemy24(this.myroot,0,217,350,50));
			this.addEnemy(new enemy24(this.myroot,0,224,400,50));
			// following line 3
			this.addEnemy(new enemy24(this.myroot,0,382,50,0));
			this.addEnemy(new enemy24(this.myroot,0,386,90,0));
			this.addEnemy(new enemy24(this.myroot,0,390,130,0));
			this.addEnemy(new enemy24(this.myroot,0,388,170,0));
			this.addEnemy(new enemy24(this.myroot,0,382,210,0));
			this.addEnemy(new enemy24(this.myroot,0,385,250,0));
			this.addEnemy(new enemy24(this.myroot,0,382,300,0));
			this.addEnemy(new enemy24(this.myroot,0,385,350,0));			
		}
		public function mission_9() {
			// 3 small spears - schraeg
			this.addEnemy(new enemy24(this.myroot,2,370,30,0));
			this.addEnemy(new enemy24(this.myroot,2,300,20,0));
			this.addEnemy(new enemy24(this.myroot,2,300,80,0));
			
			this.addEnemy(new enemy24(this.myroot,2,570,50,0));
			this.addEnemy(new enemy24(this.myroot,2,500,40,0));
			this.addEnemy(new enemy24(this.myroot,2,500,100,0));
			
			this.addEnemy(new enemy24(this.myroot,2,470,80,0));
			this.addEnemy(new enemy24(this.myroot,2,400,70,0));
			this.addEnemy(new enemy24(this.myroot,2,400,130,0));
		}
		public function mission_10() {
			// skull thingy
			this.addEnemy(new enemy24(this.myroot,0,130,0,0));
			this.addEnemy(new enemy24(this.myroot,0,224,0,0));
			this.addEnemy(new enemy24(this.myroot,0,300,0,0));

			this.addEnemy(new enemy24(this.myroot,0,120,50,0));
			this.addEnemy(new enemy24(this.myroot,0,170,50,0));
			this.addEnemy(new enemy24(this.myroot,0,220,50,0));
			this.addEnemy(new enemy24(this.myroot,0,270,50,0));
			this.addEnemy(new enemy24(this.myroot,0,320,50,0));

			this.addEnemy(new enemy24(this.myroot,0,100,100,0));
			this.addEnemy(new enemy24(this.myroot,0,150,100,0));
			this.addEnemy(new enemy24(this.myroot,0,205,100,0));
			this.addEnemy(new enemy24(this.myroot,0,255,100,0));
			this.addEnemy(new enemy24(this.myroot,0,300,100,0));
			this.addEnemy(new enemy24(this.myroot,0,350,100,0));
			
			this.addEnemy(new enemy24(this.myroot,0,110,150,0));
			this.addEnemy(new enemy24(this.myroot,0,158,154,0));
			this.addEnemy(new enemy24(this.myroot,0,215,147,0));
			this.addEnemy(new enemy24(this.myroot,0,265,152,0));
			this.addEnemy(new enemy24(this.myroot,0,315,156,0));
		}
		public function mission_11() {
			// skull nice
			this.addEnemy(new enemy24(this.myroot,0,130,0,0));
			this.addEnemy(new enemy24(this.myroot,0,224,0,0));
			this.addEnemy(new enemy24(this.myroot,0,300,0,0));		

			this.addEnemy(new enemy24(this.myroot,0,133,60,0));
			this.addEnemy(new enemy24(this.myroot,0,177,52,0));
			this.addEnemy(new enemy24(this.myroot,0,220,50,0));
			this.addEnemy(new enemy24(this.myroot,0,260,54,0));
			this.addEnemy(new enemy24(this.myroot,0,302,50,0));

			this.addEnemy(new enemy24(this.myroot,0,116,102,0));
			this.addEnemy(new enemy24(this.myroot,0,150,110,0));
			this.addEnemy(new enemy24(this.myroot,0,205,103,0));
			this.addEnemy(new enemy24(this.myroot,0,255,100,0));
			this.addEnemy(new enemy24(this.myroot,0,290,98,0));
			this.addEnemy(new enemy24(this.myroot,0,320,110,0));

			this.addEnemy(new enemy24(this.myroot,0,110,160,0));
			this.addEnemy(new enemy24(this.myroot,0,158,154,0));
			this.addEnemy(new enemy24(this.myroot,0,215,147,0));
			this.addEnemy(new enemy24(this.myroot,0,265,152,0));
			this.addEnemy(new enemy24(this.myroot,0,315,156,0));
			
			this.addEnemy(new enemy24(this.myroot,0,113,200,0));
			this.addEnemy(new enemy24(this.myroot,0,158,204,0));
			this.addEnemy(new enemy24(this.myroot,0,215,207,0));
			this.addEnemy(new enemy24(this.myroot,0,265,212,0));
			this.addEnemy(new enemy24(this.myroot,0,310,206,0));	

			this.addEnemy(new enemy24(this.myroot,0,140,250,0));
			this.addEnemy(new enemy24(this.myroot,0,190,267,0));
			this.addEnemy(new enemy24(this.myroot,0,230,252,0));
			this.addEnemy(new enemy24(this.myroot,0,280,266,0));
		}
		public function mission_12() {
			// biggie
			this.addEnemy(new enemy29(this.myroot,0,280,266,0));
		}
		public function mission_13() {
			// small 3 first time - spears - sprotten code name
			this.addEnemy(new enemy26(this.myroot,0,40,50,0));
			this.addEnemy(new enemy26(this.myroot,0,90,20,0));
			this.addEnemy(new enemy26(this.myroot,0,140,55,0));		

			this.addEnemy(new enemy26(this.myroot,0,170,250,0));
			this.addEnemy(new enemy26(this.myroot,0,220,220,0));
			this.addEnemy(new enemy26(this.myroot,0,270,255,0));

			this.addEnemy(new enemy26(this.myroot,0,290,30,0));
			this.addEnemy(new enemy26(this.myroot,0,330,0,0));
			this.addEnemy(new enemy26(this.myroot,0,380,40,0));
		}
		public function mission_14() {
			// haken - small 1
			// unten reihe 1
			this.addEnemy(new enemy25(this.myroot,0,50,70,0));
			this.addEnemy(new enemy25(this.myroot,0,100,50,0));
			this.addEnemy(new enemy25(this.myroot,0,150,30,0));
			this.addEnemy(new enemy25(this.myroot,0,200,10,0));
			this.addEnemy(new enemy25(this.myroot,0,250,0,0));
			this.addEnemy(new enemy25(this.myroot,0,300,10,0));
			this.addEnemy(new enemy25(this.myroot,0,350,50,0));
			this.addEnemy(new enemy25(this.myroot,0,400,90,0));		
			// reihe 2
			this.addEnemy(new enemy25(this.myroot,0,375,180,0));
			this.addEnemy(new enemy25(this.myroot,0,325,130,0));
			this.addEnemy(new enemy25(this.myroot,0,275,90,0));
			this.addEnemy(new enemy25(this.myroot,0,225,120,0));
			this.addEnemy(new enemy25(this.myroot,0,185,122,0));	
			// reihe 3
			this.addEnemy(new enemy25(this.myroot,0,315,230,0));
			this.addEnemy(new enemy25(this.myroot,0,265,190,0));
			this.addEnemy(new enemy25(this.myroot,0,235,220,0));
			this.addEnemy(new enemy25(this.myroot,0,177,222,0));
			this.addEnemy(new enemy25(this.myroot,0,250,280,0));
			this.addEnemy(new enemy25(this.myroot,0,280,380,0));
		}		
		public function mission_15() {
			// rochen schraeg
			this.addEnemy(new enemy30(this.myroot,2,450,0,0));
		}		
		public function mission_16() {
			// biggies mit mittelreihe
			this.addEnemy(new enemy25(this.myroot,0,50,50,0));
			this.addEnemy(new enemy24(this.myroot,0,150,30,0));
			this.addEnemy(new enemy24(this.myroot,0,200,10,0));
			this.addEnemy(new enemy24(this.myroot,0,250,0,0));
			this.addEnemy(new enemy24(this.myroot,0,300,10,0));
			this.addEnemy(new enemy25(this.myroot,0,350,40,0));
		}				
		public function mission_17() {
			// bow with  small 2 in der zweiten reihe
			this.addEnemy(new enemy24(this.myroot,0,50,50,0));
			this.addEnemy(new enemy24(this.myroot,0,100,40,0));
			this.addEnemy(new enemy24(this.myroot,0,150,30,0));
			this.addEnemy(new enemy24(this.myroot,0,200,10,0));
			this.addEnemy(new enemy24(this.myroot,0,250,0,0));
			this.addEnemy(new enemy24(this.myroot,0,300,10,0));
			this.addEnemy(new enemy24(this.myroot,0,350,30,0));
			this.addEnemy(new enemy24(this.myroot,0,400,50,0));
			this.addEnemy(new enemy24(this.myroot,0,450,70,0));	
			
			this.addEnemy(new enemy25(this.myroot,0,70,160,0));
			this.addEnemy(new enemy25(this.myroot,0,170,130,0));
			this.addEnemy(new enemy25(this.myroot,0,270,150,0));
			this.addEnemy(new enemy25(this.myroot,0,370,170,0));
		}				
		public function mission_18() {
			// 	2 rochen 
			this.addEnemy(new enemy30(this.myroot,0,300,0,0));
			this.addEnemy(new enemy30(this.myroot,0,100,50,0));
		}				
		public function mission_19() {
			// single schlaengler
			this.addEnemy(new enemy28(this.myroot,0,260,0,0));
		}	
		public function mission_20() {
			// schild
			this.myroot.schild7.gotoAndPlay(2);	
			// small 4 - first time - sinus
			this.addEnemy(new enemy27(this.myroot,4,200,0,0));
			this.addEnemy(new enemy27(this.myroot,4,200,200,0.3));
		}		
		public function mission_21() {
			// spear 
			this.addEnemy(new enemy27(this.myroot,0,93,60,0));
			this.addEnemy(new enemy27(this.myroot,0,130,0,0));
			this.addEnemy(new enemy27(this.myroot,0,170,62,0));
		}		
		public function mission_22() {
			// spear 
			this.addEnemy(new enemy24(this.myroot,0,93,60,0));
			this.addEnemy(new enemy24(this.myroot,0,130,0,0));
			this.addEnemy(new enemy24(this.myroot,0,170,62,0));
			// triangle 1
			this.addEnemy(new enemy27(this.myroot,0,70,210,0));
			this.addEnemy(new enemy27(this.myroot,0,143,200,0));
			this.addEnemy(new enemy27(this.myroot,0,210,218,0));
			this.addEnemy(new enemy27(this.myroot,0,284,202,0));
			this.addEnemy(new enemy27(this.myroot,0,105,100,0));
			this.addEnemy(new enemy27(this.myroot,0,175,110,0));
			this.addEnemy(new enemy27(this.myroot,0,245,120,0));
			this.addEnemy(new enemy27(this.myroot,0,175,100,0));
			// arch 1
			this.addEnemy(new enemy27(this.myroot,0,150,500,0));
			this.addEnemy(new enemy27(this.myroot,0,215,400,0));
			this.addEnemy(new enemy27(this.myroot,0,270,300,0));
			this.addEnemy(new enemy27(this.myroot,0,335,310,0));
			this.addEnemy(new enemy27(this.myroot,0,390,400,0));
			this.addEnemy(new enemy27(this.myroot,0,400,500,0));
			// arch 2
			this.addEnemy(new enemy27(this.myroot,0,20,800,0));
			this.addEnemy(new enemy27(this.myroot,0,100,855,0));
			this.addEnemy(new enemy27(this.myroot,0,180,900,0));
			this.addEnemy(new enemy27(this.myroot,0,260,910,0));
			this.addEnemy(new enemy27(this.myroot,0,340,845,0));
			this.addEnemy(new enemy27(this.myroot,0,385,820,0));			
		}		
		public function mission_23() {
			// rochen
			this.addEnemy(new enemy25(this.myroot,0,280,0,0)); 			
			// little triangle
			this.addEnemy(new enemy25(this.myroot,0,90,120,0));
			this.addEnemy(new enemy25(this.myroot,0,173,190,0));
			this.addEnemy(new enemy25(this.myroot,0,238,130,0));
		}		
		public function mission_24() {
			// augenfreund
			this.addEnemy(new enemy29(this.myroot,0,200,0,0));
		}		
		public function mission_25() {
			// rochen dreieck
			this.addEnemy(new enemy25(this.myroot,0,90,120,0));
			this.addEnemy(new enemy25(this.myroot,0,250,0,0));
			this.addEnemy(new enemy25(this.myroot,0,390,130,0));		
		}		
		public function mission_26() {
			// spear - with biggie following
			this.addEnemy(new enemy25(this.myroot,0,93,60,0));
			this.addEnemy(new enemy25(this.myroot,0,130,0,0));
			this.addEnemy(new enemy25(this.myroot,0,170,42,0));			
			this.addEnemy(new enemy25(this.myroot,0,220,82,0));
			this.addEnemy(new enemy28(this.myroot,0,150,110,0));
		}		
		public function mission_27() {
			// sinus fans
			this.addEnemy(new enemy28(this.myroot,3,290,0,0.1));
			this.addEnemy(new enemy27(this.myroot,3,290,200,0.1));
			this.addEnemy(new enemy27(this.myroot,3,290,300,0.1));			
			this.addEnemy(new enemy27(this.myroot,3,290,350,0.2));
			this.addEnemy(new enemy27(this.myroot,3,290,400,0.3));			
			this.addEnemy(new enemy27(this.myroot,3,290,450,0.4));
			this.addEnemy(new enemy27(this.myroot,3,290,500,0.5));			
			this.addEnemy(new enemy27(this.myroot,3,290,550,0.6));
			this.addEnemy(new enemy27(this.myroot,3,290,600,0.6));			
			this.addEnemy(new enemy27(this.myroot,3,290,650,0.6));
		}		
		public function mission_28() {
			// small spear - schraeg
			this.addEnemy(new enemy26(this.myroot,2,470,30,0));
			this.addEnemy(new enemy26(this.myroot,2,400,20,0));
			this.addEnemy(new enemy26(this.myroot,2,400,80,0));				
		}		
		public function mission_29() {
			// 
			this.addEnemy(new enemy26(this.myroot,0,60,50,0));
			this.addEnemy(new enemy26(this.myroot,0,100,100,0));
			this.addEnemy(new enemy26(this.myroot,0,140,150,0));			
			this.addEnemy(new enemy26(this.myroot,0,180,200,0));
			this.addEnemy(new enemy26(this.myroot,0,220,250,0));
			this.addEnemy(new enemy26(this.myroot,0,260,300,0));			
			this.addEnemy(new enemy26(this.myroot,0,300,350,0));
			this.addEnemy(new enemy26(this.myroot,0,340,400,0));
			this.addEnemy(new enemy26(this.myroot,0,380,450,0));
		}		
		public function mission_30() {
			// small spear - schraeg
			this.addEnemy(new enemy27(this.myroot,1,70,30,0));
			this.addEnemy(new enemy27(this.myroot,1,0,20,0));
			this.addEnemy(new enemy27(this.myroot,1,0,80,0));
		}		
		public function mission_31() {
			// schraege reihe
			this.addEnemy(new enemy24(this.myroot,0,60,50,0));
			this.addEnemy(new enemy24(this.myroot,0,100,100,0));
			this.addEnemy(new enemy24(this.myroot,0,140,150,0));			
			this.addEnemy(new enemy24(this.myroot,0,180,200,0));
			this.addEnemy(new enemy24(this.myroot,0,220,250,0));
			this.addEnemy(new enemy24(this.myroot,0,260,300,0));			
			this.addEnemy(new enemy24(this.myroot,0,300,350,0));
			this.addEnemy(new enemy24(this.myroot,0,340,400,0));
			this.addEnemy(new enemy24(this.myroot,0,380,450,0));
		}		
		public function mission_32() {
			// small spear - schraeg
			this.addEnemy(new enemy25(this.myroot,2,370,30,0));
			this.addEnemy(new enemy25(this.myroot,2,300,20,0));
			this.addEnemy(new enemy25(this.myroot,2,300,100,0));
		}		
		public function mission_33() {
			// reihe von oben nach unten - schraeg.
			//reihe 1
			this.addEnemy(new enemy25(this.myroot,0,60,50,0));
			this.addEnemy(new enemy25(this.myroot,0,100,100,0));
			this.addEnemy(new enemy25(this.myroot,0,140,150,0));			
			this.addEnemy(new enemy25(this.myroot,0,180,200,0));
			this.addEnemy(new enemy25(this.myroot,0,220,250,0));
			this.addEnemy(new enemy25(this.myroot,0,260,300,0));			
			this.addEnemy(new enemy25(this.myroot,0,300,350,0));
			this.addEnemy(new enemy25(this.myroot,0,340,400,0));
			this.addEnemy(new enemy25(this.myroot,0,380,450,0));
		}	
		public function mission_34() {
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss6.visible=true;
			this.myroot.name_boss6.gotoAndPlay(1);
			//BOSS
			var e1:boss6=new boss6(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
		}
		public function mission6_end() {
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