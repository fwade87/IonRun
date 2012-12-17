package  
{
	
	//** --- THE MAIN CLASS !! -----
	//**
	//**
	
	import flash.sampler.NewObjectSample;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class PlayState extends FlxState
	{
		//sound fxs and music and gfx
		[Embed(source = "../assets/sfx/waxhit1.mp3")] private var waxFX:Class;
		[Embed(source = "../assets/sfx/enemyhit1.mp3")] private var enemyFX:Class;
		[Embed(source = "../assets/sfx/death.mp3")] private var deathFX:Class;
		[Embed(source = "../assets/drop1.png")] private var scrapPNG:Class;

		//main game vars
		private var player:Player;
		private var level:Level1;
		private var score:FlxText;
		private var scrapScore:FlxText;
		private var scrapTotal:Number;
		public var scrapDrops:FlxSprite;
		public var scrapDelay:FlxDelay;

		//gibs

		public var debris:Debris;
		
		//soundfx
		private var waxHitFX:FlxSound;
		private var enemyHitFX:FlxSound;
		private var deathHitFX:FlxSound;
		
		//enemies
		public var slimeMob:Slime;
		public var buzzerMob:Buzzer;
		
		//meta groups, to help speed up collisions
		protected var _objects:FlxGroup;
		protected var _hazards:FlxGroup;
		
		public function PlayState() 
		{
		}
		//create and init all level player, wax, score, worldbounds etc
		override public function create():void
		{
			level = new Level1;
			
			//sound stuff
			waxHitFX = new FlxSound;
			waxHitFX.loadEmbedded(waxFX);
			
			deathHitFX = new FlxSound;
			deathHitFX.loadEmbedded(deathFX);
			
			enemyHitFX = new FlxSound;
			enemyHitFX.loadEmbedded(enemyFX);
	
			//player
			player = new Player(20, 90);

			debris = new Debris;
			//score stuff
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text =  "0 / " + level.totalWaxes.toString() ;
			
			scrapTotal = 0;
			scrapScore = new FlxText(0, 8, 100);
			scrapScore.color = 0xffffffff;
			scrapScore.shadow = 0xff000000;
			scrapScore.scrollFactor.x = 0;
			scrapScore.scrollFactor.y = 0;
			scrapScore.text = scrapScore.toString();
			
			
			add(level);
			add(player);
			add(level.waxes);
			add(level.slimes);
			add(level.buzzers);
			add(score);
			add(scrapScore);
			add(debris);
		
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
			//Debugger Watch examples
			FlxG.watch(player,"x");
			FlxG.watch(player, "y");
			
			//Finally we are going to sort things into a couple of helper groups.
			//We don't add these groups to the state, we just use them for collisions later!
			_hazards = new FlxGroup();
			_hazards.add(level.slimes);
			_hazards.add(level.buzzers);
			
			_objects = new FlxGroup();
			_objects.add(debris);
			_objects.add(scrapDrops);
			_objects.add(level.waxes);
			
			
		}
		//main update for collision!
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, level);
			FlxG.collide(_hazards, level);
			FlxG.collide(_objects, level);
			
			FlxG.overlap(player, level.slimes, hitSlime);
			FlxG.overlap(player, level.buzzers, hitBuzzer);
			FlxG.overlap(player, level.waxes, hitWax);
			FlxG.overlap(player, scrapDrops, scrapHit);
			
			
			//	Player walked through end of level exit?
			if (player.x > Registry.levelExit.x && player.y == Registry.levelExit.y)
			{
				player.exists = false;
				FlxG.fade(0xff000000, 2, changeState);
			}
		}
		//next level changer
		private function changeState():void
		{
			FlxG.switchState(new LevelEndState);
		}
		
		
		//COLLISION EFFECTS 
		
	
		//SLIMES
		private function hitSlime(player:FlxObject, slime:FlxSprite):void
		{
			if (Slime(slime).isDying)
			{
				return;
			}
			
			if (player.y < slime.y)
			{
				debris.createEmitter(slime.x, slime.y);

				player.velocity.y *= -1;
				slime.kill();
				enemyHitFX.play(true);
				scrapDrops = new FlxSprite(slime.x, slime.y, scrapPNG);
				_objects.add(scrapDrops);
				scrapDrops.y += -75;
				scrapDrops.velocity.y += 130;
				add(scrapDrops);
			}
			else
			{
				deathHitFX.play(true);

				Player(player).restart();
			}
		}
		
		//BUZZER
		private function hitBuzzer(player:FlxObject, buzzer:FlxObject):void
		{
			if (Buzzer(buzzer).isDying)
			{
				return;
			}
			
			if (player.y < buzzer.y)
			{
				
				debris.createEmitter(buzzer.x, buzzer.y);

				
				player.velocity.y *= -1;
				buzzer.kill();
				enemyHitFX.play(true);
				scrapDrops = new FlxSprite(buzzer.x, buzzer.y, scrapPNG);
				_objects.add(scrapDrops);
				scrapDrops.y += -75;
				scrapDrops.velocity.y += 130;
				add(scrapDrops);
			}
			else
			{
				deathHitFX.play(true);

				Player(player).restart();
			}
		}
		
		//Scrap Drops
		private function scrapHit(player:FlxObject, scrapDrops:FlxSprite):void
		{
				enemyHitFX.play(true);
				scrapScore.text += 1;
				
				scrapDrops.kill();
		}
		
		//WAXES
		private function hitWax(p:FlxObject, wax:FlxObject):void
		{
			wax.kill();
			
			FlxG.score += 1;
			
			waxHitFX.play(true);
			
			if (FlxG.score == level.totalWaxes)
			{
				//	Opens the exit at the end of the level
				score.text = FlxG.score.toString() + " / " + level.totalWaxes.toString() + " EXIT OPEN!";
				level.openExit();
			}
			else
			{
				score.text = FlxG.score.toString() + " / " + level.totalWaxes.toString();
			}
		}
		
	}

}