package  
{
	import org.flixel.FlxSprite;

	public class ConWall extends FlxSprite
	{
		[Embed(source = '../assets/conwall.png')] private var cWallPNG:Class;
		
		public function ConWall(X:int, Y:int)
		{
			super(X, Y, cWallPNG);
			solid = true;
			immovable = true;

		}
		
	}

}