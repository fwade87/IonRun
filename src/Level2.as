package  
{
	import org.flixel.*;

	public class Level2 extends BaseLevel
	{

		public function Level2(skipMobs:Boolean = false) 
		{
		
		}
		
		override public function setData():void
		{
			mapCSV = data.map2;
			interactCSV = data.interact2;
			skyCSV = data.sky2;
		}
	}
}