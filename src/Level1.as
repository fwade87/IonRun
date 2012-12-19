package  
{
	import org.flixel.*;

	public class Level1 extends BaseLevel
	{

		override public function setData():void
		{
			mapCSV = data.map1;
			interactCSV = data.interact1;
			skyCSV = data.sky1;
		}
	}
}