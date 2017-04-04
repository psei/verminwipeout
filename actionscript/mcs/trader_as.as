// TRADER
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class trader_as extends MovieClip {
		public var myroot:MovieClip;
		public var clip:MovieClip;
		public var w:int=0;
		public var td:int=0;
		public var prices:Array=[1000,3000,10000,10000,10000,30000,250,500,1000,1000,200,10000];
		public var sell_prices:Array=[500,1500,5000,5000,5000,15000,120,250,500,500,100,5000];
		public function trader_as(root_p:MovieClip,clip_p:MovieClip) {
			
			this.w=0;
			
			this.myroot=root_p;
			
			//this.myroot.trader=clip_p;
			
			//this.trader.briefing.visible=true;
			//todo enable

			//this.myroot.trader.traders.gotoAndStop(this.myroot.mission_nr);
			this.myroot.trader.buy_price.text=""+this.prices[this.w]+"c";
			
			this.myroot.trader.sell_price.text=""+this.sell_prices[this.w]+"c";
			this.myroot.w1.w_selected.visible=true;
			for (var i:int=0; i<12; i++) {
				var btn:tw_as=new tw_as(this,this.myroot.trader,this.myroot.trader["w"+(i+1)],i);
			}
			
			this.myroot.trader.wexit.trans.buttonMode=true;
			this.myroot.trader.wexit.trans.addEventListener(MouseEvent.MOUSE_DOWN,this.wexit_down);
			this.myroot.trader.wexit.trans.addEventListener(MouseEvent.MOUSE_OVER,this.wexit_over);
			this.myroot.trader.wexit.trans.addEventListener(MouseEvent.MOUSE_OUT,this.wexit_out);
			
			this.myroot.trader.wbuy.buttonMode=true;
			this.myroot.trader.wbuy.addEventListener(MouseEvent.MOUSE_DOWN,this.wbuy_down);
			this.myroot.trader.wbuy.addEventListener(MouseEvent.MOUSE_OVER,this.wbuy_over);
			this.myroot.trader.wbuy.addEventListener(MouseEvent.MOUSE_OUT,this.wbuy_out);
			
			this.myroot.trader.wsell.buttonMode=true;
			this.myroot.trader.wsell.addEventListener(MouseEvent.MOUSE_DOWN,this.wsell_down);
			this.myroot.trader.wsell.addEventListener(MouseEvent.MOUSE_OVER,this.wsell_over);
			this.myroot.trader.wsell.addEventListener(MouseEvent.MOUSE_OUT,this.wsell_out);
			
			
			
			this.myroot.trader.th.visible=false;
			
			this.myroot.trader.tu.buttonMode=true;
			this.myroot.trader.tu.addEventListener(MouseEvent.MOUSE_DOWN,this.tu_down);
			this.myroot.trader.tu.addEventListener(MouseEvent.MOUSE_OVER,this.tu_over);
			this.myroot.trader.tu.addEventListener(MouseEvent.MOUSE_OUT,this.tu_out);
			
			this.myroot.trader.td.buttonMode=true;
			this.myroot.trader.td.addEventListener(MouseEvent.MOUSE_DOWN,this.td_down);
			this.myroot.trader.td.addEventListener(MouseEvent.MOUSE_OVER,this.td_over);
			this.myroot.trader.td.addEventListener(MouseEvent.MOUSE_OUT,this.td_out);
			
			this.myroot.trader.addEventListener(Event.ENTER_FRAME,this.toef);
			this.myroot.trader.stage.addEventListener(MouseEvent.MOUSE_UP,this.tup);
			
			
			
			// Trader Rumor
			for (i = 1; i < 7; i++ ) {
				this.myroot.trader.traders["trader_rumor" + i].visible=false;
				this.myroot.trader.traders["trader_rumor" + i].buttonMode=true;
				this.myroot.trader.traders["trader_rumor" + i].addEventListener(MouseEvent.MOUSE_DOWN,this.trader_rumor_down);
				this.myroot.trader.traders["trader_rumor" + i].addEventListener(MouseEvent.MOUSE_OVER,this.trader_rumor_over);
				this.myroot.trader.traders["trader_rumor" + i].addEventListener(MouseEvent.MOUSE_OUT,this.trader_rumor_out);
			}
			
		}
		
		public function trader_rumor_down(event:MouseEvent) {
			this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_8_"+(1+Math.floor(Math.random()*5))];			
		}
		public function trader_rumor_over(event:MouseEvent) {
			this.myroot.trader.traders.trader_name.gotoAndPlay(1);
		}
		public function trader_rumor_out(event:MouseEvent) {
			//this.myroot.trader.
		}
		
		public function tu_down(event:MouseEvent) {
			this.myroot.trader.gotoAndStop(3);
		}
		public function tu_over(event:MouseEvent) {
			if(this.myroot.trader.weapons.txt.txt.textHeight>80){
				this.td=1;				
			}
			this.myroot.trader.gotoAndStop(2);
		}
		public function tu_out(event:MouseEvent) {
			this.myroot.trader.gotoAndStop(1);
		}
		
		public function td_down(event:MouseEvent) {
			this.myroot.trader.gotoAndStop(3);
		}
		public function td_over(event:MouseEvent) {
			trace(this.myroot.trader.weapons.txt.txt.textHeight);
			if(this.myroot.trader.weapons.txt.txt.textHeight>80){
				this.td=2;
			}
			this.myroot.trader.gotoAndStop(2);
		}
		public function td_out(event:MouseEvent) {
			this.myroot.trader.gotoAndStop(1);
		}

		public function tup(event:MouseEvent) {
			this.td=0;
		}
		public function toef(event:Event) {
			if(this.myroot.trader.weapons.txt.txt.textHeight>80){
				if(this.td==1){
					this.myroot.trader.weapons.txt.txt.y+=5;
					if(this.myroot.trader.weapons.txt.txt.y>0){
						this.myroot.trader.weapons.txt.txt.y=0;
					}
				}else if(this.td==2){
					this.myroot.trader.weapons.txt.txt.y-=5;
					if(this.myroot.trader.weapons.txt.txt.y<-this.myroot.trader.weapons.txt.txt.textHeight+80){
						this.myroot.trader.weapons.txt.txt.y=-this.myroot.trader.weapons.txt.txt.textHeight+80;
					}
				}
			}
		}
		public function wsell_down(event:MouseEvent) {
			if (this.w<6) {
				if (this.myroot.weapons_available[this.w]==1) {
					if (this.w==0) {
						// SELL FAIL - no standard gun
						this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl].t_2_6_3;
					} else {
					this.myroot.weapons_available[this.w]=0;
					this.myroot.credits_f(this.sell_prices[this.w]);
					if (this.myroot.weapon1==this.w+1) {
						this.myroot.weapon1=0;
					}
					if (this.myroot.weapon2==this.w+1) {
						this.myroot.weapon2=0;
					}
					// SELL success
					this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_3_"+(1+Math.floor(Math.random()*5))];
					//this.myroot.trader.traders.trader_txt.gotoAndStop(30+Math.floor(Math.random()*5));
					}
				} else {
					// SELL FAIL 
					this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_5_"+(1+Math.floor(Math.random()*5))];
					//this.myroot.trader.traders.trader_txt.gotoAndStop(40+Math.floor(Math.random()*5));
				}
				this.myroot.weapons_oo();
				for (var i:int=0; i<10; i++) {
					this.myroot["w" + (i + 1)].w_selected.visible=false;
				}
			} else if (this.w<10) {
				if (this.myroot.weapons_available[this.w]==1) {
					if(this.w==6){
						if(this.myroot.w7ammo>=100){
							this.myroot.w7ammo-=100;
							this.myroot.credits_f(this.sell_prices[this.w]);
							// SELL success
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_3_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(30+Math.floor(Math.random()*5));
							if (this.myroot.w7ammo==0){
								this.myroot.weapons_available[this.w]=0;
							}
						} else {
							// SELL FAIL - i take only 100
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl].t_2_6_4;
							//this.myroot.trader.traders.trader_txt.gotoAndStop(60+Math.floor(Math.random()*5));
						}
						this.myroot.ammo_txt.text=this.myroot.w7ammo;
					} else if(this.w==7){
						if(this.myroot.w8ammo>=100){
							this.myroot.w8ammo-=100;
							this.myroot.credits_f(this.sell_prices[this.w]);
							// SELL success
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_3_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(30+Math.floor(Math.random()*5));
							if (this.myroot.w8ammo==0){
								this.myroot.weapons_available[this.w]=0;
								}
							}
							this.myroot.ammo_txt.text=this.myroot.w8ammo;
						} else if(this.w==8){
						if(this.myroot.w9ammo>=1){
							this.myroot.w9ammo-=1;
							this.myroot.credits_f(this.sell_prices[this.w]);
							// SELL success
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_3_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(30+Math.floor(Math.random()*5));
							if (this.myroot.w9ammo==0){
								this.myroot.weapons_available[this.w]=0;
								}
							}
							this.myroot.ammo_txt.text=""; //this.myroot.w9ammo;							
						} else if(this.w==9){
						if(this.myroot.w10ammo>=1){
							this.myroot.w10ammo-=1;
							this.myroot.credits_f(this.sell_prices[this.w]);
							// SELL success
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_3_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(30+Math.floor(Math.random()*5));
							if (this.myroot.w10ammo==0){
								this.myroot.weapons_available[this.w]=0;
								}
							}
							this.myroot.ammo_txt.text=this.myroot.w10ammo;
						}
				} else {
					// SELL FAIL you dont own this weapon
					this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_4_"+(1+Math.floor(Math.random()*5))];
					//this.myroot.trader.traders.trader_txt.gotoAndStop(40+Math.floor(Math.random()*5));
				}
				this.myroot.weapons_oo();
				for (var j:int=0; j<10; j++) {
					this.myroot["w" + (j + 1)].w_selected.visible=false;
				}
			} else {

			}
		}
		public function wsell_over(event:MouseEvent) {
			if (this.myroot.trader.wsell.currentFrame<3) {
				this.myroot.trader.wsell.gotoAndStop(2);
			}
		}
		public function wsell_out(event:MouseEvent) {
			if (this.myroot.trader.wsell.currentFrame<3) {
				this.myroot.trader.wsell.gotoAndStop(1);
			}
		}
		public function wexit_down(event:MouseEvent) {
			this.myroot.trader.visible=false;
			this.myroot.vermin_briefing.visible = true;
			this.myroot.briefing.showStage(this.myroot.mission_nr+1);
		}
		public function wexit_over(event:MouseEvent) {
			if (this.myroot.trader.wexit.currentFrame<3) {
				this.myroot.trader.wexit.gotoAndStop(2);
			}
		}
		public function wexit_out(event:MouseEvent) {
			if (this.myroot.trader.wexit.currentFrame<3) {
				this.myroot.trader.wexit.gotoAndStop(1);
			}
		}
		public function wbuy_down(event:MouseEvent) {
			//this.myroot.station.gotoAndPlay(407);
			// WAFFEN
			if (this.w<6) {
				if (this.myroot.weapons_available[this.w]==0) {
					if (this.myroot.credits<this.prices[this.w]) {
						// BUY FAIL not enough money
						//this.myroot.trader.traders.trader_txt.gotoAndStop(20+Math.floor(Math.random()*5));
						this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_2_"+(1+Math.floor(Math.random()*5))];
					} else {
						// BUY!
						//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
						this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
						this.myroot.weapons_available[this.w]=1;
						/*if (this.w==6) {
							this.myroot.w7ammo+=100;
							this.myroot.ammo_txt.text=this.myroot.w7ammo;
						} else if (this.w==7) {
							this.myroot.w8ammo+=100;
							this.myroot.ammo_txt.text=this.myroot.w8ammo;
						} else if (this.w==8) {
							if(this.myroot.w9ammo==0){
								this.myroot.w9ammo+=1;
								this.myroot.ammo_txt.text=""; //this.myroot.w9ammo;
							}
							
						} else if (this.w==9) {
							this.myroot.w10ammo+=1;
							this.myroot.ammo_txt.text=this.myroot.w10ammo;
						}*/
						this.myroot.credits_f(-this.prices[this.w]);
					}
				} else {
					// BUY FAIL - yuu allready own this weapon
					//this.myroot.trader.traders.trader_txt.gotoAndStop(50+Math.floor(Math.random()*5));
					this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_5_"+(1+Math.floor(Math.random()*5))];
				}
				this.myroot.weapons_oo();
				for (var i:int=0; i<10; i++) {
					this.myroot["w" + (i + 1)].w_selected.visible=false;
				}
			} else if (this.w<10) {
				if (this.myroot.credits<this.prices[this.w]) {
						// BUY FAIL not enough money
						//this.myroot.trader.traders.trader_txt.gotoAndStop(20+Math.floor(Math.random()*5));
						this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_2_"+(1+Math.floor(Math.random()*5))];
					} else {
						// BUY!
						
						this.myroot.weapons_available[this.w]=1;
						if (this.w==6) {
							this.myroot.w7ammo+=100;
							this.myroot.ammo_txt.text=this.myroot.w7ammo;
							this.myroot.credits_f(-this.prices[this.w]);
							//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
						} else if (this.w==7) {
							this.myroot.w8ammo+=100;
							this.myroot.ammo_txt.text=this.myroot.w8ammo;
							this.myroot.credits_f(-this.prices[this.w]);
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
						} else if (this.w==8) {
							if(this.myroot.w9ammo==0){
								this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
								//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
								this.myroot.credits_f(-this.prices[this.w]);
								this.myroot.w9ammo+=1;
								this.myroot.ammo_txt.text=""; //this.myroot.w9ammo;
							} else {
								this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_5_"+(1+Math.floor(Math.random()*5))];
								//this.myroot.trader.traders.trader_txt.gotoAndStop(50+Math.floor(Math.random()*5));
							}
						} else if (this.w==9) {
							this.myroot.credits_f(-this.prices[this.w]);
							this.myroot.w10ammo+=1;
							this.myroot.ammo_txt.text=this.myroot.w10ammo;
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
						}
						
					}
					this.myroot.weapons_oo();
						for (var j:int=0; j<10; j++) {
						this.myroot["w" + (j + 1)].w_selected.visible=false;
				}
			} else if (this.w==10) {
				if (this.myroot.credits<this.prices[this.w]) {
					// not enough money
					this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_2_"+(1+Math.floor(Math.random()*5))];
					//this.myroot.trader.traders.trader_txt.gotoAndStop(20+Math.floor(Math.random()*5));
				} else {
					// BUY!
					if (this.myroot.ship.maxhealth==1000) {
						if (this.myroot.ship.health != this.myroot.ship.maxhealth) {
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
							if (this.myroot.ship.health+200>=this.myroot.ship.maxhealth) {
								this.myroot.ship.health=this.myroot.ship.maxhealth;
							} else {
								this.myroot.ship.health+=200;
							}
							this.myroot.broken_f(1);
							this.myroot.health.scaleY=this.myroot.ship.health/this.myroot.ship.maxhealth;
							this.myroot.credits_f(-this.prices[this.w]);
						}
					} else {
						if (this.myroot.ship.health != this.myroot.ship.maxhealth) {
							this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
							//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
							if (this.myroot.ship.health+200>=this.myroot.ship.maxhealth) {
								this.myroot.ship.health=this.myroot.ship.maxhealth;
							} else {
								this.myroot.ship.health+=200;
							}
							this.myroot.broken_f(1);
							if (this.myroot.ship.health<=1000) {
								this.myroot.health.scaleY=this.myroot.ship.health/(this.myroot.ship.maxhealth/2);
								this.myroot.health2.health.scaleY=0;
							} else {
								this.myroot.health.scaleY=1;
								this.myroot.health2.health.scaleY=(this.myroot.ship.health-1000)/(this.myroot.ship.maxhealth/2);
							}
							this.myroot.credits_f(-this.prices[this.w]);
						}
					}
				}
			} else if (this.w==11) {
				if (this.myroot.ship.maxhealth!=2000) {
					if (this.myroot.credits<this.prices[this.w]) {
						// BUY FAIL not enough money
						this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_2_"+(1+Math.floor(Math.random()*5))];
						//this.myroot.trader.traders.trader_txt.gotoAndStop(20+Math.floor(Math.random()*5));
					} else {
						// buy shield2
						this.myroot.trader.traders.trader_txt.txt.text=this.myroot.langs[this.myroot.chl]["t_2_1_"+(1+Math.floor(Math.random()*5))];
						//this.myroot.trader.traders.trader_txt.gotoAndStop(10+Math.floor(Math.random()*5));
						this.myroot.health2.visible=true;
						this.myroot.ship.maxhealth=2000;
						this.myroot.ship.health=2000;
						this.myroot.health.scaleY=1;
						this.myroot.broken_zustand=-1;
						this.myroot.broken_f(0);
					}
				}
			}
		}
		public function wbuy_over(event:MouseEvent) {
			if (this.myroot.trader.wbuy.currentFrame<3) {
				this.myroot.trader.wbuy.gotoAndStop(2);
			}
		}
		public function wbuy_out(event:MouseEvent) {
			if (this.myroot.trader.wbuy.currentFrame<3) {
				this.myroot.trader.wbuy.gotoAndStop(1);
			}
		}
	}
}