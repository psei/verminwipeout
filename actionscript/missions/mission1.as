// MISSION 1 - red
package missions{
	
	import flash.display.MovieClip;
	import flash.events.*;
	import mcs.*;
	import missions.*;
	
	public class mission1 extends Mission {
		public var wave:int=0;
		public var total_waves=32;
		public var times:Array=new Array(10,110,200,602,700,800,900,1200,1400,1700,1800,
		 1900,2000,2100,2300,2400,2600,2650,2800,2900,3000,
		 3100,3200,3300,3400,3500,3600,3800,3950,4000,4100,
		 4260);
		public function mission1(root_p:MovieClip) {
			super(root_p);
		}
		public function mission_0() {					
			//shooting enemy
			//this.addEnemy(new enemy3a(this.myroot,106,80,0,0));
			//this.addEnemy(new enemy1a(this.myroot,108,120,0,0));		
			
			
			/*			
			// Zwischenboss für Level 4 (Made "Lurvle")
			var made:boss4a = new boss4a(this.myroot);
			this.myroot.name_boss4a.visible=true;
			this.myroot.name_boss4a.gotoAndPlay(1);
			this.myroot.enemies.addChild(made);
			this.myroot.enemies_array.push(made);
			this.myroot.bosshealth.visible=true;
			*/
			
			this.stationLeaveMainPlay();
			
			this.myroot.station0.gotoAndPlay(2);
			
			// ships ueberhol ani
			this.myroot.ship3.gotoAndPlay(2);
			
			// shield hold still !
			this.myroot.health_warning.gotoAndStop(1);

			// DEBRIS
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var e1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(e1);
				this.myroot.enemies_array.push(e1);
			}
			// DEBRIS 2
			var da2:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da2; j++) {
				var e2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
			}
		}
		
		public function mission_1() {
			// barriere bein single   just in time
			var b10:barriere10=new barriere10(this.myroot);
			this.myroot.enemies.addChild(b10);
			this.myroot.enemies_array.push(b10);	

			// schild
			this.myroot.fade2black.gotoAndPlay(2);
			
		}		
		public function mission_2() {
			// barriere bein
			var b1:barriere1=new barriere1(this.myroot);
			this.myroot.enemies.addChild(b1);
			this.myroot.enemies_array.push(b1);	
						
			// DEBRIS
			var da:int=Math.floor(1+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var e1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(e1);
				this.myroot.enemies_array.push(e1);
			}
			// DEBRIS 2
			var da2:int=Math.floor(1+Math.random()*8);
			for (var j:int=0; j < da2; j++) {
				var e2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
			}
		}
		public function mission_3() {
			// DEBRIS
			var da:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da; i++) {
				var e1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(e1);
				this.myroot.enemies_array.push(e1);
			}
			// TITEL 
			// easy FLATTER VIECHER
			this.addEnemy(new enemy3(this.myroot,0,350,0,0));
			/*
			var e2_fly:enemy3=new enemy3(this.myroot,0,350,0,0);
			this.myroot.enemies.addChild(e2_fly);
			this.myroot.enemies_array.push(e2_fly);
			*/
			
			this.addEnemy(new enemy3(this.myroot,0,362,100,0));
			/*
			var e2_flya:enemy3=new enemy3(this.myroot,0,362,100,0);
			this.myroot.enemies.addChild(e2_flya);
			this.myroot.enemies_array.push(e2_flya);
			*/

			// spear 1
			this.addEnemy(new enemy3(this.myroot,0,93,460,0));
			this.addEnemy(new enemy3(this.myroot,0,130,410,0));
			this.addEnemy(new enemy3(this.myroot,0,170,462,0));
			// spear 2
			this.addEnemy(new enemy3(this.myroot,0,220,560,0));			
			this.addEnemy(new enemy3(this.myroot,0,260,500,0));
			this.addEnemy(new enemy3(this.myroot,0,310,564,0));			
			// row 1
			this.addEnemy(new enemy3(this.myroot,0,123,716,0));			
			this.addEnemy(new enemy3(this.myroot,0,200,700,0));
			this.addEnemy(new enemy3(this.myroot,0,273,710,0));			
			// triangle 1
			this.addEnemy(new enemy3(this.myroot,0,70,1210,0));			
			this.addEnemy(new enemy3(this.myroot,0,143,1200,0));
			this.addEnemy(new enemy3(this.myroot,0,210,1218,0));		
			this.addEnemy(new enemy3(this.myroot,0,284,1202,0));			
			this.addEnemy(new enemy3(this.myroot,0,105,1100,0));
			this.addEnemy(new enemy3(this.myroot,0,175,1110,0));		
			this.addEnemy(new enemy3(this.myroot,0,245,1120,0));
			this.addEnemy(new enemy3(this.myroot,0,175,1000,0));		
			// arch 1
			this.addEnemy(new enemy3(this.myroot,0,150,1500,0));			
			this.addEnemy(new enemy3(this.myroot,0,215,1400,0));
			this.addEnemy(new enemy3(this.myroot,0,270,1300,0));
			this.addEnemy(new enemy3(this.myroot,0,335,1310,0));			
			this.addEnemy(new enemy3(this.myroot,0,390,1400,0));
			this.addEnemy(new enemy3(this.myroot,0,400,1500,0));		
			// arch 2
			this.addEnemy(new enemy3(this.myroot,0,20,1800,0));			
			this.addEnemy(new enemy3(this.myroot,0,100,1855,0));
			this.addEnemy(new enemy3(this.myroot,0,180,1900,0));
			this.addEnemy(new enemy3(this.myroot,0,260,1910,0));			
			this.addEnemy(new enemy3(this.myroot,0,340,1845,0));
			this.addEnemy(new enemy3(this.myroot,0,385,1820,0));	
		}
		public function mission_4() {
			// barriere bein single
			var b8:barriere8=new barriere8(this.myroot);
			this.myroot.enemies.addChild(b8);
			this.myroot.enemies_array.push(b8);	
			
			// debris
			var da:int=Math.floor(3+Math.random()*10);
			for (var i:int=0; i < da; i++) {
				var de1:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(de1);
				this.myroot.enemies_array.push(de1);
			}
			this.myroot.names_mc.visible=false;
			// slow biggie
			this.addEnemy(new enemy2(this.myroot,0,150,0,0));		
			// little triangle
			this.addEnemy(new enemy3(this.myroot,0,90,120,0));	
			this.addEnemy(new enemy3(this.myroot,0,173,190,0));	
			this.addEnemy(new enemy3(this.myroot,0,238,130,0));	
		}
		public function mission_5() {
			// schild
			this.myroot.schild3.gotoAndPlay(2);
			// slow biggies
			this.addEnemy(new enemy2(this.myroot,0,210,0,0));	
			this.addEnemy(new enemy2(this.myroot,0,90,20,0));	
			// BIG CUBE
			this.addEnemy(new enemy3(this.myroot,14,50,40,300));	
			// single one
			this.addEnemy(new enemy3(this.myroot,0,150,40,300));	
		}
		public function mission_6() {
			// slow biggie group
			this.addEnemy(new enemy2(this.myroot,0,50,100,0));		
			this.addEnemy(new enemy2(this.myroot,0,120,30,0));	
			this.addEnemy(new enemy2(this.myroot,0,192,0,0));		
			this.addEnemy(new enemy2(this.myroot,0,260,40,0));		
			this.addEnemy(new enemy2(this.myroot,0,325,90,0));		
			// BIG CUBE
			this.addEnemy(new enemy3(this.myroot,14,50,40,300));	
			// little triangle
			this.addEnemy(new enemy3(this.myroot,0,70,0,0));				
			this.addEnemy(new enemy3(this.myroot,0,150,0,0));				
			this.addEnemy(new enemy3(this.myroot,0,213,0,0));				
			// little triangle2
			this.addEnemy(new enemy3(this.myroot,0,70,0,0));				
			this.addEnemy(new enemy3(this.myroot,0,150,0,0));				
			this.addEnemy(new enemy3(this.myroot,0,213,0,0));				

			this.addEnemy(new enemy3(this.myroot,0,270,123,0));				
			this.addEnemy(new enemy3(this.myroot,0,330,193,0));				
			this.addEnemy(new enemy3(this.myroot,0,393,133,0));
		}
		public function mission_7() {
			this.addEnemy(new enemy3(this.myroot,0,40,200,0));				
			this.addEnemy(new enemy3(this.myroot,0,90,150,0));				
			this.addEnemy(new enemy3(this.myroot,0,145,50,0));				
			this.addEnemy(new enemy3(this.myroot,0,200,0,0));
			// biggie
			this.addEnemy(new enemy0(this.myroot,0,250,90,0));
			// little triangle2
			this.addEnemy(new enemy3(this.myroot,0,385,1820,0));		
			this.addEnemy(new enemy3(this.myroot,0,270,0,0));		
			this.addEnemy(new enemy3(this.myroot,0,330,0,0));		
			this.addEnemy(new enemy3(this.myroot,0,393,0,0));		
			// sinus fans
			
			this.addEnemy(new enemy3(this.myroot,3,290,200,0.1));		
			this.addEnemy(new enemy3(this.myroot,3,290,300,0.1));		
			this.addEnemy(new enemy3(this.myroot,3,290,350,0.2));		
			this.addEnemy(new enemy3(this.myroot,3,290,400,0.3));		
						
			this.addEnemy(new enemy3(this.myroot,3,290,450,0.4));		
			this.addEnemy(new enemy3(this.myroot,3,290,500,0.5));		
			this.addEnemy(new enemy3(this.myroot,3,290,550,0.6));		
			this.addEnemy(new enemy3(this.myroot,3,290,600,0.6));		
			this.addEnemy(new enemy3(this.myroot,3,290,650,0.6));		
		}
		public function mission_8() {
			// flyer			
			this.addEnemy(new enemy3(this.myroot,0,40,0,0));
			this.addEnemy(new enemy3(this.myroot,12,400,20,0));
			this.addEnemy(new enemy3(this.myroot,0,220,200,0));
			this.addEnemy(new enemy3(this.myroot,0,275,170,0));
			this.addEnemy(new enemy3(this.myroot,0,330,200,0));
			this.addEnemy(new enemy3(this.myroot,0,120,350,0));		
			this.addEnemy(new enemy3(this.myroot,0,175,400,0));
			this.addEnemy(new enemy3(this.myroot,0,230,350,0));
			this.addEnemy(new enemy3(this.myroot,0,-20,560,0));
			this.addEnemy(new enemy3(this.myroot,0,20,530,0));
			this.addEnemy(new enemy3(this.myroot,0,75,520,0));
			this.addEnemy(new enemy3(this.myroot,0,120,530,0));		
			this.addEnemy(new enemy3(this.myroot,0,175,550,0));
			this.addEnemy(new enemy3(this.myroot,0,230,560,0));
			this.addEnemy(new enemy3(this.myroot,0,280,550,0));
			this.addEnemy(new enemy3(this.myroot,0,330,530,0));
			this.addEnemy(new enemy3(this.myroot,0,-20,660,0));
			this.addEnemy(new enemy3(this.myroot,0,20,630,0));		
			this.addEnemy(new enemy3(this.myroot,0,75,620,0));
			this.addEnemy(new enemy3(this.myroot,0,120,630,0));
			this.addEnemy(new enemy3(this.myroot,0,175,650,0));
			this.addEnemy(new enemy3(this.myroot,0,230,660,0));
			this.addEnemy(new enemy3(this.myroot,0,280,650,0));
			this.addEnemy(new enemy3(this.myroot,0,330,630,0));		
			this.addEnemy(new enemy3(this.myroot,0,50,810,0));
			this.addEnemy(new enemy3(this.myroot,0,100,780,0));
			this.addEnemy(new enemy3(this.myroot,0,150,760,0));
			this.addEnemy(new enemy3(this.myroot,0,200,760,0));
			this.addEnemy(new enemy3(this.myroot,0,250,780,0));
			this.addEnemy(new enemy3(this.myroot,0,300,810,0));
			this.addEnemy(new enemy2(this.myroot,19,210,880,0));			
		}

		public function mission_9() {
			// flyer

			this.addEnemy(new enemy3(this.myroot,0,120,30,0));
			this.addEnemy(new enemy3(this.myroot,0,160,0,0));
			this.addEnemy(new enemy3(this.myroot,0,200,30,0));
			this.addEnemy(new enemy3(this.myroot,0,120,130,0));
			this.addEnemy(new enemy3(this.myroot,0,160,100,0));
			this.addEnemy(new enemy3(this.myroot,0,200,130,0));			
			// BIG AND SLOW
			// part1
			this.addEnemy(new enemy2(this.myroot,0,110,0,0));
			this.addEnemy(new enemy2(this.myroot,0,280,0,0));			
			// part2
			this.addEnemy(new enemy2(this.myroot,0,70,300,0));			
			this.addEnemy(new enemy2(this.myroot,0,350,300,0));			
		}
		public function mission_10() {
			// BIG SLOW   ueber kreuz
			this.addEnemy(new enemy2(this.myroot,1,10,10,0));		
			this.addEnemy(new enemy2(this.myroot,1,70,100,0));		
			// 3 uglies 			
			this.addEnemy(new enemy0(this.myroot,0,100,10,0));
			this.addEnemy(new enemy0(this.myroot,0,200,0,0));
			this.addEnemy(new enemy0(this.myroot,0,300,15,0));		
			// 2 Biggies			
			this.addEnemy(new enemy2(this.myroot,2,300,100,0));			
			this.addEnemy(new enemy2(this.myroot,2,310,10,0));						
		}
		public function mission_11() {
			// DEBRIS 2
			var da2:int=Math.floor(1+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrise2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(debrise2);
				this.myroot.enemies_array.push(debrise2);
			}
			// DREIECK TRIANGLE ATTACKs
			this.addEnemy(new enemy1(this.myroot,7,150,40,0));		
			this.addEnemy(new enemy1(this.myroot,7,100,80,0));		
			this.addEnemy(new enemy1(this.myroot,7,50,40,0));		
			this.addEnemy(new enemy1(this.myroot,16,250,40,0));		
			this.addEnemy(new enemy1(this.myroot,16,300,80,0));		
			this.addEnemy(new enemy1(this.myroot,16,350,40,0));		
			this.addEnemy(new enemy1(this.myroot,17,80,240,0));					
			this.addEnemy(new enemy1(this.myroot,17,130,280,0));		
			this.addEnemy(new enemy1(this.myroot,17,180,240,0));		
		}
		public function mission_12() {
			// ungerade standard
			// wand 1 
			this.addEnemy(new enemy1(this.myroot,0,40,0,0));		
			this.addEnemy(new enemy1(this.myroot,0,80,30,0));		
			this.addEnemy(new enemy1(this.myroot,0,120,30,0));		
			this.addEnemy(new enemy1(this.myroot,0,160,20,0));		
			this.addEnemy(new enemy1(this.myroot,0,200,0,0));		
			this.addEnemy(new enemy1(this.myroot,0,240,0,0));		
			this.addEnemy(new enemy1(this.myroot,0,280,0,0));		
			this.addEnemy(new enemy1(this.myroot,0,320,40,0));		
			this.addEnemy(new enemy1(this.myroot,0,360,30,0));		
			this.addEnemy(new enemy1(this.myroot,0,400,0,0));	
			// wand 2 	
			this.addEnemy(new enemy1(this.myroot,19,40,400,0));		
			this.addEnemy(new enemy1(this.myroot,19,80,430,0));		
			this.addEnemy(new enemy1(this.myroot,19,120,430,0));		
			this.addEnemy(new enemy1(this.myroot,19,160,400,0));		
			this.addEnemy(new enemy1(this.myroot,19,200,400,0));		
			this.addEnemy(new enemy1(this.myroot,19,240,400,0));		
			this.addEnemy(new enemy1(this.myroot,19,280,400,0));		
			this.addEnemy(new enemy1(this.myroot,19,320,430,0));		
			this.addEnemy(new enemy1(this.myroot,19,360,430,0));		
			this.addEnemy(new enemy1(this.myroot,19,400,400,0));
			// wand 3
			this.addEnemy(new enemy1(this.myroot,0,40,500,0));
			this.addEnemy(new enemy1(this.myroot,0,80,530,0));
			this.addEnemy(new enemy1(this.myroot,0,120,530,0));
			this.addEnemy(new enemy1(this.myroot,0,160,500,0));
			this.addEnemy(new enemy1(this.myroot,0,200,500,0));
			this.addEnemy(new enemy1(this.myroot,0,240,500,0));
			this.addEnemy(new enemy1(this.myroot,0,280,500,0));
			this.addEnemy(new enemy1(this.myroot,0,320,530,0));
			this.addEnemy(new enemy1(this.myroot,0,360,530,0));
			this.addEnemy(new enemy1(this.myroot,0,400,500,0));
		}
		public function mission_13() {
			// DREIECK TRIANGLE ATTACK   2
			// part 1
			this.addEnemy(new enemy1(this.myroot,7,150,40,0));
			this.addEnemy(new enemy1(this.myroot,7,100,80,0));
			this.addEnemy(new enemy1(this.myroot,7,50,40,0));

			this.addEnemy(new enemy1(this.myroot,16,250,40,0));
			this.addEnemy(new enemy1(this.myroot,16,300,80,0));
			this.addEnemy(new enemy1(this.myroot,16,350,40,0));
			
			this.addEnemy(new enemy1(this.myroot,17,80,240,0));
			this.addEnemy(new enemy1(this.myroot,17,130,280,0));
			this.addEnemy(new enemy1(this.myroot,17,180,240,0));
			// part 2
			this.addEnemy(new enemy1(this.myroot,7,150,440,0));
			this.addEnemy(new enemy1(this.myroot,7,100,480,0));
			this.addEnemy(new enemy1(this.myroot,7,50,440,0));
			
			this.addEnemy(new enemy1(this.myroot,19,270,460,0));
			this.addEnemy(new enemy1(this.myroot,19,320,500,0));
			this.addEnemy(new enemy1(this.myroot,19,370,460,0));

			this.addEnemy(new enemy1(this.myroot,17,70,500,0));
			this.addEnemy(new enemy1(this.myroot,17,120,540,0));
			this.addEnemy(new enemy1(this.myroot,17,170,500,0));

			// part 3
			this.addEnemy(new enemy1(this.myroot,17,70,600,0));
			this.addEnemy(new enemy1(this.myroot,17,120,640,0));
			this.addEnemy(new enemy1(this.myroot,17,170,600,0));

			this.addEnemy(new enemy1(this.myroot,17,250,740,0));
			this.addEnemy(new enemy1(this.myroot,17,200,780,0));
			this.addEnemy(new enemy1(this.myroot,17,150,740,0));

			this.addEnemy(new enemy1(this.myroot,19,270,860,0));
			this.addEnemy(new enemy1(this.myroot,19,320,800,0));
			this.addEnemy(new enemy1(this.myroot,19,370,860,0));
		}
		public function mission_14() {
			// doppel sinus
			// reihe links
			this.addEnemy(new enemy1(this.myroot,3,320,0,0.1));
			this.addEnemy(new enemy1(this.myroot,3,320,50,0.2));
			this.addEnemy(new enemy1(this.myroot,3,320,100,0.3));
			this.addEnemy(new enemy1(this.myroot,3,320,150,0.4));
			this.addEnemy(new enemy1(this.myroot,3,320,200,0.5));
			this.addEnemy(new enemy1(this.myroot,3,320,250,0.6));
			// reihe rechts
			this.addEnemy(new enemy1(this.myroot,4,120,0,0.1));
			this.addEnemy(new enemy1(this.myroot,4,120,50,0.2));
			this.addEnemy(new enemy1(this.myroot,4,120,100,0.3));
			this.addEnemy(new enemy1(this.myroot,4,120,150,0.4));
			this.addEnemy(new enemy1(this.myroot,4,120,200,0.5));
			this.addEnemy(new enemy1(this.myroot,4,120,250,0.6));
		}
		public function mission_15() {
			// BIG MAUER
			// reihe 1
			this.addEnemy(new enemy1(this.myroot,0,50,10,0));
			this.addEnemy(new enemy1(this.myroot,0,100,0,0));
			this.addEnemy(new enemy1(this.myroot,0,150,20,0));
			this.addEnemy(new enemy1(this.myroot,0,200,0,0));
			this.addEnemy(new enemy1(this.myroot,0,250,10,0));
			this.addEnemy(new enemy1(this.myroot,0,300,20,0));
			this.addEnemy(new enemy1(this.myroot,0,350,30,0));
			this.addEnemy(new enemy1(this.myroot,0,400,30,0));
			this.addEnemy(new enemy1(this.myroot,0,450,25,0));
			// reihe 2
			this.addEnemy(new enemy1(this.myroot,0,70,70,0));
			this.addEnemy(new enemy1(this.myroot,0,120,60,0));
			this.addEnemy(new enemy1(this.myroot,0,180,80,0));
			this.addEnemy(new enemy1(this.myroot,0,220,70,0));
			this.addEnemy(new enemy1(this.myroot,0,270,90,0));
			this.addEnemy(new enemy1(this.myroot,0,320,80,0));
			this.addEnemy(new enemy1(this.myroot,0,360,70,0));
			this.addEnemy(new enemy1(this.myroot,0,420,70,0));
			this.addEnemy(new enemy1(this.myroot,0,460,70,0));
			// reihe 3
			this.addEnemy(new enemy1(this.myroot,0,50,150,0));
			this.addEnemy(new enemy1(this.myroot,0,100,150,0));
			this.addEnemy(new enemy1(this.myroot,0,140,150,0));
			this.addEnemy(new enemy1(this.myroot,0,200,140,0));
			this.addEnemy(new enemy1(this.myroot,0,250,160,0));
			this.addEnemy(new enemy1(this.myroot,0,310,160,0));
			this.addEnemy(new enemy1(this.myroot,0,350,170,0));
			this.addEnemy(new enemy1(this.myroot,0,400,160,0));
			this.addEnemy(new enemy1(this.myroot,0,450,155,0));
			// reihe 4
			this.addEnemy(new enemy1(this.myroot,0,60,210,0));
			this.addEnemy(new enemy1(this.myroot,0,110,200,0));
			this.addEnemy(new enemy1(this.myroot,0,160,210,0));
			this.addEnemy(new enemy1(this.myroot,0,210,210,0));
			this.addEnemy(new enemy1(this.myroot,0,260,220,0));
			this.addEnemy(new enemy1(this.myroot,0,300,200,0));
			this.addEnemy(new enemy1(this.myroot,0,340,230,0));
			this.addEnemy(new enemy1(this.myroot,0,400,210,0));
			this.addEnemy(new enemy1(this.myroot,0,450,205,0));
			// reihe 5
			this.addEnemy(new enemy1(this.myroot,0,30,265,0));
			this.addEnemy(new enemy1(this.myroot,0,70,280,0));
			this.addEnemy(new enemy1(this.myroot,0,120,260,0));
			this.addEnemy(new enemy1(this.myroot,0,180,280,0));
			this.addEnemy(new enemy1(this.myroot,0,220,270,0));
			this.addEnemy(new enemy1(this.myroot,0,270,290,0));
			this.addEnemy(new enemy1(this.myroot,0,320,280,0));
			this.addEnemy(new enemy1(this.myroot,0,360,270,0));
			this.addEnemy(new enemy1(this.myroot,0,420,270,0));
			this.addEnemy(new enemy1(this.myroot,0,460,250,0));			
		}
		public function mission_16() {
			// schild1 fliegt vorbei
			this.myroot.schild1.gotoAndPlay(2);
			// schräg von beiden seiten DREIECK
			// links
			this.addEnemy(new enemy1(this.myroot,1,100,70,0));
			this.addEnemy(new enemy1(this.myroot,1,100,-20,0));		
			this.addEnemy(new enemy1(this.myroot,1,0,0,0));		
			// rechts
			this.addEnemy(new enemy1(this.myroot,2,500,20,0));
			this.addEnemy(new enemy1(this.myroot,2,420,0,0));		
			this.addEnemy(new enemy1(this.myroot,2,400,70,0));		
		}
		public function mission_17() {
			// DEBRIS 2
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrise2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(debrise2);
				this.myroot.enemies_array.push(debrise2);
			}
			// schräg von beiden seiten DREIECK
			// links
			this.addEnemy(new enemy1(this.myroot,1,100,70,0));
			this.addEnemy(new enemy1(this.myroot,1,100,-20,0));		
			this.addEnemy(new enemy1(this.myroot,1,0,0,0));		
			// rechts
			this.addEnemy(new enemy1(this.myroot,2,500,20,0));
			this.addEnemy(new enemy1(this.myroot,2,420,0,0));		
			this.addEnemy(new enemy1(this.myroot,2,400,70,0));		
		}
		public function mission_18() {
			// kleine mit anfuehrer
			this.addEnemy(new enemy1(this.myroot,0,150,0,0));
			this.addEnemy(new enemy1(this.myroot,0,100,50,0));		
			this.addEnemy(new enemy2(this.myroot,0,206,0,0));		
			this.addEnemy(new enemy1(this.myroot,0,300,0,0));
			this.addEnemy(new enemy1(this.myroot,0,350,50,0));		
		}
		/*
		public function mission_6() {
		// turret
		var e1:enemy1=new enemy1(this.myroot,5,100,100,0);
		this.myroot.enemies.addChild(e1);
		this.myroot.enemies_array.push(e1);
		}
		*/

		public function mission_19() {
			// von oben nach unten. lamer aliens.
			this.addEnemy(new enemy1(this.myroot,0,80,50,0));
			this.addEnemy(new enemy1(this.myroot,0,120,50,0));		
			this.addEnemy(new enemy1(this.myroot,0,160,50,0));		
			this.addEnemy(new enemy1(this.myroot,0,200,50,0));
			this.addEnemy(new enemy1(this.myroot,0,240,50,0));		
			this.addEnemy(new enemy1(this.myroot,0,280,50,0));	
			this.addEnemy(new enemy1(this.myroot,0,320,50,0));	
		}
		public function mission_20() {
			// DEBRIS 1
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrisse2:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(debrisse2);
				this.myroot.enemies_array.push(debrisse2);
			}
			this.addEnemy(new enemy1(this.myroot,0,100,0,50));
			this.addEnemy(new enemy1(this.myroot,0,200,50,50));		
			this.addEnemy(new enemy1(this.myroot,0,300,100,50));		
			this.addEnemy(new enemy1(this.myroot,0,400,150,50));					

			this.addEnemy(new enemy1(this.myroot,0,100,100,50));
			this.addEnemy(new enemy1(this.myroot,0,200,150,50));		
			this.addEnemy(new enemy1(this.myroot,0,300,200,50));		
			this.addEnemy(new enemy1(this.myroot,0,400,250,50));					
			
			this.addEnemy(new enemy1(this.myroot,0,100,200,50));
			this.addEnemy(new enemy1(this.myroot,0,200,250,50));		
			this.addEnemy(new enemy1(this.myroot,0,300,300,50));		
			this.addEnemy(new enemy1(this.myroot,0,400,350,50));		

			this.addEnemy(new enemy1(this.myroot,0,100,300,50));
			this.addEnemy(new enemy1(this.myroot,0,200,350,50));		
			this.addEnemy(new enemy1(this.myroot,0,300,400,50));		
			this.addEnemy(new enemy1(this.myroot,0,400,450,50));				
		}
		public function mission_21() {

			// DEBRIS 2
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrise2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(debrise2);
				this.myroot.enemies_array.push(debrise2);
			}
			// SPEAR
			this.addEnemy(new enemy1(this.myroot,0,50,150,50));
			this.addEnemy(new enemy1(this.myroot,0,100,100,50));		
			this.addEnemy(new enemy1(this.myroot,0,150,50,50));		
			this.addEnemy(new enemy1(this.myroot,0,200,0,50));		
			this.addEnemy(new enemy1(this.myroot,0,250,50,50));		
			this.addEnemy(new enemy1(this.myroot,0,300,100,50));		
			this.addEnemy(new enemy1(this.myroot,0,350,150,50));		
		}
		public function mission_22() {
			// doppelreihe von oben nach unten - schraeg.
			//reihe 1
			this.addEnemy(new enemy1(this.myroot,0,-100,-350,0));
			this.addEnemy(new enemy1(this.myroot,0,60,50,0));		
			this.addEnemy(new enemy1(this.myroot,0,100,100,0));		
			this.addEnemy(new enemy1(this.myroot,0,140,150,0));		
			this.addEnemy(new enemy1(this.myroot,0,180,200,0));		
			this.addEnemy(new enemy1(this.myroot,0,220,250,0));		
			this.addEnemy(new enemy1(this.myroot,0,260,300,0));		
			this.addEnemy(new enemy1(this.myroot,0,300,350,0));						
			this.addEnemy(new enemy1(this.myroot,0,340,400,0));	
			this.addEnemy(new enemy1(this.myroot,0,380,450,0));	
			//reihe 2
			this.addEnemy(new enemy1(this.myroot,0,300,450,0));
			this.addEnemy(new enemy1(this.myroot,0,60,150,0));		
			this.addEnemy(new enemy1(this.myroot,0,100,200,0));		
			this.addEnemy(new enemy1(this.myroot,0,140,250,0));		
			this.addEnemy(new enemy1(this.myroot,0,180,300,0));		
			this.addEnemy(new enemy1(this.myroot,0,220,350,0));		
			this.addEnemy(new enemy1(this.myroot,0,260,400,0));		
			this.addEnemy(new enemy1(this.myroot,0,340,500,0));						
			this.addEnemy(new enemy1(this.myroot,0,380,550,0));									
		}
		public function mission_23() {
			// DEBRIS 1
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var e2:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
			}
			// rein zischer
			this.addEnemy(new enemy1(this.myroot,13,50,0,0));
			this.addEnemy(new enemy1(this.myroot,13,100,50,0));		
			this.addEnemy(new enemy1(this.myroot,13,150,100,0));		
			this.addEnemy(new enemy1(this.myroot,13,250,150,0));		
			this.addEnemy(new enemy1(this.myroot,13,250,200,0));		
			this.addEnemy(new enemy1(this.myroot,13,350,250,0));		
			this.addEnemy(new enemy1(this.myroot,13,450,300,0));		
			this.addEnemy(new enemy1(this.myroot,13,550,350,0));		
		}
		public function mission_24() {
			// rudel
			this.addEnemy(new enemy2(this.myroot,14,50,0,0));		
			this.addEnemy(new enemy1(this.myroot,0,50,140,0));		
			this.addEnemy(new enemy1(this.myroot,0,70,240,0));	
			// zwischen flyer
			this.addEnemy(new enemy3(this.myroot,1,100,80,0));		
			this.addEnemy(new enemy3(this.myroot,1,60,40,0));		
			this.addEnemy(new enemy3(this.myroot,1,0,0,0));				
			this.addEnemy(new enemy3(this.myroot,2,400,250,0));		
			this.addEnemy(new enemy3(this.myroot,2,450,210,0));		
			this.addEnemy(new enemy3(this.myroot,2,500,180,0));	
			// zwischen flyer 2
			this.addEnemy(new enemy3(this.myroot,0,100,200,0));		
			this.addEnemy(new enemy3(this.myroot,0,60,240,0));		
			this.addEnemy(new enemy3(this.myroot,0,0,220,0));				
			this.addEnemy(new enemy3(this.myroot,0,200,500,0));		
			this.addEnemy(new enemy3(this.myroot,0,250,480,0));		
			this.addEnemy(new enemy3(this.myroot,0,300,500,0));
			
			this.addEnemy(new enemy1(this.myroot,0,400,70,0));		
			this.addEnemy(new enemy1(this.myroot,0,20,120,0));		
			this.addEnemy(new enemy1(this.myroot,0,310,200,0));				
			this.addEnemy(new enemy3(this.myroot,1,350,280,0));	
		}
		public function mission_25() {

			// DEBRIS 1
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrise2:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(debrise2);
				this.myroot.enemies_array.push(debrise2);
			}
			// SPACE INVADERs
			// reihe 1
			this.addEnemy(new enemy1(this.myroot,8,50,40,0));
			this.addEnemy(new enemy1(this.myroot,8,100,40,0));		
			this.addEnemy(new enemy1(this.myroot,8,150,40,0));		
			this.addEnemy(new enemy1(this.myroot,8,200,40,0));		
			this.addEnemy(new enemy1(this.myroot,8,250,40,0));		
			this.addEnemy(new enemy1(this.myroot,8,300,40,0));		
			this.addEnemy(new enemy1(this.myroot,8,350,40,0));	
			// reihe 2
			this.addEnemy(new enemy1(this.myroot,8,50,100,0));
			this.addEnemy(new enemy1(this.myroot,8,100,100,0));		
			this.addEnemy(new enemy1(this.myroot,8,150,100,0));		
			this.addEnemy(new enemy1(this.myroot,8,200,100,0));		
			this.addEnemy(new enemy1(this.myroot,8,250,100,0));		
			this.addEnemy(new enemy1(this.myroot,8,300,100,0));		
			this.addEnemy(new enemy1(this.myroot,8,350,100,0));
			// reihe 3
			this.addEnemy(new enemy1(this.myroot,8,50,160,0));
			this.addEnemy(new enemy1(this.myroot,8,100,160,0));		
			this.addEnemy(new enemy1(this.myroot,8,150,160,0));		
			this.addEnemy(new enemy1(this.myroot,8,200,160,0));		
			this.addEnemy(new enemy1(this.myroot,8,250,160,0));		
			this.addEnemy(new enemy1(this.myroot,8,300,160,0));		
			this.addEnemy(new enemy1(this.myroot,8,350,160,0));		
		}
		public function mission_26() {
			this.addEnemy(new enemy1(this.myroot,6,50,40,300));					
			this.addEnemy(new enemy1(this.myroot,6,350,40,100));								
		}
		public function mission_27() {
			// DEBRIS 2
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrise2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(debrise2);
				this.myroot.enemies_array.push(debrise2);
			}
			// zick zack crew
			this.addEnemy(new enemy1(this.myroot,23,250,0,20));
			this.addEnemy(new enemy1(this.myroot,23,150,50,30));		
			this.addEnemy(new enemy1(this.myroot,23,300,50,40));		
			this.addEnemy(new enemy1(this.myroot,23,300,200,35));		
			this.addEnemy(new enemy1(this.myroot,23,230,200,35));	
		}
		public function mission_28() {
			// DEBRIS 1
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var debrise2:debris1=new debris1(this.myroot,0);
				this.myroot.enemies.addChild(debrise2);
				this.myroot.enemies_array.push(debrise2);
			}
			this.addEnemy(new enemy0(this.myroot,23,105,50,35));
			this.addEnemy(new enemy0(this.myroot,23,200,0,35));		
			this.addEnemy(new enemy0(this.myroot,23,300,65,40));		
		}
		public function mission_29() {
			// DEBRIS 2
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var e2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
			}
		}
		public function mission_30() {
		}
		public function mission_31() {
			// BOSS Name
			this.myroot.boss_music();
			this.myroot.name_boss1.visible=true;
			this.myroot.name_boss1.gotoAndPlay(1);
			
			// BOSS MUSIC INTRO starts
			// BOSS MUSIC LOOP starts
			// DEBRIS 2
			var da2:int=Math.floor(2+Math.random()*8);
			for (var i:int=0; i < da2; i++) {
				var e2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
			}
			var e1:boss1=new boss1(this.myroot);
			this.myroot.enemies.addChild(e1);
			this.myroot.enemies_array.push(e1);
			this.myroot.bosshealth.visible=true;
			this.myroot.bossmode=true;
			//this.myroot.bosshealth.scaleX=this.myroot.boss1.maxhealth;
		}
		
		public function mission1_end() {
			this.myroot.bossmode=false;
			var da2:int=Math.floor(2+Math.random()*8);
			for (var j:int=0; j < da2; j++) {
				var e2:debris2=new debris2(this.myroot,0);
				this.myroot.enemies.addChild(e2);
				this.myroot.enemies_array.push(e2);
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