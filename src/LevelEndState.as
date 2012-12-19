package  
{
	import org.flixel.*;
	
	public class LevelEndState extends FlxState
	{
		[Embed(source = "../assets/mapCSV_LevelEnd_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../assets/backdrop.png")] public var skyTilesPNG:Class;
		[Embed(source = "../assets/gear.png")] public var gearPNG:Class;
		
		private var sky:FlxTilemap;
		private var won:FlxText;
		private var gears:FlxEmitter;

		public function LevelEndState() 
		{
		}
		//sets data for the level complete screen
		override public function create():void
		{
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, skyTilesPNG, 192, 336);
			
			won = new FlxText(0, 80, 320, "- GAME WON! -");
			won.scale.x = 4;
			won.scale.y = 4;
			won.alignment = "center";
			won.shadow = 0xff000000;
			won.scrollFactor.x = 0;
			won.scrollFactor.y = 0;
			
			gears = new FlxEmitter;
			gears.x = 160;
			gears.y = 100;
			gears.setXSpeed( -100, 100);
			gears.setYSpeed( -200, 0);
			gears.setRotation( 0, 0);
			gears.gravity = 150;
			gears.makeParticles(gearPNG, 100, 0, false, 0);
			
			
			gears.start(false, 4, 0.1);
			
			add(sky);
			add(gears);
			add(won);
		}
		//checks for key press
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.any())
			{
				FlxG.fade(0xff000000, 2, changeState);
			}
		}
		
		private function changeState():void
		{
			FlxG.switchState(new MainMenuState);
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
	}

}