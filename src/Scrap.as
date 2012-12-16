package  
{
	import org.flixel.FlxSprite;

	public class Scrap extends FlxSprite
	{
		[Embed(source = '../assets/drop1.png')] private var scrapPNG:Class;
		
		public function Scrap(X:int, Y:int)
		{
			super(X * 16, Y * 16, scrapPNG);
			solid = true;
		}
	
	}

}