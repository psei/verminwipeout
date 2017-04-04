// VERMIN LANGUAGE AS
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	public class vermin_briefing_as extends MovieClip {
		public var myroot:MovieClip;
		public var td:int;
		
		public function vermin_briefing_as(root_p:MovieClip) {
			this.myroot=root_p;
			
			this.myroot.vermin_briefing.btn_next.buttonMode = true;						
			this.myroot.vermin_briefing.btn_next.addEventListener(MouseEvent.MOUSE_DOWN,this.next_down);
			this.myroot.vermin_briefing.btn_next.addEventListener(MouseEvent.MOUSE_OVER,this.next_over);
			this.myroot.vermin_briefing.btn_next.addEventListener(MouseEvent.MOUSE_OUT, this.next_out);
			
			this.myroot.vermin_briefing.btn_back.buttonMode = true;						
			this.myroot.vermin_briefing.btn_back.addEventListener(MouseEvent.MOUSE_DOWN,this.back_down);
			this.myroot.vermin_briefing.btn_back.addEventListener(MouseEvent.MOUSE_OVER,this.back_over);
			this.myroot.vermin_briefing.btn_back.addEventListener(MouseEvent.MOUSE_OUT, this.back_out);
			
			this.myroot.vermin_briefing.th.visible=false;
			
			this.myroot.vermin_briefing.tu.buttonMode=true;
			this.myroot.vermin_briefing.tu.addEventListener(MouseEvent.MOUSE_DOWN,this.tu_down);
			this.myroot.vermin_briefing.tu.addEventListener(MouseEvent.MOUSE_OVER,this.tu_over);
			this.myroot.vermin_briefing.tu.addEventListener(MouseEvent.MOUSE_OUT,this.tu_out);
			
			this.myroot.vermin_briefing.td.buttonMode=true;
			this.myroot.vermin_briefing.td.addEventListener(MouseEvent.MOUSE_DOWN,this.td_down);
			this.myroot.vermin_briefing.td.addEventListener(MouseEvent.MOUSE_OVER,this.td_over);
			this.myroot.vermin_briefing.td.addEventListener(MouseEvent.MOUSE_OUT,this.td_out);
			
			this.myroot.trader.addEventListener(Event.ENTER_FRAME,this.toef);
		}
		
		public function showStage(stageNr:int) {
			
			this.myroot.vermin_briefing.visible = true;
			this.myroot.stage.addEventListener(KeyboardEvent.KEY_UP,this.keyup);
			
			for (var i:int=1; i<=6; i++) {
				//unfinished level
				if (i > stageNr) {
					this.myroot.vermin_briefing.worldmap["world_s" + i].gotoAndStop(1);
				}
				//finished level
				if (i < stageNr) {
					this.myroot.vermin_briefing.worldmap["world_s" + i].gotoAndStop(2);
				}
				//next level
				if (i == stageNr) {
					this.myroot.vermin_briefing.worldmap["world_s" + i].gotoAndStop(3);
				}
			}
			
			this.myroot.vermin_briefing.worldmap.gotoAndPlay("STAGE_"+stageNr);
			this.myroot.vermin_briefing.worldmap.system.gotoAndStop(stageNr);
			this.myroot.vermin_briefing.planets.gotoAndStop(stageNr);
			this.myroot.vermin_briefing.txt.text = this.myroot.langs[this.myroot.chl]["t_3_"+stageNr];
		}
		
		
		public function keyup(event:KeyboardEvent) {
			//enter
			if (event.keyCode == 13) {
				this.next_down(new MouseEvent(MouseEvent.CLICK));
			}			
		}
		
		public function next_down(event:MouseEvent) {
			this.myroot.stage.removeEventListener(KeyboardEvent.KEY_UP,this.keyup);
			this.myroot.vermin_briefing.btn_next.gotoAndStop(3);
			this.myroot.vermin_briefing.visible = false;
						
			if (this.myroot.mission_nr == 0) {
				this.myroot.new_game();	
			}
			else {					
				this.myroot.weapons_oo();
				this.myroot.nextlevel();
				if (this.myroot.mission_nr==2) {
					this.myroot.station1.visible=true;
					this.myroot.station1.gotoAndPlay(409);
				} else if (this.myroot.mission_nr==3) {
					this.myroot.station2.visible=true;
					this.myroot.station2.gotoAndPlay(407);
				} else if (this.myroot.mission_nr==4) {
					this.myroot.station3.visible=true;
					this.myroot.station3.gotoAndPlay(407);
				} else if (this.myroot.mission_nr==5) {
					this.myroot.station4.visible=true;
					this.myroot.station4.gotoAndPlay(407);
				} else if (this.myroot.mission_nr==6) {
					this.myroot.station5.visible=true;
					this.myroot.station5.gotoAndPlay(407);
				} else if (this.myroot.mission_nr==7) {
					this.myroot.station6.visible=true;
					this.myroot.station6.gotoAndPlay(411);
				}
				this.myroot.twf.visible=false;
			}
			this.myroot.SoundEffect("menu");
		}
		public function next_over(event:MouseEvent) {
			this.myroot.vermin_briefing.btn_next.gotoAndStop(2);
		}
		public function next_out(event:MouseEvent) {
			this.myroot.vermin_briefing.btn_next.gotoAndStop(1);
		}
		
		public function back_down(event:MouseEvent) {
			this.myroot.stage.removeEventListener(KeyboardEvent.KEY_UP,this.keyup);
			this.myroot.vermin_briefing.btn_back.gotoAndStop(1);
			this.myroot.vermin_briefing.visible = false;
			if (this.myroot.mission_nr == 0) {
				this.myroot.vermin_menu.visible = true;
				this.myroot.start_as.addEventListener(Event.ENTER_FRAME,this.myroot.start_as.oef);
				this.myroot.menu_bg.visible=true
			}
			else {
				this.myroot.trader.visible = true;
			}
			this.myroot.SoundEffect("menu");
		}
		public function back_over(event:MouseEvent) {
			this.myroot.vermin_briefing.btn_back.gotoAndStop(2);
		}
		public function back_out(event:MouseEvent) {
			this.myroot.vermin_briefing.btn_back.gotoAndStop(1);
		}
		
		
		public function tu_down(event:MouseEvent) {
			this.myroot.vermin_briefing.tu.gotoAndStop(3);
		}
		public function tu_over(event:MouseEvent) {
					if(this.myroot.vermin_briefing.txt.textHeight>80){
				this.td=1;				
			}
			this.myroot.stage.addEventListener(MouseEvent.MOUSE_UP,this.mu);
			this.myroot.vermin_briefing.tu.gotoAndStop(2);
		}		
		public function tu_out(event:MouseEvent) {
			this.myroot.vermin_briefing.tu.gotoAndStop(1);
		}		
		
		
		public function td_down(event:MouseEvent) {
		}
		public function td_over(event:MouseEvent) {
			if(this.myroot.vermin_briefing.txt.textHeight>80){
				this.td=2;
			}
			this.myroot.stage.addEventListener(MouseEvent.MOUSE_UP,this.mu);
			this.myroot.vermin_briefing.td.gotoAndStop(2);
		}		
		public function td_out(event:MouseEvent) {
			this.myroot.vermin_briefing.td.gotoAndStop(1);
		}	
		
		
		public function mu(event:MouseEvent){
			this.td=0;
			this.myroot.stage.removeEventListener(MouseEvent.MOUSE_UP,this.mu);
		}
		public function toef(event:Event) {
			if(this.myroot.vermin_briefing.txt.textHeight>80){
				if(this.td==1){
					this.myroot.vermin_briefing.txt.y+=5;
					if(this.myroot.vermin_briefing.txt.y>325){
						this.myroot.vermin_briefing.txt.y=325;
					}
				}else if(this.td==2){
					this.myroot.vermin_briefing.txt.y-=5;
					if(this.myroot.vermin_briefing.txt.y<-this.myroot.vermin_briefing.txt.textHeight+80){
						this.myroot.vermin_briefing.txt.y=-this.myroot.vermin_briefing.txt.textHeight+80;
					}
				}
			}
		}
	}
}
