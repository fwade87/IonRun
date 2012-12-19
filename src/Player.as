package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source = '../assets/player.png')] private var playerPNG:Class;
		
		public var playstate:PlayState;
		private var start:FlxPoint;
		public var playerHPbar:FlxBar;
		//double jump stuff
		public var DOUBLEJUMP:Boolean;
		private var SINGLEJUMP:Boolean;
		private var jumpspeed:int = 200;
		
		public function Player(x:Number, y:Number)
		{
			//	As this extends FlxSprite we need to call super() to ensure all of the parent variables we need are created
			super(x, y);
			start = new FlxPoint(x, y);
		
			//	Load the player.png into this sprite.
			//	The 2nd parameter tells Flixel it's a sprite sheet and it should chop it up into 16x18 sized frames.
			loadGraphic(playerPNG, true, true, 16, 18, true);
			
			//	The sprite is 16x18 in size, but that includes a little feather of hair on its head which we don't want to include in collision checks.
			//	We also shave 2 pixels off each side to make it slip through gaps easier. Changing the width/height does NOT change the visual sprite, just the bounding box used for physics.
			width = 16;
			height = 16;
			
			//player HP
			health = 4;
			playerHPbar = new FlxBar(x, y, FlxBar.FILL_LEFT_TO_RIGHT, 17, 4, this, "health", 0, 4, false);
			playerHPbar.trackParent(0, -12);
			
			//	The Animation sequences we need
			addAnimation("idle", [0], 0, false);
			addAnimation("walk", [0, 1, 0, 2], 10, true);
			addAnimation("jump", [1], 0, false);
			addAnimation("hurt", [4], 0, false);
			
			//	Enable the Controls plugin - you only need do this once (unless you destroy the plugin)
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			//	Add this sprite to the FlxControl plugin and tell it we want the sprite to accelerate and decelerate smoothly
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			//	Sprite will be controlled with the left and right cursor keys
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			//jumping is in update
			
			//	Because we are using the MOVEMENT_ACCELERATES type the first value is the acceleration speed of the sprite
			//	Think of it as the time it takes to reach maximum velocity. A value of 100 means it would take 1 second. A value of 400 means it would take 0.25 of a second.
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			
			//	Set a downward gravity 
			FlxControl.player1.setGravity(0, 420);
			
			
			//	By default the sprite is facing to the right.
			//	Changing this tells Flixel to flip the sprite frames to show the left-facing ones instead.
			facing = FlxObject.RIGHT;
   
		}

		
		override public function update():void
		{
			super.update();
			
		//This first 'if' statement is our initial jump
			if (FlxG.keys.justPressed("SPACE") && velocity.y == 0)
				{
				velocity.y = -jumpspeed;
				DOUBLEJUMP = false;
				SINGLEJUMP = true;
				}
			 
			//This second 'if' statement checks that we've stopped doing our first jump, and sets us up to do a double jump.
			if ((FlxG.keys.justReleased("SPACE") && SINGLEJUMP) || velocity.y == 0)
				{
				DOUBLEJUMP = true;
				SINGLEJUMP = false;
				}
			 
			//This final 'if' statement is our mid-air, or double jump
			if (FlxG.keys.justPressed("SPACE") && (velocity.y > 0 || velocity.y < 0) && DOUBLEJUMP)
				{
				velocity.y = -jumpspeed/1.4;
				DOUBLEJUMP = false;
				}
			
			
			if (x < 0)
			{
				x = 0;
			}
			
			//	Have they hit the water?
			if (y > 268)
			{
				FlxG.fade(0xff000000, 2);
				FlxG.switchState(new PlayState);
			}
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			else if (velocity.y < 0)
			{
				play("jump");
			}
		}
		
	}
}