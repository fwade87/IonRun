package  
{
	import org.flixel.FlxSprite;

	public class Gear extends FlxSprite
	{
		[Embed(source = '../assets/gear.png')] private var gearPNG:Class;
		
		public function Gear(X:int, Y:int)
		{
			super(X * 16, Y * 16, gearPNG);
			solid = false;
		}
		
	}

}