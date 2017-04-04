// SHIP
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class ship_as extends MovieClip {
		public var speed:Number;
		public var myroot:MovieClip;
		public var mc:MovieClip;
		public var health:Number=1000;
		public var pps:int=0;
		public var maxhealth:Number=1000;
		public function ship_as(root_p:MovieClip) {
			this.myroot=root_p;
			this.mc=this.myroot.ship_mc;
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				if(this.pps==1){
					this.mc.fire2.play();
					this.mc.fire1.play();
					this.mc.fire_side1.play();
					this.mc.fire_side2.play();
					this.pps=0;
				}
			}else{
				if(this.pps==0){
					this.mc.fire2.stop();
					this.mc.fire1.stop();
					this.mc.fire_side1.stop();
					this.mc.fire_side2.stop();
					this.pps=1;
				}
			}
			
			if (this.mc.x>275) {
				this.myroot.ua++;
			}
			if (this.mc.shield.currentFrame==25) {
				this.mc.shield.gotoAndStop(1);
			}
			//death animation of ship
			if (this.health<0 && this.myroot.death_ani.visible == false) {
				this.myroot.ship_mc.visible=false;
				this.myroot.death_ani.visible=true;
				this.myroot.health.scaleY=0;
				this.myroot.death_ani.gotoAndPlay(1);
				this.myroot.death_message.gotoAndPlay(1);
				this.myroot.death_ani.x=this.myroot.ship_mc.x;
				this.myroot.death_ani.y=this.myroot.ship_mc.y;
			}
			//death message to be shown
			if (this.health<0 && this.myroot.death_ani.visible == true && this.myroot.death_message.visible == false) {
				this.myroot.death_ani.visible=true;
				//show full screen death graphics
				this.myroot.death_message.visible=true;
				//show random text
				var death_msg_index = Math.floor(Math.random()*13+1);
				this.myroot.death_message.death_msg.gotoAndStop(death_msg_index);
				var continue_txt = "continues: " + this.myroot.game_continues.toString() + "";
				trace(continue_txt);
				this.myroot.death_message.game_continue.text = continue_txt;
				this.myroot.death_message.press_txt.gotoAndPlay(1);
			}
			if (this.mc.shield.currentFrame<=1) {
				for (var i:int=0; i<this.myroot.enemies_array.length; i++) {
					var target:MovieClip = this.myroot.enemies_array[i];
					if (target.hitTestObject(this.mc)) {
						for (var j:int=1; j<9; j++) {
							if (target.hitTestPoint(this.mc["h"+j].x+this.mc.x,this.mc["h"+j].y+this.mc.y,true)) {
								
								var bossname:String=target.name;
								if (bossname.charAt(0)!="b") {
									target.kill(400);
								}
								if (bossname.charAt(0)!="d" && bossname.charAt(0)!="o") {
									var ex1:explosion=new explosion(this.myroot,target.x,target.y);
									this.health-=80;
									if (health > 1000) {
										this.myroot.health2.health.gotoAndPlay(2);
									}
									else {
										this.myroot.health.gotoAndPlay(2);
									}
								}
								
								if (maxhealth==2000) {
									if (health>=1000) {
										this.myroot.health.scaleY=1;
										this.myroot.health2.health.scaleY=(this.health-1000)/1000;
									} else {
										this.myroot.health.scaleY=this.health/(this.maxhealth/2);
										if(this.health<=0){
											this.myroot.health.scaleY=0;
										}
										this.myroot.health2.health.scaleY=0;
										}
								} else {
									this.myroot.health.scaleY=this.health/this.maxhealth;
									
								}
								this.mc.shield.gotoAndPlay(2);
								this.myroot.broken_f(0);
							}
						}
					}
				}
			}
		}
	}
}