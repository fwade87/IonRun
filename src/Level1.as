package  
{
	import org.flixel.*;

	public class Level1 extends BaseLevel
	{

		override public function setData():void
		{
			mapCSV = registry.map1;
			interactCSV = registry.interact1;
			skyCSV = registry.sky1;
		}
	}
}