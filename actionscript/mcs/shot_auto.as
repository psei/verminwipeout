// AUTOCANNON WAFFE 8
package mcs {
	import flash.geom.Point;
	import flash.display.*;
	import flash.events.*;
	public class shot_auto extends MovieClip {
		public var myroot:MovieClip;
		public var ht:int = 0;
		public var ac:int = 0;
		public var ct:int = 0;
		public var hta:Array = new Array();
		public var distances:Array = new Array();
		public function shot_auto(root_p) {
			this.myroot=root_p;
			this.addEventListener(Event.ADDED_TO_STAGE,this.init);
			this.visible=false;
			this.myroot.shots.addChild(this);
			this.myroot.SoundEffect("w4");
		}
		public function init(event:Event) {
			this.x=this.myroot.ship_mc.x;
			this.y=this.myroot.ship_mc.y;
			this.hta=new Array();
			for (var i:int=0; i<this.myroot.enemies_array.length; i++) {
				var target:MovieClip = this.myroot.enemies_array[i];
				var pt1:Point = new Point(target.x, target.y);
				var pt2:Point = new Point(this.myroot.ship_mc.x, this.myroot.ship_mc.y);
				var distance:Number = Point.distance(pt1, pt2);
				if (target.y>0 && this.myroot.ship_mc.y-target.y>=0) {
					if (this.hta.length==0) {
						this.hta.push(target);
						this.distances.push(distance);
					} else {
						if (this.myroot.ship_mc.y-target.y>=0) {
							if (distance<this.distances[0]) {
								this.hta[0]=target;
								this.distances[0]=distance;
							}
						}
					}
				}
			}
			if (this.hta.length>0) {
				this.visible=true;
				this.hta[0].kill(2000);
				var dx:Number = this.hta[0].x- this.x;
				var dy:Number = this.hta[0].y- this.y;
				var radians:Number = Math.atan2(dy, dx);
				this.rotation = 90+(radians * 180 / Math.PI);
				this.height=Math.sqrt(dx*dx+dy*dy);
			}
			this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
		}
		public function oef(event:Event) {
			if (this.myroot.gp==0) {
				this.ct++;
				if (this.ct==2) {
					this.myroot.shots.removeChild(this);
					var remove_nr: int = this.myroot.shots_array.indexOf(this);
					if (remove_nr>-1) this.myroot.shots_array.splice(remove_nr, 1);
					delete this;
				}
			}
		}
	}
}