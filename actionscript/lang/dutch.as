// LANGUAGE _ Dutch
package lang{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.*;
	public class dutch extends MovieClip {
		public var myroot:MovieClip;
			//Achievement Descriptions
			public var a1:String="OL´ DIEHARD\n \nWhen the smoke is coming out of countless holes and the warning lights flash in bright red all the time, you know this was a close call. \nFinish a run with 5% of hull integrity - or less.";
			public var a2:String="PIECE OF CAKE \n \nSome are great pilots, others are just incredibly lucky. In any case, it just feels great to see your ship roll back into the hangar without a scratch. \nFinish a run without getting hit.";
			public var a3:String="FLOWER CHILD\n \nSometimes, even vermin exterminators feel sorry for those little things. They aren't even that ugly and almost never kill someone. Until one starts to miss the way they pop when they die. \nDon't kill any of the drones, just the boss.";
			public var a4:String="TRIGGER FREAK\n \nIt's always kinda cool when blaster barrels start to get that orange glow and the warnings flash to tell you they're not made for so much punishment. \nFire the primaries through the entire level.";
			public var a5:String="CLEANSWEAP\n \nWhen you wreaked true havoc on the hordes of vermin and the number on the paycheck does reflect that too, you know it has been a good run. More than just another day at the office. \nKill 95% of all the bugs - or more.";
			public var a6:String="BULLSEYE\n \nHigh hit percentage looks just great on any pilot rating and is something to brag about on late nights in bars as well. \nMake 80% or more of you shots count.";
			public var a7:String="KILLCOUNTER \n \nThere comes a point in a slimer merc's life when one stops adding notches to the stock. However, in an age of every shred of information being digitally filed, one celebrates the milestones, at least. \nKill 1000 bugs.";
			public var a8:String="BUG STOMPER \n \nWhen vermin hunting becomes a scoreboard sport. \nKill 5000 bugs.";
			public var a9:String="KAMIKAZE \n \nWho would willingly crash into those creatures just to see them up close being fried alive by the deflector shields? \nCollide with 10 bugs.";
			public var a10:String="BLOODBATH \n \nOne might think that blooddrenched weapons and barbaric carnage have no place in an age of homing missiles and long range lasers. \nKill more than 80% of a level's bugs in close combat and splatter their innards across your windshield.";
			
			public var a11:String="SPLATTOPHOBIA \n \nIt's totally gross to clean the ship from gallons of entrails after -close- encounters of the third. You do realize that you have to do that yourself after every job, right? Some mercs just fly close scrapes by star coronae to have them vaporize, but they're just lazy. \nKill 80% of all bugs at least, but don't get blood on the windshield.";
			public var a12:String="DEATH DRIVER \n \nReckless flying with full afterburners in a swarm of flying aliens is just asking for head-on collisions. Maybe that's what you're going for 'cause you have some kind of bet or are compensating... or whatever. \nFly on the upper part of the screen until the boss arrives.";
			public var a13:String="OLD SCREW \n \nSometimes it makes sense to save money for missiles and bombs when you have reactor-fed guns that eat only energy for ammo. Sometimes not. Don't fire any secondaries all level.";
			public var a14:String="PYROMANIAC \n \nExplosions. Not only are they useful for taking out large groups, they are entertaining, too! From the package slip of Detonator Torpedos: Far enough away to not-be-torn-to-shreds, close enough to feel the blastwave in your bones. \nHit with over 100 missiles in a level.";
			public var a15:String="RETIREMENT FUNDS \n \nVacation on Risa, a new ship, a mansion or freedom from the debts? With great money comes great irresponsibility. Amass 1000000 Credits.";
			public var a16:String="PIMP MY RIDE \n \nJust when you thought your ship has enough wings, comes along the newest body kit with yet another set of spoilers and a free pair of fuzzy dice for your cockpit. \nFully upgrade your ship.";
			public var a17:String="PROVEN NINJA MASTER \n \nWith the reflexes and skill of ancient shadow warriors, your danger-filled profession has become a constant battle against your bold, self-set standards (and the fear of dying at the pincers of an invertebrate). \nFinish a level having killed more than 80% of all bugs, without taking damage and without being stained by alien blood.";
			public var a18:String="A PIRATE I WAS MEANT TO BE \n \nAye, 'tis a fine day for takin' to the high skies, cuttin' some yellow-bellied gut, plunderin' the creds'o'eight an' drownin' me sins in gunpowder-laced Aldebaran Grog, YARRR!!	(seriously, don't fly drunk though, unless it's an exception). \nFly on the upper part of the screen until the boss arrives, kill more than 90% of all bugs and hit with 100 missiles!";
			public var a19:String="BEEN THERE - DONE THAT \n \nThe end of this tour of duty - duty to yourself, that is. You paid off your creditors and can lay low for a while. \nFinish the game.";
			public var a20:String="TROPHY HUNTER \n \nThe wall in your study hung with chitin shells and stuffed heads of giant beasts - reflecting on a career of exterminating vermin and swimming pools worth of bug blood, one question persistently harrows your thoughts: Where to find more? \nUnlock all achievements.";
			//Welcome Txt --------
			//Jar'edd
			public var t_1_1:String="Hey there, welcome to the Buy'n'Fly! \nSo, you're new to the business? No sweat. Did some bounty hunting in my time as well. Here's a tip right away - as soon as possible, invest in some new hardware. Firepower is essential when you wanna get by - every merc has to face a great deal of opposition sooner or later and a standard issue blaster just won't cut it for too long. So, happy shopping, good hunting and try to get a cheap laugh or two out of wiping guts from your windscreen! By the way, if you come across my pet-Zusel, please tell me. I miss him. He's green and furry and likes swamp cookies.";
			//C-Faic
			public var t_1_2:String="Nah, great, anotha zlimer merc. \nZo... vuzit gunna be? Mizziles or zumthin... eh... lazer? C'mon, ai aint goz all friggn day. Ai mean, ye gozzum credz, rait? Don needz no vindo-zhoppin zunuvabitch, knoamzayn?";
			//Angrehspaic
			public var t_1_3:String="Better keep your weapons holstered, stranger. My autoguns are tracking you, so don't think you can steal anything. If you're here to do business, you're sure to find what you're looking for. If you're here to piss me off, so help me, I'll kick you out the airlock!";
			//F0RM47-C
			public var t_1_4:String="-greetings-alien-creature- \n-warning-\n-sensors-indicate-unidentified-lifeform-in-close-proximity- \n -scanning- \n -link-with-biological-database-established- \n -lifeform-identified- \n -classification-species-5P1N35N4P-00946- \n -designation-zusel- \n -initiating-pest-control-protocol- \n -procedure-halted- \n -sensors-indicate-organism-relocated-to-vessel-docked-at-bay-seven- \n -infestation-area-exceeds-jurisdiction- \n -procedure-cancelled- \n -we-apologize-for-stated-inconvenience- \n -initiating-business-negotiation-protocol- \n -indicate-desired-transaction- \n -thank-you-";
			//Anthraxrawx
			public var t_1_5:String="Welcome, traveller. \n We here at Anthraxine Hardware Emporium offer the finest in sophisticated heavy duty working equipment. \n We are selling long-range sports and hunting utilities, napalm-based large-scale vegetation control devices, high-power particle emitter relays for scientific and communication purposes and the latest in mining laser technology. Proper license required. \n How may we help you today? \n Special offer: free hull wash for every purchase above 1000c.";
			//Splurk
			public var t_1_6:String="Hey there. \n Come in, Splurk of the merchant guild at your service. \n We got some new powerful hardware shipped last month, browse the selection and take your pick. \n Umm... excuse me, but... is that a Zusel you got there? \n Sorry, but they're not allowed in here. Nasty little creatures, good for nothing, eating like Hutts and breeding like Tribbles. \n Just make sure you keep it out of my store and there will be no problems.";
			//Jar'edd (again)
			public var t_1_7:String="Welcome to Buy'n'Fly. \n Hey, it's you, glad to see you're still breathing. Looks like you made yourself some creds along the way and your ship sure has seen some action. Feel free to browse the collection as usual. \n What? My Zusel? You found it!! Aah, c'mere ye little thingy, daddy missed you. I'm so glad you brought it back to me. Look, I gotta repay you. Last week I found some interesting knick-knacks on a Regilian trade bazaar. Among them was a laser-sweeper, custom made for slimer mercs that have a lot of alien guts to wipe off their windshields. Or bounty hunters, if you prefere that term. \n I think the sweeper is just the thing for you, so, it's yours. \n Have fun and try not to die.";

			//Trader Short Messages [random x 5] --------
			//Buy success
			public var t_2_1_1:String="More means of destruction means more destruction!";
			public var t_2_1_2:String="*Hmm!* \nThat's lots of killsticks for me. \n Anything else?";
			public var t_2_1_3:String="Deal.";
			public var t_2_1_4:String="Thanks friend! \nHappy hunting!";
			public var t_2_1_5:String="Good choice!"; 
			//Buy fail
			public var t_2_2_1:String="You need more cash.";
			public var t_2_2_2:String="Not enough money.";
			public var t_2_2_3:String="Think you get a loan? \nThink again.";
			public var t_2_2_4:String="You have to pay for public var  \nI only take creds.";
			public var t_2_2_5:String="You fly for hire? \n Then get hired. \nCome back with creds.";
			//Sell success
			public var t_2_3_1:String="Nice doing business with you.";
			public var t_2_3_2:String="I will give this to my cousin. \nHe is a great pilot... \n... or so he said.";
			public var t_2_3_3:String=" Guess I can use public var ";
			public var t_2_3_4:String="Makes a fine birthday present for grandma.";
			public var t_2_3_5:String="Yes, stuff. \nAlways looking for more. \nGot stuff? \nLet's talk.";
			//Sell fail
			public var t_2_4_1:String="Yeah. You need to HAVE one of those to sell them.";
			public var t_2_4_2:String="*Chrm* ";
			public var t_2_4_3:String="*Sigh* \nYou wanna SELL it, you oughta OWN it.";
			public var t_2_4_4:String="How should that work?";
			public var t_2_4_5:String="WTF!?";
			//Buy double
			public var t_2_5_1:String="Nah, would go well beyond specs, sorry.";
			public var t_2_5_2:String="Already installed.";
			public var t_2_5_3:String="There are limitations to fighter craft. \nGet a second-hand battlecruiser and rack it up for kicks.";
			public var t_2_5_4:String="Double the fun, hm? \nWell, not on such a small ship.";
			public var t_2_5_5:String="Going for overkill, are we?";
			//Only 50 Pack
			public var t_2_6_1:String="Rockets only in packs of 50.";
			public var t_2_6_2:String="Nah, peanuts.";
			public var t_2_6_3:String="Bulk supplies only. ";
			public var t_2_6_4:String="Only 100 at once.";
			public var t_2_6_5:String="Sorry, 100 at once.  \nI´ve got already too many open boxes.";
			//Standard Blaster
			public var t_2_7_1:String="Don't want it either. \nThat blaster is too... \n... civil.";
			public var t_2_7_2:String="I don´t take blasters.";
			public var t_2_7_3:String="Sorry, the blaster is a standard component to your ship, so taking it out would be more trouble than it's worth.";
			public var t_2_7_4:String="This stuff is pretty retro. \nNo deal.";
			public var t_2_7_5:String="I buy top performance hardware  only. \nTake yer trash to the dump.";
			//Rumors
			public var t_2_8_1:String="... Why'd the chicken miss the jump-gate? \nCause... \nHeh, never gets old. Kaplah!";
			public var t_2_8_2:String="So, there was this bounty hunter that other day, told him, get a checkup on yer core. And HE says, nah, it's cool. So he takes off and- ... ah well.";
			public var t_2_8_3:String="I heard that Tomas Flup, the president of the New Groundings deep space colony, has enforced thousands of executions on spam raiders.";
			public var t_2_8_4:String="Ever been to the Enigma cluster? I watched c-beams there, glitter in the dark near Tannhäuser Gate.";
			public var t_2_8_5:String="They say there's a one-headed brahmin on display in the museum of genetics on Thetis Seven. Of course, that's only a myth.";
			//Welcome mini-msg / random msg
			public var t_2_9_1:String="Step right up, sit right down...";
			public var t_2_9_2:String="Take your pick!";
			public var t_2_9_3:String="Welcome, traveler! \nNot everything you see here is original but it´s at prices one can afford.";
			public var t_2_9_4:String="Come one, come all!";
			public var t_2_9_5:String="Come on in, amuse yourself!";


			//Level Intro / Briefing --------
			// NOVA 
			public var t_3_1:String="CRITTER INVESTATION \n \nThe surface of Balrog VII in the Vendi System is about to be colonized for ore mining. Unfortunately, the toxines in its atmosphere provide a perfect environment for mutant species, which emerged when the planet was considered meaningless and used as a giant galactic trash dump by 326 different worlds. Handsome payments for any merc to do the run, pay per kill.";
			//ARACHNA
			public var t_3_2:String="ARACHNOIDAL ORGANISMS \n \nThe second moon of Tremis Minor B could very well be called \"alife\". \nBeneath the rugged surface an immensely large mushrom has thriven throughout the centuries, now inhabiting over thirty percent of the entire satellite. The primitive tribal cultures living down on the planet have somehow become spiritually aware of its presence long ago, now worshipping it as their lunar god. They are willing to pay in gemstones for its preservation, meaning the extermination of parasites that infest the mushroom's roots.";
			//REEF
			public var t_3_3:String="MACROCORAL COLONY \n \nThe planet Risa in the Beta quadrant had been the aim of tourists for centuries. It had been a weather regulated tropical paradise until someone pressed the wrong button and made the climate control go berserk. Noone knows how, but nearly all coral reefs near the western continent began growing uncontrolled and for reasons unknown, a collective intelligence has emerged. Nearly all sea dwelling creatures are now under its control, aggressively attacking anyone to come close enough. Waste them, than use your drive to roast one for dinner.";
			//BUGS
			public var t_3_4:String="INSECTOID PARASITES \nThe entire planet of Xegis-En-Dam is covered by a single, giant city. Almost all indigenous life is extinct by now, leaving only its conquerors - and their pests. The colonists of Xegis are immensely giant creatures of about 40 meters of height. Now, what they consider Bugs are beings that would ingest the average humanoid in about one quick bite. Still, they are quite bothersome to the Xegons, so they called the exterminators. Time to weed out some vermin!";
			//CORRIDOR
			public var t_3_5:String="CRYSTALLINE ENTITIES \nThis one came in from the merchant guild. An important supply route through the Gamma Eridon nebula known as the \"Corridor\" has been declared a war zone due to several ships reported missing and deemed either seized or destroyed. The merchant vessels are bulky and slow, with little to no armaments at all, so pirates and raiders might be involved.However, before the Confeds bother rushing warships in, they usually want the region scouted so they know if nuking the threat is worth the hassle. Chance for the scum to make some quick buck - and that's where you come in.";
			// NECROBE
			public var t_3_6:String="ORGANIC MATTER FEEDING LIFEFORMS \n \nHope you like a rough ride, cause this one's quite nasty. The royal family of Mandakh, which governs the system of the same name, has made it a matter of etiquette for the emperor, his first mistress and the prince to own one of the (several miles long) giant worm creatures that live on their planet - as pets. His Highness has ordered regular, complete physicals on the male alpha worm, his beloved -Snoopy-. Your task is to pilot your ship through the prime orifice (on its front end), enter its insides and gun down any parasite bigger than a womp-rat (noone could possibly hit the smaller ones anyway).";
			//MK II
			public var t_3_7:String="CYBERNETICALLY ENHANCED SPECIMEN \n \nThe imperial alpha worm has recently gone mad, shortly after your parasite removal job was completed. It has been rampaging through the residental district of one of Mandakh's cities. The log of your cleansing run through the worm has been analyzed by the imperial authorities. They seem to have found a rather unusual situation: One infesting critter has attatched itself to the animal's brain and begun to control its movements. The intentions of the parasite are unknown, all we know is we want it killed. Easy enough? We thought so.";

			//Incomming Text Msg from Trader--------
			//C-Faic
			public var t_4_1:String="Now dere you are, makin yar derty monay bai zlautering mai brethren. \nYou vill pai for de deztruction you brougt among mai kin and ve vill take diz planet az our own! De viruz in yur zistem vill dizrupt yur zhipz komputrr, zo yu vill krash. \nThen ve vill take yu to ze queen and zhe vill make zhure yu'll be alive vor a long, long time.";
			//
			public var t_4_2:String="Watchout, there are lots pieces of scrap like this one around here. Do us a favor and burn them.";
			//
			public var t_4_3:String="Text";

			//Weapon Title --------
			//Alway the same text, just bigger font size than description text.
			public var t_5_1:String="Pulse Blaster";
			public var t_5_2:String="Hotwired Pulse";
			public var t_5_3:String="Plasma Melter";
			public var t_5_4:String="Autocannon";
			public var t_5_5:String="Electrocutioner";
			public var t_5_6:String="Fusion Laser";

			public var t_5_7:String="Detonator Torpedo";
			public var t_5_8:String="Phalanx Missile";
			public var t_5_9:String="Gundrone";
			public var t_5_10:String="Quantum Warhead";

			public var t_5_11:String="Shield Charges";
			public var t_5_12:String="Backup Shield Generator";

			//Weapon Description --------
			//PULSE BLASTER
			public var t_6_1:String="The basic \"Riot Reaver\" blaster cannon issued to anyone who can afford a fake ID. Used mainly by police forces to handle civil rampage and dissident fractions.";
			//HOTWIRED PULSE BLASTER
			public var t_6_2:String="Kicked up with 4 intercooling devices, 2 fusion chargers, a bored-out barrel and some cracked and rewritten software to boost the power output. High stress on the reactor coils, so this might blow some circuits. \n Or maybe the ship.";
			//PLASMA MELTER
			public var t_6_3:String="Put together from an old pleasure droid and stuff you get in every drug store, this handy gadget shoots a spray of ionized gas to cloud whole vesels and melt them into steaming puddles of goo. \n I tried and it does burn in total vacuum so don't ask.";
			//AUTOCANNON
			public var t_6_4:String="The Autocannon uses a tracking system scavenged from a navigational satellite, modified to automate the targeting process. Don't worry about aiming, just hit fire and step on it.";
			//ELECTROCUTIONER
			public var t_6_5:String="It is possible to modify your ship's subspace relay antenna to direct energy charges straight from your reactor into the enemy. It will be anything but precise, so this is a gun for those who don't really care whom they grill.";
			//FUSION LASER
			public var t_6_6:String="The \"Broadsword\" laser cannon is a military high-end fusion weapon. To own one is entirely illegal so no crap about the price.";
			//DETONATOR TORPEDO
			public var t_6_7:String="Cheap and effective, but only in large quantities. Goes straight into the target, no guidance system.";
			//PHALANX MISSILE
			public var t_6_8:String="A little tricky. This one splits into many smaller explosives, creating a fiery wall of death. Good for crowd cleanup.";
			//GUNDRONE
			public var t_6_9:String="A drone that can be launched to fly by your ship, which is equipped with a Pulse Blaster to fire supporting bursts. \nOnce its energy is used up, it serves as an explosive device.";
			//QUANTUM WARHEAD
			public var t_6_10:String="Invented by a cybernetic brain within the government mainframe and mass produced by the Fakiu Union in slave labour. Since your own shield adjusts to the blast-wave frequence, it provides controlled mass-destruction. \nAlso, it glows in the dark!";
			//SHIELD CHARGES
			public var t_6_11:String="Your deflector shields are capable of stopping any kind of impact, energy or solid matter. But only as long as your power supplies can compensate for the field disruptions, meaning as long as they can patch up the holes that are torn by enemy fire. New charges can be purchased here, always make sure to fill 'er up before you roll.";
			//BACKUP SHIELD GENERATOR
			public var t_6_12:String="Your ship's shield generator sure has some output, but there are those moments when one just won't seem to cut it. We all know those moments, right? How about two of them? This may not be within safety limits. But head to head with a giant slime bug and a battered shield ain't either. \nOne gets you there, two get you back.";

		

			//Station Enter / Leave -------------
			//station 0
			public var station_leave_head_0:String = "LEAVING0";
			public var station_leave_subs_0:String = "Runway PQ-8";		
			
			//station 1
			public var station_enter_head_1:String = "ENTERING";
			public var station_enter_subs_1:String = "Civilian Carrier HDM 26-5 \nPopulation 26035 \nDestination Ctropo-Sector \n \nSection Fourteen Acres \nIf you lived here, you´d be home by now. \nOctagon Real Estate Agency";
			public var station_leave_head_1:String = "LEAVING";
			public var station_leave_subs_1:String = "Civilian Carrier HDM 26-5";
			
			//station 2
			public var station_enter_head_2:String = "ENTERING";
			public var station_enter_subs_2:String = "Ctropolis \nPopuation 1572 \nDestination Lululu-Sektor \n \nDecorating tips, cooking with Zoorzakgz and dissident execution, tonight at eight, only von FOGNL.";
			public var station_leave_head_2:String = "LEAVING";
			public var station_leave_subs_2:String = "Ctropolis";			
			
			//station 3
			public var station_enter_head_3:String = "ENTERING";
			public var station_enter_subs_3:String = "Nano Drome 7EE1 \n \nPopulation 12049 \nDestination Next SolarSystem \n \nTractor beam guidance locking on. \n Please disangage all thruster activity. \nReport to docking office 4. Thank you.";
			public var station_leave_head_3:String = "LEAVING";
			public var station_leave_subs_3:String = "Nano Drome 7EE1";			
			
			//station 4
			public var station_enter_head_4:String = "ENTERING";
			public var station_enter_subs_4:String = "Dump Town \nPopulation 7 \nDestination Next SolarSystem \n \nRummage sales every thursday. \nPremium offers for everything out of service and has-been.";
			public var station_leave_head_4:String = "LEAVING";
			public var station_leave_subs_4:String = "Dump Town";			
			
			//station 5
			public var station_enter_head_5:String = "ENTERING";
			public var station_enter_subs_5:String = "Battle Cruiser FUBA 7-XC \nPopulation 516 \nDestination Next SolarSystem \n \nBe all you can be. See the galaxy. \nServe your system and join the corps. \nSign up at recruitment office on deck 7.";
			public var station_leave_head_5:String = "LEAVING";
			public var station_leave_subs_5:String = "Battle Cruiser FUBA 7-XC";			
			
			//station 6
			public var station_enter_head_6:String = "ENTERING";
			public var station_enter_subs_6:String = "Fort Falcon XB GT \nPopulation 5604 \nDestination Le next Milkyway \n \nNarcotics, weapons, nerve gas and slaves only to be exchanged with legal permit by order of Governor Xark VIII.";
			public var station_leave_head_6:String = "LEAVING";
			public var station_leave_subs_6:String = "Fort Falcon XB GT";			
			
			//station 7
			public var station_enter_head_7:String = "ENTERING";
			public var station_enter_subs_7:String = "Runway PQ-8 \nPopulation 37 \n \nEngine overhaul, juicier thrusters and fuzzy dice for your cockpit! Stop by Hanks garage today!";		
					
			
			/*
			public var clip.wexit.trans.buttonMode=true;
			public var clip.wexit.trans.addEventListener(MouseEvent.MOUSE_DOWN,public var wexit_down);
			public var clip.wexit.trans.addEventListener(MouseEvent.MOUSE_OVER,public var wexit_over);
			public var clip.wexit.trans.addEventListener(MouseEvent.MOUSE_OUT,public var wexit_out);
			*/
		// public var prices:Array=[1000,3000,10000,10000,10000,30000,250,500,1000,1000,200,10000];
		public function dutch(root_p:MovieClip) {
			this.myroot=root_p;
		}
	}
}