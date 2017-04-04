// MISSION 3 - orange REEF
package missions{

	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;

	public class mission3 extends Mission {
		public var wave:int=0;
		public var total_waves=31;
		public var times:Array=new Array(200,520,600,700,800,900,1000,1100,1200,1300,
										 1400,1500,1600,1800,1900,2100,2200,2300,2400,2500,
										 2600,2700,2800,2900,3000,3100,3200,3300,3400,3500,
										 3600);
		public function mission3(root_p:MovieClip) {
			super(root_p);
		}
		public function mission_0() {
			this.stationLeaveMainPlay();
			
			// DEBRIS 5 Swarm
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3 Asteroid
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			var b1:barriere3=new barriere3(this.myroot);
			this.myroot.enemies.addChild(b1);
			this.myroot.enemies_array.push(b1);

			// ship1
			this.myroot.ship1.gotoAndPlay(2);
		}
		public function mission_1() {
			// slow biggie
			var e1:enemy8=new enemy8(this.myroot,0,220,10,0);
		}
		public function mission_2() {
			// schild 4
			this.myroot.schild4.gotoAndPlay(2);
			// small enemies
			// cube
			var e1:enemy11=new enemy11(this.myroot,14,120,10,0);
			// cube 2
			var e12:enemy11=new enemy11(this.myroot,15,350,40,0);
		}
		public function mission_3() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// small enemies - rein slide
			this.addEnemy(new enemy11(this.myroot,12,300,10,0));
			this.addEnemy(new enemy11(this.myroot,12,350,110,0));
			// some fast
			this.addEnemy(new enemy11(this.myroot,0,50,400,0));
			this.addEnemy(new enemy11(this.myroot,0,150,450,0));
			this.addEnemy(new enemy11(this.myroot,0,250,410,0));
			this.addEnemy(new enemy11(this.myroot,0,350,380,0));
		}
		public function mission_4() {
			// small enemies - spears
			this.addEnemy(new enemy10(this.myroot,13,350,0,0));
			this.addEnemy(new enemy11(this.myroot,0,100,0,0));
			this.addEnemy(new enemy11(this.myroot,0,150,20,0));
			this.addEnemy(new enemy11(this.myroot,0,200,150,0));
			this.addEnemy(new enemy11(this.myroot,0,300,150,0));
		}
		public function mission_5() {
			// standards
			this.addEnemy(new enemy11(this.myroot,0,210,0,0));
			this.addEnemy(new enemy11(this.myroot,0,150,20,0));
			this.addEnemy(new enemy11(this.myroot,0,200,150,0));
			this.addEnemy(new enemy11(this.myroot,0,300,150,0));

			this.addEnemy(new enemy11(this.myroot,0,100,200,0));
			this.addEnemy(new enemy11(this.myroot,0,150,220,0));
			this.addEnemy(new enemy11(this.myroot,0,200,240,0));
			this.addEnemy(new enemy11(this.myroot,0,250,200,0));
		}
		public function mission_6() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// small enemies : stupid schlaengels on 3 places
			this.addEnemy(new enemy10(this.myroot,3,100,20,0.2));
			this.addEnemy(new enemy10(this.myroot,3,100,150,0.3));
			this.addEnemy(new enemy10(this.myroot,3,100,220,0.3));

			this.addEnemy(new enemy10(this.myroot,3,200,0,0.3));
			this.addEnemy(new enemy10(this.myroot,3,200,120,0.4));
			this.addEnemy(new enemy10(this.myroot,3,200,190,0.3));

			this.addEnemy(new enemy10(this.myroot,3,300,30,0.3));
			this.addEnemy(new enemy10(this.myroot,3,300,170,0.3));
			this.addEnemy(new enemy10(this.myroot,3,300,232,0.5));
		}
		public function mission_7() {
			// up n down
			this.addEnemy(new enemy11(this.myroot,6,50,240,0));
			this.addEnemy(new enemy11(this.myroot,6,150,220,0));
			this.addEnemy(new enemy11(this.myroot,6,200,500,0));
			this.addEnemy(new enemy11(this.myroot,6,250,480,0));
			this.addEnemy(new enemy11(this.myroot,6,300,500,0));
		}
		public function mission_8() {
			// DEBRIS 5
			var da:int=Math.floor(3+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
		}
		public function mission_9() {
			this.addEnemy(new enemy10(this.myroot,1,400,100,50));
			this.addEnemy(new enemy10(this.myroot,0,300,100,30));
			this.addEnemy(new enemy10(this.myroot,0,200,100,50));

			// up n down2 
			this.addEnemy(new enemy11(this.myroot,6,100,200,0));
			this.addEnemy(new enemy11(this.myroot,6,50,240,0));
			this.addEnemy(new enemy11(this.myroot,6,150,220,0));
			this.addEnemy(new enemy11(this.myroot,6,200,500,0));
			this.addEnemy(new enemy11(this.myroot,6,250,480,0));
			this.addEnemy(new enemy11(this.myroot,6,300,500,0));
		}
		public function mission_10() {
			// schrimpie
			this.addEnemy(new enemy9(this.myroot,1,400,100,50));
			this.addEnemy(new enemy9(this.myroot,0,300,100,30));
			this.addEnemy(new enemy9(this.myroot,0,200,100,50));
		}
		public function mission_11() {
			// moar schrimp
			this.addEnemy(new enemy9(this.myroot,0,100,0,50));
			this.addEnemy(new enemy9(this.myroot,0,200,50,50));
			this.addEnemy(new enemy9(this.myroot,0,300,100,50));
			this.addEnemy(new enemy9(this.myroot,0,400,150,50));
		}
		public function mission_12() {
			// single fattie
			this.addEnemy(new enemy7(this.myroot,0,180,100,50));
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
		}
		public function mission_13() {
			// crawler spear
			this.addEnemy(new enemy10(this.myroot,0,50,150,50));
			this.addEnemy(new enemy10(this.myroot,0,100,100,50));
			this.addEnemy(new enemy10(this.myroot,0,150,50,50));
			this.addEnemy(new enemy10(this.myroot,0,200,0,50));
			this.addEnemy(new enemy10(this.myroot,0,250,50,50));
			this.addEnemy(new enemy10(this.myroot,0,300,100,50));
			this.addEnemy(new enemy10(this.myroot,0,350,150,50));
			this.addEnemy(new enemy10(this.myroot,0,400,200,50));
		}
		public function mission_14() {
			// crawler spear 2
			this.addEnemy(new enemy10(this.myroot,0,50,150,50));
			this.addEnemy(new enemy10(this.myroot,0,106,110,50));
			this.addEnemy(new enemy10(this.myroot,0,150,50,50));
			this.addEnemy(new enemy10(this.myroot,0,200,0,50));
			this.addEnemy(new enemy10(this.myroot,0,252,54,50));
			this.addEnemy(new enemy10(this.myroot,0,300,100,50));
			this.addEnemy(new enemy10(this.myroot,0,350,160,50));
			this.addEnemy(new enemy10(this.myroot,0,400,200,50));
		}
		public function mission_15() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// crawler spear doppel reihe
			this.addEnemy(new enemy10(this.myroot,0,50,160,50));
			this.addEnemy(new enemy10(this.myroot,0,102,100,50));
			this.addEnemy(new enemy10(this.myroot,0,151,40,50));
			this.addEnemy(new enemy10(this.myroot,0,203,0,50));
			this.addEnemy(new enemy10(this.myroot,0,244,50,50));
			this.addEnemy(new enemy10(this.myroot,0,295,100,50));
			this.addEnemy(new enemy10(this.myroot,0,352,150,50));
			this.addEnemy(new enemy10(this.myroot,0,396,200,50));
			// reihe 2
			this.addEnemy(new enemy10(this.myroot,0,45,360,50));
			this.addEnemy(new enemy10(this.myroot,0,104,300,50));
			this.addEnemy(new enemy10(this.myroot,0,152,240,50));
			this.addEnemy(new enemy10(this.myroot,0,203,220,50));
			this.addEnemy(new enemy10(this.myroot,0,243,250,50));
			this.addEnemy(new enemy10(this.myroot,0,303,310,50));
			this.addEnemy(new enemy10(this.myroot,0,345,350,50));
			this.addEnemy(new enemy10(this.myroot,0,405,400,50));
			// single one
			this.addEnemy(new enemy11(this.myroot,0,260,400,50));
		}
		public function mission_16() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// endless line
			this.addEnemy(new enemy10(this.myroot,0,100,400,0));
			this.addEnemy(new enemy10(this.myroot,0,105,300,0));
			this.addEnemy(new enemy10(this.myroot,0,110,190,0));
			this.addEnemy(new enemy10(this.myroot,0,100,100,0));
			this.addEnemy(new enemy10(this.myroot,0,106,0,0));

			this.addEnemy(new enemy10(this.myroot,0,902,400,0));
			this.addEnemy(new enemy10(this.myroot,0,800,0,0));
			this.addEnemy(new enemy10(this.myroot,0,105,700,0));
			this.addEnemy(new enemy10(this.myroot,0,110,600,0));
			this.addEnemy(new enemy10(this.myroot,0,106,500,0));
		}
		public function mission_17() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// 3 small  from right to left
			this.addEnemy(new enemy11(this.myroot,31,450,-150,0));
			this.addEnemy(new enemy11(this.myroot,31,600,-150,0));
			this.addEnemy(new enemy11(this.myroot,31,750,-150,0));
			// endless line 2
			this.addEnemy(new enemy10(this.myroot,0,100,400,0));
			this.addEnemy(new enemy11(this.myroot,0,105,300,0));
			this.addEnemy(new enemy11(this.myroot,0,110,190,0));
			this.addEnemy(new enemy11(this.myroot,0,100,100,0));
			this.addEnemy(new enemy11(this.myroot,0,106,0,0));

			this.addEnemy(new enemy11(this.myroot,0,902,400,0));
			this.addEnemy(new enemy11(this.myroot,0,800,0,0));
			this.addEnemy(new enemy11(this.myroot,0,105,700,0));
			this.addEnemy(new enemy11(this.myroot,0,110,600,0));
			this.addEnemy(new enemy11(this.myroot,0,106,500,0));
		}
		public function mission_18() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// sinus biggie
			this.addEnemy(new enemy7(this.myroot,3,280,100,0.4));
			// small from  left to right 
			this.addEnemy(new enemy11(this.myroot,30,0,-160,0));
			this.addEnemy(new enemy11(this.myroot,30,150,-160,0));
			this.addEnemy(new enemy11(this.myroot,30,300,-160,0));
		}
		public function mission_19() {

			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// schlaengel 
			this.addEnemy(new enemy11(this.myroot,0,20,5,50));
			this.addEnemy(new enemy11(this.myroot,0,61,33,50));
			this.addEnemy(new enemy11(this.myroot,0,102,52,50));
			this.addEnemy(new enemy11(this.myroot,0,140,70,50));
			this.addEnemy(new enemy11(this.myroot,0,180,69,50));
			this.addEnemy(new enemy11(this.myroot,0,220,64,50));
			this.addEnemy(new enemy11(this.myroot,0,260,33,50));
			this.addEnemy(new enemy11(this.myroot,0,300,15,50));
			this.addEnemy(new enemy11(this.myroot,0,342,0,50));
			this.addEnemy(new enemy11(this.myroot,0,380,9,0));
			this.addEnemy(new enemy11(this.myroot,0,420,30,0));
		}
		public function mission_20() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}

			// schlaengel  2
			this.addEnemy(new enemy10(this.myroot,0,20,5,50));
			this.addEnemy(new enemy10(this.myroot,0,61,33,50));
			this.addEnemy(new enemy10(this.myroot,0,102,52,50));
			this.addEnemy(new enemy10(this.myroot,0,140,70,50));
			this.addEnemy(new enemy10(this.myroot,0,180,69,50));
			this.addEnemy(new enemy10(this.myroot,0,220,64,50));
			this.addEnemy(new enemy10(this.myroot,0,260,33,50));
			this.addEnemy(new enemy10(this.myroot,0,300,15,50));
			this.addEnemy(new enemy10(this.myroot,0,342,0,50));
			this.addEnemy(new enemy10(this.myroot,0,380,9,0));
			this.addEnemy(new enemy10(this.myroot,0,420,30,0));
		}
		public function mission_21() {
			// DREIECK TRIANGLE ATTACKs
			this.addEnemy(new enemy9(this.myroot,7,150,0,0));
			this.addEnemy(new enemy9(this.myroot,7,100,80,0));
			this.addEnemy(new enemy9(this.myroot,7,50,0,0));

			this.addEnemy(new enemy9(this.myroot,16,250,0,0));
			this.addEnemy(new enemy9(this.myroot,16,300,80,0));
			this.addEnemy(new enemy9(this.myroot,16,350,10,0));

			this.addEnemy(new enemy9(this.myroot,17,80,240,0));
			this.addEnemy(new enemy9(this.myroot,17,130,280,0));
			this.addEnemy(new enemy9(this.myroot,17,180,240,0));
		}
		public function mission_22() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// biggies mit mittelreihe
			this.addEnemy(new enemy8(this.myroot,0,50,50,0));
			this.addEnemy(new enemy11(this.myroot,0,150,30,0));
			this.addEnemy(new enemy11(this.myroot,0,200,10,0));
			this.addEnemy(new enemy11(this.myroot,0,250,0,0));
			this.addEnemy(new enemy11(this.myroot,0,300,10,0));
			this.addEnemy(new enemy8(this.myroot,0,350,40,0));
		}
		public function mission_23() {
			// SPACE INVADERs
			this.addEnemy(new enemy10(this.myroot,8,50,40,0));
			this.addEnemy(new enemy10(this.myroot,8,100,40,0));
			this.addEnemy(new enemy10(this.myroot,8,150,40,0));
			this.addEnemy(new enemy10(this.myroot,8,200,40,0));
			this.addEnemy(new enemy10(this.myroot,8,250,40,0));
			this.addEnemy(new enemy10(this.myroot,8,300,40,0));
			this.addEnemy(new enemy10(this.myroot,8,350,40,0));
		}
		public function mission_24() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// fattie spear
			this.addEnemy(new enemy7(this.myroot,0,100,140,0));
			this.addEnemy(new enemy7(this.myroot,0,220,0,0));
			this.addEnemy(new enemy7(this.myroot,0,350,200,0));
		}
		public function mission_25() {
			// kringels - sinus
			this.addEnemy(new enemy9(this.myroot,3,290,0,0.2));
			this.addEnemy(new enemy9(this.myroot,3,290,100,0.3));
			this.addEnemy(new enemy9(this.myroot,3,290,200,0.2));
			this.addEnemy(new enemy9(this.myroot,3,290,300,0.1));
			this.addEnemy(new enemy9(this.myroot,3,290,350,0.2));
			this.addEnemy(new enemy9(this.myroot,3,290,400,0.3));
			this.addEnemy(new enemy9(this.myroot,3,290,450,0.4));
			this.addEnemy(new enemy9(this.myroot,3,290,500,0.5));
			this.addEnemy(new enemy9(this.myroot,3,290,550,0.6));
			this.addEnemy(new enemy9(this.myroot,3,290,600,0.5));
			this.addEnemy(new enemy9(this.myroot,3,290,650,0.4));
		}
		public function mission_26() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// smalls big bow
			this.addEnemy(new enemy10(this.myroot,0,20,5,50));
			this.addEnemy(new enemy10(this.myroot,0,61,33,50));
			this.addEnemy(new enemy10(this.myroot,0,102,52,50));
			this.addEnemy(new enemy10(this.myroot,0,140,70,50));
			this.addEnemy(new enemy10(this.myroot,0,180,69,50));
			this.addEnemy(new enemy10(this.myroot,0,220,55,50));
			this.addEnemy(new enemy10(this.myroot,0,260,43,50));
			this.addEnemy(new enemy10(this.myroot,0,300,30,50));
			this.addEnemy(new enemy10(this.myroot,0,342,20,50));
			this.addEnemy(new enemy10(this.myroot,0,380,9,0));
			this.addEnemy(new enemy10(this.myroot,0,420,0,0));
		}
		public function mission_27() {
			// fattie with spear
			this.addEnemy(new enemy7(this.myroot,0,290,0,0));

			this.addEnemy(new enemy10(this.myroot,0,50,150,50));
			this.addEnemy(new enemy10(this.myroot,0,100,100,50));
			this.addEnemy(new enemy10(this.myroot,0,150,50,50));
			this.addEnemy(new enemy10(this.myroot,0,200,0,50));
			this.addEnemy(new enemy10(this.myroot,0,250,50,50));
			this.addEnemy(new enemy10(this.myroot,0,300,100,50));
			this.addEnemy(new enemy10(this.myroot,0,350,150,50));
			this.addEnemy(new enemy10(this.myroot,0,400,200,50));
		}
		public function mission_28() {
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// fattie
			this.addEnemy(new enemy10(this.myroot,0,200,0,0));
		}
		public function mission_29() {
			// 2 little spears  - smalls
			// spear 1 
			this.addEnemy(new enemy11(this.myroot,0,50,240,0));
			this.addEnemy(new enemy11(this.myroot,0,100,200,0));
			this.addEnemy(new enemy11(this.myroot,0,150,220,0));
			// spear 2
			this.addEnemy(new enemy11(this.myroot,0,200,500,0));
			this.addEnemy(new enemy11(this.myroot,0,250,480,0));
			this.addEnemy(new enemy11(this.myroot,0,300,500,0));
		}
		public function mission_30() {
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss3.visible=true;
			this.myroot.name_boss3.gotoAndPlay(1);
			
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 3
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			var e1:boss3=new boss3(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
		}
		public function mission3_end() {
			this.myroot.bossmode=false;
			// DEBRIS 5
			var da:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da; j++) {
				var d1:debris5=new debris5(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
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