// MISSION 2 - purple
package missions{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class mission2 extends Mission {
		public var wave:int=0;
		public var total_waves=32;
		public var times:Array=new Array(120,300,620,700,900,1000,1100,1200,1300,1400,
										 1500,1600,1700,1800,1900,2000,2100,2250,2300,2400,
										 2600,2700,2800,2900,3000,3100,3250,3400,3500,3600,
										 3750,3900);
		public function mission2(root_p:MovieClip) {
			super(root_p);
		}
		//misssion 2
		public function mission_0() {			
			this.stationLeaveMainPlay();
			
			// schild10 fliegt vorbei
			this.myroot.schild10.gotoAndPlay(2);
			// DEBRIS 6 SpiderFly
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris6=new debris6(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
		}
		public function mission_1() {
			// schild10 fliegt vorbei
			this.myroot.schild10.gotoAndPlay(2);

			// DEBRIS 3
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			var b1:barriere2=new barriere2(this.myroot);
			this.myroot.enemies.addChild(b1);
			this.myroot.enemies_array.push(b1);
		}
		public function mission_2() {
			
			// DEBRIS 4
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// schild8 fliegt vorbei
			this.myroot.schild8.gotoAndPlay(2);
			// cube 2
			this.addEnemy(new enemy4(this.myroot,15,350,10,0));
		}
		public function mission_3() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// schild10 fliegt vorbei
			this.myroot.schild10.gotoAndPlay(2);
			// cube 2
			this.addEnemy(new enemy4(this.myroot,15,350,10,0));
		}
		public function mission_4() {
			// DEBRIS
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var deb1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(deb1);
				this.myroot.enemies_array.push(deb1);
			}
			// biggies von rechts nach links  slide
			this.addEnemy(new enemy4(this.myroot,13,300,10,0));
			this.addEnemy(new enemy4(this.myroot,13,350,110,0));			
			// some fast
			this.addEnemy(new enemy5(this.myroot,0,50,400,0));
			this.addEnemy(new enemy5(this.myroot,0,150,450,0));
			this.addEnemy(new enemy5(this.myroot,0,250,410,0));
			this.addEnemy(new enemy5(this.myroot,0,350,380,0));
		}
		public function mission_5() {

			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			this.addEnemy(new enemy4(this.myroot,13,350,0,0));			
			this.addEnemy(new enemy6(this.myroot,0,100,0,0));			
			this.addEnemy(new enemy6(this.myroot,0,150,20,0));			
			this.addEnemy(new enemy6(this.myroot,0,200,150,0));			
			this.addEnemy(new enemy6(this.myroot,0,300,150,0));
		}
		public function mission_6() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// 
			this.addEnemy(new enemy6(this.myroot,0,320,0,0));
			this.addEnemy(new enemy6(this.myroot,0,150,20,0));
			this.addEnemy(new enemy6(this.myroot,0,200,150,0));
			this.addEnemy(new enemy6(this.myroot,0,90,150,0));
			
			this.addEnemy(new enemy6(this.myroot,0,100,200,0));
			this.addEnemy(new enemy6(this.myroot,0,150,220,0));
			this.addEnemy(new enemy6(this.myroot,0,200,240,0));
			this.addEnemy(new enemy6(this.myroot,0,250,200,0));
		}
		public function mission_7() {
			this.addEnemy(new enemy6(this.myroot,0,50,240,0));
			this.addEnemy(new enemy6(this.myroot,0,100,200,0));
			this.addEnemy(new enemy6(this.myroot,0,150,220,0));
			this.addEnemy(new enemy6(this.myroot,0,200,500,0));
			this.addEnemy(new enemy6(this.myroot,0,250,480,0));
			this.addEnemy(new enemy6(this.myroot,0,300,500,0));
		}
		public function mission_8() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// cube
			this.addEnemy(new enemy4(this.myroot,14,120,10,0));
			// up n down
			this.addEnemy(new enemy6(this.myroot,6,100,200,0));
			this.addEnemy(new enemy6(this.myroot,6,50,240,0));
			this.addEnemy(new enemy6(this.myroot,6,150,220,0));
			this.addEnemy(new enemy6(this.myroot,6,200,500,0));
			this.addEnemy(new enemy6(this.myroot,6,250,480,0));
			this.addEnemy(new enemy6(this.myroot,6,300,500,0));

			this.addEnemy(new enemy6(this.myroot,0,350,470,0));
			this.addEnemy(new enemy6(this.myroot,0,100,400,0));
			this.addEnemy(new enemy6(this.myroot,0,150,420,0));
			this.addEnemy(new enemy6(this.myroot,0,200,500,0));
			this.addEnemy(new enemy6(this.myroot,0,250,480,0));
			this.addEnemy(new enemy6(this.myroot,0,300,500,0));
		}
		public function mission_9() {
			// up n down2 
			this.addEnemy(new enemy6(this.myroot,6,100,200,0));
			this.addEnemy(new enemy6(this.myroot,6,50,240,0));
			this.addEnemy(new enemy6(this.myroot,6,150,220,0));
			this.addEnemy(new enemy6(this.myroot,6,200,500,0));
			this.addEnemy(new enemy6(this.myroot,6,250,480,0));
			this.addEnemy(new enemy6(this.myroot,6,300,500,0));
		}
		public function mission_10() {
			this.addEnemy(new enemy5(this.myroot,1,400,100,50));
			this.addEnemy(new enemy5(this.myroot,0,300,100,30));
			this.addEnemy(new enemy5(this.myroot,0,200,100,50));
		}
		public function mission_11() {
			// schild2 fliegt vorbei
			this.myroot.schild2.gotoAndPlay(2);
			this.addEnemy(new enemy5(this.myroot,1,400,100,50));
			this.addEnemy(new enemy5(this.myroot,0,300,100,30));
			this.addEnemy(new enemy5(this.myroot,0,200,100,50));			
		}
		public function mission_12() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			this.addEnemy(new enemy4(this.myroot,0,100,0,50));
			this.addEnemy(new enemy4(this.myroot,0,200,50,50));
			this.addEnemy(new enemy4(this.myroot,0,300,100,50));
		}
		public function mission_13() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// big spear
			this.addEnemy(new enemy6a(this.myroot,0,50,200,50));
			this.addEnemy(new enemy6a(this.myroot,0,100,120,50));
			this.addEnemy(new enemy6a(this.myroot,0,150,60,50));
			this.addEnemy(new enemy6a(this.myroot,0,200,0,50));
			this.addEnemy(new enemy6a(this.myroot,0,250,60,50));
			this.addEnemy(new enemy6a(this.myroot,0,310,140,50));			
			this.addEnemy(new enemy6a(this.myroot,0,370,230,50));

			this.addEnemy(new enemy6a(this.myroot,0,80,250,50));
			this.addEnemy(new enemy6a(this.myroot,0,160,270,50));
			this.addEnemy(new enemy6a(this.myroot,0,250,250,50));
		}
		public function mission_14() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			this.addEnemy(new enemy6a(this.myroot,0,70,160,50));
			this.addEnemy(new enemy6a(this.myroot,0,130,30,50));			
			this.addEnemy(new enemy6a(this.myroot,0,190,0,50));
			this.addEnemy(new enemy6a(this.myroot,0,240,60,50));
			this.addEnemy(new enemy6a(this.myroot,0,310,110,50));
		}
		public function mission_15() {
			this.addEnemy(new enemy6a(this.myroot,0,70,160,50));
			this.addEnemy(new enemy6a(this.myroot,0,130,30,50));			
			this.addEnemy(new enemy6a(this.myroot,0,190,0,50));
			this.addEnemy(new enemy6a(this.myroot,0,240,60,50));			
			this.addEnemy(new enemy6a(this.myroot,0,310,110,50));
		}
		public function mission_16() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debra1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(debra1);
				this.myroot.enemies_array.push(debra1);
			}
			// small spear
			this.addEnemy(new enemy6(this.myroot,0,40,120,50));
			this.addEnemy(new enemy6(this.myroot,0,100,60,50));
			this.addEnemy(new enemy6(this.myroot,0,160,0,50));
			this.addEnemy(new enemy6(this.myroot,0,220,50,50));
			this.addEnemy(new enemy6(this.myroot,0,280,130,50));
			// small spear - with biggie
			this.addEnemy(new enemy6(this.myroot,0,80,350,50));
			this.addEnemy(new enemy6(this.myroot,0,130,290,50));	
			this.addEnemy(new enemy4(this.myroot,24,200,230,50));
			this.addEnemy(new enemy6(this.myroot,0,270,290,50));
			this.addEnemy(new enemy6(this.myroot,0,320,350,50));
		}
		public function mission_17() {
			// big spear - with biggie
			this.addEnemy(new enemy6(this.myroot,0,20,350,50));
			this.addEnemy(new enemy6(this.myroot,0,80,270,50));			
			this.addEnemy(new enemy6(this.myroot,0,130,210,50));			
			this.addEnemy(new enemy4(this.myroot,24,200,220,50));						
			this.addEnemy(new enemy6(this.myroot,0,260,290,50));						
			this.addEnemy(new enemy6(this.myroot,0,320,360,50));
			this.addEnemy(new enemy6(this.myroot,0,380,390,50));						
			// flyer morons
			this.addEnemy(new enemy5(this.myroot,0,40,0,0));
			this.addEnemy(new enemy5(this.myroot,12,400,20,0));			
			this.addEnemy(new enemy5(this.myroot,0,220,50,0));			
			this.addEnemy(new enemy5(this.myroot,0,275,20,0));
			this.addEnemy(new enemy5(this.myroot,0,330,50,0));
		}
		public function mission_18() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// sinus fans
			this.addEnemy(new enemy5(this.myroot,3,250,150,0.3));
			this.addEnemy(new enemy5(this.myroot,3,250,200,0.1));			
			this.addEnemy(new enemy5(this.myroot,3,250,300,0.1));			
			this.addEnemy(new enemy5(this.myroot,3,250,350,0.1));						
			this.addEnemy(new enemy5(this.myroot,3,250,400,0.2));												
			this.addEnemy(new enemy5(this.myroot,3,250,450,0.1));
			this.addEnemy(new enemy5(this.myroot,3,250,500,0.1));			
			this.addEnemy(new enemy5(this.myroot,3,250,550,0.1));			
			this.addEnemy(new enemy5(this.myroot,3,250,600,0.4));						
			this.addEnemy(new enemy5(this.myroot,3,250,650,0.1));
		}
		public function mission_19() {
			// up n down2 
			this.addEnemy(new enemy6a(this.myroot,6,100,0,0));
			this.addEnemy(new enemy6(this.myroot,6,30,40,0));			
			this.addEnemy(new enemy6(this.myroot,6,170,20,0));			
			this.addEnemy(new enemy6(this.myroot,6,180,200,0));
			this.addEnemy(new enemy6a(this.myroot,6,250,170,0));
			this.addEnemy(new enemy6(this.myroot,6,330,200,0));
		}
		public function mission_20() {
			// sinus fans - with biggie on top
			this.addEnemy(new enemy4(this.myroot,3,220,330,0.3));
			this.addEnemy(new enemy5(this.myroot,3,220,400,0.1));
			this.addEnemy(new enemy5(this.myroot,3,220,450,0.1));
			this.addEnemy(new enemy5(this.myroot,3,220,500,0.2));			
			this.addEnemy(new enemy5(this.myroot,3,220,550,0.1));
			this.addEnemy(new enemy5(this.myroot,3,220,600,0.6));			
			this.addEnemy(new enemy5(this.myroot,3,220,650,0.1));
			this.addEnemy(new enemy5(this.myroot,3,220,700,0.4));
			this.addEnemy(new enemy5(this.myroot,3,220,750,0.1));			
			this.addEnemy(new enemy5(this.myroot,3,220,810,0.4));
			this.addEnemy(new enemy5(this.myroot,3,220,880,0.2));			
		}
		public function mission_21() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// schraeg nach rechts
			this.addEnemy(new enemy5(this.myroot,1,0,0,50));
			this.addEnemy(new enemy5(this.myroot,1,80,0,50));
			this.addEnemy(new enemy6(this.myroot,1,160,0,50));			
			this.addEnemy(new enemy6(this.myroot,1,240,0,50));
			this.addEnemy(new enemy6(this.myroot,1,280,0,50));
		}
		public function mission_22() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			var da2:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da2; j++) {
				var deba1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(deba1);
				this.myroot.enemies_array.push(deba1);
			}
			// schraeg nach links
			this.addEnemy(new enemy6a(this.myroot,2,420,0,50));
			this.addEnemy(new enemy6a(this.myroot,2,340,0,50));
			this.addEnemy(new enemy6a(this.myroot,2,260,0,50));			
		}
		public function mission_23() {
			// small bo
			this.addEnemy(new enemy6(this.myroot,0,51,10,50));
			this.addEnemy(new enemy6(this.myroot,0,112,60,50));
			this.addEnemy(new enemy6(this.myroot,0,170,110,50));			
			this.addEnemy(new enemy6(this.myroot,0,226,50,50));
			this.addEnemy(new enemy6(this.myroot,0,290,0,50));			
		}
		public function mission_24() {
			// big bow
			this.addEnemy(new enemy5(this.myroot,0,20,10,50));
			this.addEnemy(new enemy5(this.myroot,0,61,30,50));			
			this.addEnemy(new enemy5(this.myroot,0,112,60,50));
			this.addEnemy(new enemy5(this.myroot,0,160,105,50));			
			this.addEnemy(new enemy5(this.myroot,0,196,100,50));
			this.addEnemy(new enemy5(this.myroot,0,226,70,50));
			this.addEnemy(new enemy5(this.myroot,0,290,30,50));			
			this.addEnemy(new enemy5(this.myroot,0,340,15,50));
			this.addEnemy(new enemy5(this.myroot,0,402,0,50));			
		}
		public function mission_25() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// schraeg nach rechts
			this.addEnemy(new enemy6a(this.myroot,1,0,0,50));
			this.addEnemy(new enemy6a(this.myroot,1,60,0,50));
			this.addEnemy(new enemy6a(this.myroot,1,120,0,50));			
			// 3 biggies 
			this.addEnemy(new enemy4(this.myroot,0,90,30,50));
			this.addEnemy(new enemy4(this.myroot,0,200,0,50));
			this.addEnemy(new enemy4(this.myroot,0,310,30,50));			
		}
		public function mission_26() {
			// schraeg nach links
			this.addEnemy(new enemy6a(this.myroot,2,430,10,50));
			this.addEnemy(new enemy6a(this.myroot,2,340,0,50));
			this.addEnemy(new enemy6a(this.myroot,2,270,10,50));
			// doppelreihe von oben nach unten - schraeg.
			//reihe 1
			this.addEnemy(new enemy5(this.myroot,0,-100,-350,0));
			this.addEnemy(new enemy5(this.myroot,0,60,50,0));
			this.addEnemy(new enemy5(this.myroot,0,100,100,0));			
			this.addEnemy(new enemy5(this.myroot,0,140,150,0));
			this.addEnemy(new enemy5(this.myroot,0,180,200,0));			
			this.addEnemy(new enemy5(this.myroot,0,220,250,0));
			this.addEnemy(new enemy5(this.myroot,0,260,300,0));
			this.addEnemy(new enemy5(this.myroot,0,300,350,0));			
			this.addEnemy(new enemy5(this.myroot,0,340,400,0));
			this.addEnemy(new enemy5(this.myroot,0,380,450,0));			
			//reihe 2
			this.addEnemy(new enemy5(this.myroot,0,300,450,0));
			this.addEnemy(new enemy5(this.myroot,0,60,150,0));			
			this.addEnemy(new enemy5(this.myroot,0,100,200,0));
			this.addEnemy(new enemy5(this.myroot,0,140,250,0));			
			this.addEnemy(new enemy5(this.myroot,0,180,300,0));
			this.addEnemy(new enemy5(this.myroot,0,220,350,0));
			this.addEnemy(new enemy5(this.myroot,0,260,400,0));			
			this.addEnemy(new enemy5(this.myroot,0,340,500,0));
			this.addEnemy(new enemy5(this.myroot,0,380,550,0));			
		}
		public function mission_27() {
			// schraeg nach rechts doppelreihe
			this.addEnemy(new enemy6a(this.myroot,1,0,0,50));
			this.addEnemy(new enemy6a(this.myroot,1,60,0,50));
			this.addEnemy(new enemy6a(this.myroot,1,125,0,50));
			this.addEnemy(new enemy6a(this.myroot,1,0,70,50));
			this.addEnemy(new enemy6a(this.myroot,1,60,75,50));
			this.addEnemy(new enemy6a(this.myroot,1,120,70,50));			
			
			this.addEnemy(new enemy6(this.myroot,0,70,1210,0));
			this.addEnemy(new enemy6(this.myroot,0,143,1200,0));
			this.addEnemy(new enemy6(this.myroot,0,210,1218,0));
			this.addEnemy(new enemy6(this.myroot,0,284,1202,0));
			this.addEnemy(new enemy6(this.myroot,0,105,1100,0));
			this.addEnemy(new enemy6(this.myroot,0,175,1110,0));
			this.addEnemy(new enemy6(this.myroot,0,245,1120,0));			
			this.addEnemy(new enemy6(this.myroot,0,175,1000,0));			
		}
		public function mission_28() {
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// small spear
			this.addEnemy(new enemy5(this.myroot,0,40,120,50));
			this.addEnemy(new enemy5(this.myroot,0,100,60,50));
			this.addEnemy(new enemy5(this.myroot,0,160,0,50));
			this.addEnemy(new enemy5(this.myroot,0,220,70,50));			
			this.addEnemy(new enemy5(this.myroot,0,300,140,50));			
		}
		public function mission_29() {
			this.addEnemy(new enemy4(this.myroot,6,200,0,50));			
		}
		public function mission_30() {
			// some fast
			this.addEnemy(new enemy5(this.myroot,0,50,400,0));			
			this.addEnemy(new enemy5(this.myroot,0,150,450,0));
			this.addEnemy(new enemy5(this.myroot,0,250,410,0));
			this.addEnemy(new enemy5(this.myroot,0,350,380,0));			
		}
		public function mission_31() {
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss2.visible=true;
			this.myroot.name_boss2.gotoAndPlay(1);
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris4=new debris4(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			var e1:boss2=new boss2(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
			//this.myroot.bosshealth.scaleX=this.myroot.boss2.maxhealth;
		}
		public function mission2_end() {
			this.myroot.bossmode=false;
			// DEBRIS 3
			var da:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da; j++) {
				var d1:debris3=new debris3(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			trace("mission2 end - boss dead - stats appear - matsch 0 - heat 0 - no weapon selected");
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