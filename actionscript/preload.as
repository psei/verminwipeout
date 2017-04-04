package {
	import flash.display.*;
	import flash.events.*;
	public class preload extends MovieClip {
		public var myvar1:int=0;
		public function preload() {
			stop();
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler1);
		}
		public function progressHandler(event:ProgressEvent) {
			this.preloaderbar.scaleX = event.bytesLoaded/event.bytesTotal;
		}
		public function completeHandler(event:Event) {
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler1);
			this.gotoAndStop(3);
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		public function enterFrameHandler(event:Event) {
			if (this.currentFrame >= 3) {
				this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
				this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler1);
				stop();
				this.mymain();
			}
		}
		public function enterFrameHandler1(event:Event) {
			this.blueprints_scroll();
		}		
		public function mymain() {			
			var mainClass:Class = loaderInfo.applicationDomain.getDefinition("main") as Class;
			var main:MovieClip = new mainClass(this) as MovieClip;
			addChild(main);
		}

		public function blueprints_scroll() {
            if(this.currentFrame==1){
                if (this.mouseX<100) {
                    this.blueprints.x += -this.blueprints.x/70;
                    if (this.blueprints.x>=0) {
                        this.blueprints.x = 0;
                    }
                } else if (this.mouseX>400) {
                    this.blueprints.x -= (this.blueprints.width-780+this.blueprints.x)/70;
                    if (this.blueprints.x<=-this.blueprints.width+780) {
                        this.blueprints.x = -this.blueprints.width+780;
                    }
                }
            }
		}
	}
}