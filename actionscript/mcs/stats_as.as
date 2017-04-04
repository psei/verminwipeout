// STATS
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class stats_as extends MovieClip {
		public var myroot:MovieClip;
		public var clip:MovieClip;
		public var counter:int=0;
		public function stats_as(root_p:MovieClip,clip_p:MovieClip) {
			this.myroot=root_p;
			this.clip=clip_p;
			this.clip.btn_continue.buttonMode=true;
			this.clip.btn_continue.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_continue_down);
			this.clip.btn_continue.addEventListener(MouseEvent.MOUSE_OVER,this.btn_continue_over);
			this.clip.btn_continue.addEventListener(MouseEvent.MOUSE_OUT,this.btn_continue_out);
			
			// Achievement Icons (20)
			this.clip.a1.buttonMode=true;
			this.clip.a1.addEventListener(MouseEvent.MOUSE_DOWN,this.a1_down);
			this.clip.a1.addEventListener(MouseEvent.MOUSE_OVER,this.a1_over);
			this.clip.a1.addEventListener(MouseEvent.MOUSE_OUT,this.a1_out);
			this.clip.a2.buttonMode=true;
			this.clip.a2.addEventListener(MouseEvent.MOUSE_DOWN,this.a2_down);
			this.clip.a2.addEventListener(MouseEvent.MOUSE_OVER,this.a2_over);
			this.clip.a2.addEventListener(MouseEvent.MOUSE_OUT,this.a2_out);
			this.clip.a3.buttonMode=true;
			this.clip.a3.addEventListener(MouseEvent.MOUSE_DOWN,this.a3_down);
			this.clip.a3.addEventListener(MouseEvent.MOUSE_OVER,this.a3_over);
			this.clip.a3.addEventListener(MouseEvent.MOUSE_OUT,this.a3_out);
			this.clip.a4.buttonMode=true;
			this.clip.a4.addEventListener(MouseEvent.MOUSE_DOWN,this.a4_down);
			this.clip.a4.addEventListener(MouseEvent.MOUSE_OVER,this.a4_over);
			this.clip.a4.addEventListener(MouseEvent.MOUSE_OUT,this.a4_out);
			this.clip.a5.buttonMode=true;
			this.clip.a5.addEventListener(MouseEvent.MOUSE_DOWN,this.a5_down);
			this.clip.a5.addEventListener(MouseEvent.MOUSE_OVER,this.a5_over);
			this.clip.a5.addEventListener(MouseEvent.MOUSE_OUT,this.a5_out);			
			this.clip.a6.buttonMode=true;
			this.clip.a6.addEventListener(MouseEvent.MOUSE_DOWN,this.a6_down);
			this.clip.a6.addEventListener(MouseEvent.MOUSE_OVER,this.a6_over);
			this.clip.a6.addEventListener(MouseEvent.MOUSE_OUT,this.a6_out);
			this.clip.a7.buttonMode=true;
			this.clip.a7.addEventListener(MouseEvent.MOUSE_DOWN,this.a7_down);
			this.clip.a7.addEventListener(MouseEvent.MOUSE_OVER,this.a7_over);
			this.clip.a7.addEventListener(MouseEvent.MOUSE_OUT,this.a7_out);			
			this.clip.a8.buttonMode=true;
			this.clip.a8.addEventListener(MouseEvent.MOUSE_DOWN,this.a8_down);
			this.clip.a8.addEventListener(MouseEvent.MOUSE_OVER,this.a8_over);
			this.clip.a8.addEventListener(MouseEvent.MOUSE_OUT,this.a8_out);			
			this.clip.a9.buttonMode=true;
			this.clip.a9.addEventListener(MouseEvent.MOUSE_DOWN,this.a9_down);
			this.clip.a9.addEventListener(MouseEvent.MOUSE_OVER,this.a9_over);
			this.clip.a9.addEventListener(MouseEvent.MOUSE_OUT,this.a9_out);			
			this.clip.a10.buttonMode=true;
			this.clip.a10.addEventListener(MouseEvent.MOUSE_DOWN,this.a10_down);
			this.clip.a10.addEventListener(MouseEvent.MOUSE_OVER,this.a10_over);
			this.clip.a10.addEventListener(MouseEvent.MOUSE_OUT,this.a10_out);
			this.clip.a11.buttonMode=true;
			this.clip.a11.addEventListener(MouseEvent.MOUSE_DOWN,this.a11_down);
			this.clip.a11.addEventListener(MouseEvent.MOUSE_OVER,this.a11_over);
			this.clip.a11.addEventListener(MouseEvent.MOUSE_OUT,this.a11_out);
			this.clip.a12.buttonMode=true;
			this.clip.a12.addEventListener(MouseEvent.MOUSE_DOWN,this.a12_down);
			this.clip.a12.addEventListener(MouseEvent.MOUSE_OVER,this.a12_over);
			this.clip.a12.addEventListener(MouseEvent.MOUSE_OUT,this.a12_out);
			this.clip.a13.buttonMode=true;
			this.clip.a13.addEventListener(MouseEvent.MOUSE_DOWN,this.a13_down);
			this.clip.a13.addEventListener(MouseEvent.MOUSE_OVER,this.a13_over);
			this.clip.a13.addEventListener(MouseEvent.MOUSE_OUT,this.a13_out);
			this.clip.a14.buttonMode=true;
			this.clip.a14.addEventListener(MouseEvent.MOUSE_DOWN,this.a14_down);
			this.clip.a14.addEventListener(MouseEvent.MOUSE_OVER,this.a14_over);
			this.clip.a14.addEventListener(MouseEvent.MOUSE_OUT,this.a14_out);			
			this.clip.a15.buttonMode=true;
			this.clip.a15.addEventListener(MouseEvent.MOUSE_DOWN,this.a15_down);
			this.clip.a15.addEventListener(MouseEvent.MOUSE_OVER,this.a15_over);
			this.clip.a15.addEventListener(MouseEvent.MOUSE_OUT,this.a15_out);			
			this.clip.a16.buttonMode=true;
			this.clip.a16.addEventListener(MouseEvent.MOUSE_DOWN,this.a16_down);
			this.clip.a16.addEventListener(MouseEvent.MOUSE_OVER,this.a16_over);
			this.clip.a16.addEventListener(MouseEvent.MOUSE_OUT,this.a16_out);			
			this.clip.a17.buttonMode=true;
			this.clip.a17.addEventListener(MouseEvent.MOUSE_DOWN,this.a17_down);
			this.clip.a17.addEventListener(MouseEvent.MOUSE_OVER,this.a17_over);
			this.clip.a17.addEventListener(MouseEvent.MOUSE_OUT,this.a17_out);			
			this.clip.a18.buttonMode=true;
			this.clip.a18.addEventListener(MouseEvent.MOUSE_DOWN,this.a18_down);
			this.clip.a18.addEventListener(MouseEvent.MOUSE_OVER,this.a18_over);
			this.clip.a18.addEventListener(MouseEvent.MOUSE_OUT,this.a18_out);			
			this.clip.a19.buttonMode=true;
			this.clip.a19.addEventListener(MouseEvent.MOUSE_DOWN,this.a19_down);
			this.clip.a19.addEventListener(MouseEvent.MOUSE_OVER,this.a19_over);
			this.clip.a19.addEventListener(MouseEvent.MOUSE_OUT,this.a19_out);			
			this.clip.a20.buttonMode=true;
			this.clip.a20.addEventListener(MouseEvent.MOUSE_DOWN,this.a20_down);
			this.clip.a20.addEventListener(MouseEvent.MOUSE_OVER,this.a20_over);
			this.clip.a20.addEventListener(MouseEvent.MOUSE_OUT,this.a20_out);
		}
		public function oef(event:Event) {
			this.counter++;
			if (this.counter==430) {
				this.myroot.twf.visible=true;
				this.myroot.zustand=2;
				this.myroot.trader.visible=true;
				this.myroot.trader.traders.gotoAndStop(this.myroot.mission_nr);
				this.myroot.trader.traders["trader_rumor" + this.myroot.mission_nr].visible=true;
				this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_1_"+this.myroot.mission_nr];
				this.myroot.trader.traders.trader.gotoAndPlay(2);
				trace(this.myroot.trader.traders.trader_text.currentFrame)
				this.myroot.trader.traders.trader_text.gotoAndPlay(2);				
				this.myroot.trader_music();
				this.counter=0;
				
				var remove_nr: int = this.myroot.oefSubscribers.indexOf(this);
				if (remove_nr>-1) this.myroot.oefSubscribers.splice(remove_nr, 1);
			}
		}
		public function btn_continue_down(event:MouseEvent) {
			this.counter=0;
			this.clip.visible=false;
			this.myroot["mi"+this.myroot.mission_nr].stationEnterMainPlay();
			this.myroot.oefSubscribers.push(this);
		}
		public function btn_continue_over(event:MouseEvent) {
			if (this.clip.btn_continue.currentFrame==1) {
				this.clip.btn_continue.gotoAndStop(2);
			}
		}
		public function btn_continue_out(event:MouseEvent) {
			if (this.clip.btn_continue.currentFrame==2) {
				this.clip.btn_continue.gotoAndStop(1);
			}
		}
		
		// Achievement Icons
		public function a1_over(event:MouseEvent) {
			if (this.clip.a1.icon_select.currentFrame==1) {
				this.clip.a1.icon_select.gotoAndStop(2);
			}
		}
		public function a1_out(event:MouseEvent) {
			if (this.clip.a1.icon_select.currentFrame==2) {
				this.clip.a1.icon_select.gotoAndStop(1);
			}
		}
		public function a1_down(event:MouseEvent) {
			if (this.clip.a1.icon_select.currentFrame==1) {
				this.clip.a1.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a1"];
			this.clip.a1.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(1);
		}
		
		public function a2_over(event:MouseEvent) {
			if (this.clip.a2.icon_select.currentFrame==1) {
				this.clip.a2.icon_select.gotoAndStop(2);
			}
		}
		public function a2_out(event:MouseEvent) {
			if (this.clip.a2.icon_select.currentFrame==2) {
				this.clip.a2.icon_select.gotoAndStop(1);
			}
		}
		public function a2_down(event:MouseEvent) {
			if (this.clip.a2.icon_select.currentFrame==1) {
				this.clip.a2.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a2"];
			this.clip.a2.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(2);
		}
		
		public function a3_over(event:MouseEvent) {
			if (this.clip.a3.icon_select.currentFrame==1) {
				this.clip.a3.icon_select.gotoAndStop(2);
			}
		}
		public function a3_out(event:MouseEvent) {
			if (this.clip.a3.icon_select.currentFrame==2) {
				this.clip.a3.icon_select.gotoAndStop(1);
			}
		}
		public function a3_down(event:MouseEvent) {
			if (this.clip.a3.icon_select.currentFrame==1) {
				this.clip.a3.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a3"];
			this.clip.a3.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(3);
		}		
		
		public function a4_over(event:MouseEvent) {
			if (this.clip.a4.icon_select.currentFrame==1) {
				this.clip.a4.icon_select.gotoAndStop(2);
			}
		}
		public function a4_out(event:MouseEvent) {
			if (this.clip.a4.icon_select.currentFrame==2) {
				this.clip.a4.icon_select.gotoAndStop(1);
			}
		}
		public function a4_down(event:MouseEvent) {
			if (this.clip.a4.icon_select.currentFrame==1) {
				this.clip.a4.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a4"];
			this.clip.a4.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(4);			
		}
		
		public function a5_over(event:MouseEvent) {
			if (this.clip.a5.icon_select.currentFrame==1) {
				this.clip.a5.icon_select.gotoAndStop(2);
			}
		}
		public function a5_out(event:MouseEvent) {
			if (this.clip.a5.icon_select.currentFrame==2) {
				this.clip.a5.icon_select.gotoAndStop(1);
			}
		}
		public function a5_down(event:MouseEvent) {
			if (this.clip.a5.icon_select.currentFrame==1) {
				this.clip.a5.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a5"];
			this.clip.a5.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(5);
		}		
				
		public function a6_over(event:MouseEvent) {
			if (this.clip.a6.icon_select.currentFrame==1) {
				this.clip.a6.icon_select.gotoAndStop(2);
			}
		}
		public function a6_out(event:MouseEvent) {
			if (this.clip.a6.icon_select.currentFrame==2) {
				this.clip.a6.icon_select.gotoAndStop(1);
			}
		}
		public function a6_down(event:MouseEvent) {
			if (this.clip.a6.icon_select.currentFrame==1) {
				this.clip.a6.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a6"];
			this.clip.a6.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(6);
		}		
				
		public function a7_over(event:MouseEvent) {
			if (this.clip.a7.icon_select.currentFrame==1) {
				this.clip.a7.icon_select.gotoAndStop(2);
			}
		}
		public function a7_out(event:MouseEvent) {
			if (this.clip.a7.icon_select.currentFrame==2) {
				this.clip.a7.icon_select.gotoAndStop(1);
			}
		}
		public function a7_down(event:MouseEvent) {
			if (this.clip.a7.icon_select.currentFrame==1) {
				this.clip.a7.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a7"];
			this.clip.a7.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(7);
		}		
				
		public function a8_over(event:MouseEvent) {
			if (this.clip.a8.icon_select.currentFrame==1) {
				this.clip.a8.icon_select.gotoAndStop(2);
			}
		}
		public function a8_out(event:MouseEvent) {
			if (this.clip.a8.icon_select.currentFrame==2) {
				this.clip.a8.icon_select.gotoAndStop(1);
			}
		}
		public function a8_down(event:MouseEvent) {
			if (this.clip.a8.icon_select.currentFrame==1) {
				this.clip.a8.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a8"];
			this.clip.a8.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(8);
		}		
				
		public function a9_over(event:MouseEvent) {
			if (this.clip.a9.icon_select.currentFrame==1) {
				this.clip.a9.icon_select.gotoAndStop(2);
			}
		}
		public function a9_out(event:MouseEvent) {
			if (this.clip.a9.icon_select.currentFrame==2) {
				this.clip.a9.icon_select.gotoAndStop(1);
			}
		}
		public function a9_down(event:MouseEvent) {
			if (this.clip.a9.icon_select.currentFrame==1) {
				this.clip.a9.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a9"];
			this.clip.a9.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(9);
		}		
				
		public function a10_over(event:MouseEvent) {
			if (this.clip.a10.icon_select.currentFrame==1) {
				this.clip.a10.icon_select.gotoAndStop(2);
			}
		}
		public function a10_out(event:MouseEvent) {
			if (this.clip.a10.icon_select.currentFrame==2) {
				this.clip.a10.icon_select.gotoAndStop(1);
			}
		}
		public function a10_down(event:MouseEvent) {
			if (this.clip.a10.icon_select.currentFrame==1) {
				this.clip.a10.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a10"];
			this.clip.a10.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(10);
		}		
		
		
		
		public function a11_over(event:MouseEvent) {
			if (this.clip.a11.icon_select.currentFrame==1) {
				this.clip.a11.icon_select.gotoAndStop(2);
			}
		}
		public function a11_out(event:MouseEvent) {
			if (this.clip.a11.icon_select.currentFrame==2) {
				this.clip.a11.icon_select.gotoAndStop(1);
			}
		}
		public function a11_down(event:MouseEvent) {
			if (this.clip.a11.icon_select.currentFrame==1) {
				this.clip.a11.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a11"];
			this.clip.a11.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(11);
		}
		
		public function a12_over(event:MouseEvent) {
			if (this.clip.a2.icon_select.currentFrame==1) {
				this.clip.a12.icon_select.gotoAndStop(2);
			}
		}
		public function a12_out(event:MouseEvent) {
			if (this.clip.a12.icon_select.currentFrame==2) {
				this.clip.a12.icon_select.gotoAndStop(1);
			}
		}
		public function a12_down(event:MouseEvent) {
			if (this.clip.a12.icon_select.currentFrame==1) {
				this.clip.a12.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a12"];
			this.clip.a12.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(12);
		}
		
		public function a13_over(event:MouseEvent) {
			if (this.clip.a13.icon_select.currentFrame==1) {
				this.clip.a13.icon_select.gotoAndStop(2);
			}
		}
		public function a13_out(event:MouseEvent) {
			if (this.clip.a13.icon_select.currentFrame==2) {
				this.clip.a13.icon_select.gotoAndStop(1);
			}
		}
		public function a13_down(event:MouseEvent) {
			if (this.clip.a13.icon_select.currentFrame==1) {
				this.clip.a13.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a13"];
			this.clip.a13.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(13);
		}		
		
		public function a14_over(event:MouseEvent) {
			if (this.clip.a14.icon_select.currentFrame==1) {
				this.clip.a14.icon_select.gotoAndStop(2);
			}
		}
		public function a14_out(event:MouseEvent) {
			if (this.clip.a14.icon_select.currentFrame==2) {
				this.clip.a14.icon_select.gotoAndStop(1);
			}
		}
		public function a14_down(event:MouseEvent) {
			if (this.clip.a14.icon_select.currentFrame==1) {
				this.clip.a14.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a14"];
			this.clip.a14.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(14);			
		}
		
		public function a15_over(event:MouseEvent) {
			if (this.clip.a15.icon_select.currentFrame==1) {
				this.clip.a15.icon_select.gotoAndStop(2);
			}
		}
		public function a15_out(event:MouseEvent) {
			if (this.clip.a15.icon_select.currentFrame==2) {
				this.clip.a15.icon_select.gotoAndStop(1);
			}
		}
		public function a15_down(event:MouseEvent) {
			if (this.clip.a15.icon_select.currentFrame==1) {
				this.clip.a15.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a15"];
			this.clip.a15.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(15);
		}		
				
		public function a16_over(event:MouseEvent) {
			if (this.clip.a16.icon_select.currentFrame==1) {
				this.clip.a16.icon_select.gotoAndStop(2);
			}
		}
		public function a16_out(event:MouseEvent) {
			if (this.clip.a16.icon_select.currentFrame==2) {
				this.clip.a16.icon_select.gotoAndStop(1);
			}
		}
		public function a16_down(event:MouseEvent) {
			if (this.clip.a16.icon_select.currentFrame==1) {
				this.clip.a16.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a16"];
			this.clip.a16.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(16);
		}		
				
		public function a17_over(event:MouseEvent) {
			if (this.clip.a17.icon_select.currentFrame==1) {
				this.clip.a17.icon_select.gotoAndStop(2);
			}
		}
		public function a17_out(event:MouseEvent) {
			if (this.clip.a17.icon_select.currentFrame==2) {
				this.clip.a17.icon_select.gotoAndStop(1);
			}
		}
		public function a17_down(event:MouseEvent) {
			if (this.clip.a17.icon_select.currentFrame==1) {
				this.clip.a17.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a17"];
			this.clip.a17.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(17);
		}		
				
		public function a18_over(event:MouseEvent) {
			if (this.clip.a18.icon_select.currentFrame==1) {
				this.clip.a18.icon_select.gotoAndStop(2);
			}
		}
		public function a18_out(event:MouseEvent) {
			if (this.clip.a18.icon_select.currentFrame==2) {
				this.clip.a18.icon_select.gotoAndStop(1);
			}
		}
		public function a18_down(event:MouseEvent) {
			if (this.clip.a18.icon_select.currentFrame==1) {
				this.clip.a18.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a18"];
			this.clip.a18.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(18);
		}		
				
		public function a19_over(event:MouseEvent) {
			if (this.clip.a19.icon_select.currentFrame==1) {
				this.clip.a19.icon_select.gotoAndStop(2);
			}
		}
		public function a19_out(event:MouseEvent) {
			if (this.clip.a19.icon_select.currentFrame==2) {
				this.clip.a19.icon_select.gotoAndStop(1);
			}
		}
		public function a19_down(event:MouseEvent) {
			if (this.clip.a19.icon_select.currentFrame==1) {
				this.clip.a19.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a19"];
			this.clip.a19.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(19);
		}	
				
		public function a20_over(event:MouseEvent) {
			if (this.clip.a20.icon_select.currentFrame==1) {
				this.clip.a20.icon_select.gotoAndStop(2);
			}
		}
		public function a20_out(event:MouseEvent) {
			if (this.clip.a20.icon_select.currentFrame==2) {
				this.clip.a20.icon_select.gotoAndStop(1);
			}
		}
		public function a20_down(event:MouseEvent) {
			if (this.clip.a20.icon_select.currentFrame==1) {
				this.clip.a20.icon_select.gotoAndStop(2);
			}
			this.clip.stats_description.text=this.myroot.langs[this.myroot.chl]["a20"];
			this.clip.a20.icon_select.gotoAndStop(2);
			this.clip.stats_big.gotoAndStop(20);
		}		
		
		public function stats_check() {

			for(var j:int=0;j<20;j++){
				this.clip["a"+(j+1)].gotoAndStop(1);
			}
			
			
			this.clip.stats_kills.text=this.myroot.kills;
			this.clip.stats_shots.text=this.myroot.ss;

			var hitratio:Number=Math.floor(100*(this.myroot.sshit/this.myroot.ss));
			this.clip.stats_hitratio.text=hitratio+" ";
		
			if(this.myroot.ship.health<=50){
				this.clip.a1.gotoAndStop(2);
				this.myroot.acnt[0]++;
			}
			//check
			// achievement trigger freak
			if(this.myroot.p_d==1){
				this.clip.a4.gotoAndStop(2);
				this.myroot.acnt[3]++;
			}
			if(this.myroot.kills<=this.myroot.enemy_count*.05){
				this.clip.a3.gotoAndStop(2);
				this.myroot.acnt[2]++;
			}
			if(this.myroot.enemy_count*.95==this.myroot.kills){
				this.clip.a5.gotoAndStop(2);
				this.myroot.acnt[4]++;
			}
			if(this.myroot.ship.health==1000 || this.myroot.ship.health==2000){
				this.clip.a2.gotoAndStop(2);
				this.myroot.acnt[1]++;
			}
			// sshit = shooted shots hitted (verschossene schüsse, die getroffen haben)
			if(this.myroot.sshit>=this.myroot.ss*.8 && this.myroot.kills>=this.myroot.enemy_count*.8){
				this.clip.a6.gotoAndStop(2);
				this.myroot.acnt[5]++;
			}			
			if(this.myroot.total_kills>=1000){
				this.clip.a7.gotoAndStop(2);
				this.myroot.acnt[6]++;
			}
			if(this.myroot.total_kills>=5000){
				this.clip.a8.gotoAndStop(2);
				this.myroot.acnt[7]++;
			}
			if(this.myroot.matsched>=this.myroot.enemy_count*.8){
				this.clip.a10.gotoAndStop(2);
				this.myroot.acnt[9]++;
			}
			if(this.myroot.matsched==0 && this.myroot.kills>=this.myroot.enemy_count*.8){
				this.clip.a11.gotoAndStop(2);
				this.myroot.acnt[10]++;
			}
			if(this.myroot.no_shot2_fired==0){
				this.clip.a13.gotoAndStop(2);
				this.myroot.acnt[12]++;
			}
			if(this.myroot.credits>=100000){
				this.clip.a15.gotoAndStop(2);
				this.myroot.acnt[14]++;
			}
			var unr:int=0;
			//a16
			for(var l:int=0;l<this.myroot.weapons_available.length;l++){
				if(this.myroot.weapons_available[l]==1){
					unr++;
				}
			}
			if(unr==this.myroot.weapons_available.length){
				this.clip.a16.gotoAndStop(2);
				this.myroot.acnt[15]++;
			}
			//a17
			if((this.myroot.kills>=this.myroot.enemy_count*.8 && this.myroot.ship.health==1000 && this.myroot.matsched==0) || (this.myroot.kills>=this.myroot.enemy_count*.8 && this.myroot.ship.health==2000 && this.myroot.matsched==0)){
				this.clip.a17.gotoAndStop(2);
				this.myroot.acnt[16]++;
			}
			//a19
			if(this.myroot.mission_nr==7){
				this.clip.a19.gotoAndStop(2);
				this.myroot.acnt[18]++;
			}
			//a20
			var anr:int=0;
			for(var i:int=0;i<19;i++){
				if(this.myroot.acnt[i]>0){
					anr++;
				}
			}
			for(var k:int=0;k<19;k++){
				if(k!=6 && k!=7){
					this.clip["a"+(k+1)].achieveMulti.gotoAndStop(this.myroot.acnt[k]+1);
				}
			}
			if(anr==19){
				this.clip.a20.gotoAndStop(2);
				this.myroot.acnt[19]++;
			}

			
			/*if (this.myroot.total_matsch>10) {
				this.clip.achievements_mc.visible=false;
			}*/
		}
	}
}