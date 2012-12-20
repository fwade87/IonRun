package  
{
	
	//** Auther: Frank Wade
	//**
	//**
	
	import flash.sampler.NewObjectSample;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxHealthBar;
	
	public class PlayState extends FlxState
	{
		//Embed Assets (Gfx, sfx, etc.)
		[Embed(source = "../assets/sfx/gearhit1.mp3")] private var gearFX:Class;
		[Embed(source = "../assets/sfx/enemyhit1.mp3")] private var enemyFX:Class;
		[Embed(source = "../assets/sfx/death.mp3")] private var deathFX:Class;
		[Embed(source = "../assets/sfx/playerhit1.mp3")] private var playerhurtFX:Class;
		[Embed(source = "../assets/sfx/scrapFX.mp3")] private var scrapFX:Class;
		[Embed(source = "../assets/drop1.png")] private var scrapPNG:Class;

		//main game vars
		private var player:Player;
		private var level:BaseLevel;
		public var registry:Registry;
		
		//lvls
		public var lvl1:Class = Level1;
		public var lvl2:Class = Level2;
		
		//make an array out of the Class references of the stages
		public static var lvls:Array;
		
		//scrap and score!
		private var score:FlxText;
		private var scrapScore:FlxText;
		private var scrapTotal:int;
		private var _scrapDrops:FlxGroup;
		private var scrap:FlxSprite;
		
		//gears
		private var gear:Gear;
		
		//set the stage counter at 0
		public static var lvlCount:int = 1;

		//gibs
		public var debris:Debris;
		
		//soundfx
		private var gearHitFX:FlxSound;
		private var enemyHitFX:FlxSound;
		private var deathHitFX:FlxSound;
		private var scrapHitFX:FlxSound;
		private var playerhurtHitFX:FlxSound;


		
		//meta groups, to help speed up collisions
		protected var _objects:FlxGroup;
		protected var _hazards:FlxGroup;
		
		public function PlayState() 
		{
		}
		
		//create and init all level player, gear, score, worldbounds etc
		override public function create():void
		{
			FlxG.mouse.hide();
			
			lvls = [lvl1,lvl2];
			makeStage();
			
			//sound stuff
			gearHitFX = new FlxSound;
			gearHitFX.loadEmbedded(gearFX);
			
			scrapHitFX = new FlxSound;
			scrapHitFX.loadEmbedded(scrapFX);
			
			playerhurtHitFX = new FlxSound;
			playerhurtHitFX.loadEmbedded(playerhurtFX);
			
			deathHitFX = new FlxSound;
			deathHitFX.loadEmbedded(deathFX);
			
			enemyHitFX = new FlxSound;
			enemyHitFX.loadEmbedded(enemyFX);

			
			debris = new Debris;
			//score stuff
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text =  "0 / " + level.totalGears.toString() ;
			
			scrapScore = new FlxText(0, 20, 100);
			scrapScore.color = 0xffffffff;
			scrapScore.shadow = 0xff000000;
			scrapScore.scrollFactor.x = 0;
			scrapScore.scrollFactor.y = 0;
			scrapScore.text = scrapTotal.toString();
			
			
			//meta groups !
			_hazards = new FlxGroup();
			_hazards.add(level.slimes);
			_hazards.add(level.buzzers);
			
			
			_objects = new FlxGroup();
			
			_objects.add(debris);
			
			_scrapDrops = new FlxGroup();
			_objects.add(_scrapDrops);
			
			
		}
		//main update for collision!
		override public function update():void
		{
			super.update();
			FlxG.collide(player, level);
			FlxG.collide(_hazards, level);
			FlxG.collide(_objects, level);
			
			FlxG.overlap(player,level.slimes, hitSlime);
			FlxG.overlap(player, level.buzzers, hitBuzzer);
			FlxG.overlap(player, level.levelGears, hitGear);
			FlxG.overlap(player, _scrapDrops, scrapHit);
		}
		
		//generate the stage
		public function makeStage():void
		{	
			
			level = new lvls[lvlCount];
			add(level.sky);
			
			//player
			player = new Player(20, 60);
			
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
			//add everything
			add(debris);
			add(level.map);
			add(level.slimes);
			add(level.buzzers);
			add(player.playerHPbar);
			add(level.interact);
			add(score);
			add(scrapScore);
			
			add(player);
			
			FlxG.camera.flash(0xff000000, 1, null, false);

			//Debugger
			FlxG.watch(player,"x","Player X: ");
			FlxG.watch(player, "y","Player Y: ");
			FlxG.log("Playstate started...");

		}

		//COLLISION EFFECTS 
		//SLIMES
		private function hitSlime(player:FlxObject, slime:FlxObject):void
		{
			if (Slime(slime).isDying)
			{
				return;
			}
			//If enemy is "stomped"...
			if (player.y < slime.y && player.acceleration.y != 0)
			{
				//gibs
				debris.createEmitter(slime.x, slime.y);
				//bounce player
				player.velocity.y *= -1;
				//kill enemy
				slime.kill();
				//enemy death SFX
				enemyHitFX.play(true);
				//LOOT!
				scrap = new FlxSprite(slime.x, slime.y, scrapPNG);
				//Start loot above players head...
				scrap.y += -55;
				//loot gravity...
				scrap.acceleration.y = 100;
				//loot bounce!
				scrap.elasticity = 0.8;
				//add to loot group!
				_scrapDrops.add(scrap);
				//loooooooooot!
				add(scrap);
			}
			else
			{
				//Player DMG ! :(
				player.x -= 10;
				player.health -= 1;
				player.flicker(1);
				playerhurtHitFX.play(true);
				if (player.health <= 0)
				{
					player.flicker(2);
					deathHitFX.play(true);
					player.exists = false;
					FlxG.fade(0xff000000, 2);
					FlxG.switchState(new PlayState);
				}
			}
		}
		
		//BUZZER
		private function hitBuzzer(player:FlxObject, buzzer:FlxObject):void
		{
			if (Buzzer(buzzer).isDying)
			{
				return;
			}
			//If enemy is "stomped"...
			if (player.y < buzzer.y && player.acceleration.y != 0)
			{
				//gibs
				debris.createEmitter(buzzer.x, buzzer.y);
				//bounce player
				player.velocity.y *= -1;
				//kill enemy
				buzzer.kill();
				//enemy death SFX
				enemyHitFX.play(true);
				//LOOT!
				scrap = new FlxSprite(buzzer.x, buzzer.y, scrapPNG);
				//Start loot above players head...
				scrap.y += -55;
				//loot gravity
				scrap.acceleration.y = 100;
				//loot bounce
				scrap.elasticity = 0.8;
				//loot to group, add loot
				_scrapDrops.add(scrap);
				add(scrap);
				
			}
			else
			{
				//player DMG
				player.x -= 10;
				player.health -= 1;
				player.flicker(1);
				playerhurtHitFX.play(true);
				if (player.health <= 0)
				{
					player.flicker(2);
					deathHitFX.play(true);
					player.exists = false;
					FlxG.fade(0xff000000, 2);
					FlxG.switchState(new PlayState);
				}
			}
		}
		
		//Scrap Drops
		private function scrapHit(player:FlxObject, scrap:FlxSprite):void
		{
				scrapHitFX.play(true);
				//score ++
				scrapTotal++;
				scrapScore.text = scrapTotal.toString();
				//remove from scene
				scrap.kill();
		}
		
		//GEARS
		private function hitGear(player:FlxObject, gear:FlxGroup):void
		{
			FlxG.log("GEAR HIT!");
			gear.kill();
			player.health += 1;
			//main score ++
			FlxG.score += 1;
			gearHitFX.play(true);
			
			if (FlxG.score == level.totalGears)
			{
				//	Opens the exit at the end of the level
				score.text = FlxG.score.toString() + " / " + level.totalGears.toString() + " EXIT OPEN!";
				level.openExit();
			}
			else
			{
				score.text = FlxG.score.toString() + " / " + level.totalGears.toString();
			}
		}
		
	}

}