// VERMIN LANGUAGE AS
package mcs{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	public class vermin_language_as extends MovieClip {
		public var myroot:MovieClip;
		private var selected_id;
		
		public function vermin_language_as(root_p:MovieClip) {
			this.myroot=root_p;
			this.myroot.vermin_language.language1.buttonMode=true;	//en
			this.myroot.vermin_language.language1.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_language1_down);
			this.myroot.vermin_language.language1.addEventListener(MouseEvent.MOUSE_OVER,this.btn_language1_over);
			this.myroot.vermin_language.language2.buttonMode=true;	//de
			this.myroot.vermin_language.language2.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_language2_down);
			this.myroot.vermin_language.language2.addEventListener(MouseEvent.MOUSE_OVER,this.btn_language2_over);
			this.myroot.vermin_language.language3.buttonMode=true;	//jap
			this.myroot.vermin_language.language3.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_language3_down);
			this.myroot.vermin_language.language3.addEventListener(MouseEvent.MOUSE_OVER,this.btn_language3_over);
			this.myroot.vermin_language.language4.buttonMode=true;	//france
			this.myroot.vermin_language.language4.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_language4_down);
			this.myroot.vermin_language.language4.addEventListener(MouseEvent.MOUSE_OVER,this.btn_language4_over);	
			this.myroot.vermin_language.language5.buttonMode=true;	//dutch
			this.myroot.vermin_language.language5.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_language5_down);
			this.myroot.vermin_language.language5.addEventListener(MouseEvent.MOUSE_OVER,this.btn_language5_over);				
			this.myroot.vermin_menu.visible = true;
			this.myroot.menu_bg.visible = true;
			this.selected_id = 1;
			this.addEventListener(Event.ENTER_FRAME,oef);
			this.myroot.stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
		}
						
		public function oef(event:Event) {
			this.myroot.blueprints_scroll();
		}
		
		public function keyup(event:KeyboardEvent) {
			//right
			if (event.keyCode == 39 && this.selected_id < 5) {
				this.selected_id += 1;
			}
			//left
			if (event.keyCode == 37 && this.selected_id > 1) {
				this.selected_id -= 1;
			}
			this.selectLanguage(this.selected_id);
			
			//enter
			if (event.keyCode == 13 || event.keyCode == 33) {
				this.myroot.real_root.stop();
				this.myroot.stop();
				this.stop();
				this.setLanguage(this.selected_id);
			}			
		}
		
		protected function selectLanguage(lang_id:int) {
			this.selected_id=lang_id;
			for (var i:int = 1; i<=5; i++) {
				this.myroot.vermin_language["language"+i].gotoAndStop(1)
			}
			this.myroot.vermin_language["language"+lang_id].gotoAndStop(2);
		}
		
		protected function setLanguage(lang_id:int) {
			this.removeEventListener(Event.ENTER_FRAME,oef);
			this.myroot.stage.removeEventListener(KeyboardEvent.KEY_UP,keyup);
			this.myroot.vermin_language.visible = false;
			this.myroot.start_as.activate();
			this.myroot.chl = lang_id-1;
			this.myroot.SoundEffect("menu");
		}
		
		//eng
		public function btn_language1_down(event:MouseEvent) {
			this.setLanguage(1)
		}		
		public function btn_language1_over(event:MouseEvent) {
			this.selectLanguage(1);
		}		
		
		//de
		public function btn_language2_down(event:MouseEvent) {
			this.setLanguage(2)
		}		
		public function btn_language2_over(event:MouseEvent) {
			this.selectLanguage(2);
		}		
		
		//jap
		public function btn_language3_down(event:MouseEvent) {
			this.setLanguage(3)
		}		
		public function btn_language3_over(event:MouseEvent) {
			this.selectLanguage(3);
		}		
		
		//france
		public function btn_language4_down(event:MouseEvent) {
			this.setLanguage(4)
		}		
		public function btn_language4_over(event:MouseEvent) {
			this.selectLanguage(4);
		}		
		
		//dutch
		public function btn_language5_down(event:MouseEvent) {
			this.setLanguage(5)
		}		
		public function btn_language5_over(event:MouseEvent) {
			this.selectLanguage(5);
		}		
	}
}
