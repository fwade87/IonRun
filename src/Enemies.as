package  
{
	import org.flixel.*;

	public class Enemies extends FlxGroup
	{
		public function Enemies()
		{
			super();
		}
		
		//all add enemy functions go here, to be called in level
		
		//slime
		public function addSlime(x:int, y:int):void
		{
			var tempSlime:Slime = new Slime(x,y);
				
			add(tempSlime);
		}
		//buzzer
		public function addBuzzer(x:int, y:int):void
		{
			var tempBuzzer:Buzzer = new Buzzer(x,y);
				
			add(tempBuzzer);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}