package mcs{
	import flash.filters.BlurFilter;
	import flash.display.MovieClip;
	import flash.events.*;
	public class flare extends MovieClip {
		public var speed:Number;
		//public var nr:int;
		public var myroot:MovieClip;
		public function flare(root_p:MovieClip) {
			this.myroot=root_p;
			//this.nr=nr_p;
			//var bf:BlurFilter=new BlurFilter(2+Math.random()*6, 2+Math.random()*6, 1);
			//this.filters=[bf];
			this.gotoAndStop(this.myroot.mission_nr);
			this.x=Math.random()*450;
			this.y=-Math.random()*700;
			this.scaleX=0.3+Math.random()*1;
			this.scaleY=this.scaleX;
			this.speed=10+Math.random()*20;
			this.addEventListener(MouseEvent.MOUSE_OVER,this.mo);
		}
		public function mo(event:MouseEvent) {
			this.speed+=20;
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.y+=this.speed;
				if (this.y>550)
				{
					this.y=-Math.random()*550;
					this.scaleX=0.3+Math.random()*1;
					this.scaleY=this.scaleX;
					this.speed=20+Math.random()*10;
				}
			}
		}
	}
}