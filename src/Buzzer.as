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
		
		public var isDying:Boolean = false;
		public var flighttime:Number = 0;
		public var spin:int;
		
		public function Buzzer(x:int, y:int)
		{
			super(x * 16, y * 16);
			loadGraphic(buzzerPNG, true, true, 16, 16);
			facing = FlxObject.RIGHT;

			//animations
			addAnimation("walk", [0, 1], 6, true);
			play("walk");
			
			//speed and flight 
			velocity.x = -30;
			spin = 0;
			flighttime = 0;
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

		}
		
		private function turnAround():void
		{
			if (facing == FlxObject.RIGHT)
			{
				facing = FlxObject.LEFT;
				velocity.x = -30;
			}
			else
			{
				facing = FlxObject.RIGHT;
				velocity.x = 30;
			}
		}
		
	}

}