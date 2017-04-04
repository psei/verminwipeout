// TRADER WEAPONS
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	public class tw_as extends MovieClip {
		public var myroot:MovieClip;
		public var trader:MovieClip;
		public var w:int=0;
		public var tr_as:trader_as;
		public var clip:MovieClip;
		public function tw_as(tr_as_p:trader_as,trader_p:MovieClip,clip_p:MovieClip,w_p:int) {
			this.trader=trader_p;
			this.clip=clip_p;
			this.tr_as=tr_as_p;
			this.w=w_p;
			this.myroot=this.tr_as.myroot;
			this.clip.buttonMode=true;
			this.clip.addEventListener(MouseEvent.MOUSE_DOWN,this.clip_down);
			this.clip.addEventListener(MouseEvent.MOUSE_OVER,this.clip_over);
			this.clip.addEventListener(MouseEvent.MOUSE_OUT,this.clip_out);
		}
		public function clip_down(event:MouseEvent) {
			this.tr_as.w=this.w;
			for (var i:int=0; i<12; i++) {
				this.trader["w" + (i + 1)].gotoAndStop(1);
				//this.trader["w" + (i + 1)].gotoAndStop(1);
				if (i<10) {
					this.myroot["w" + (i + 1)].gotoAndStop(1);
				}
			}
			this.trader.weapons.gotoAndStop(this.w+1);
			
			this.trader.buy_price.text="c"+this.tr_as.prices[this.tr_as.w];
			this.trader.sell_price.text="c"+this.tr_as.sell_prices[this.tr_as.w];
			this.trader.weapons.txt.txt.y=0 //scroll to top
			this.trader.weapons.txt.txt.text=this.myroot.langs[this.myroot.chl]["t_6_"+(this.tr_as.w+1)];
			this.trader.weapons.txt.head.text=this.myroot.langs[this.myroot.chl]["t_5_"+(this.tr_as.w+1)];
			//this.trader.weapons.gotoAndStop(this.tr_as.w+1);
			if (this.w<10) {
				this.myroot["w"+(this.w+1)].gotoAndStop(3);
			}
			if (this.w>5 && this.w<10) {
				this.tr_as.myroot.ammo_txt.text=""+this.tr_as.myroot["w"+(this.w+1)+"ammo"];
				if(this.w==8){
					this.tr_as.myroot.ammo_txt.text="";
				}
				this.tr_as.myroot.secondary.gotoAndStop(this.w-5);
			}
			else {
				this.tr_as.myroot.primary.gotoAndStop(this.w);
			}
			this.trader["w"+(this.w + 1)].gotoAndStop(3);
		}
		public function clip_over(event:MouseEvent) {
			if (this.clip.currentFrame<3) {
				if (this.w<10) {
					if (this.myroot["w"+(this.w+1)].currentFrame<3) {
						this.myroot["w"+(this.w+1)].gotoAndStop(2);
					}
				}
				this.clip.gotoAndStop(2);
			}
		}
		public function clip_out(event:MouseEvent) {
			if (this.clip.currentFrame<3) {
				if (this.w<10) {
					if (this.myroot["w"+(this.w+1)].currentFrame<3) {
						this.myroot["w"+(this.w+1)].gotoAndStop(1);
					}
				}
				this.clip.gotoAndStop(1);
			}
		}
	}
}