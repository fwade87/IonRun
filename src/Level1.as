package  
{
	import org.flixel.*;

	public class Level1 extends FlxGroup
	{
		[Embed(source = "../assets/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		[Embed(source = "../assets/mapCSV_Level1_Map.csv", mimeType = "application/octet-stream")] public var mapCSV:Class;
		[Embed(source = "../assets/mapCSV_Level1_Wax.csv", mimeType = "application/octet-stream")] public var waxCSV:Class;
		[Embed(source = "../assets/backdrop.png")] public var skyTilesPNG:Class;
		[Embed(source = "../assets/tiles.png")] public var mapTilesPNG:Class;
		[Embed(source = "../assets/wax.png")] public var waxPNG:Class;
		
		public var sky:FlxTilemap;
		public var map:FlxTilemap;
		public var waxes:FlxGroup;
		public var slimes:Enemies;
		public var buzzers:Enemies;

		
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		
		public var width:int;
		public var height:int;
		public var totalWaxes:int;
		
		public function Level1(skipMobs:Boolean = false) 
		{
			super();
			
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, skyTilesPNG, 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
			
			map = new FlxTilemap;
			map.loadMap(new mapCSV, mapTilesPNG, 16, 16, 0, 0, 1, 31);
			
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(40, FlxObject.UP, null, null, 4);
			
			Registry.map = map;
			Registry.levelExit = new FlxPoint(99 * 16, 16 * 16);
			
			width = map.width;
			height = map.height;
			
			elevator1 = new Elevator(26, 6, 10, 0);
			elevator2 = new Elevator(82, 6, 0, 7);
			
			add(sky);
			add(map);
			add(elevator1);
			add(elevator2);
			
			parseWaxes();
			
			if (skipMobs == false)
			{
				addSlimes();
				addBuzzers();
			}
		}
		
		
		//ACTUALLY ADDING THE ENEMIES TO THE LEVEL
		
		//SLIMES
		private function addSlimes():void
		{
			slimes = new Enemies;
			
			slimes.addSlime(11, 16);
			slimes.addSlime(15, 16);
			slimes.addSlime(31, 16);
			slimes.addSlime(28, 16);
			slimes.addSlime(74, 16);
			slimes.addSlime(92, 16);
		}
		//BUZZERS
		private function addBuzzers():void
		{
			buzzers = new Enemies;
			
			buzzers.addBuzzer(16, 10);
			buzzers.addBuzzer(28, 11);
			buzzers.addBuzzer(56, 10);
			
		}
		
		public function openExit():void
		{
			//	Removes the two blocking tiles on the right of the map and sets them to nothing, so the player can walk through
			map.setTile(98, 16, 0, true);
			map.setTile(99, 16, 0, true);
		}
		
		private function parseWaxes():void
		{
			var waxMap:FlxTilemap = new FlxTilemap();
			
			waxMap.loadMap(new waxCSV, waxPNG, 16, 16);
			
			waxes = new FlxGroup();
			
			for (var ty:int = 0; ty < waxMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < waxMap.widthInTiles; tx++)
				{
					if (waxMap.getTile(tx, ty) == 1)
					{
						waxes.add(new Wax(tx, ty));
						totalWaxes++;
					}
				}
			}
		}
		
	}

}