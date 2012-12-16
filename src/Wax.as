package  
{
	import org.flixel.FlxSprite;

	public class Wax extends FlxSprite
	{
		[Embed(source = '../assets/wax.png')] private var waxPNG:Class;
		
		public function Wax(X:int, Y:int)
		{
			super(X * 16, Y * 16, waxPNG);
			solid = true;
		}
		
	}

}