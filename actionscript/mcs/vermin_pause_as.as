// vermin_pause_as GREEN
package mcs
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	//public var mixer:SoundTransform;
	public class vermin_pause_as extends MovieClip
	{

		public var myroot:MovieClip;

		public function vermin_pause_as(root_p:MovieClip)
		{
			this.name = "vermin_pause";
			this.myroot = root_p;
			this.myroot.vermin_pause.visible = false;
			this.myroot.vermin_pause.men_pause_btn_1.buttonMode = true;
			this.myroot.vermin_pause.men_pause_btn_1.addEventListener(MouseEvent.MOUSE_DOWN,this.resume_down);
			this.myroot.vermin_pause.men_pause_btn_1.addEventListener(MouseEvent.MOUSE_OVER,this.resume_over);
			this.myroot.vermin_pause.men_pause_btn_1.addEventListener(MouseEvent.MOUSE_OUT,this.resume_out);
			
			this.myroot.vermin_pause.men_pause_btn_2.buttonMode = true;
			this.myroot.vermin_pause.men_pause_btn_2.addEventListener(MouseEvent.MOUSE_DOWN,this.stats_down);
			this.myroot.vermin_pause.men_pause_btn_2.addEventListener(MouseEvent.MOUSE_OVER,this.stats_over);
			this.myroot.vermin_pause.men_pause_btn_2.addEventListener(MouseEvent.MOUSE_OUT,this.stats_out);
			
			this.myroot.vermin_pause.men_pause_btn_3.buttonMode = true;
			this.myroot.vermin_pause.men_pause_btn_3.addEventListener(MouseEvent.MOUSE_DOWN,this.config_down);
			this.myroot.vermin_pause.men_pause_btn_3.addEventListener(MouseEvent.MOUSE_OVER,this.config_over);
			this.myroot.vermin_pause.men_pause_btn_3.addEventListener(MouseEvent.MOUSE_OUT,this.config_out);

			this.myroot.vermin_pause.men_pause_btn_4.buttonMode = true;
			this.myroot.vermin_pause.men_pause_btn_4.addEventListener(MouseEvent.MOUSE_DOWN,this.credits_down);
			this.myroot.vermin_pause.men_pause_btn_4.addEventListener(MouseEvent.MOUSE_OVER,this.credits_over);
			this.myroot.vermin_pause.men_pause_btn_4.addEventListener(MouseEvent.MOUSE_OUT,this.credits_out);
			
			this.myroot.vermin_pause.men_pause_btn_5.buttonMode = true;						
			this.myroot.vermin_pause.men_pause_btn_5.addEventListener(MouseEvent.MOUSE_DOWN,this.exit_down);
			this.myroot.vermin_pause.men_pause_btn_5.addEventListener(MouseEvent.MOUSE_OVER,this.exit_over);
			this.myroot.vermin_pause.men_pause_btn_5.addEventListener(MouseEvent.MOUSE_OUT,this.exit_out);
			
			this.myroot.vermin_credits.btn_continue.buttonMode = true;
			this.myroot.vermin_credits.btn_web.buttonMode = true;
			this.myroot.vermin_pause.btn_web.buttonMode = true;			
		}

		public function enable()
		{
			this.myroot.unpauseMe = new Array();
			this.myroot.pauseFrameList = new Array();
			this.myroot.pauseFrameReturn = new Array();
			this.myroot.pauseObjects = new Array();
			this.myroot.pauseGetFrames(this.myroot);
			this.myroot.checkpause=true;
			this.myroot.gp=1;
			this.myroot.xpa(1);
			this.myroot.vermin_pause.visible = true;
			this.myroot.vermin_background.visible = true;
		}

		public function disable()
		{
			this.myroot.unpauseAll(this.myroot);
			this.myroot.gp=0;
			this.myroot.xpa(0);
			this.myroot.vermin_pause.visible = false;
			this.myroot.vermin_credits.visible = false;
			this.myroot.vermin_controls.visible = false;
			this.myroot.vermin_background.visible = false;
			this.myroot.stats_mc.visible = false;
		}
		
		public function resume_down(event:MouseEvent)
		{
			this.myroot.gp = 0;
			this.myroot.xpa(0);
			this.disable();
			this.myroot.vermin_pause.men_pause_btn_1.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function resume_over(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_1.gotoAndStop(2);
		}
		public function resume_out(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_1.gotoAndStop(1);
		}
		
		public function stats_down(event:MouseEvent)
		{
			this.myroot.stats.clip.btn_continue.removeEventListener(MouseEvent.MOUSE_DOWN,this.myroot.stats.btn_continue_down);
			this.myroot.stats.clip.btn_continue.addEventListener(MouseEvent.MOUSE_DOWN, this.stats_continue_down);
			this.myroot.vermin_pause.visible = false;
			this.myroot.stats_mc.visible = true;
			this.myroot.SoundEffect("menu");
		}
		public function stats_over(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_2.gotoAndStop(2);
		}
		public function stats_out(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_2.gotoAndStop(1);
		}
		
		public function config_down(event:MouseEvent)
		{
			this.myroot.config.toggleVisibility();
			this.myroot.vermin_pause.men_pause_btn_3.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function config_over(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_3.gotoAndStop(2);
		}
		public function config_out(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_3.gotoAndStop(1);
		}
		
		public function exit_down(event:MouseEvent)
		{
			this.myroot.vermin_pause.men_pause_btn_5.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function exit_over(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_5.gotoAndStop(2);
		}
		public function exit_out(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_5.gotoAndStop(1);
		}
		
		

		public function credits_down(event:MouseEvent)
		{
			this.myroot.vermin_pause.visible = false;
			this.myroot.vermin_credits.visible = true;
			this.myroot.vermin_credits.btn_continue.addEventListener(MouseEvent.MOUSE_DOWN,this.credits_continue_down);
			this.myroot.vermin_credits.btn_continue.addEventListener(MouseEvent.MOUSE_OVER,this.credits_continue_over);
			this.myroot.vermin_credits.btn_continue.addEventListener(MouseEvent.MOUSE_OUT,this.credits_continue_out);
			this.myroot.vermin_pause.men_pause_btn_4.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function credits_over(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_4.gotoAndStop(2);
		}
		public function credits_out(event:MouseEvent) {
			this.myroot.vermin_pause.men_pause_btn_4.gotoAndStop(1);
		}
		
		public function credits_continue_over(event:MouseEvent)
		{
			if (this.myroot.vermin_credits.btn_continue.currentFrame == 1)
			{
				this.myroot.vermin_credits.btn_continue.gotoAndStop(2);
			}
		}
		public function credits_continue_out(event:MouseEvent)
		{
			if (this.myroot.vermin_credits.btn_continue.currentFrame == 2)
			{
				this.myroot.vermin_credits.btn_continue.gotoAndStop(1);
			}
		}


		public function credits_continue_down(event:MouseEvent)
		{
			this.myroot.vermin_pause.gotoAndStop(1);
			this.myroot.vermin_credits.visible = false;
			this.myroot.vermin_pause.visible = true;
			this.myroot.vermin_credits.btn_continue.removeEventListener(MouseEvent.MOUSE_DOWN,this.credits_continue_down);
			this.myroot.vermin_credits.btn_continue.removeEventListener(MouseEvent.MOUSE_OVER,this.credits_continue_over);
			this.myroot.vermin_credits.btn_continue.removeEventListener(MouseEvent.MOUSE_OUT,this.credits_continue_out);
			this.myroot.SoundEffect("menu");
		}

		public function stats_continue_down(event:MouseEvent)
		{
			this.myroot.stats.clip.btn_continue.addEventListener(MouseEvent.MOUSE_DOWN,this.myroot.stats.btn_continue_down);
			this.myroot.vermin_pause.visible = true;
			this.myroot.stats_mc.visible = false;
			this.myroot.SoundEffect("menu");

		}
	}
}