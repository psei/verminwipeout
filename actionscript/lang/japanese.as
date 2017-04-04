// LANGUAGE _ Japanese
package lang{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.*;
	public class japanese extends MovieClip {
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
			public var t_1_1:String="やぁ、ようこそ Buy'n'Fly へ!新しい仕事に行くの?焦らないで。賞金付きのハンティン グの話がある。 報酬はすぐそこ。早ければ早いほど良い。他の武器に投資することも出来る。 あらゆる仕事に火力は欠かせない。そしてテクニックを要する。速く、遅く、そして爆発 を起こす必要がある。ただそう長くはもたないだろう。 ハッピーな買い物、いい狩り、そして大いに笑い、フロントガラスから邪魔者を拭い去ろ う! ところで、もし僕のペット・ツーゼルが横切ったら教えてほしい。彼が恋しい。緑の毛皮・ 湿ったクッキーが好物だ。";
			//C-Faic
			public var t_1_2:String="いや、すごいよ。 別の zlimer merc. だから・・行きたいの? Mizziles or zumthin... eh... レーザー? おいで, ai aint goz 全ての friggn 日. つまり, ye gozzum credz, rait? ビデオショッピングは必要ない zunuvabitch, knoamzayn?";
			//Angrehspaic
			public var t_1_3:String="今 汚い金を作る zlautering mai brethrenによって. 金を支払うだろうfor de deztruction 君は作ったものの中から運び、そして 私たちは持っていく diz 惑星 az わたしたち自身のものを! De viruz in yur zistem vill dizrupt yur zhipz komputrr, そして君は墜落するだろう。 では、わたしたちは君をze queenへ連れて行く。 そして、 彼女は作るだろう zhure 君は長い長い時間を生きることになるだろう。";
			//F0RM47-C
			public var t_1_4:String="-挨拶-エイリアン-創造物- \n -警告- -感知器-表示物-身元不明-生物形態-に-接近した-接近- \n -精査- \n -結合-と-生物学的な-データベース-確立した- \n -生物形態-同一であると認められた- \n -分類-種類-5P1N35N4P-00946- \n -名づけた-ツーゼルと- \n -着手する-害虫-管理する-通信規則- \n -手順-筋が通らない- \n -感知器-表示物-有機体-再配置する-へ-飛行船-ドックへ着けた-に-港-七つの - \n -侵食生物-地域-超えた-司法権- \n -手順-中止する- \n -わたしたちは-謝罪する-ために-定まった-迷惑をかける- \n -着手する-ビジネス-交渉-通信規制- \n -指示物-要求した-処理- \n -感謝する-あなたに-";
			//Anthraxrawx
			public var t_1_5:String="ようこそトラベラー。 \n ここはアンスラキシネ銃器専門店。闇の仕事用の高度な技術を提供している。 \n 私たちは、長距離スポーツ、実用的なハンティング、ナパーム爆弾、巨大植物、それにふ さわしいライセンスを必要とする。今日はいかようにいたしましょうか? スペシャルオファー:1000c 以上の買い物をすると船体の洗浄が無料に。";
			//Splurk
			public var t_1_6:String="やぁ、来たね。あなたの為のシュプルーク商業組合。わたしたちは、新しい強力な銃器を 先月手に入れた。ざっと目を通して、ピックアップしてくれ。 うーん・・あの・・、しかし、ツーゼルはそこにいるかな? ごめん、ここでは許可されていないんだ。 汚い小さな生き物、いいことはなにもない。外のパーキングメーターにつないで置けば問 題ない。";
			//Jar'edd (again)
			public var t_1_7:String="Welcome to Buy'n'Fly. \n へようこそ!生きてる君とまた会えてうれしいよ。君は君のやり方で君自身を 作ったようだね。そして君の船はきっと動いている。いつものように自由にコレクション に目を通してくれ。なに?僕のツーゼル?見つけたの!!あー かわいいかわいい僕のヘイビー ぎゅー パパだよー会いたかったよぅ。僕のところに連れて帰ってくれて本当に うれしいよ。これ、お返し。先週バザールで面白いものをみつけたんだ。レーザースウィー パーだよ。フロントガラスにくっつく粘着質のエイリアンを簡単に拭い去るための特注品 さ。君がもしチームに選ばれたら、これは君にとってうってつけのものになると思うよ。 楽しんで、そして死んだりしないでね。";

			//Trader Short Messages [random x 5] --------
			//Buy success
			public var t_2_1_1:String="More means of destruction means more destruction!";
			public var t_2_1_2:String="*Hmm!* \n That's lots of killsticks for me. \n Anything else?";
			public var t_2_1_3:String="Deal.";
			public var t_2_1_4:String="Thanks friend! \n Happy hunting!";
			public var t_2_1_5:String="Good choice!"; 
			//Buy fail
			public var t_2_2_1:String="You need more cash.";
			public var t_2_2_2:String="Not enough money.";
			public var t_2_2_3:String="Think you get a loan? \n Think again.";
			public var t_2_2_4:String="You have to pay for public var  \n I only take creds.";
			public var t_2_2_5:String="You fly for hire? \n Then get hired. \n Come back with creds.";
			//Sell success
			public var t_2_3_1:String="Nice doing business with you.";
			public var t_2_3_2:String="I will give this to my cousin. \n He is a great pilot... \n ... or so he said.";
			public var t_2_3_3:String=" Guess I can use public var ";
			public var t_2_3_4:String="Makes a fine birthday present for grandma.";
			public var t_2_3_5:String="Yes, stuff. \n Always looking for more. \n Got stuff? \n Let's talk.";
			//Sell fail
			public var t_2_4_1:String="Yeah. You need to HAVE one of those to sell them.";
			public var t_2_4_2:String="*Chrm* ";
			public var t_2_4_3:String="*Sigh* \n You wanna SELL it, you oughta OWN it.";
			public var t_2_4_4:String="How should that work?";
			public var t_2_4_5:String="WTF!?";
			//Buy double
			public var t_2_5_1:String="Nah, would go well beyond specs, sorry.";
			public var t_2_5_2:String="Already installed.";
			public var t_2_5_3:String="There are limitations to fighter craft. \n Get a second-hand battlecruiser and rack it up for kicks.";
			public var t_2_5_4:String="Double the fun, hm? \n Well, not on such a small ship.";
			public var t_2_5_5:String="Going for overkill, are we?";
			//Only 50 Pack
			public var t_2_6_1:String="Rockets only in packs of 50.";
			public var t_2_6_2:String="Nah, peanuts.";
			public var t_2_6_3:String="Bulk supplies only. ";
			public var t_2_6_4:String="Only 100 at once.";
			public var t_2_6_5:String="Sorry, 100 at once.  \n I´ve got already too many open boxes.";
			//Standard Blaster
			public var t_2_7_1:String="Don't want it either. \n That blaster is too... \n ... civil.";
			public var t_2_7_2:String="I don´t take blasters.";
			public var t_2_7_3:String="Sorry, the blaster is a standard component to your ship, so taking it out would be more trouble than it's worth.";
			public var t_2_7_4:String="This stuff is pretty retro. \n No deal.";
			public var t_2_7_5:String="I buy top performance hardware  only. \n Take yer trash to the dump.";
			//Rumors
			public var t_2_8_1:String="... Why'd the chicken miss the jump-gate? \n Cause... \n Heh, never gets old. Kaplah!";
			public var t_2_8_2:String="So, there was this bounty hunter that other day, told him, get a checkup on yer core. And HE says, nah, it's cool. So he takes off and- ... ah well.";
			public var t_2_8_3:String="I heard that Tomas Flup, the president of the New Groundings deep space colony, has enforced thousands of executions on spam raiders.";
			public var t_2_8_4:String="Ever been to the Enigma cluster? I watched c-beams there, glitter in the dark near Tannhäuser Gate.";
			public var t_2_8_5:String="They say there's a one-headed brahmin on display in the museum of genetics on Thetis Seven. Of course, that's only a myth.";
			//Welcome mini-msg / random msg
			public var t_2_9_1:String="Step right up, sit right down...";
			public var t_2_9_2:String="Take your pick!";
			public var t_2_9_3:String="Welcome, traveler! \n Not everything you see here is original but it´s at prices one can afford.";
			public var t_2_9_4:String="Come one, come all!";
			public var t_2_9_5:String="Come on in, amuse yourself!";


			//Level Intro / Briefing --------
			//NOVA 
			public var t_3_1:String="謎の生物の侵入 \n ヴェンディシステムの表面、鉱石マイニングの開拓地バルログVII。不運なことに、当時は 問題になっていなかった異なる 326 の世界による銀河の巨大なダストスペースが、大気中 に毒素を作り変異体を生み出す最適な環境を作っていることが判明した。 一体殺すごとにかなりの報酬が支払われる。";
			//MANTRAP
			public var t_3_2:String="クモのような生物 \n トレミス・マイナーの二番目の月、通称”アルフェ”。硬い表面の下には巨大キノコが繁 殖し、現在、体積の 30%を占めている。原始部族は霊的な力によりその存在を昔から知っ ていて、今は月の神として崇拝している。キノコの根を荒らす寄生虫を駆除することで、 彼らから報酬として宝石が与えられる。";
			//REEF
			public var t_3_3:String="巨大な集落 \n 四分儀座を構成している惑星のひとつ、惑星リサ。熱帯の楽園で、何世紀にも渡り旅人の 目的地だった。何者かが間違ったボタンを押し、気候のコントロールを狂わしてしまうま では。大陸の西側のほとんどが、自由に繁殖を続ける珊瑚礁に覆われた。そして未知の知 的生物体の群れが現れ、すべての海の生物は支配下に置かれ、無差別に攻撃を仕掛けるよ うになった。どうせ殺すならローストして食事にしよう。";
			//BUGS
			public var t_3_4:String="寄生虫 \n そのすべてがひとつの巨大都市になっている、惑星エグゼジズ・エン・ダム。現在はほと んどの現地生物が絶滅し、勝利者である全長 40 メートルにもなる種族と彼らの害虫たち しかいない。しかし今、害虫たちは人間を襲うようになり、彼らは救いを求めている。害 虫たちを駆除せよ!";
			//CORRIDOR
			public var t_3_5:String="透明な存在 \n それは貿易協会から来た。ガンマ・エリドン星雲を通過するための重要なルートとして知 られる”コリドール”。戦争水域として公表され、何隻かの船は行方不明になり、捕まる もしくは破壊されたとみられている。貿易船は巨大でスピードもなく、戦闘設備も整っていないため、海賊と関係があると推測される。小銭を稼ぐチャンスだ。";
			//NECROBE
			public var t_3_6:String="有機物質を供給する生物形態 \n インペリア・アルファ虫が狂い出してすぐ、寄生虫駆除の仕事が舞い込んだ。マンダクの 都市の中の居住区を荒らしまわっている。駆除の記録は帝国の権限で分析されている。そ してその結果分かったことがある。ある寄生虫がはびこっており、彼らは宿主の脳に結び つき、その肉体を操っている。目的はわからない。ただ分かっているのは、私たちが彼ら を殺さなければならないということ。簡単過ぎる?まったく同感だ。";
			//MK II
			public var t_3_7:String="脳を強化された検体 \n インペリア・アルファ虫が狂い出してすぐ、寄生虫駆除の仕事が舞い込んだ。マンダクの 都市の中の居住区を荒らしまわっている。駆除の記録は帝国の権限で分析されている。そ してその結果分かったことがある。ある寄生虫がはびこっており、彼らは宿主の脳に結び つき、その肉体を操っている。目的はわからない。ただ分かっているのは、私たちが彼ら を殺さなければならないということ。簡単過ぎる?まったく同感だ。";

			//Incomming Text Msg from Trader--------
			//C-Faic
			public var t_4_1:String="Now dere you are, makin yar derty monay bai zlautering mai brethren. \n You vill pai for de deztruction you brougt among mai kin and ve vill take diz planet az our own! De viruz in yur zistem vill dizrupt yur zhipz komputrr, zo yu vill krash. \n Then ve vill take yu to ze queen and zhe vill make zhure yu'll be alive vor a long, long time.";
			//
			public var t_4_2:String="Watchout, there are lots pieces of scrap like this one around here. Do us a favor and burn them.";
			//
			public var t_4_3:String="Text";

			//Weapon Title --------
			//Alway the same text, just bigger font size than description text.
			public var t_5_1:String="Pulse Blaster";
			public var t_5_2:String="Hotwired Pulse Blaster";
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
			public var t_6_1:String="標準型リオット・リーバー爆弾。偽造 ID では購入できない。主に警察が民間で暴力を振 るうものや、反対勢力に対抗する手段として使われている。";
			//HOTWIRED PULSE BLASTER
			public var t_6_2:String="起爆装置、4 つの冷却装置、2 つの装薬器、複数の銃口、そして銃声、出力を増加させる ソフトウェア。負担が大きいため技術力が必要とされる。";
			//PLASMA MELTER
			public var t_6_3:String="オールドプレジャーアンドロイドによって、ドラッグが全ての薬局で買えるようになる。 この小型銃はガスをイオン化させ雲状にし、対象を全て溶かす。このスチームに入ったも のは、どろどろの水溜りと化す。";
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
			public var t_6_9:String="A drone that can be launched to fly by your ship, which is equipped with a Pulse Blaster to fire supporting bursts. \n Once its energy is used up, it serves as an explosive device.";
			//QUANTUM WARHEAD
			public var t_6_10:String="Invented by a cybernetic brain within the government mainframe and mass produced by the Fakiu Union in slave labour. Since your own shield adjusts to the blast-wave frequence, it provides controlled mass-destruction. \n Also, it glows in the dark!";
			//SHIELD CHARGES
			public var t_6_11:String="Your deflector shields are capable of stopping any kind of impact, energy or solid matter. But only as long as your power supplies can compensate for the field disruptions, meaning as long as they can patch up the holes that are torn by enemy fire. New charges can be purchased here, always make sure to fill 'er up before you roll.";
			//BACKUP SHIELD GENERATOR
			public var t_6_12:String="Your ship's shield generator sure has some output, but there are those moments when one just won't seem to cut it. We all know those moments, right? How about two of them? This may not be within safety limits. But head to head with a giant slime bug and a battered shield ain't either. \n One gets you there, two get you back.";



			//Station Enter / Leave -------------
			//station 0
			public var station_leave_head_0:String = "LEAVING0";
			public var station_leave_subs_0:String = "Runway PQ-8";		
			
			//station 1
			public var station_enter_head_1:String = "ENTERING";
			public var station_enter_subs_1:String = "Civilian Carrier HDM 26-5 /nPopulation 26035 /n /nSection Fourteen Acres /nIf you lived here, you´d be home by now. /nOctagon Real Estate Agency";
			public var station_leave_head_1:String = "LEAVING";
			public var station_leave_subs_1:String = "Civilian Carrier HDM 26-5";
			
			//station 2
			public var station_enter_head_2:String = "ENTERING";
			public var station_enter_subs_2:String = "Ctropolis /nPopuation 1572 /nDestination Lululu-Sektor /n /nDecorating tips, cooking with Zoorzakgz and dissident execution, tonight at eight, only von FOGNL.";
			public var station_leave_head_2:String = "LEAVING";
			public var station_leave_subs_2:String = "Ctropolis";			
			
			//station 3
			public var station_enter_head_3:String = "ENTERING";
			public var station_enter_subs_3:String = "Nano Drome 7EE1 /n /nPopulation 12049 /nDestination Next SolarSystem /n /nTractor beam guidance locking on. /n Please disangage all thruster activity. /nReport to docking office 4. Thank you.";
			public var station_leave_head_3:String = "LEAVING";
			public var station_leave_subs_3:String = "Nano Drome 7EE1";			
			
			//station 4
			public var station_enter_head_4:String = "ENTERING";
			public var station_enter_subs_4:String = "Dump Town /nPopulation 7 /nDestination Next SolarSystem /n /nRummage sales every thursday. /nPremium offers for everything out of service and has-been.";
			public var station_leave_head_4:String = "LEAVING";
			public var station_leave_subs_4:String = "Dump Town";			
			
			//station 5
			public var station_enter_head_5:String = "ENTERING";
			public var station_enter_subs_5:String = "Battle Cruiser FUBA 7-XC /nPopulation 516 /nDestination Next SolarSystem /n /nBe all you can be. See the galaxy. /nServe your system and join the corps. /nSign up at recruitment office on deck 7.";
			public var station_leave_head_5:String = "LEAVING";
			public var station_leave_subs_5:String = "Battle Cruiser FUBA 7-XC";			
			
			//station 6
			public var station_enter_head_6:String = "ENTERING";
			public var station_enter_subs_6:String = "Fort Falcon XB GT /nPopulation 5604 /nDestination Le next Milkyway /n /nNarcotics, weapons, nerve gas and slaves only to be exchanged with legal permit by order of Governor Xark VIII.";
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
		public function japanese(root_p:MovieClip) {
			this.myroot=root_p;
		}
	}
}