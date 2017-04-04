// CONTROLS
package mcs{
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.*;
	import flash.net.*;
	public class vermin_controls_as {
		public var myroot:MovieClip;

		public var flash_quality:int= 2; //0: low, 1: medium, 2: high
		public var volume_music:int	= 10;
		public var volume_fx:int	= 10;

		public function vermin_controls_as(root_p:MovieClip) {
			this.myroot = root_p;

			this.myroot.vermin_controls.icon_quality.buttonMode = true;						
			this.myroot.vermin_controls.icon_quality.addEventListener(MouseEvent.MOUSE_DOWN,this.icon_flash_quality_down);
			this.myroot.vermin_controls.icon_quality.addEventListener(MouseEvent.MOUSE_OVER,this.icon_flash_quality_over);
			this.myroot.vermin_controls.icon_quality.addEventListener(MouseEvent.MOUSE_OUT,this.icon_flash_quality_out);

			this.myroot.vermin_controls.icon_audio.buttonMode = true;						
			this.myroot.vermin_controls.icon_audio.addEventListener(MouseEvent.MOUSE_DOWN,this.icon_audio_down);
			this.myroot.vermin_controls.icon_audio.addEventListener(MouseEvent.MOUSE_OVER,this.icon_audio_over);
			this.myroot.vermin_controls.icon_audio.addEventListener(MouseEvent.MOUSE_OUT,this.icon_audio_out);			

			this.myroot.vermin_controls.icon_music.buttonMode = true;						
			this.myroot.vermin_controls.icon_music.addEventListener(MouseEvent.MOUSE_DOWN,this.icon_music_down);
			this.myroot.vermin_controls.icon_music.addEventListener(MouseEvent.MOUSE_OVER,this.icon_music_over);
			this.myroot.vermin_controls.icon_music.addEventListener(MouseEvent.MOUSE_OUT,this.icon_music_out);
		}
		
		public function showControls() {
			this.myroot.vermin_controls.visible = true;
		}
		
		public function hideControls() {
			this.myroot.vermin_controls.visible = false;
		}
		
		public function toggleVisibility() {
			if (this.myroot.vermin_controls.visible == true) {
				this.myroot.vermin_controls.visible = false;
			}
			else {
				this.myroot.vermin_controls.visible = true;
			}
			
		}
		
		public function toggleflash_quality() {
			this.flash_quality += 1;
			this.flash_quality %= 3;
			switch(this.flash_quality) {
				case 0:
					this.myroot.stage.quality = StageQuality.LOW;
					break;
				case 1:
					this.myroot.stage.quality = StageQuality.MEDIUM;
					break;
				case 2:
					this.myroot.stage.quality = StageQuality.HIGH;
					break;
			}
			this.myroot.vermin_controls.bar1.width = 64*(this.flash_quality)/2;
		}

		public function icon_flash_quality_down(event:MouseEvent)
		{
			// TOGGLE flash_quality in 3 steps
			// MAYBEE SOME EFFECTS OFF in LOW MODE
			this.toggleflash_quality();
			this.myroot.vermin_controls.icon_quality.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function icon_flash_quality_over(event:MouseEvent) {
			this.myroot.vermin_controls.icon_quality.gotoAndStop(2);
		}
		public function icon_flash_quality_out(event:MouseEvent) {
			this.myroot.vermin_controls.icon_quality.gotoAndStop(1);
		}
		
		public function toggleFx() {
			this.volume_fx += 1;
			this.volume_fx %= 10;
			this.myroot.updateEffectVolume(this.volume_fx/10);
			this.myroot.vermin_controls.bar2.width = 64*(this.volume_fx)/9;
		}
		
		public function icon_audio_down(event:MouseEvent)
		{
			this.toggleFx();
			// TOGGLE AUDIO FX ON OFF
			this.myroot.vermin_controls.icon_audio.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function icon_audio_over(event:MouseEvent) {
			this.myroot.vermin_controls.icon_audio.gotoAndStop(2);
		}
		public function icon_audio_out(event:MouseEvent) {
			this.myroot.vermin_controls.icon_audio.gotoAndStop(1);
		}
		
		public function toggleAudio() {
			this.volume_music += 1;
			this.volume_music %= 10;
			this.myroot.updateMusicVolume(this.volume_music/10);
			this.myroot.vermin_controls.bar3.width = 64*(this.volume_music)/9;
		}
		
		public function icon_music_down(event:MouseEvent)
		{
			// TOGGLE MUSIC ON OFF
			this.toggleAudio();
			this.myroot.vermin_controls.icon_music.gotoAndStop(3);
			this.myroot.SoundEffect("menu");
		}
		public function icon_music_over(event:MouseEvent) {
			this.myroot.vermin_controls.icon_music.gotoAndStop(2);
		}
		public function icon_music_out(event:MouseEvent) {
			this.myroot.vermin_controls.icon_music.gotoAndStop(1);
		}
	}
}
