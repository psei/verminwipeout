package {
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import flash.geom.ColorTransform;
	//import f lash.system.fscommand;	
	import flash.media.*;
	import mcs.*;
	import missions.*;
	import lang.*;
	import flash.geom.Rectangle;
	
	public class main extends MovieClip {
		public var sndc1:SoundChannel=new SoundChannel();
		public var sndc2:SoundChannel=new SoundChannel();
		public var sndEffectChannel:SoundChannel=new SoundChannel();
		public var sndLevelIntro:music_intro = new music_intro();
		public var sndBossIntro:boss_intro = new boss_intro();
		public var sndLevelMusic:music_loop = new music_loop();
		public var sndBossMusic:boss_loop = new boss_loop();
		public var sndTrader:snd_trader_01 = new snd_trader_01();
		public var snd_effects:Object = {
			// Klick
			menu: new snd_menu_click(),
			
			// WEAPONs
			// 01 Pulse Blaster
			w1: new snd_waffe1(),
			// 02 Hotwired Pulse Blaster
			w2: new snd_waffe2(),
			// 03 Flamethrower
			w3: new snd_waffe3(),
			// 04 Autocannon
			w4: new snd_waffe4(),
			// 05 Lightning Gun
			w5: new snd_waffe5(),
			// 06 Galting Laser
			// w6: new snd_waffe6(),
			// 07 Detonator Torpedo Drop
			w7: new snd_waffe7(),
			// 08 Phalanx Missile Drop
			w8: new snd_waffe8(),
			// 10 Bomb
			w10: new snd_waffe8(),
			// Weapon Switch
			weapon_switch: new snd_switch(),
			// Explosion w7 detonator 
			// Explosion w8 phalanx
			// Drone activate
			// Explosion w10 bomb
			// Wiper
			wiper: new snd_wiper()
		};
		//Achievements
		public var acnt:Array=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		//public var sfx1:s1=new s1();
		//public var sfx2:s2=new s2();
		public var p_d:int=0;
		public var nsf:int=0;
		public var no_shot_fired:int=0;
		public var ns2f:int=0;
		public var no_shot2_fired:int=0;
		public var matsched:int=0;
		public var langs:Array=[];
		public var chl:int=0;
		public var hacked:int=0;
		public var gp:int=0;
		//ss  - shooted shots
		public var ss:int=0;
		public var sss:int=0;
		// shooted shots hitted
		public var sshit:int=0;
		public var ssmax:Array=[1000,0,0,0,0,0,0];
		public var cmax:Array=[1000,0,0,0,0,0,0];
		public var ua:int=0;
		public var total_matsch:int=0;
		public var ram:int=0;
		public var ws:int=0;
		public var kills:int=0;
		public var total_kills:int=0;
		public var total_shots:int=0;
		public var zustand:Number=0;
		public var counter:Number=0;
		public var counter1:Number=0;
		public var counter2:Number=0;
		public var move_up:Boolean=false;
		public var move_down:Boolean=false;
		public var move_left:Boolean=false;
		public var move_right:Boolean=false;
		public var shoot:Boolean=false;
		public var shoot2:Boolean=false;
		public var shoot3:Boolean=false;
		public var credits:Number=0;
		public var ship:ship_as;
		public var traders:trader_as;
		public var stats:stats_as;
		public var enemies_array:Array=new Array;
		public var shots_array:Array=new Array;
		public var flares_array:Array=new Array;
		public var oefSubscribers:Array=new Array;
		public var x_out:Number=-1000;
		public var y_out:Number=-1000;

		public var mission_nr:int=0;
		public var enemy_count:int=0;
		public var real_root:MovieClip;
		public var weapons_available:Array=[1,1,1,1,1,1,1,1,1,1];
		public var wischer_pressed:Number=0;
		public var w7ammo=250;
		public var w8ammo=100;
		public var w9ammo=0;
		public var w10ammo=10;
		public var weapon1:Number=1;
		public var weapon2:Number=7;
		public var w2_heat:Number=0;
		public var w3_heat:Number=0;
		public var w4_heat:Number=0;
		public var w6_heat:Number=0;
		public var mi1:mission1;
		public var mi2:mission2;
		public var mi3:mission3;
		public var mi4:mission4;
		public var mi5:mission5;
		public var mi6:mission6;
		public var mi7:mission7;
		public var matsch_zustand:int=0;
		public var matsch_random:int=0;
		public var broken_random:int=0;
		public var broken_zustand:int=0;
		public var drone:shot_drone;
		public var pause_as:vermin_pause_as;
		public var start_as:vermin_start_as;
		public var language_as:vermin_language_as;
		public var config:vermin_controls_as;
		public var briefing:vermin_briefing_as;
		public var game_continues:int=3;
		public var bossmode = false;
		public var zwischenbossmode = false;
		
		public var unpauseMe:Array = new Array;
		public  var pauseFrameList:Array = new Array;
		public  var pauseFrameReturn:Array = new Array;
		public  var pauseObjects:Array = new Array;
		public  var checkpause:Boolean = false;

		public var cinematics1:cinematic_intro_clip; 
		public var cinematicnr:int=0;
		
		public var mixer:SoundTransform;
		public var EffectMixer:SoundTransform;
		
		public var sounds:Array=[];
		
		public function SoundEffect(effect_name:String) {
			this.snd_effects[effect_name].play(0, 0, this.EffectMixer);
		}

		//public var bg_zustand:int=0;
		public function add_cinematics(nr_p:int){
					/*this.cinematic_intro.visible=false;
					this.cinematic_middle.visible=false;
					this.cinematic_outro.visible=false;
					this.vermin_briefing.visible = true;
					this.briefing.showStage(1);					
		}*/
		//removed by de, enable it with current fla
			if(nr_p==1){
				this.cinematics1=new cinematic_intro_clip();
				this.cinematics.addChild(this.cinematics1);	
				this.cinematics1.skip_btn.buttonMode=true;
				this.cinematics1.skip_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.cinematic_skip);
				this.cinematics1.skip_btn.addEventListener(MouseEvent.MOUSE_OVER,this.cinematic_skip_over);
				this.cinematics1.skip_btn.addEventListener(MouseEvent.MOUSE_OUT,this.cinematic_skip_out);
				this.stage.addEventListener(KeyboardEvent.KEY_UP, this.cinematic_key);
			}else if(nr_p==2){
				this.cinematics1=new cinematic_intro_clip();
				this.cinematics.addChild(this.cinematics1);
			}else if(nr_p==3){
				this.cinematics1=new cinematic_intro_clip();
				this.cinematics.addChild(this.cinematics1);
			}
			this.cinematics.visible=true;
			this.cinematicnr=nr_p;
			this.addEventListener(Event.ENTER_FRAME,this.coef);			
		}
		public function remove_cinematics(){
			for(var i:int=this.cinematics.numChildren-1;i>-1;i--){
				this.cinematics.removeChildAt(0);			
			}
			this.cinematics1=null;
			//this.cinematics2=null;
			//this.cinematics3=null;
		}
		public function cinematic_skip(event:MouseEvent){
			this.cinematics1.gotoAndPlay(this.cinematics1.totalFrames-2);
			this.SoundEffect("menu");
		}
		public function cinematic_skip_over(event:MouseEvent){
			this.cinematics1.skip_btn.gotoAndStop(2);
		}		
		public function cinematic_skip_out(event:MouseEvent){
			/*			
			// FIXME Auskommentiert, weil es einen Fehler verursacht, den ich nicht verstehe.
			trace(this);
			trace(this.cinematics1);
			trace(this.cinematics1.skip_btn);
			this.cinematics1.skip_btn.gotoAndStop(1);
			*/
		}		
		public function cinematic_key(event:KeyboardEvent) {
			//enter
			if (event.keyCode == 13) {
				this.cinematic_skip(new MouseEvent(MouseEvent.CLICK));
				this.SoundEffect("menu");
			}	
		}
		
		public function coef(event:Event){
			if(this.cinematicnr==1){
				if (this.cinematics1.currentFrame == this.cinematics1.totalFrames) {
					this.removeEventListener(Event.ENTER_FRAME,coef);
					this.stage.removeEventListener(KeyboardEvent.KEY_UP, this.cinematic_key);
					this.cinematics1.gotoAndStop(1);
					this.cinematics.visible=false;
					this.remove_cinematics();
					this.briefing.showStage(1);					
					this.cinematicnr=0;					
				}
			}
		}

		public function soundEnginePlay(soundClipNumber:int) {
			this.sndc2=this.sounds[soundClipNumber].play(0,0,this.mixer);
		}

		public function soundchannelhandlerBoss(event:Event):void {
			this.sndc1.stop();
			this.sndc1=this.sndBossMusic.play(0, 0, this.mixer);
			this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandlerBoss);
		}
		public function soundchannelhandlerLevel(event:Event):void {
			this.sndc1.stop();
			this.sndc1=this.sndLevelMusic.play(0, 0, this.mixer);
			this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandlerLevel);
		}
		public function soundchannelhandlerTrader(event:Event):void {
			this.sndc1.stop();
			this.sndc1=this.sndTrader.play(0, 0, this.mixer);
			this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandlerTrader);
		}
		public function main(root_p:MovieClip) {
			//fscommand("fullscreen","true");
			//fscommand("allowscale","noscale");
			//fscommand("showmenu","false");			
			this.real_root=root_p;
			this.addEventListener(Event.ADDED_TO_STAGE,this.init);
			//this.sndc1=this.bgmusic.play();
			//this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandler1);
			//this.sndc2.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandler1);
		}
		public function bg_music() {
			this.sndc1.stop();
			this.sndc1=this.sndLevelIntro.play(0, 0, this.mixer);
			this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandlerLevel);
		}
		public function boss_music() {
			this.sndc1.stop();
			this.sndc1=this.sndBossIntro.play(0, 0, this.mixer);
			this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandlerBoss);
		}
		public function trader_music() {
			this.sndc1.stop();
			this.sndc1=this.sndTrader.play(0, 0, this.mixer);
			this.sndc1.addEventListener(Event.SOUND_COMPLETE, this.soundchannelhandlerTrader);
		}
		public function langs_f() {
			var l1:english = new english(this);
			var l2:german = new german(this);
			var l3:japanese = new japanese(this);
			var l4:france = new france(this);
			var l5:dutch = new dutch(this);
			this.langs.push(l1,l2,l3,l4,l5);
		}
		// FULLSCREEN Button
		public function fullscreen_btn_down(event:MouseEvent) {
			if (this.real_root.stage.displayState == StageDisplayState.FULL_SCREEN) {
				this.real_root.stage.displayState=StageDisplayState.NORMAL;
			} else {
				this.real_root.stage.displayState=StageDisplayState.FULL_SCREEN;
			}
		}
		public function fullscreen_btn_over(event:MouseEvent) {
			this.fullscreen_btn.gotoAndStop(2);
		}
		public function fullscreen_btn_out(event:MouseEvent) {
			this.fullscreen_btn.gotoAndStop(1);
		}
		// AUDIO Button
		public function audio_btn_down(event:MouseEvent) {
			if (this.mixer.volume == 0) {
				this.mixer.volume = 1;
				this.sndc1.soundTransform = this.mixer;
				this.sndc2.soundTransform = this.mixer;
			}
			else {
				this.mixer.volume = 0;
				this.sndc1.soundTransform = this.mixer;
				this.sndc2.soundTransform = this.mixer;
			}
		}
		public function audio_btn_over(event:MouseEvent) {
				this.audio_btn.gotoAndStop(2);
		}
		public function audio_btn_out(event:MouseEvent) {
				this.audio_btn.gotoAndStop(1);
		}
		public function cheat1_down(event:MouseEvent) {
			// CHEAT BUTTON 
			if (this.mission_nr==1) {
				this.mi1.wave=31;
				this.counter=4000;
			} else if (this.mission_nr==2) {
				this.mi2.wave=31;
				this.counter=3900;
			} else if (this.mission_nr==3) {
				this.mi3.wave=29;
				this.counter=3500;
			} else if (this.mission_nr==4) {
				this.mi4.wave=30;
				this.counter=4000;
			} else if (this.mission_nr==5) {
				this.mi5.wave=21;
				this.counter=2200;
			} else if (this.mission_nr==6) {
				this.mi6.wave=33;
				this.counter=3600;
			}
			this.credits_f(6000);
		}
		public function init(event:Event) {
			this.scrollRect = new Rectangle(0,0,570,550);
			this.mixer = new SoundTransform(1,0);
			this.EffectMixer = new SoundTransform(1,0);
			
			//initialize languages
			this.langs_f();
			
			this.removeEventListener(Event.ADDED_TO_STAGE, this.init);
			
			this.pause_as = new vermin_pause_as(this);
			this.start_as = new vermin_start_as(this);
			this.language_as = new vermin_language_as(this);
			this.stats	  = new stats_as(this,this.stats_mc);
			this.config   = new vermin_controls_as(this);
			this.briefing = new vermin_briefing_as(this);
			
			// CINEMATICs
			/*this.cinematic_intro.visible= false;
			this.cinematic_middle.visible= false;
			this.cinematic_outro.visible= false;*/
			/* removed by de, enable it with current fla this.cinematics.visible=false; */
			
			this.vermin_language.visible= true;
			this.vermin_menu.visible	= false;
			this.vermin_pause.visible	= false;
			this.vermin_credits.visible = false;
			this.stats_mc.visible		= false;
			this.death_message.visible	= false;
			this.trader.visible			= false;
			this.bosshealth.visible		= false;
			this.health2.visible		= false;
			this.death_ani.visible		= false;
			this.station_enter.visible  = false;
			this.station_leave.visible	= false;
			this.bg1.visible			= true;
			this.station0.visible		= true;
			this.vermin_controls.visible= false;
			this.vermin_briefing.visible= false;
			this.tutorial.visible		= false;
			
			this.vermin_language.gotoAndStop(1);
			this.station0.gotoAndStop(1);
			this.death_message.gotoAndStop(1);
			this.death_ani.gotoAndStop(1);
			this.names_mc.gotoAndStop(1);
			this.trader.gotoAndStop(1);
			this.tutorial.gotoAndStop(1);
		}
		
		public function new_game() {
			
			this.tutorial.visible = true;
			this.tutorial.gotoAndPlay(1);
			
			this.mission_nr = 1;
			
			this.addEventListener(Event.ENTER_FRAME,oef);
			
			this.bg_music();
			this.drone=new shot_drone(this);
			this.shots.addChild(this.drone);
			this.audio_btn.buttonMode=true;
			this.audio_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.audio_btn_down);
			this.audio_btn.addEventListener(MouseEvent.MOUSE_OVER,this.audio_btn_over);
			this.audio_btn.addEventListener(MouseEvent.MOUSE_OUT,this.audio_btn_out);
			
			this.fullscreen_btn.buttonMode=true;
			this.fullscreen_btn.addEventListener(MouseEvent.MOUSE_DOWN,this.fullscreen_btn_down);
			this.fullscreen_btn.addEventListener(MouseEvent.MOUSE_OVER,this.fullscreen_btn_over);
			this.fullscreen_btn.addEventListener(MouseEvent.MOUSE_OUT,this.fullscreen_btn_out);
			
			this.cheat1.addEventListener(MouseEvent.MOUSE_DOWN,this.cheat1_down);
			this.real_root.stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			this.real_root.stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
			
			//missions
			this.mi1=new mission1(this);
			this.mi2=new mission2(this);
			this.mi3=new mission3(this);
			this.mi4=new mission4(this);
			this.mi5=new mission5(this);
			this.mi6=new mission6(this);
			this.mi7=new mission7(this);
			this.ship=new ship_as(this);
			this.oefSubscribers.push(this.ship);
			
			this.traders=new trader_as(this,this.trader);
			for (var j=0; j<10; j++) {
				var twfs:tw_as=new tw_as(this.traders,this.trader,this.twf["twf"+(j+1)],j);
			}
			
			for (var i:int=0; i < 5; i++) {
				var t1:flare=new flare(this);
				this.flares.addChild(t1);
				this.flares_array.push(t1);
			}
			this.start_game();
		}
		
		public function start_game() {			
			
			this.ship_mc.x=220;
			this.ship_mc.y=400;
			this.x_out=220;
			this.y_out=400;
		
			this.bg_music();
			
			this.wischer.wischer1.wischer_matsch1.visible=false;
			this.wischer.wischer1.wischer_matsch2.visible=false;
			this.wischer.wischer1.wischer_matsch3.visible=false;

			this.ammo_txt.text=""+this.w7ammo;
			this.bg1.gotoAndStop(this.mission_nr);
			this.bg2.gotoAndStop(this.mission_nr);
			this.health2.visible=false;
			//todo: removable? this.bosshealth.visible=false;
			this.twf.visible=false;
			this.station1.visible=false;
			this.vermin_menu.visible=false;
			this.vermin_credits.visible=false;
			this.stats_mc.visible=false;
			this.pause_as.disable();
			
			// Station Text language setting
			this.station_enter.visible=false;
			this.station_leave.visible=false;
			//this.station_enter_main_ger.visible=false;
			//this.station_leave_main_ger.visible=false;
			
			// BOSS Names
			this.name_boss1.visible=false;
			this.name_boss2.visible=false;
			this.name_boss3.visible=false;
			this.name_boss4.visible=false;
			this.name_boss5.visible=false;
			this.name_boss6.visible=false;
			this.name_boss7.visible=false;
			this.bossmode=false;


			this.audio_btn.visible=true;
			this.cheat1.visible=true;
			this.trader.visible=false;
			
			//death
			this.death_message.visible=false;
			this.death_message.gotoAndStop(1);
			this.death_ani.gotoAndStop(1);
			this.death_ani.visible=false;
			this.death_message.press_txt.gotoAndStop(1);

			this.w2.heat.scaleX=0;

			this.weapons_oo();
			this.w1.w_selected.visible=true;

			this.credits_txt.text="0";
			
			this.mi1.reset_mission();
			this.mi2.reset_mission();
			this.mi3.reset_mission();
			this.mi4.reset_mission();
			this.mi5.reset_mission();
			this.mi6.reset_mission();
			this.mi7.reset_mission();
						
			this.ship.health=this.ship.maxhealth;
			this.ship.mc.shield.gotoAndStop(1);
			this.ship.pps=0;	
			this.ship_mc.visible=true;
			
			this.stats.counter = 0;
			/*
			//todo restart traders.
			this.traders=new trader_as(this,this.trader);
			for (var j=0; j<10; j++) {
				var twfs:tw_as=new tw_as(this.traders,this.trader,this.twf["twf"+(j+1)],j);
			}
			
			for (var i:int=0; i < 25; i++) {
				var t1:flare=new flare(this);
				this.flares.addChild(t1);
			}
			*/
			
			this.counter = 0;				
			this.counter1= 0;
			this.counter2= 0;
			
			this.enemy_count=0;
			this.sshit=0;
			this.kills=0;
			this.no_shot_fired=0;
			this.nsf=0;
			this.no_shot2_fired=0;
			this.ns2f=0;
			this.matsched=0;
			this.total_kills=0;
			this.total_shots=0;
			this.ss=0;
			this.p_d=0;
			this.sss=0;
			
			this.oefSubscribers.splice(0,this.oefSubscribers.length);
			this.enemies_array.splice(0,this.enemies_array.length);
			this.shots_array.splice(0,this.shots_array.length);
			
			while (this.enemies.numChildren) {
				this.enemies.removeChildAt(0);
			}
			
			while (this.explo.numChildren) {
				this.explo.removeChildAt(0);
			}
			
			while (this.shots.numChildren) {
				this.shots.removeChildAt(0);
			}
			
			this.shots.addChild(this.drone);
			this.oefSubscribers.push(this.ship);
			
			this.vermin_controls.visible= false;
		}
		
		public function weapons_oo() {
			for (var j:int=0; j<7; j++) {
				if (this.weapon1==0) {
					if (this.weapons_available[j]==1) {
						this.weapon1=j+1;
					}
				}
			}
			for (var k:int=6; k<10; k++) {
				if (this.weapon2==0) {
					if (this.weapons_available[k]==1) {
						this.weapon2=j+1;
					}
				}
			}
			for (var i:int=0; i<10; i++) {
				this["w"+(i+1)].nr.visible=true;
				if (this.weapon1==i+1 || this.weapon2==i+1) {
					this["w"+(i+1)].nr.visible=false;
				} else {
					var pfad1=i+1;
					this["w" + pfad1].gotoAndStop(1);
				}
				if (this.weapons_available[i]==0) {
					this["w"+(i+1)].w_off.visible=true;
					this["w"+(i+1)].w_selected.visible=false;
				} else {
					this["w"+(i+1)].w_off.visible=false;
					if (this.weapon1==i+1 || this.weapon2==i+1) {
						this["w"+(i+1)].w_selected.visible=true;
					} else {
						this["w"+(i+1)].w_selected.visible=false;
					}
				}
			}
		}
		public function credits_f(c:Number) {
			this.credits+= c;
			this.credits_txt.text="" + this.credits;
		}
		public function oef(event:Event) {
			if (this.checkpause) {
				this.checkpause = false;
				this.pauseAll(this);
			}
			if(this.gp==0){
				
				
			//update enemies
			for (var i:int=0; i < this.enemies_array.length; i++) {
				enemies_array[i].oef(event);
			}
			
			//update shoots
			for (i=0; i < this.shots_array.length; i++) {
				this.shots_array[i].oef(event);
			}
			
			//other Subscribers (i.e. drone)
			for (i=0; i < this.oefSubscribers.length; i++) {
				this.oefSubscribers[i].oef(event);
			}

			//update flares
			for (i=0; i < this.flares_array.length; i++) {
				this.flares_array[i].oef(event);
			}

			if (this.wischer.currentFrame>=9) {
				this.matsch_zustand=0;
				this.matsch.gotoAndStop(1);
				this.wischer.wischer1.wischer_matsch1.visible=false;
				this.wischer.wischer1.wischer_matsch2.visible=false;
				this.wischer.wischer1.wischer_matsch3.visible=false;
			}
			// BACKGROUND
			if (this.zustand==0 && this.bossmode==false && this.zwischenbossmode==false) {
				this.bg1.y+= 2;
				this.bg2.y+= 2;
				if (this.bg1.y>=-10 && this.bg1.y<=4) {
					this.bg2.y=this.bg1.y-this.bg1.height+1;
				}
				if (this.bg2.y>=-10 && this.bg2.y<=4) {
					this.bg1.y=this.bg2.y-this.bg2.height+1;
				}
			} else if (this.zustand==1 && this.bossmode==false && this.zwischenbossmode==false) {
				this.bg1.y+= 2;
				this.bg2.y+= 2;
				if (this.bg1.y>=-10 && this.bg1.y<=4) {
					this.bg2.y=this.bg1.y-this.bg1.height+1;
				}
				if (this.bg2.y>=-10 && this.bg2.y<=4) {
					this.bg1.y=this.bg2.y-this.bg2.height+1;
				}
			}
			//missions
			var wave:int=this["mi"+this.mission_nr].wave;
			var total_waves:int=this["mi"+this.mission_nr].total_waves;
			var time:int=this["mi"+this.mission_nr].times[wave];
			if (this.counter==time && wave<=total_waves && this.zwischenbossmode==false) {
				if(wave==3 && this.p_d==0){
					this.p_d=3;
				}
				if(wave==total_waves-1 && this.no_shot_fired==0){
					this.nsf=1;
				}
				this["mi"+this.mission_nr]["mission_"+wave]();
				this["mi"+this.mission_nr].wave++;
			}
			// MOVEMENT
			this.ship_mc.fire_side1.visible=false;
			this.ship_mc.fire_side2.visible=false;
			
			if (this.zustand < 2) {
				if (this.move_right == true && this.move_left == false) {
					if (this.hacked==0) {
						this.m_r_f();
					} else {
						this.m_l_f();
					}
				}
				if (this.move_left == true && this.move_right == false) {
					if (this.hacked==0) {
						this.m_l_f();
					} else {
						this.m_r_f();
					}
				}
				if (this.move_up == true && this.move_down == false) {
					this.ship_mc.y-= 13;
					this.ship_mc.fire1.visible=false;
					this.ship_mc.fire2.visible=true;
					this.ship_mc.fire3.visible=false;
					this.y_out=this.ship_mc.y - 40;
					if (this.ship_mc.y <= 10) {
						this.ship_mc.y=10;
						this.y_out=this.ship_mc.y;
					}
				}
				if (this.move_down == true && this.move_up == false) {
					this.ship_mc.y+= 13;
					this.ship_mc.fire1.visible=false;
					this.ship_mc.fire2.visible=false;
					this.ship_mc.fire3.visible=true;
					this.y_out=this.ship_mc.y + 40;
					if (this.ship_mc.y >= 455) {
						this.ship_mc.y=455;
						this.y_out=this.ship_mc.y;
					}
				}
				if (this.move_right == false && this.move_left == false) {
					if (this.x_out > -1000) {
						this.ship_mc.x+= (this.x_out - this.ship_mc.x) / 10;
					}
					if (this.ship_mc.currentFrame != 1) {
						this.ship_mc.gotoAndStop(1);
					}
					if (this.ship_mc.x >= 420) {
						this.ship_mc.x=420;
						this.x_out=this.ship_mc.x;
					}
					if (this.ship_mc.x <= 15) {
						this.ship_mc.x=15;
						this.x_out=this.ship_mc.x;
					}
				}
				if (this.move_up == false && this.move_down == false) {
					if (this.y_out > -1000) {
						this.ship_mc.y+= (this.y_out - this.ship_mc.y) / 10;
					}
					this.ship_mc.fire1.visible=true;
					this.ship_mc.fire2.visible=false;
					this.ship_mc.fire3.visible=false;
					if (this.ship_mc.y >= 455) {
						this.ship_mc.y=455;
						this.y_out=this.ship_mc.y;
					}
					if (this.ship_mc.y <= 10) {
						this.ship_mc.y=10;
						this.y_out=this.ship_mc.y;
					}
				}
				// PRIMARY
				if (this.shoot == true) {
					if (this.weapon1 == 1) {
						// pulse blaster standard 
						if (this.counter1 % 4 == 0) {
							var myshot1:shot=new shot(this);
							myshot1.x=this.ship_mc.x -8 ;
							myshot1.y=this.ship_mc.y;
							this.shots.addChild(myshot1);
							this.shots_array.push(myshot1);

							var myshot11:shot=new shot(this);
							myshot11.x=this.ship_mc.x + 18;
							myshot11.y=this.ship_mc.y;
							this.shots.addChild(myshot11);
							this.shots_array.push(myshot11);
						}
					} else if (this.weapon1 == 2) {
						// w 2 hotwired pulse blaster
						if (this.counter1 % 2 == 0 && this.w2_heat < 1.0) {
							var myshot2:shot4=new shot4(this);

							myshot2.x=this.ship_mc.x - 12;
							myshot2.x+=-2+Math.floor(1+Math.random()*15);
							myshot2.y=this.ship_mc.y + 5;

							this.shots.addChild(myshot2);
							this.shots_array.push(myshot2);

							var myshot12:shot4=new shot4(this);
							myshot12.x=this.ship_mc.x + 18 ;
							myshot12.x+=-2+Math.floor(1+Math.random()*15);
							myshot12.y=this.ship_mc.y + 5;
							this.shots.addChild(myshot12);
							this.shots_array.push(myshot12);

							this.w2_heat+=0.01;
							this.w2.heat.scaleX=this.w2_heat;
						} else if (this.w2_heat > 0.99) {
							this.w2.overload.visible=true;
						}
					} else if (this.weapon1 == 3) {
						// burn
						if (this.counter1 % 5 == 0  && this.w3_heat < 1.0) {
							var myshot:shot_plasma=new shot_plasma(this);		
							this.shots_array.push(myshot);
							this.w3_heat+=0.03;
							this.w3.heat.scaleX=this.w3_heat;
						} else if (this.w3_heat > 0.99) {
							this.w3.overload.visible=true;
						}
					} else if (this.weapon1 == 4) {
						// AUTOCANNON
						if (this.counter1 % 7 == 0  && this.w4_heat < 1.0) {
							var myshot300:shot_auto=new shot_auto(this);			
							this.shots_array.push(myshot300);				
							this.w4_heat+=0.02;
							this.w4.heat.scaleX=this.w4_heat;
						} else if (this.w4_heat > 0.99) {
							this.w4.overload.visible=true;
						}
					} else if (this.weapon1 == 5) {
						// electrolutioner
						if (this.counter1 % 7 == 0) {
							var evolutioner1:shot5=new shot5(this);
							var evolutioner2:shot5=new shot5(this);		
							this.shots_array.push(evolutioner1);		
							this.shots_array.push(evolutioner2);
						}
					} else if (this.weapon1 == 6) {
						// gatling laser
						if (this.counter1 % 7 == 0  && this.w6_heat < 1.0) {
							var gatling1:shot3=new shot3(this,1);
							var gatling2:shot3=new shot3(this,2);	
							this.shots_array.push(gatling1);			
							this.shots_array.push(gatling2);		
							this.w6_heat+=0.02;
							this.w6.heat.scaleX=this.w6_heat;
						} else if (this.w6_heat > 0.99) {
							this.w6.overload.visible=true;
						}
					} 
				}
				if (this.weapon1!=2 || (this.shoot==false && this.weapon1==2)) {
					// cooldown
					this.w2_heat-=0.04;
					this.w2.overload.visible=false;
					if (this.w2_heat < 0) {
						this.w2_heat=0;
					}
					this.w2.heat.scaleX=this.w2_heat;
				}
				if (this.weapon1!=3 || this.shoot==false) {
					
					this.w3_heat-=0.04;
					this.w3.overload.visible=false;
					if (this.w3_heat < 0) {
						this.w3_heat=0;
					}
					this.w3.heat.scaleX=this.w3_heat;
				}
				if (this.weapon1!=4 || this.shoot==false) {
					
					this.w4_heat-=0.04;
					this.w4.overload.visible=false;
					if (this.w4_heat < 0) {
						this.w4_heat=0;
					}
					this.w4.heat.scaleX=this.w4_heat;
				}

				if (this.weapon1!=6 || this.shoot==false) {
					
					this.w6_heat-=0.04;
					this.w6.overload.visible=false;
					if (this.w6_heat < 0) {
						this.w6_heat=0;
					}
					this.w6.heat.scaleX=this.w6_heat;
				}
				// SECONDARY
				if (this.shoot2 == true) {
					if (this["w"+this.weapon2+"ammo"]>0) {
						if (this.weapon2 == 7 && this.w7ammo>0) {
							// detonator torpedo
							if (this.counter2 % 7 == 0) {
								this.w7ammo-=2;
								var myshot7_1:shot2=new shot2(this,1);
								var myshot7_2:shot2=new shot2(this,2);
								this.shots_array.push(myshot7_1);
								this.shots_array.push(myshot7_2);
							}
						} else if (this.weapon2 == 8 && this.w8ammo>0) {
							// phalanx missile
							if (this.counter2 % 15 == 0) {
								this.w8ammo-=2;
								var myshot8:shot8=new shot8(this);
								this.shots_array.push(myshot8);
							}
						} else if (this.weapon2 == 9 && this.w9ammo>0) {
							// drone
							
						} else if (this.weapon2 == 10 && this.w10ammo>0) {
							// quantum warhead
							if (this.counter2 % 40 == 0) {
								this.w10ammo-=1;
								var myshot10:shot10=new shot10(this);
								this.shots_array.push(myshot10);
							}
						}
						this.ammo_txt.text=""+this["w"+this.weapon2+"ammo"];
						if (this.weapon2 == 9) {
							this.ammo_txt.text="";						
						}
					}
				}
			}
			this.counter++;
			this.counter1++;
			this.counter2++;
			}			
		}
		public function m_r_f() {
			this.ship_mc.x+= 13;
			this.ship_mc.fire1.visible=true;
			this.ship_mc.fire2.visible=false;
			this.ship_mc.fire3.visible=false;
			
			if (this.move_up == false) {
				this.ship_mc.fire_side1.visible=true;
				this.ship_mc.fire_side2.visible=false;
			}
			else {
				this.ship_mc.fire_side1.visible=false;
				this.ship_mc.fire_side2.visible=true;				
			}
			
			this.x_out=this.ship_mc.x + 40;
			if (this.ship_mc.x >= 420) {
				this.ship_mc.x=420;
				this.x_out=this.ship_mc.x;
			}
			if (this.ship_mc.currentFrame != 3) {
				this.ship_mc.gotoAndStop(3);
			}

		}
		public function m_l_f() {
			this.ship_mc.x-= 13;
			this.ship_mc.fire1.visible=true;
			this.ship_mc.fire2.visible=false;
			this.ship_mc.fire3.visible=false;
			
			if (this.move_up == false) {
				this.ship_mc.fire_side1.visible=true;
				this.ship_mc.fire_side2.visible=false;
			}
			else {
				this.ship_mc.fire_side1.visible=false;
				this.ship_mc.fire_side2.visible=true;		
			}
			
			this.x_out=this.ship_mc.x - 40;
			if (this.ship_mc.x <= 15) {
				this.ship_mc.x=15;
				this.x_out=this.ship_mc.x;
			}
			if (this.ship_mc.currentFrame != 2) {
				this.ship_mc.gotoAndStop(2);
			}
		}
		public function nextlevel() {
			
			this.ship_mc.x=220;
			this.ship_mc.y=400;
			this.x_out=220;
			this.y_out=400;
			
			//after respawn
			if (this.ship.health <= 0) {
				this.start_game();
			}
			
			this.mission_nr++;
			this.bg_music();
			// STAGE NAMEs 
			this.names_mc.visible=true;
			this.names_mc.gotoAndPlay(this.mission_nr);
			
			// STATION LEAVE NAMEs 
			//todo: removable? this.station_leave_main_eng.gotoAndPlay(this.mission_nr);
						
			this.trader.visible=false;
			this.ship_mc.x=220;
			this.ship_mc.y=400;
			this.bg1.gotoAndStop(this.mission_nr);
			this.bg2.gotoAndStop(this.mission_nr);
			this.counter=0;
			this.zustand=0;
			
			this.total_kills+=this.kills;
			this.total_shots+=this.ss;
			this.ss=0;
			this.p_d=0;
			this.sshit=0;
			this.kills=0;
			this.no_shot_fired=0;
			this.nsf=0;
			this.no_shot2_fired=0;
			this.ns2f=0;
			this.matsched=0;
			this.enemy_count=0;

		}
		public function xpa(nr:int){
			if(nr==1){
				if(this.mission_nr==1){
					if(this.station0.currentFrame<this.station0.totalFrames){
						this.station0.stop();
					}
				}else if(this.mission_nr==2){
					
				}else if(this.mission_nr==3){
					
				}else if(this.mission_nr==4){
					
				}else if(this.mission_nr==5){
					
				}else if(this.mission_nr==6){
					
				}
			}else{
				if(this.mission_nr==1){
					if(this.station0.currentFrame<this.station0.totalFrames){
						this.station0.play();
					}
				}else if(this.mission_nr==2){
					
				}else if(this.mission_nr==3){
					
				}else if(this.mission_nr==4){
					
				}else if(this.mission_nr==5){
					
				}else if(this.mission_nr==6){
					
				}
			}
		}
		//Key functions
		public function keydown(event:KeyboardEvent) {
			
			if(gp==0 && this.ship.health > 0){
				if (this.zustand < 2) {
					//x primary fire
					if (event.keyCode == 88) {
						if (this.shoot == false) {
							this.p_d++;
							this.no_shot_fired++;
							this.shoot=true;
							this.counter1=0;
						}
	
					}
					//c secondary fire
					if (event.keyCode == 67) {
						if (this.shoot2 == false) {
							this.shoot2=true;
							this.no_shot_fired++;
							this.no_shot2_fired++;
							this.counter2=0;
						}
					}
					/*if (event.keyCode == 81) {
					if (this.shoot3 == false) {
					this.shoot3=true;
					this.counter1=0;
					}
					}*/
					if (event.keyCode == 37 || event.keyCode == 65) {
						this.move_left=true;
					}
					if (event.keyCode == 39 || event.keyCode == 68) {
						this.move_right=true;
					}
					if (event.keyCode == 38 || event.keyCode == 87) {
						this.move_up=true;
					}
					if (event.keyCode == 40 || event.keyCode == 83) {
						this.move_down=true;
					}
	
					if (this.weapons_available[0] == 1) {
						if (event.keyCode == 49 || event.keyCode == 97) {
							this.primary.gotoAndStop(1);
							this.weapon1=1;
							this.weapons_oo();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon2 - on
					if (this.weapons_available[1] == 1) {
						if (event.keyCode == 50 || event.keyCode == 98) {
							this.primary.gotoAndStop(2);
							this.weapon1=2;
							this.weapons_oo();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon3 - on
					if (this.weapons_available[2] == 1) {
						if (event.keyCode == 51 || event.keyCode == 99) {
							this.primary.gotoAndStop(3);
							this.weapon1=3;
							this.weapons_oo();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon4 - on
					if (this.weapons_available[3] == 1) {
						if (event.keyCode == 52 || event.keyCode == 100) {
							this.primary.gotoAndStop(4);
							this.weapon1=4;
							this.weapons_oo();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon5 - on
					if (this.weapons_available[4] == 1) {
						if (event.keyCode == 53 || event.keyCode == 101) {
							this.primary.gotoAndStop(5);
							this.weapon1=5;
							this.weapons_oo();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon6 - on
					if (this.weapons_available[5] == 1) {
						if (event.keyCode == 54 || event.keyCode == 102) {
							this.primary.gotoAndStop(6);
							this.weapon1=6;
							this.weapons_oo();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon7 - on
					if (this.weapons_available[6] == 1) {
						if (event.keyCode == 55 || event.keyCode == 103) {
							this.secondary.gotoAndStop(1);
							this.weapon2=7;
							this.ammo_txt.text=""+this["w"+this.weapon2+"ammo"];
							this.weapons_oo();
							//this.drone_off();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon8 - on
					if (this.weapons_available[7] == 1) {
						if (event.keyCode == 56 || event.keyCode == 104) {
							this.secondary.gotoAndStop(2);
							this.weapon2=8;
							this.ammo_txt.text=""+this["w"+this.weapon2+"ammo"];
							this.weapons_oo();
							//this.drone_off();
							this.SoundEffect("weapon_switch");
						}
					}
					// weapon9 - on
					if (this.weapons_available[8] == 1) {
						if (event.keyCode == 57 || event.keyCode == 105) {
							if(this.weapon2!=9){
								if (! this.drone.visible) {
									this.drone_on();
								}
								this.secondary.gotoAndStop(3);
								this.weapon2=9;
								this.ammo_txt.text="";
								this.weapons_oo();
								this.SoundEffect("weapon_switch");
							}
						}
					}				
					// weapon10 - on
					if (this.weapons_available[9] == 1) {
						if (event.keyCode == 48 || event.keyCode == 96) {
							this.secondary.gotoAndStop(4);
							this.weapon2=10;
							this.ammo_txt.text=""+this["w"+this.weapon2+"ammo"];
							this.weapons_oo();
							//this.drone_off();
							this.SoundEffect("weapon_switch");
						}
					}
					// wischer - on
					if (event.keyCode == 86) {
						if (this.wischer.currentFrame==1 && this.wischer_pressed==0) {
							this.wischer_pressed=1;
							this.wischer.gotoAndPlay(2);
							this.matsch_zustand = 0;
							this.SoundEffect("wiper");
						}
					}
				}
			}
		}
		public function keyup(event:KeyboardEvent) {
						
			//ENTER restart game
			if (event.keyCode == 13 && 
				this.death_message.currentFrame == death_message.totalFrames && 
				this.death_message.visible == true && 
				this.vermin_briefing.visible == false &&
				this.vermin_menu.visible == false)
				{
					
				this.health.scaleY=1;		// reset health bar
				this.matsch_zustand = 0;	// reset blood on screen
				//disable boss features
				if (this.bossmode) {
					this.bosshealth.visible = false;
					this.bossmode = false;
				}
				this.matsch.gotoAndStop(0);
				//continue in last briefing (max 3 times)
				if (this.game_continues > 0) {
					this.game_continues = this.game_continues - 1;
					this.mission_nr--; //will be +1 in briefing
					this.briefing.showStage(this.mission_nr+1);
				}
				//back to start menu
				else {
					this.mission_nr=0;
					this.game_continues=3;
					this.start_as.activate();
				}
			}
			
			//f fullscreen toggle
			if(event.keyCode==70){
				if (this.real_root.stage.displayState == StageDisplayState.FULL_SCREEN) {
					this.real_root.stage.displayState=StageDisplayState.NORMAL;
				} else {
					this.real_root.stage.displayState=StageDisplayState.FULL_SCREEN;
				}
			}
			//esc
			if (event.keyCode==27) {
				//exit full screen if set
				if(this.real_root.stage.displayState == StageDisplayState.FULL_SCREEN){
					this.real_root.stage.displayState=StageDisplayState.NORMAL;
				}
				//pause toggle
				else {
					if(this.gp==0){
						this.pause_as.enable();
					}else{
						this.pause_as.disable();
					}
				}
				
			}
			//p pause toggle
			if(event.keyCode==80){
				if(this.gp==0){
					this.pause_as.enable();
				}else{
					this.pause_as.disable();
				}
			}
						
			if (event.keyCode == 88) {
				this.shoot=false;
				this.p_d++;
			}
			if (event.keyCode == 67) {
				if (this.weapon2 == 9) {
					if (this.drone.visible) {
						this.drone_off();
					}
					else {
						this.drone_on();
					}
				}
				this.shoot2=false;
			}
			if (event.keyCode == 37 || event.keyCode == 65) {
				this.move_left=false;
			}
			if (event.keyCode == 39 || event.keyCode == 68) {
				this.move_right=false;
			}
			if (event.keyCode == 38 || event.keyCode == 87) {
				this.move_up=false;
			}
			if (event.keyCode == 40 || event.keyCode == 83) {
				this.move_down=false;
			}
			if (event.keyCode == 86) {
				if (this.wischer_pressed==1) {
					this.wischer_pressed=0;
				}
			}
		}
		public function matsch_f() {
			var matsch_color:ColorTransform=new ColorTransform();
			if (this.mission_nr==1) {
				matsch_color.color=0x760101;
			} else if (this.mission_nr==2) {
				matsch_color.color=0x11411C;
			} else if (this.mission_nr==3) {
				matsch_color.color=0x660033;
			} else if (this.mission_nr==4) {
				matsch_color.color=0xFF9900;
			} else if (this.mission_nr==5) {
				matsch_color.color=0x0096BD;
			} else if (this.mission_nr==6) {
				matsch_color.color=0x041C00;
			}
			this.matsch.transform.colorTransform=matsch_color;

			this.wischer.wischer1.wischer_matsch1.transform.colorTransform=matsch_color;
			this.wischer.wischer1.wischer_matsch2.transform.colorTransform=matsch_color;
			this.wischer.wischer1.wischer_matsch3.transform.colorTransform=matsch_color;
			
			this.wischer.wischer1.wischer_matsch1.visible=false;
			this.wischer.wischer1.wischer_matsch2.visible=false;
			this.wischer.wischer1.wischer_matsch3.visible=false;
			
			this.matsch_zustand++;
			this.matsched++;
			if (this.matsch_zustand==1) {
				this.matsch_random=Math.floor(Math.random()*9);
			}
			if (this.matsch_zustand<9) {
				this.matsch.gotoAndStop(10+this.matsch_random*10+this.matsch_zustand);
			}
			
			if (this.matsch.currentFrame%10 <= 3) {
				this.wischer.wischer1.wischer_matsch1.visible=true;
			} else if (this.matsch.currentFrame%10 <= 6) {
				this.wischer.wischer1.wischer_matsch2.visible=true;
			} else if (this.matsch.currentFrame%10 <= 9) {
				this.wischer.wischer1.wischer_matsch3.visible=true;
			}
			
			this.total_matsch++;
		}
		public function drone_on() {
				this.drone.activate();
			}
		public function drone_off() {
				this.drone.deactivate();
			}
		public function broken_f(broken_nr:int) {
			if (broken_nr==0) {
				this.broken_zustand++;
				if (this.broken_zustand==1) {
					this.broken_random=Math.floor(Math.random()*8);
				}
				this.broken.gotoAndStop(1);
			}
			if (this.ship.health>=1000) {
				this.broken.gotoAndStop(1);
			} else if (this.ship.health<=999 && this.ship.health>960) {
				this.broken.gotoAndStop(10+this.broken_random*20);
			} else if (this.ship.health<=960 && this.ship.health>900) {
				this.broken.gotoAndStop(10+this.broken_random*20+1);
			} else if (this.ship.health<=900 && this.ship.health>800) {
				this.broken.gotoAndStop(10+this.broken_random*20+2);
			} else if (this.ship.health<=800 && this.ship.health>700) {
				this.broken.gotoAndStop(10+this.broken_random*20+3);
			} else if (this.ship.health<=700 && this.ship.health>600) {
				this.broken.gotoAndStop(10+this.broken_random*20+4);
			} else if (this.ship.health<=600 && this.ship.health>500) {
				this.broken.gotoAndStop(10+this.broken_random*20+5);
			} else if (this.ship.health<=500 && this.ship.health>400) {
				this.broken.gotoAndStop(10+this.broken_random*20+6);
			} else if (this.ship.health<=400 && this.ship.health>300) {
				this.broken.gotoAndStop(10+this.broken_random*20+7);
			} else if (this.ship.health<=300 && this.ship.health>200) {
				this.broken.gotoAndStop(10+this.broken_random*20+8);
			} else if (this.ship.health<=200 && this.ship.health>100) {
				this.broken.gotoAndStop(10+this.broken_random*20+9);
				this.health_warning.gotoAndPlay(2);
			} else if (this.ship.health<=100 && this.ship.health>50) {
				this.broken.gotoAndStop(10+this.broken_random*20+10);
			}
		}
		
		public function blueprints_scroll() {
            if(this.currentFrame==1){
                if (this.mouseX<250) {
                    this.menu_bg.x += -this.menu_bg.x/70;
                    if (this.menu_bg.x>=0) {
                        this.menu_bg.x = 0;
                    }
                } else if (this.mouseX>250) {
                    this.menu_bg.x -= (553+this.menu_bg.x)/70;
                    if (this.menu_bg.x<=-553) {
                        this.menu_bg.x = -553;
                    }
                }
            }
		}
		
		public function updateMusicVolume(vol) {
			this.mixer.volume = vol;
			this.sndc1.soundTransform = this.mixer;
			this.sndc2.soundTransform = this.mixer;
		}
		
		public function updateEffectVolume(vol) {
			this.EffectMixer.volume = vol;
			this.sndEffectChannel.soundTransform = this.EffectMixer;
		}
		
		
		public function pauseGetFrames(content:DisplayObjectContainer):void
		{
			if (content is MovieClip) {
				this.pauseObjects.push(content);
				this.pauseFrameList.push((content as MovieClip).currentFrame);
			}
		   
			if (content.numChildren)
			{
				var child:DisplayObjectContainer;
				for (var i:int, n:int = content.numChildren; i < n; ++i)
				{
					if (content.getChildAt(i) is DisplayObjectContainer)
					{
						child = content.getChildAt(i) as DisplayObjectContainer;
					   
						if (child.numChildren)
							this.pauseGetFrames(child);
						else if (child is MovieClip) {
							this.pauseObjects.push(child);
							this.pauseFrameList.push((child as MovieClip).currentFrame);
						}
					}
				}
			}
		}
		
		public function pauseAll(content:DisplayObjectContainer):void
		{
			var id:int;
			var lastFrame:int
			
			if (content is MovieClip) {
				id = this.pauseObjects.indexOf(content);
				lastFrame = this.pauseFrameList[id];

				if ((content as MovieClip).currentFrame != lastFrame) {
					this.unpauseMe.push(content);
					this.pauseFrameReturn.push((content as MovieClip).currentFrame);
					(content as MovieClip).stop();
				}
			}
		   
			if (content.numChildren)
			{
				var child:DisplayObjectContainer;
				for (var i:int, n:int = content.numChildren; i < n; ++i)
				{
					if (content.getChildAt(i) is DisplayObjectContainer)
					{
						child = content.getChildAt(i) as DisplayObjectContainer;
					   
						if (child.numChildren)
							this.pauseAll(child);
						else if (child is MovieClip) {
							id = this.pauseObjects.indexOf(child);
							lastFrame = this.pauseFrameList[id];
							
							if ((child as MovieClip).currentFrame != lastFrame) {
								this.unpauseMe.push(child);
								this.pauseFrameReturn.push((child as MovieClip).currentFrame);
								(child as MovieClip).stop();
							}
						}
					}
				}
			}
		}
		
		public function unpauseAll(content:DisplayObjectContainer):void
		{
			var id:int;
			
			if (content is MovieClip) {
				id = this.unpauseMe.indexOf(content);
				if (id > -1) {
					(content as MovieClip).gotoAndPlay(this.pauseFrameReturn[id]);
				}
			}
		   
			if (content.numChildren)
			{
				var child:DisplayObjectContainer;
				for (var i:int, n:int = content.numChildren; i < n; ++i)
				{
					if (content.getChildAt(i) is DisplayObjectContainer)
					{
						child = content.getChildAt(i) as DisplayObjectContainer;
					   
						if (child.numChildren)
							this.unpauseAll(child);
						else if (child is MovieClip) {
							id = this.unpauseMe.indexOf(child);
							if (id > -1) {
								(child as MovieClip).gotoAndPlay(this.pauseFrameReturn[id]);
							}
						}
					}
				}
			}
		}
	}
}