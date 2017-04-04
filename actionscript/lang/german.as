// LANGUAGE _ German
package lang{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.*;
	public class german extends MovieClip {
		public var myroot:MovieClip;
		
			//Achievement Descriptions
			public var a1:String="HAUDEGEN \n \nMit klaffenden Wunden im ganzen Schiffsrumpf und leuchtrot blinkenden Warnmeldungen auf allen Schirmen ist klar - das war haarscharf. Beende einen Auftrag mit 5% Aussenhüllenintegrität - oder weniger.";
			public var a2:String="KINDERSPIEL \n \nManche sind erstklassige Piloten, andere haben einfach eine Menge Glück. Wie dem auch sei, es ist ein grossartiges Gefühl wenn man sein Schiff völlig ungeschoren in den Hangar zurückstellt. \nAbsolviere einen Level ohne Schaden zu nehmen.";
			public var a3:String="PAZIFIST \n \nSogar Kammerjäger haben Tage, an denen ihnen die armen Dinger Leid tun. Sie sind doch gar nicht so hässlich, und sie tun ja auch fast keinem was. - Bis einem wieder einfällt wie schön sie quieken	wenn sie explodieren. \nTöte keine der Dronen, nur den Boss.";
			public var a4:String="DAUERFEUER \n \nEs ist schon cool, wenn man sieht wie der Lauf vom Blaster dieses orange Glühen ausstrahlt und die Anzeigen warnen, dass die Teile nicht für diese Art Belastung gemacht sind.	\nDauerfeuer mit einer Primärwaffe, den ganzen Level durch.";
			public var a5:String="ABSERVIERT \n \nWenn man eine Schneise der Vernichtung durch die Reihen seiner Gegner geschlagen hat und die Zahl auf dem Check vom Auftraggeber entsprechend hoch ausfällt, weiss man, es war ein guter Tag.	\nVernichte 95% der Gegner - oder mehr.";
			public var a6:String="SCHARFSCHÜTZE \n \nEine hohe Trefferquote macht sich gut als Referenz für potentielle Auftraggeber und Gesprächsthema w‰hrend langer Nächte in Bars. \nErziele eine Trefferquote von 80% oder mehr.";
			public var a7:String="Alien Killer \n \nIrgendwann kommt der Punkt, ab dem man nicht mehr zählt, wieviele Viecher man schon auf dem Gewissen hat. Aber im Zeitalter einer digitalen Datenverarbeitung, die wirklich jedes Stück Information erfasst, zelebriert man zumindest die Meilensteine. \nTöte 1000 Gegner.";
			public var a8:String="VIECHERVERNICHTER \n \nWenn der Job zum Highscoresport wird. \nTöte 5000 Gegner.";
			public var a9:String="KAMIKAZE \n \nWas für Leute rammen Riesenungeziefer, nur um von ganz nah zuzusehen, wie sie von den Deflektorschilden lebendig gebraten werden? \nKollidiere mit 10 Gegnern.";
			public var a10:String="BLUTBAD \n \n Only close combat kills.";
			
			public var a11:String="SPLATTOPHOBIE \n \n Es ist voll widerlich das Schiff nach einem Kampf von literweise Blut und Eingeweiden zu befreien - dir ist klar, dass das dein Job ist, oder? Manche Söldner fliegen einfach dicht an Sternenkoronae entlang und verdampfen den ganzen Mist, aber die sind bloss zu faul zum schrubben. \nTöte mindestens 80% der Gegner, ohne Blutspritzer abzubekommen.";
			public var a12:String="TODESFAHRER \n \nRücksichtsloses Fliegen mit vollen Nachbrennern durch einen Alienschwarm provoziert Frontalkollisionen. Vielleicht ist das genau dein Ding, oder du hast 'ne Wette laufen oder... was auch immer. \nFliege einen Level am oberen Bildschirmrand, bis zum Boss.";
			public var a13:String="GEIZHALS \n \nAb und zu macht es Sinn, das Geld für Raketen und Bomben zu sparen, wenn man reaktorgespeiste Energiewaffen an Bord hat. Und dann auch manchmal wieder nicht. \nBenutze einen Level lang keinerlei Sekundärwaffen.";
			public var a14:String="PYROMANE \n \nExplosionen sind nicht nur effektiv bei grossen Gegnergruppen, sondern auch durchaus unterhaltsam. Auszug aus dem Beipackzettel für Detonator Torpedos: Weit genug weg um nicht zerfetzt zu werden, nah genug dran um die Druckwelle in den Knochen zu spüren. \n \nErziele über 100 Raketentreffer in einem Level.";
			public var a15:String="FRÜHRENTE \n \nEin Urlaub auf Risa, ein neues Schiff, ein Anwesen oder lieber Schuldenfreiheit? Mit dem grossen Geld kommt die Qual der Wahl. \nVerdiene 1000000 Credits.";
			public var a16:String="PIMP MY RIDE \n \nGrade wenn man denkt die Kiste hat ausreichend Flügel, stolpert man über das neueste Body-Kit mit noch einem Set Spoiler und nem Paar Fellwürfel für's Cockpit. \nKaufe alle Upgrades.";
			public var a17:String="NINJAMEISTER \n \nMit den Reflexen und Fähigkeiten eines altertümlichen Schattenkriegers ist dein Beruf zu einem ständigen Kampf gegen deine selbstgesetzten Standards (und die Furcht vor dem Tod zwischen den Scheren eines Invertebraten) herangewachsen. \nTöte mehr als 80% aller Gegner, ohne Schaden zu nehmen oder mit Blut befleckt zu werden.";
			public var a18:String="PRIVATPIRAT \n \nAye, ein glorreicher Tag zum Raumsegeln, Landratten töten, Credits plündern und zum Ertränken aller Sünden in schiesspulverversetztem Aldebarangrog, YARRR!! (ernsthaft, nie besoffen fliegen, ausser es ist ne Ausnahme). Fliege bis zum Boss in der oberen Bildschirmhälfte, töte mehr als 90% aller Gegner und triff mit mehr als 100 Raketen ins Ziel!";
			public var a19:String="DAS ENDE VOM WEG \n \nDas Ende deiner Dienstzeit - im Dienste deiner Selbst, natürlich. Deine Gläubiger sind ausgezahlt und du kannst für ne Weile die Füsse hochlegen. \nBeende das Spiel.";
			public var a20:String="TROPHÄHENJÄGER \n \nDie Wand im Arbeitszimmer voller Chitinpanzer und ausgestopfter Käferköpfe - im Rückblick auf eine Karriere voller exterminierter Viecher und ganzen Schwimmbecken voller Ungezieferblut stellt sich die eine Frage - Wo gibt es mehr? Schalte alle Achievements frei.";
			
			//Welcome Txt --------
			//Jar'edd
			public var t_1_1:String="Moin moin, willkommen im Buy'n'Fly! \nDu bist neu in der Branche, oder? Passt schon, war auch mal Kammerjäger. Um das mal vorweg zu sagen, du solltest so schnell wie möglich in neue Hardware investieren. Durchschlagskraft ist dein bester Verbündeter wenn du schnell an Kohle kommen willst - dein Standardblaster wird ziemlich schnell ziemlich nutzlos werden gegen die Viecher mit denen du zu tun haben wirst. Na dann, viel Spass beim abkratzen der Alieninnereien von deiner Cockpitscheibe! Ach ja, falls du meinen entlaufenen Zusel siehst, bitte bring ihn zurück, er fehlt mir. Er ist grün und wuschelig und mag Schlammcracker.";
			//C-Faic
			public var t_1_2:String="Nah, klazze, nochn Zchleim Zöldner. \nAlzo... vaz zollz zein, Rakketen oder zowaz... eh... Lazer? Na loz, hab nich ganzn zcheiz Tak. Eh... du hazt Credz, odr? Ven du hir nix kauvst vrpiz dich.";
			//Angrehspaic
			public var t_1_3:String="Lass die Knarre bloss im Holster, Fremder. Meine Autoguns tracken dich, also denk nicht dass du was klauen kannst. Wenn du hier bist um zu handeln, findest du garantiert wonach du suchst. Wenn du mich anpissen willst, tret ich dich persönlich aus der Luftschleuse.";
			//F0RM47-C
			public var t_1_4:String="-grüsse-alien-kreatur- \n-warnung- \n-sensoren-erfassen-unidentifizierte-lebensform-in-unmittelbarer-nähe- \n-scanning- \n-link-mit-biologischer-datenbank-hergestellt- \n-lebensform-identifiziert- \n-klassifikation-spezies-5P1N35N4P-00946- \n-identifiziert-als-zusel- \n-beginne-ungeziefer-vernichtungs-protokoll- \n-prozedur-unterbrochen- \n-sensoren-zeigen-organismus-nun-in-schiff-an-dockschleuse-sieben- \n-infiziertes-gebiet-ausserhalb-zuständigkeitsbereich- \n-prozedur-abgebrochen- \n-wir-entschuldigen-uns-für-unannehmlichkeiten- \n-initiiere-geschäftliches-verhandlungsprotokoll- \nINITIIERE \n-bitte-gewünschten-service-angeben- \n-vielen-dank-";
			//Anthraxrawx
			public var t_1_5:String="Wilkommen. \nWir hier vom Anthraxine Hardware Emporium haben die modernsten Technologien für jeden noch so hochspezialisierten Aufgabenbereich für Sie im Angebot.  \nWir verkaufen Industrielle-langreichweiten-Sport- und Jagdausrüstung, Grossflächen-Unkrautvertilgungs-Maschinerie auf Napalm Basis, Hochenergie-Partikel-Emitter-Relays zur Verwendung etwa im Bereich der Subraumkommunikation oder wissenschaftlicher Feldstudien sowie natürlich die neuesten Industrielaser für orbitale Bohrungen und Rohstoffabbau. \nNotwendige Lizenzfreigabe vorausgesetzt. \nWas können wir heute für Sie tun? \nSpezial Bonus Angebot: gratis Wäsche der Hüllenpanzerung für jede Transaktion über 1000c.";
			//Splurk
			public var t_1_6:String="Oh, hey. \nSplurk von der Händlergilde zu Diensten. \nWir haben letzten Monat jede Menge derbe Hardware reinbekommen, sieh dich um und such dir was aus.  \nUmm... Entschuldigung, aber... ist das ein Zusel, den du da hast?  \nTut mir leid, aber die sind hier drin nicht gestattet. \nUnangenehme Kreaturen, zu nichts zu gebrauchen, fressen wie Hutts und vermehren sich wie Tribbles. Bind ihn draussen an ne Parkuhr, dann gibts keine Probleme.";
			//Jar'edd (nochmal)
			public var t_1_7:String="Welcome to Buy'n'Fly. \nHey, it's you, glad to see you're still breathing. Looks like you made yourself some creds along the way and your ship sure has seen some action. Feel free to browse the collection as usual. \nWhat? My Zusel? You found it!! Aah, c'mere ye little thingy, daddy missed you. I'm so glad you brought it back to me. Look, I gotta repay you. Last week I found some interesting knick-knacks on a Regilian trade bazaar. Among them was a laser-sweeper, custom made for slimer mercs that have a lot of alien guts to wipe off their windshields. Or bounty hunters, if you prefere that term. \n I think the sweeper is just the thing for you, so, it's yours. \nHave fun and try not to die.";

			//Trader Short Messages [random x 5] --------
			//Buy success
			public var t_2_1_1:String="More means of destruction means more destruction!";
			public var t_2_1_2:String="*Hmm!* \n Jede Menge Killsticks für mich. \nSonst noch etwas?";
			public var t_2_1_3:String="Deal.";
			public var t_2_1_4:String="Danke, Man! \nGute Jagd!";
			public var t_2_1_5:String="Gute Wahl!";
			//Buy fail
			public var t_2_2_1:String="Du brauchst mehr Kohle.";
			public var t_2_2_2:String="Nicht genug Kohle.";
			public var t_2_2_3:String="Think you get a loan? \nThink again.";
			public var t_2_2_4:String="You have to pay for public var \n I only take creds.";
			public var t_2_2_5:String="You fly for hire? \n Then get hired. \n Come back with creds.";
			//Sell success
			public var t_2_3_1:String="Nice doing business with you.";
			public var t_2_3_2:String="Hey, ich hab nen Cousin der noch so einen braucht. \nEr ist ein toller Pilot... \n... sagt er jedenfalls.";
			public var t_2_3_3:String="Guess I can use public var";
			public var t_2_3_4:String="Makes a fine birthday present for grandma.";
			public var t_2_3_5:String="Yes, stuff. \nAlways looking for more. \n Got stuff? \n Let's talk.";
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
			// NOVA 
			public var t_3_1:String="KRIECHTIER SEUCHE \n\nDie Oberfläche von Balrog VII im Vendi System soll für Erzabbau kolonisiert werden. \nAllerdings haben die Massen an Toxinen in der Atmosphäre dafür gesorgt, dass diverse Spezies des ursprünglichen Ökosystems mutierten und inzwischen eine Gefahr für das Unternehmen darstellen. Da der Planet damals als bedeutungslos eingestuft wurde, nutzen ihn seitdem 326 verschiedene Welten als eine gigantische galaktische Mülldeponie, entsprechend ernst ist die Kontamination. \n\nFinanziell sieht's ganz nett aus, Zahlung erfolgt je bestätigtem Kill.";
			//MANTRAP
			public var t_3_2:String="ARACHNOIDE ORGANISMEN \n\nDer zweite Mond von Tremis Minor könnte durchaus als \"lebendig\" gelten. Unter der zerfurchten Kraterlandschaft wuchs über die Jahrhunderte ein Pilz von immensen Ausmassen heran, der inzwischen über dreissig Prozent des gesamten Satelliten für sich eingenommen hat. Die primitiven vorindustriellen Kulturen auf dem Planeten haben die Fähigkeit entwickelt, sich auf irgendeiner spirituellen Ebene des Fungus bewusst zu sein und verehren ihn schon seit langer Zeit als Gottheit ihres Mondes. \n Sie sind bereit, in Edelsteinen für dessen Erhalt und Pflege zu bezahlen, denn diverse Arten von Parasiten haben sich in seinen Wurzeln eingenistet.";
			//REEF
			public var t_3_3:String="RIESENKORALLEN KOLONIE\n\nDer Planet Risa im Beta Quadranten war über Jahrhunderte das Ziel für Touristen aus allen Ecken der Galaxie. Ein ganzjährig tropisches, wetterreguliertes Paradies, bis irgendjemand auf den falschen Knopf gedrückt hat und die Klimakontrolle amok lief. \n Keiner weiss so recht warum, aber so gut wie alle Korallenriffe nahe des westlichen Kontinents fingen an wucherartig zu wachsen und obendrein scheint sich sowas wie eine kollektive Intelligenz herausgebildet zu haben. Beinahe alle Meereskreaturen sind inzwischen unter der Kontrolle dieser Kraft und attackieren jeden der ihnen zu nahe kommt. Also mach sie platt und dann grill dir einen mit den Schubdüsen zum Mittag.";
			//BUGS
			public var t_3_4:String="INSEKTOIDE PARASITEN\n\nDer gesamte Planet Xegis-En-Dam ist eine einzige, gigantische Stadt. \nSo gut wie alle ursprünglich einheimischen Lebensformen sind inzwischen ausgestorben, wasbleibt sind nur die Kolonisten - und deren Ungeziefer. \n Die Bewohner von Xegis sind Wesen von immensen Ausmassen, eine Grösse von bis zu 40 Metern ist für sie völlig normal. Was diese Riesen als Ungeziefer betrachten, sind Kreaturen, die den durchschnittlichen Humanoiden mit einem einzigen Biss zerfleischen. \n Für die Xegiden zwar keine direkte Gefahr, sind sie ihnen doch mehr als lästig, also haben sie die Kammerjäger bestellt. Zeit für die Fliegenklatsche!";
			//CORRIDOR
			public var t_3_5:String="KRISTALLWESEN \n\nDieser Auftrag kommt von der Händlergilde. Eine wichtige Transportroute durch den Gamma Eridon Nebel, die als der \"Korridor\" bekannt ist, wurde zum Kriegsgebiet erklärt, da mehrere Frachter vermisst werden, die jetzt als gekapert oder zerstört gelistet sind. \n  Diese Schiffe sind langsam und schwerfällig, ohne nennenswerte Bewaffnung, also stecken höchstwahrscheinlich Piraten oder angeheuerte Söldner dahinter. \n Bevor die Confeds allerdings ihre Schlachtschiffe von den Frontlinien abziehen und sie hier zur Hasenjagd beordern, wollen sie wissen ob es den Ärger auch wert ist.  \nÜblicherweise ist das genau die Art Gelegenheit, auf die die kleinen Fische warten um nen schnellen Cred abzugreifen - und da kommst du ins Bild.";
			// NECROBE
			public var t_3_6:String="FLEISCHFRESSENDE LEBENSFORMEN \n\nHab gehört du bist nicht allzu pingelig, demnach ist das hier wohl ganz nach deinem Geschmack. \n Die Herrscherfamilie von Mandakh Prime, die über das Mandakh System regiert, hat es zur Tradition für den Imperator, seine erste Frau und den Prinzen gemacht, jeweils einen der (mehrere Kilometer langen) Riesenwürmer zu besitzen, die auf dem Planeten heimisch sind - und zwar als Haustiere.  \n Seine Hoheit hat regelmässige medizinische Checkups für den männlichen Alpha-Wurm, seinen geliebten \"Snoopie\" angeordnet. Deine Aufgabe besteht darin, dein Schiff durch die Hauptöffnung (am Vorderende) zu fliegen und in seinen Innereien sämtliche Parasiten zu erledigen, die grösser als eine Womp Ratte sind (die Kleineren könnte sowieso niemand treffen).";
			//MK II
			public var t_3_7:String="KYBERNETISCH MODIFIZIERTE SPEZIMEN \n\nThe imperial alpha worm has recently gone mad, shortly after your parasite removal job was completed. It has been rampaging through the residental district of one of Mandakh's cities. The log of your cleansing run through the worm has been analyzed by the imperial authorities. They seem to have found a rather unusual situation: One infesting critter has attatched itself to the animal's brain and begun to control its movements. The intentions of the parasite are unknown, all we know is we want it killed. Easy enough? We thought so.";

			//Incomming Text Msg from Trader --------
			//C-Faic
			public var t_4_1:String="Ja, mach dain Blutgelt mit dem Tot mainer Gezwiztr zolang du kanzt. \n Du virzt bereun daz du jemalz hir hergekom bizt, dizer Planet izt unzr Planet! \n Der Viruz in dainem Ziztem virt dainen Komputr vrnichtn und du virzt notlantn. \n Dann bringn vir dich zu der Koniginn und zie vird zicherztelln dazz du noch lange, lange Zait am Leben blaibzt.";
			//
			public var t_4_2:String="Watchout, there are lots pieces of scrap like this one around here. Do us a favor and burn them.";
			//
			public var t_4_3:String="Text";

			//Waffen Titel --------
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

			//Waffen Beschreibungen --------
			//PULSE BLASTER
			public var t_6_1:String="Der \"Riot Reaver\" Standardblaster, für jeden der sich eine gefälschte ID leisten kann. Hauptsächlich von Polizeikräften benutzt, um Bürgeraufstände und Freidenkergruppierungen zu zerschlagen.";
			//HOTWIRED PULSE BLASTER
			public var t_6_2:String="Mit 4 Kühlaggregaten, 2 Fusionsladern, ausgebohrtem Lauf und gecrackter Software aufgemotzt, um die Leistung in allen Bereichen zu erhöhen. \n Es setzt dem Reaktor ziemlich zu, daher könnten ein Paar Schaltkreise hochgehen.  \n Oder das Schiff.";
			//PLASMA MELTER
			public var t_6_3:String="Zusammengebastelt aus einem alten Lustdroiden und Sachen, die man in jeder Apotheke kaufen kann. Der Flammenwerfer benutzt ionisiertes Gas, um ganze Schiffe in dampfende Schleimklumpen zu verwandeln. \n Und ja, er funktioniert auch im Vakuum.";
			//AUTOCANNON
			public var t_6_4:String="In der Autocannon steckt ein Suchsensor aus nem geklauten Navigationssatelliten, der das Zielen für dich übernimmt. Kannst dich also zurücklehnen und draufhalten.";
			//ELECTROCUTIONER
			public var t_6_5:String="Wir können die die Subraumantenne deiner Karre so umrüsten, dass sie Energie direkt vom Schiffsreaktor auf den Gegner ableitet. Nicht grade sehr präzise, aber ist auch eher was für Leute denen egal ist, wen sie grillen.";
			//FUSION LASER
			public var t_6_6:String="Der \"Broadsword\" Laser ist eine militärische high-end Fusionswaffe. Absolut illegal, also kein Aufstand wegen dem Preis.";
			//DETONATOR TORPEDO
			public var t_6_7:String="Billig und effektiv, aber nur in grossen Mengen. Direkter Zielanflug, keine Computersteuerung.";
			//PHALANX MISSILE
			public var t_6_8:String="Die Rakete teilt sich in mehrere kleine Sprengsätze und erzeugt eine tödliche Flammenwand. Für grosse Gegnermengen.";
			//GUNDRONE
			public var t_6_9:String="Die Drone fliegt neben deinem Schiff her und schiesst mit einem Pulse Blaster bis alle Energie verbraucht ist. Danach kann man sie noch als Bombe benutzen.";
			//QUANTUM WARHEAD
			public var t_6_10:String="Erfunden von einem Computerhirn im Regierungsrechner und mit Sklavenarbeit massenproduziert von der Fakiu Union. Die eigenen Schilde passen sich der Detonationsfrequenz an, das bedeutet sorgenfreie Massenvernichtung. Oh, und sie leuchtet im Dunkeln!";
			//SHIELD CHARGES
			public var t_6_11:String="Deine Deflektorschilde werden mit jedem Einschlag fertig, ob Energie oder feste Masse. Allerdings nur solange der Generator die Feldverzerrungen kompensieren kann, also solange er die Löcher wieder stopfen kann, die der Einschlag hinterlassen hat. Neue Schildladungen gibt's hier, also vergiss nicht vollzutanken.";
			//BACKUP SHIELD GENERATOR
			public var t_6_12:String="Dein Schildgenerator hält schon was aus, aber es kann immer mal sein dass das einfach nicht reicht. Du weisst was ich meine, oder? \n Wie wär's mit zwei Generatoren? Das ist zwar nicht innerhalb der Sicherheitsparameter aber mit zerschossenem Schild der Alienqueen entgegenzutreten irgendwie auch nicht. \n Einer macht das Rennen, aber der andere bringt dich auch zurück.";

			//Station Enter / Leave -------------
			//station 0
			public var station_leave_head_0:String = "LANDEANFLUG";
			public var station_leave_subs_0:String = "Runway PQ-8";		
			
			//station 1
			public var station_enter_head_1:String = "LANDEANFLUG";
			public var station_enter_subs_1:String = "Ziviles Stadtschiff HDM 26-5 \nEinwohner 26035 \n Destination ... \n \nSektion Vierzehn \nZu Haus durch die Galaxis. \nOctagon Immobilien";
			public var station_leave_head_1:String = "TAKE OFF";
			public var station_leave_subs_1:String = "Ziviles Stadtschiff HDM 26-5";
			
			//station 2
			public var station_enter_head_2:String = "LANDEANFLUG";
			public var station_enter_subs_2:String = "Ctropolis \nPopuation 1572 \nDestination Lululu-Sektor \n \nEinrichtungstips, kochen mit Zoorzakgz und Dissidentenexekution, heute ab acht, nur auf FOGNL.";
			public var station_leave_head_2:String = "TAKE OFF";
			public var station_leave_subs_2:String = "Ctropolis";			
			
			//station 3
			public var station_enter_head_3:String = "LANDEANFLUG";
			public var station_enter_subs_3:String = "Nano Drome 7EE1 \n \nEinwohner 12049 \nDestination Next SolarSystem \n \nTraktorstrahlerfassung aktiviert. \nBitte alle Schubregler auf null setzen. \nZollkontrolle bei Dock 4. Vielen Dank.";
			public var station_leave_head_3:String = "TAKE OFF";
			public var station_leave_subs_3:String = "Nano Drome 7EE1";			
			
			//station 4
			public var station_enter_head_4:String = "LANDEANFLUG";
			public var station_enter_subs_4:String = "Dump Town \nEinwohner 7 \nDestination Next SolarSystem \n \nAltwarenhandel jeden Donnerstag. \nPremiumangebote auf ausgediente Kompletthardware und Einzelteile.";
			public var station_leave_head_4:String = "TAKE OFF";
			public var station_leave_subs_4:String = "Dump Town";			
			
			//station 5
			public var station_enter_head_5:String = "LANDEANFLUG";
			public var station_enter_subs_5:String = "Schlachtkreuzer FUBA 7-XC \nCrew 516 \nDestination Next SolarSystem \n \nSei stark. Sei tapfer. Sei ein Held. \nWerde Soldat und diene deinem System. \nRekrutierung auf Deck 7.";
			public var station_leave_head_5:String = "TAKE OFF";
			public var station_leave_subs_5:String = "Schlachtkreuzer FUBA 7-XC";			
			
			//station 6
			public var station_enter_head_6:String = "LANDEANFLUG";
			public var station_enter_subs_6:String = "Fort Falcon XB GT \nEinwohner 5604 \nDestination Le next Milkyway \n \nNarkotika, Waffen, Nervengas und Sklaven nur mit Einfuhrgenehmigung umschlagen per Order von Stationsgouverneur Xark VII";
			public var station_leave_head_6:String = "TAKE OFF";
			public var station_leave_subs_6:String = "Fort Falcon XB GT";			
			
			//station 7
			public var station_enter_head_7:String = "LANDEANFLUG";
			public var station_enter_subs_7:String = "Runway PQ-8 \nEinwohner 37 \nDestination lululu \n \nMotorwartung, Nachbrennertuning, Rennstreifen und Wackeldackel! \nAlles und mehr in Hanks Schiffswerft!";
			
			/*
			public varclip.wexit.trans.buttonMode=true;
			public varclip.wexit.trans.addEventListener(MouseEvent.MOUSE_DOWN,public varwexit_down);
			public varclip.wexit.trans.addEventListener(MouseEvent.MOUSE_OVER,public varwexit_over);
			public varclip.wexit.trans.addEventListener(MouseEvent.MOUSE_OUT,public varwexit_out);
			*/
		// public var prices:Array=[1000,3000,10000,10000,10000,30000,250,500,1000,1000,200,10000];
		public function german(root_p:MovieClip) {
			this.myroot=root_p;
		}
	}
}