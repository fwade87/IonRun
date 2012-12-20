package  
{
	import org.flixel.*;

	public class Level2 extends BaseLevel
	{
		
		override public function setData():void
		{
			mapCSV = registry.map2;
			interactCSV = registry.interact2;
			skyCSV = registry.sky2;
		}
	}
}