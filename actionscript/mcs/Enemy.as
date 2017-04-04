package mcs {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Enemy extends MovieClip {

		public var myroot:MovieClip;
		
		public var typ:int;
		public var sc:Number;
		public var t1:Number;
		public var xpos:Number;
		public var health:int;
		public var enr:int;
		public var pps:int=0;
		
		public var speed:Number;
		public var dead:int = 0;
		public var t:Number = 20;
		public var xdir:int = 1;
		public var counter:int = 0;
		public var score:int = 0;
		
		public var shooting_enemy = false;
		
		public var credits_array:Array=[0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300];
		
		public function Enemy(root_p:MovieClip, typ_p:int, xp: Number, yp:Number, t1_p:Number, health_p:Number,enr_p:int) {
			this.myroot = root_p;
			this.health = health_p;
			this.enr=enr_p;
			this.typ = typ_p;
			this.t1 = t1_p;
			this.sc = this.t1;
			this.x = xp;
			this.y = -100 - yp;
			this.xpos = this.x;
			if (this.typ == 1) this.rotation = -30;
			else if (this.typ == 2) this.rotation = +30;
			
			// schießende gegner
			if (this.typ >= 100) {
				this.typ-=100;
				this.shooting_enemy = true;
			}
			else {
				if (this.getChildByName("shoot_ani")) {
					MovieClip(this.getChildByName("shoot_ani")).visible = false;
				}
			}
		}
		public function en0(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en1(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en2(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en3(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en4(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en5(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en6(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en600(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
					MovieClip(this.getChildByName("ani4")).stop();
					MovieClip(this.getChildByName("ani5")).stop();
					MovieClip(this.getChildByName("ani6")).stop();
					MovieClip(this.getChildByName("ani7")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
					MovieClip(this.getChildByName("ani4")).play();
					MovieClip(this.getChildByName("ani5")).play();
					MovieClip(this.getChildByName("ani6")).play();
					MovieClip(this.getChildByName("ani7")).play();
				}
			}
		}
		public function en7(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en8(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
					MovieClip(this.getChildByName("ani4")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
					MovieClip(this.getChildByName("ani4")).play();
				}
			}
		}
		public function en9(nr:int) {
			if(nr==0){				
				this.stop();
			}else{
				//if(this.currentFrame<54){
					this.play();
				//}
			}
		}
		public function en10(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en11(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en12(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani1")).ani1.stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani1")).ani1.play();
				}
			}
		}
		public function en13(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani1")).ani1.stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani1")).ani1.play();
				}
			}
		}
		public function en14(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani1")).ani1.stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani1")).ani1.play();
				}
			}
		}
		public function en15(nr:int) {
			if(nr==0){				
				if(this.currentFrame<21){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
					MovieClip(this.getChildByName("ani4")).stop();
					MovieClip(this.getChildByName("ani5")).stop();
					MovieClip(this.getChildByName("ani6")).stop();
				}else if(this.currentFrame>20){
					this.stop();
				}
			}else{				
				if(this.currentFrame>20){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
					MovieClip(this.getChildByName("ani4")).play();
					MovieClip(this.getChildByName("ani5")).play();
					MovieClip(this.getChildByName("ani6")).play();
				}
			}
		}
		public function en16(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
					MovieClip(this.getChildByName("ani4")).stop();
					MovieClip(this.getChildByName("ani5")).stop();
					MovieClip(this.getChildByName("ani6")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
					MovieClip(this.getChildByName("ani4")).play();
					MovieClip(this.getChildByName("ani5")).play();
					MovieClip(this.getChildByName("ani6")).play();
				}
			}
		}
		public function en17(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en18(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en19(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en20(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en21(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en22(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en23(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en24(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en25(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
				}
			}
		}
		public function en26(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en27(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en28(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en29(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
				}
			}
		}
		public function en30(nr:int) {
			if(nr==0){				
				if(this.currentFrame==1){
					MovieClip(this.getChildByName("ani1")).stop();
					MovieClip(this.getChildByName("ani2")).stop();
					MovieClip(this.getChildByName("ani3")).stop();
				}else if(this.currentFrame>1){
					this.stop();
				}
			}else{				
				if(this.currentFrame>1){
					this.play();
				}else{
					MovieClip(this.getChildByName("ani1")).play();
					MovieClip(this.getChildByName("ani2")).play();
					MovieClip(this.getChildByName("ani3")).play();
				}
			}
		}
		public function en400(nr:int) {
		}
		public function oef(event:Event) {
						
			if (this.myroot.gp==0) {
						
				if (this.shooting_enemy) {
					// open enemy to perform shoot
					if (this.y > 10 && this.currentFrame == 1 && MovieClip(this.getChildByName("shoot_ani")).currentFrame == 1) {
						MovieClip(this.getChildByName("standard_ani")).visible = false;
						MovieClip(this.getChildByName("shoot_ani")).visible = true;
						MovieClip(this.getChildByName("shoot_ani")).gotoAndPlay(2);
					}
					//do the shooting
					if (this.y > 10 && this.currentFrame == 1 && MovieClip(this.getChildByName("shoot_ani")).currentFrame == 19) {
						var myshot1:enemy_shot=new enemy_shot(this.myroot);
						this.myroot.shots.addChild(myshot1);
						this.myroot.enemies_array.push(myshot1);
						myshot1.visible=true;
						myshot1.x=this.x;
						myshot1.y=this.y;
					}
				}
				
				if(this.pps==1){
					this["en"+this.enr](1);
					this.pps=0;
				}				
				if (this.dead == 0) {					
					this.counter++;
					if (this.typ == 0) {
						// standard
						this.y+= 6;
					} else if (this.typ == 1) {
						// rotation
						this.y+= 6;
						this.x+= 4;
					} else if (this.typ == 2) {
						this.y+= 6;
						this.x-= 4;
					} else if (this.typ == 3) {
						this.sc+= 0.1;
						this.y+= 6;
						this.x=this.xpos + Math.sin(this.sc) * 100;
					} else if (this.typ == 4) {
						this.sc+= 0.1;
						this.y+= 6;
						this.x=this.xpos + Math.cos(this.sc) * 100;
					} else if (this.typ == 5) {
						// turret
						this.y+= 3;
					} else if (this.typ == 6) {
						// up and down
						if (this.xdir == 1) {
	
							this.y+= 7;
						} else {
							this.y-= 3;
						}
						if (this.counter % 50 == 0) {
							this.xdir*= -1;
						}
					} else if (this.typ == 7) {
						// FAST
						this.y+= 14;
					} else if (this.typ == 8) {
						// SPACE INVADER
						this.y+= 3.8;
						if (this.y > 50 && this.y < 100) {
							if (this.x < this.xpos + 50) {
								this.x+= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 100 && this.y < 150) {
							if (this.x < this.xpos + 50) {
								this.x+= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 150 && this.y < 200) {
							if (this.x < this.xpos + 50) {
								this.x+= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 200 && this.y < 250) {
							if (this.x < this.xpos + 50) {
								this.x+= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 250 && this.y < 300) {
							if (this.x > this.xpos) {
								this.x-= 6;
							} else {
								this.x=this.xpos;
							}
						} else if (this.y > 300 && this.y < 350) {
							if (this.x < this.xpos + 50) {
								this.x+= 6;
							} else {
								this.x=this.xpos + 50;
							}
						}
					} else if (this.typ == 9) {
						// go into the middle from left side
						if (this.x < 220) {
							this.x+= 5;
						} else {
							this.y+= 7;
						}
					} else if (this.typ == 10) {
						// go into the middle from right side
						if (this.x > 220) {
							this.x-= 5;
						} else {
							this.y+= 7;
						}
					} else if (this.typ == 11) {
						// abbremsen
						this.y+= 7;
						if (this.y > 0) {
							if (this.x < this.t1 - 0.5) {
								this.x+= this.t1 - this.x / 20;
							} else {
								this.x=this.t1;
							}
						}
					} else if (this.typ == 12) {
						// abbremsen2
						this.y+= 7;
						if (this.y > 0) {
							if (this.x > this.t1 + 0.5) {
								this.x+= this.t1 - this.x / 20;
							} else {
								this.x=this.t1;
							}
						}
					} else if (this.typ == 13) {
						this.y+= 7;
						if (this.y > 0) {
							if (this.x > this.t1 + 0.5) {
								this.x+= this.t1 - this.x / 20;
							} else {
								this.x=this.t1;
							}
						}
					} else if (this.typ == 14) {
						// cube
						if (this.xdir == 1) {
							this.y+= 7;
							//xdir = x-direction
						} else if (this.xdir == 2) {
							this.x+= 7;
						} else if (this.xdir == 3) {
							this.y-= 3;
						} else if (this.xdir == 4) {
							this.x-= 7;
						}
						if (this.counter % 40 == 0) {
							this.xdir+= 1;
							if (this.xdir == 5) {
								this.xdir=1;
							}
						}
					} else if (this.typ == 15) {
						// cube andersrum
						if (this.xdir == 1) {
							this.y+= 7;
						} else if (this.xdir == 2) {
							this.x-= 7;
						} else if (this.xdir == 3) {
							this.y-= 3;
						} else if (this.xdir == 4) {
							this.x+= 7;
						}
						if (this.counter % 25 == 0) {
							this.xdir+= 1;
							if (this.xdir == 5) {
								this.xdir=1;
							}
						}
					} else if (this.typ == 16) {
						// FAST 2
						this.y+= 11;
					} else if (this.typ == 17) {
						// FAST 3
						this.y+= 13;
					} else if (this.typ == 19) {
						// FAST 4
						this.y+= 8;
					} else if (this.typ == 20) {
						// zick zack
						this.y+= 4;
						if (this.y > 0 && this.y < 50) {
							if (this.x < this.xpos + 50) {
								this.x-= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 60 && this.y < 100) {
							if (this.x < this.xpos) {
								this.x+= 6;
							} else {
								this.x=this.xpos;
							}
						} else if (this.y > 110 && this.y < 150) {
							if (this.x < this.xpos + 50) {
								this.x-= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 160 && this.y < 200) {
							if (this.x < this.xpos) {
								this.x+= 6;
							} else {
								this.x=this.xpos;
							}
						} else if (this.y > 210 && this.y < 250) {
							if (this.x < this.xpos + 50) {
								this.x-= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 260 && this.y < 300) {
							if (this.x > this.xpos) {
								this.x+= 6;
							} else {
								this.x=this.xpos;
							}
						} else if (this.y > 310 && this.y < 350) {
							if (this.x < this.xpos + 50) {
								this.x-= 6;
							} else {
								this.x=this.xpos + 50;
							}
						} else if (this.y > 360 && this.y < 400) {
							if (this.x < this.xpos) {
								this.x+= 6;
							} else {
								this.x=this.xpos;
							}
						}
					} else if (this.typ == 21) {
						// nach unten und dann schraeg rechts
						this.y+= 8;
						if (this.y > 240) {
							this.typ=1;
						}
					} else if (this.typ == 22) {
						// nach unten und dann schraeg rechts
						this.y+= 6;
						if (this.y > 20) {
							this.typ=1;
						}
						if (this.y > 300) {
							this.typ=0;
						}
					} else if (this.typ == 23) {
						// ZICK ZACK _ nice
						this.y+= 6;
						this.x+= 5*this.xdir;
						if (this.x > this.xpos+this.t1 || this.x < this.xpos-this.t1) {
							this.xdir*=-1;
						}
					}
					if (this.y > 600 || this.x < -100 || this.x > 500) {
						this.myroot.enemies.removeChild(this);
						var remove_nr: int = this.myroot.enemies_array.indexOf(this);
						if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
						delete this;
					}
				} else {
					if (this.currentFrame == this.totalFrames) {
						this.myroot.enemies.removeChild(this);
						remove_nr = this.myroot.enemies_array.indexOf(this);
						if (remove_nr>-1) this.myroot.enemies_array.splice(remove_nr, 1);
						delete this;
					}
				}
			}else{
				if(this.pps==0){
					this["en"+this.enr](0);
					this.pps=1;
				}
				
			}
		}
		public function kill(minushealth:int) {
			if (this.dead == 0) {
				this.health-= minushealth;
				if (this.health < 0) {
					this.health=0;
				} else {
					MovieClip(this.getChildByName("first_blood")).play();
				}
				if (this.health == 0) {
					var distance:Number=this.myroot.ship_mc.y-this.y;
					if (distance<100 && distance>=0) {
						this.myroot.matsch_f();
					}
					this.myroot.kills++;
					this.myroot.credits_f(this.credits_array[this.enr]);
					this.gotoAndPlay(2);
					this.dead = 1;
				}
			}
		}
	}
}
