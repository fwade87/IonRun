package  
{
	import org.flixel.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.easing.Linear;
	import org.flixel.plugin.photonstorm.FlxMath;

	public class Buzzer extends FlxSprite
	{
		[Embed(source = '../assets/buzzer.png')] private var buzzerPNG:Class;
		
		private var targetHeight:Number = 0; // This variable is just a counter, makes your object move by plugging this into sin() function. sin() works in radians.
		public var isDying:Boolean = false;
		public var flighttime:Number = 10;
		public const maxSpeedY:Number = 10;
		public var shouldDive:Boolean;
		public var player:Player;
		
		public function Buzzer(x:int, y:int)
		{
			super(x * 16, y * 16);
			loadGraphic(buzzerPNG, true, true, 16, 16);
			facing = FlxObject.RIGHT;
			//animations
			addAnimation("walk", [0, 1], 6, true);
			play("walk");
			
			//speed and flight 
			velocity.x = -90;
			shouldDive = false;
			targetHeight = 0;
		}
		
		override public function kill():void
		{
			isDying = true;
			frame = 1;
			velocity.x = 0;
			velocity.y = 0;
			angle = 180;
			
			TweenMax.to(this, 1.5, { bezier: [ {x:"64", y:"-64"}, {x:"80", y:"200"} ], onComplete: removeSprite } );
		}
		
		private function removeSprite():void
		{
			exists = false;
		}
		
		override public function update():void
		{
			super.update();
			
			targetHeight =-20;
			if (this.y > targetHeight) {
			  acceleration.y = -maxSpeedY;
			} else if (this.y < targetHeight) {
			  acceleration.y = maxSpeedY;
			}  
			
			if (facing == FlxObject.LEFT && isTouching(WALL))
			{
					turnAround();
					return;
			}
			else if (facing == FlxObject.RIGHT && isTouching(WALL))
			{
				{
					turnAround();
					return;
				}
			}
			
			//	Check the tiles below it
			
			if (y < 0)
			{
				dive();
		
			}
			else if (y < 20)
			{
				velocity.y += 420;
			}
		}
		
		private function turnAround():void
		{
			if (facing == FlxObject.RIGHT)
			{
				facing = FlxObject.LEFT;
				
				velocity.x = -90;
			}
			else
			{
				facing = FlxObject.RIGHT;
				
				velocity.x = 90;
			}
		}
		
		private function dive():void
		{
				
			velocity.y = -20;
			
		}
		
	}

}