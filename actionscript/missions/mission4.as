// MISSION 4 - GREEN - 
package missions{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class mission4 extends Mission {
		public var wave:int=0;
		public var total_waves=31;
		public var times:Array=new Array(200,490,600,800,1000,1100,1300,1400,1600,1800,
										 1900,2000,2100,2200,2300,2400,2500,2600,2700,2800,
										 3000,3100,3200,3300,3400,3550,3700,3800,3900,4000,
										 4200);
		public function mission4(root_p:MovieClip) {
			super(root_p);
		}
		//misssion 4
		public function mission_0() {
			this.stationLeaveMainPlay();
			
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			var b1:barriere4=new barriere4(this.myroot);
			this.myroot.enemies.addChild(b1);
			this.myroot.enemies_array.push(b1);

			this.myroot.station0.visible=false;
			// ship2
			this.myroot.ship2.gotoAndPlay(2);
		}
		public function mission_1() {
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// single small
			this.addEnemy(new enemy12(this.myroot,0,120,0,0));
		}
		public function mission_2() {
			// singles small 2
			this.addEnemy(new enemy12(this.myroot,0,350,0,0));
			this.addEnemy(new enemy12(this.myroot,0,180,120,0));
		}
		public function mission_3() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}			
			// small - rudel masse - muhawwawaw
			this.addEnemy(new enemy12(this.myroot,0,40,0,0));
			this.addEnemy(new enemy12(this.myroot,0,140,12,0));
			this.addEnemy(new enemy12(this.myroot,0,240,9,0));
			this.addEnemy(new enemy12(this.myroot,0,340,13,0));
			this.addEnemy(new enemy12(this.myroot,0,400,10,0));
			// reihe 2
			this.addEnemy(new enemy12(this.myroot,0,85,162,0));
			this.addEnemy(new enemy12(this.myroot,0,170,172,0));
			this.addEnemy(new enemy12(this.myroot,0,279,163,0));
			this.addEnemy(new enemy12(this.myroot,0,383,170,0));
			this.addEnemy(new enemy12(this.myroot,0,415,265,0));	
			// reihe 3
			this.addEnemy(new enemy12(this.myroot,0,50,370,0));
			this.addEnemy(new enemy12(this.myroot,0,139,360,0));
			this.addEnemy(new enemy12(this.myroot,0,243,370,0));
			this.addEnemy(new enemy12(this.myroot,0,340,355,0));
			this.addEnemy(new enemy12(this.myroot,0,410,372,0));		
			// reihe 4
			this.addEnemy(new enemy12(this.myroot,0,200,469,0));
			this.addEnemy(new enemy12(this.myroot,0,300,473,0));
			this.addEnemy(new enemy12(this.myroot,0,380,470,0));	
		}
		public function mission_4() {
			// single small again  - spear
			this.addEnemy(new enemy12(this.myroot,0,50,255,0));
			this.addEnemy(new enemy12(this.myroot,0,130,153,0));
			this.addEnemy(new enemy12(this.myroot,0,220,4,0));
			this.addEnemy(new enemy12(this.myroot,0,320,150,0));
			this.addEnemy(new enemy12(this.myroot,0,400,250,0));
		}
		public function mission_5() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}			
			// smalls spear and one biggie following
			this.addEnemy(new enemy12(this.myroot,0,40,390,0));
			this.addEnemy(new enemy12(this.myroot,0,50,255,0));
			this.addEnemy(new enemy12(this.myroot,0,130,153,0));
			this.addEnemy(new enemy12(this.myroot,0,220,4,0));
			this.addEnemy(new enemy12(this.myroot,0,320,150,0));
			this.addEnemy(new enemy12(this.myroot,0,400,250,0));
			this.addEnemy(new enemy12(this.myroot,0,410,380,0));
			// single biggie - same speed
			this.addEnemy(new enemy14(this.myroot,0,227,250,0));			
		}
		public function mission_6() {
			// schild wrack
			this.myroot.schild5.gotoAndPlay(2);
			// 2 little spears  - smalls
			// spear 1 
			this.addEnemy(new enemy12(this.myroot,0,50,240,0));
			this.addEnemy(new enemy12(this.myroot,0,100,200,0));
			this.addEnemy(new enemy12(this.myroot,0,150,220,0));	
			// spear 2
			this.addEnemy(new enemy12(this.myroot,0,200,500,0));
			this.addEnemy(new enemy12(this.myroot,0,250,480,0));
			this.addEnemy(new enemy12(this.myroot,0,300,500,0));
		}
		public function mission_7() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}			
			// tripple sinus line smalls
			this.addEnemy(new enemy12(this.myroot,3,45,0,0.5));
			this.addEnemy(new enemy12(this.myroot,3,50,110,0.4));
			this.addEnemy(new enemy12(this.myroot,3,40,220,0.3));
			this.addEnemy(new enemy12(this.myroot,3,45,330,0.5));
			this.addEnemy(new enemy12(this.myroot,3,53,450,0.6));
			this.addEnemy(new enemy12(this.myroot,3,48,560,0.3));

			this.addEnemy(new enemy12(this.myroot,3,200,4,0.4));
			this.addEnemy(new enemy12(this.myroot,3,210,115,0.3));
			this.addEnemy(new enemy12(this.myroot,3,220,226,0.2));
			this.addEnemy(new enemy12(this.myroot,3,215,327,0.1));			
			this.addEnemy(new enemy12(this.myroot,3,200,440,0.3));
			this.addEnemy(new enemy12(this.myroot,3,210,565,0.6));

			this.addEnemy(new enemy12(this.myroot,3,350,0,0.2));
			this.addEnemy(new enemy12(this.myroot,3,360,100,0.3));
			this.addEnemy(new enemy12(this.myroot,3,355,230,0.4));
			this.addEnemy(new enemy12(this.myroot,3,345,315,0.2));
			this.addEnemy(new enemy12(this.myroot,3,350,430,0.3));
			this.addEnemy(new enemy12(this.myroot,3,360,553,0.3));
		}
		public function mission_8() {
			// single small - with a biggie spear following him 
			this.addEnemy(new enemy12(this.myroot,0,250,0,0));
			this.addEnemy(new enemy14(this.myroot,0,40,340,0));
			this.addEnemy(new enemy14(this.myroot,0,130,320,0));
			this.addEnemy(new enemy14(this.myroot,0,220,300,0));
			this.addEnemy(new enemy14(this.myroot,0,320,330,0));
			this.addEnemy(new enemy14(this.myroot,0,400,360,0));
		}
		public function mission_9() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}			
			// little spear biggies
			this.addEnemy(new enemy14(this.myroot,0,100,50,0));
			this.addEnemy(new enemy14(this.myroot,0,220,0,0));
			this.addEnemy(new enemy14(this.myroot,0,340,60,0));
		}
		public function mission_10() {
			// enemy 13 first time
			this.addEnemy(new enemy13(this.myroot,0,100,0,0));
			this.addEnemy(new enemy13(this.myroot,0,300,60,0));
		}
		public function mission_11() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}			
			// abwechselnd e 13 und e 12 - bow
			this.addEnemy(new enemy12(this.myroot,0,40,0,0));
			this.addEnemy(new enemy13(this.myroot,0,130,20,0));
			this.addEnemy(new enemy12(this.myroot,0,220,40,0));
			this.addEnemy(new enemy13(this.myroot,0,320,20,0));
			this.addEnemy(new enemy12(this.myroot,0,400,0,0));
		}
		public function mission_12() {
						// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// bow e 13
			this.addEnemy(new enemy13(this.myroot,0,50,0,0));
			this.addEnemy(new enemy13(this.myroot,0,135,20,0));
			this.addEnemy(new enemy13(this.myroot,0,225,40,0));
			this.addEnemy(new enemy13(this.myroot,0,323,20,0));
			this.addEnemy(new enemy13(this.myroot,0,402,0,0));	
		}
		public function mission_13() {

			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// big pfeil - part 1
			this.addEnemy(new enemy13(this.myroot,0,250,0,0));
			this.addEnemy(new enemy12(this.myroot,0,200,120,0));
			this.addEnemy(new enemy12(this.myroot,0,300,120,0));

			this.addEnemy(new enemy12(this.myroot,0,130,220,0));
			this.addEnemy(new enemy12(this.myroot,0,240,230,0));
			this.addEnemy(new enemy12(this.myroot,0,370,220,0));

			this.addEnemy(new enemy12(this.myroot,0,160,280,0));
			this.addEnemy(new enemy12(this.myroot,0,330,280,0));	

			this.addEnemy(new enemy12(this.myroot,0,250,320,0));

			this.addEnemy(new enemy12(this.myroot,0,255,422,0));
		}
		public function mission_14() {
			
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// big pfeil - part 2
			this.addEnemy(new enemy12(this.myroot,0,200,0,0));
			this.addEnemy(new enemy12(this.myroot,0,300,0,0));

			this.addEnemy(new enemy12(this.myroot,0,50,120,0));
			this.addEnemy(new enemy12(this.myroot,0,240,120,0));
			this.addEnemy(new enemy12(this.myroot,0,360,125,0));

			this.addEnemy(new enemy12(this.myroot,0,40,220,0));
			this.addEnemy(new enemy12(this.myroot,0,130,224,0));
			this.addEnemy(new enemy12(this.myroot,0,240,230,0));
			this.addEnemy(new enemy12(this.myroot,0,370,220,0));

			this.addEnemy(new enemy12(this.myroot,0,76,292,0));
			this.addEnemy(new enemy12(this.myroot,0,160,290,0));
			this.addEnemy(new enemy12(this.myroot,0,330,293,0));

			this.addEnemy(new enemy12(this.myroot,0,100,350,0));
			this.addEnemy(new enemy12(this.myroot,0,220,360,0));
			this.addEnemy(new enemy12(this.myroot,0,255,422,0));
		}
		public function mission_15() {
						// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// small spears
			// spear 1 
			this.addEnemy(new enemy13(this.myroot,0,50,40,0));
			this.addEnemy(new enemy13(this.myroot,0,100,0,0));		
			this.addEnemy(new enemy13(this.myroot,0,150,20,0));	
			// spear 2
			this.addEnemy(new enemy13(this.myroot,0,200,200,0));
			this.addEnemy(new enemy13(this.myroot,0,250,180,0));		
			this.addEnemy(new enemy13(this.myroot,0,300,200,0));
			// spear 3
			this.addEnemy(new enemy13(this.myroot,0,120,350,0));
			this.addEnemy(new enemy13(this.myroot,0,170,320,0));
			this.addEnemy(new enemy13(this.myroot,0,220,345,0));
		}
		public function mission_16() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}

			// schild
			this.myroot.schild6.gotoAndPlay(2);
			// big slow triangle
			this.addEnemy(new enemy14(this.myroot,32,250,0,0));
			this.addEnemy(new enemy14(this.myroot,32,140,120,0));		
			this.addEnemy(new enemy14(this.myroot,32,280,130,0));		
			this.addEnemy(new enemy14(this.myroot,32,100,246,0));
			this.addEnemy(new enemy14(this.myroot,32,220,242,0));		
			this.addEnemy(new enemy14(this.myroot,32,340,240,0));
		}
		public function mission_17() {
			// interracial triangle
			this.addEnemy(new enemy13(this.myroot,0,235,0,0));
			this.addEnemy(new enemy12(this.myroot,0,140,120,0));		
			this.addEnemy(new enemy12(this.myroot,0,280,130,0));					

			this.addEnemy(new enemy14(this.myroot,0,220,242,0));
			this.addEnemy(new enemy14(this.myroot,0,100,246,0));		
			this.addEnemy(new enemy14(this.myroot,0,340,240,0));
		}
		public function mission_18() {
						// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// enemy 15 first time - triangle
			this.addEnemy(new enemy15(this.myroot,0,235,0,0));
			this.addEnemy(new enemy15(this.myroot,0,100,230,0));		
			this.addEnemy(new enemy15(this.myroot,0,220,200,0));
			this.addEnemy(new enemy15(this.myroot,0,340,240,0));
		}
		public function mission_19() {
			// seitwärts sinus
			this.addEnemy(new enemy15(this.myroot,33,0,-100,0));
		}
		public function mission_20() {
						// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// first FATTIE 
			this.addEnemy(new enemy16(this.myroot,4,200,0,0));
		}
		public function mission_21() {
			// double spear with big stingers
			this.addEnemy(new enemy15(this.myroot,0,100,270,0));		
			this.addEnemy(new enemy15(this.myroot,0,220,200,0));
			this.addEnemy(new enemy15(this.myroot,0,340,272,0));
			
			this.addEnemy(new enemy15(this.myroot,0,105,474,0));		
			this.addEnemy(new enemy15(this.myroot,0,220,400,0));
			this.addEnemy(new enemy15(this.myroot,0,335,472,0));
		}
		public function mission_22() {
						
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// schichtsalat 
			// smalls
			this.addEnemy(new enemy12(this.myroot,0,220,0,0));		
			this.addEnemy(new enemy12(this.myroot,0,100,83,0));
			this.addEnemy(new enemy12(this.myroot,0,220,86,0));
			this.addEnemy(new enemy12(this.myroot,0,340,82,0));
			// stingers
			this.addEnemy(new enemy13(this.myroot,0,50,210,0));		
			this.addEnemy(new enemy13(this.myroot,0,123,212,0));
			this.addEnemy(new enemy13(this.myroot,0,225,210,0));
			this.addEnemy(new enemy13(this.myroot,0,285,215,0));
			this.addEnemy(new enemy13(this.myroot,0,410,212,0));
			// big stingers
			this.addEnemy(new enemy15(this.myroot,0,105,474,0));
			this.addEnemy(new enemy15(this.myroot,0,220,450,0));
			this.addEnemy(new enemy15(this.myroot,0,335,472,0));
			// biggies kastanietten
			this.addEnemy(new enemy14(this.myroot,0,90,594,0));
			this.addEnemy(new enemy14(this.myroot,0,220,590,0));
			this.addEnemy(new enemy14(this.myroot,0,345,592,0));
		}
		public function mission_23() {
			// double spear with stingers
			this.addEnemy(new enemy13(this.myroot,0,100,270,0));
			this.addEnemy(new enemy13(this.myroot,0,220,200,0));
			this.addEnemy(new enemy13(this.myroot,0,340,272,0));
			this.addEnemy(new enemy13(this.myroot,0,105,474,0));
			this.addEnemy(new enemy13(this.myroot,0,220,400,0));
			this.addEnemy(new enemy13(this.myroot,0,335,472,0));
		}
		public function mission_24() {
						// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// see tang formation
			this.addEnemy(new enemy12(this.myroot,0,250,0,0));
			this.addEnemy(new enemy12(this.myroot,0,200,50,0));
			this.addEnemy(new enemy12(this.myroot,0,230,100,0));

			this.addEnemy(new enemy12(this.myroot,0,105,140,0));
			this.addEnemy(new enemy12(this.myroot,0,140,160,0));
			this.addEnemy(new enemy12(this.myroot,0,184,150,0));			

			this.addEnemy(new enemy12(this.myroot,0,120,190,0));
			this.addEnemy(new enemy12(this.myroot,0,160,200,0));
			this.addEnemy(new enemy12(this.myroot,0,200,200,0));
		}
		public function mission_25() {
			// sinus fans
			this.addEnemy(new enemy12(this.myroot,3,290,200,0.1));
			this.addEnemy(new enemy12(this.myroot,3,290,300,0.1));
			this.addEnemy(new enemy12(this.myroot,3,290,350,0.2));
			this.addEnemy(new enemy12(this.myroot,3,290,400,0.3));
			this.addEnemy(new enemy12(this.myroot,3,290,450,0.4));
			this.addEnemy(new enemy12(this.myroot,3,290,500,0.5));
			this.addEnemy(new enemy12(this.myroot,3,290,550,0.6));
			this.addEnemy(new enemy12(this.myroot,3,290,600,0.6));
			this.addEnemy(new enemy12(this.myroot,3,290,650,0.6));
		}
		public function mission_26() {
						
			// DEBRIS 8
			var da1:int=Math.floor(3+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// ungerade wand
			this.addEnemy(new enemy12(this.myroot,0,40,0,0));
			this.addEnemy(new enemy13(this.myroot,0,80,130,0));
			this.addEnemy(new enemy12(this.myroot,0,120,30,0));
			this.addEnemy(new enemy12(this.myroot,0,160,20,0));
			this.addEnemy(new enemy12(this.myroot,0,200,0,0));
			this.addEnemy(new enemy13(this.myroot,0,240,100,0));			
			this.addEnemy(new enemy12(this.myroot,0,280,0,0));
			this.addEnemy(new enemy12(this.myroot,0,320,40,0));
			this.addEnemy(new enemy12(this.myroot,0,360,30,0));
			this.addEnemy(new enemy13(this.myroot,0,400,100,0));
		}
		public function mission_27() {
						
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			// big spear
			this.addEnemy(new enemy12(this.myroot,0,50,200,50));
			this.addEnemy(new enemy12(this.myroot,0,100,120,50));
			this.addEnemy(new enemy12(this.myroot,0,150,60,50));
			this.addEnemy(new enemy12(this.myroot,0,200,0,50));
			this.addEnemy(new enemy12(this.myroot,0,250,60,50));
			this.addEnemy(new enemy12(this.myroot,0,310,140,50));
			this.addEnemy(new enemy12(this.myroot,0,370,230,50));

			this.addEnemy(new enemy12(this.myroot,0,80,250,50));
			this.addEnemy(new enemy12(this.myroot,0,160,270,50));
			this.addEnemy(new enemy12(this.myroot,0,250,250,50));
		}
		public function mission_28() {
			// zick zack biggie
			this.addEnemy(new enemy15(this.myroot,23,260,0,50));
		}
		public function mission_29() {
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}			
			//zick zack biggie
			this.addEnemy(new enemy15(this.myroot,23,260,0,50));
			// fattie spear
			this.addEnemy(new enemy16(this.myroot,0,50,200,50));
			this.addEnemy(new enemy16(this.myroot,0,130,60,50));
			this.addEnemy(new enemy16(this.myroot,0,250,0,50));
			this.addEnemy(new enemy16(this.myroot,0,370,230,50));
		}
		public function mission_30() {
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss4.visible=true;
			this.myroot.name_boss4.gotoAndPlay(1);
			
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var d1:debris7=new debris7(this.myroot,0);
				this.myroot.enemies.addChild(d1);
				this.myroot.enemies_array.push(d1);
			}
			// DEBRIS 8
			var da1:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da1; j++) {
				var debris1:debris8=new debris8(this.myroot,0);
				this.myroot.enemies.addChild(debris1);
				this.myroot.enemies_array.push(debris1);
			}
			var e1:boss4=new boss4(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
		}
		public function mission4_end() {
			this.myroot.bossmode=false;
			// DEBRIS 7
			var da:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da; j++) {
				var d1:debris7=new debris7(this.myroot,0);
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