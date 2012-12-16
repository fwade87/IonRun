package  
{
	
	//** --- THE MAIN CLASS !! -----
	//**
	//**
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var player:Player;
		private var level:Level1;
		private var score:FlxText;
		private var scrap:Scrap;

		
		public function PlayState() 
		{
		}
		//create and init all level player, wax, score, worldbounds etc
		override public function create():void
		{
			level = new Level1;

			player = new Player(4, 120);
			
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = "0 / " + level.totalWaxes.toString();
			
			add(level);
			add(player);
			add(level.waxes);
			add(level.slimes);
			add(level.buzzers);
	
			add(score);
			
			//	Tell flixel how big our game world is
			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			
			//	Don't let the camera wander off the edges of the map
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			
			//	The camera will follow the player
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
		}
		//main update for collision!
		override public function update():void
		{
			super.update();
			
			FlxG.collide(player, level);
			FlxG.collide(level.slimes, level);
			FlxG.collide(level.buzzers, level);
			
			FlxG.overlap(player, level.slimes, hitSlime);
			FlxG.overlap(player, level.buzzers, hitBuzzer);
			FlxG.overlap(player, level.waxes, hitWax);
			
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
				slime.kill();
				scrap = new Scrap(slime.x, slime.y);
				add(scrap);
			}
			else
			{
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
				buzzer.kill();
			}
			else
			{
				Player(player).restart();
			}
		}
		//WAXES
		private function hitWax(p:FlxObject, wax:FlxObject):void
		{
			wax.kill();
			
			FlxG.score += 1;
			
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