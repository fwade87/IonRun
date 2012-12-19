package  
{
	import org.flixel.*;

	public class Level1 extends BaseLevel
	{

		public function Level1(skipMobs:Boolean = false) 
		{
		
		}
		
		override public function setData():void
		{
			mapCSV = data.map1;
			interactCSV = data.interact1;
			skyCSV = data.sky1;
		}
	}
}