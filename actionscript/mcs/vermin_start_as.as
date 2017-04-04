// START
package mcs{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	public class vermin_start_as extends MovieClip {
		public var myroot:MovieClip;
		public var bg_move_left = true;
		private var selected_id:int;
		private var item_array:Array = new Array;
		private var counter:int = 0;

		public function vermin_start_as(root_p:MovieClip) {
			this.selected_id = 0;
			this.item_array = ["start", "load", "config", "credits", "web"];
			this.myroot=root_p;
			this.myroot.vermin_menu.y = 0;
			this.myroot.vermin_menu.main_start.buttonMode=true;
			this.myroot.vermin_menu.main_start.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_start_down);
			this.myroot.vermin_menu.main_start.addEventListener(MouseEvent.MOUSE_OVER,this.btn_start_over);
			this.myroot.vermin_menu.main_load.buttonMode=true;
			this.myroot.vermin_menu.main_load.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_load_down);
			this.myroot.vermin_menu.main_load.addEventListener(MouseEvent.MOUSE_OVER,this.btn_load_over);
			this.myroot.vermin_menu.main_config.buttonMode=true;
			this.myroot.vermin_menu.main_config.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_config_down);
			this.myroot.vermin_menu.main_config.addEventListener(MouseEvent.MOUSE_OVER,this.btn_config_over);
			this.myroot.vermin_menu.main_credits.buttonMode=true;
			this.myroot.vermin_menu.main_credits.addEventListener(MouseEvent.MOUSE_DOWN,this.btn_credits_down);
			this.myroot.vermin_menu.main_credits.addEventListener(MouseEvent.MOUSE_OVER,this.btn_credits_over);
			
			this.myroot.death_message.btn_web.buttonMode=true;
			this.myroot.death_message.btn_web.buttonMode=true;
			this.myroot.death_message.btn_web.addEventListener(MouseEvent.MOUSE_DOWN,this.death_btn_web_down);
			this.myroot.death_message.btn_web.addEventListener(MouseEvent.MOUSE_OVER,this.death_btn_web_over);
			//this.myroot.death_message.btn_web.addEventListener(MouseEvent.MOUSE_OUT,this.death_btn_web_out);
					
			this.myroot.vermin_credits.btn_continue.buttonMode=true;
			
			this.myroot.vermin_credits.btn_web.buttonMode=true;
			this.myroot.vermin_credits.btn_web.addEventListener(MouseEvent.MOUSE_DOWN,this.credits_btn_web_down);
			this.myroot.vermin_credits.btn_web.addEventListener(MouseEvent.MOUSE_OVER,this.credits_btn_web_over);
			//this.myroot.vermin_credits.btn_web.addEventListener(MouseEvent.MOUSE_OUT,this.credits_btn_web_out);
			
			this.myroot.vermin_menu.btn_web.buttonMode=true;
			this.myroot.vermin_menu.btn_web.addEventListener(MouseEvent.MOUSE_DOWN,this.menu_btn_web_down);
			this.myroot.vermin_menu.btn_web.addEventListener(MouseEvent.MOUSE_OVER,this.menu_btn_web_over);
			//this.myroot.vermin_menu.btn_web.addEventListener(MouseEvent.MOUSE_OUT,this.menu_btn_web_out);
			
			this.myroot.vermin_pause.btn_web.buttonMode=true;
			this.myroot.vermin_pause.btn_web.addEventListener(MouseEvent.MOUSE_DOWN,this.pause_btn_web_down);
			this.myroot.vermin_pause.btn_web.addEventListener(MouseEvent.MOUSE_OVER,this.pause_btn_web_over);
			//this.myroot.vermin_pause.btn_web.addEventListener(MouseEvent.MOUSE_OUT,this.pause_btn_web_out);
			
			this.myroot.menu_bg.visible = true;
			
			
		}
		
		public function activate() {
			this.selectItem(0);
			this.myroot.menu_bg.visible=true;
			this.myroot.vermin_menu.visible = true;
			this.addEventListener(Event.ENTER_FRAME,this.oef);
			this.myroot.stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
		}
		
		public function oef(event:Event) {
			this.myroot.blueprints_scroll();			
		}		
		
		public function keyup(event:KeyboardEvent) {
			//up
			if (event.keyCode == 38 && this.selected_id > 0) {
				this.selected_id -= 1;
			}
			//left
			if (event.keyCode == 40 && this.selected_id < 3) {
				this.selected_id += 1;
			}
			this.selectItem(this.selected_id);
			
			//enter
			if (event.keyCode == 13 || event.keyCode == 33) {
				this.myroot.stop();
				this.stop();
				this.useItem(this.selected_id);
			}			
		}
		
		private function selectItem(id:int) {
			this.selected_id = id;
			for (var i:int = 0; i < 4; i++) {
				this.myroot.vermin_menu["main_"+this.item_array[i]].gotoAndStop(1);
			}
			this.myroot.vermin_menu["main_"+this.item_array[id]].gotoAndStop(2);
		}
		
		private function useItem(id:int) {
			this["btn_"+this.item_array[id]+"_down"](new MouseEvent(MouseEvent.CLICK));
		}
		
		public function btn_start_down(event:MouseEvent) {
			this.myroot.vermin_menu.main_start.gotoAndStop(3);
			this.myroot.vermin_menu.visible=false;
			this.myroot.menu_bg.visible=false;
			this.myroot.add_cinematics(1);
			this.myroot.stage.removeEventListener(KeyboardEvent.KEY_UP,keyup);
			this.removeEventListener(Event.ENTER_FRAME,this.oef);
			this.myroot.SoundEffect("menu");
		}
		public function btn_start_over(event:MouseEvent) {
			this.selectItem(0);
		}

		public function btn_load_down(event:MouseEvent) {
			// load the saveGame
			this.myroot.vermin_menu.main_load.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function btn_load_over(event:MouseEvent) {
			this.selectItem(1);
		}

		public function btn_config_down(event:MouseEvent) {
			this.myroot.config.toggleVisibility();
			this.myroot.vermin_menu.main_config.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function btn_config_over(event:MouseEvent) {
			this.selectItem(2);
		}
		
		
		public function menu_btn_web_down(event:MouseEvent) {
			// open website
			navigateToURL(new URLRequest("http://www.zusel.net"), "_blank");
			this.myroot.vermin_menu.btn_web.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function menu_btn_web_over(event:MouseEvent) {
			this.myroot.vermin_menu.btn_web.gotoAndStop(2);
		}
		
		public function death_btn_web_down(event:MouseEvent) {
			// open website
			navigateToURL(new URLRequest("http://www.zusel.net"), "_blank");
			this.myroot.death_message.btn_web.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function death_btn_web_over(event:MouseEvent) {
			this.myroot.death_message.btn_web.gotoAndStop(2);
		}
		
		public function pause_btn_web_down(event:MouseEvent) {
			// open website
			navigateToURL(new URLRequest("http://www.zusel.net"), "_blank");
			this.myroot.vermin_pause.btn_web.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function pause_btn_web_over(event:MouseEvent) {
			this.myroot.vermin_pause.btn_web.gotoAndStop(2);
		}
		
		public function credits_btn_web_down(event:MouseEvent) {
			// open website
			navigateToURL(new URLRequest("http://www.zusel.net"), "_blank");
			this.myroot.SoundEffect("menu");
		}
		public function credits_btn_web_over(event:MouseEvent) {
			this.myroot.vermin_credits.btn_web.gotoAndStop(2);
		}
		
		public function btn_credits_down(event:MouseEvent) {
			this.myroot.vermin_menu.visible   = false;
			this.myroot.vermin_credits.visible = true;
			this.myroot.vermin_credits.btn_continue.addEventListener(MouseEvent.MOUSE_DOWN,this.credits_continue_down);
			this.myroot.vermin_credits.btn_continue.addEventListener(MouseEvent.MOUSE_OVER,this.credits_continue_over);
			this.myroot.SoundEffect("menu");
		}
		public function btn_credits_over(event:MouseEvent) {
			this.selectItem(3);
		}
		
		public function credits_continue_down(event:MouseEvent) {
			this.myroot.vermin_pause.gotoAndStop(1);
			this.myroot.vermin_credits.visible = false;
			this.myroot.vermin_menu.visible   = true;
			this.myroot.vermin_credits.btn_continue.removeEventListener(MouseEvent.MOUSE_DOWN,this.credits_continue_down);
			this.myroot.vermin_credits.btn_continue.removeEventListener(MouseEvent.MOUSE_OVER,this.credits_continue_over);
			this.myroot.SoundEffect("menu");
		}
		
		public function credits_continue_over(event:MouseEvent) {
			this.myroot.vermin_credits.btn_continue.gotoAndStop(2);
		}
	}
}
