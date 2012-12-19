package  
{
	import com.greensock.loading.data.DataLoaderVars;
	import org.flixel.*;

	public class BaseLevel extends FlxGroup
	{

		public var registry:Registry;
		public var data:LevelData;
		public var sky:FlxTilemap;
		public var map:FlxTilemap;
		public var interact:FlxTilemap;
		
		public var skyCSV:Class;
		public var mapCSV:Class;
		public var interactCSV:Class;

		//enemies
		public var slimeMob:Slime;
		public var buzzerMob:Buzzer;
				
		public var slimes:Enemies;
		public var buzzers:Enemies;
		
		public var levelGears:FlxGroup;
		
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		
		public var width:int;
		public var height:int;
		public var totalGears:int;
		
		public function BaseLevel(skipMobs:Boolean = false) 
		{
			registry = new Registry;
			data = new LevelData;
			setData();
			createBackgroundMap();
			createFloorMap();
			createInteractiveElements();
			
			setDimensions();
			
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
		
		//this assigns the data to the variables used in map creation. Override it to generate different stages
		public function setData():void
		{
			skyCSV = data.sky1;
			mapCSV = data.map1;
			interactCSV = data.interact1;
			
		}

		//this just loads the floorMap from whatever you set floorCSV to
		public function createFloorMap():void
		{
			map = recycle(FlxTilemap) as FlxTilemap;
			map.loadMap(new mapCSV,data.tilesPNG, 16, 16, 0, 0, 1, 31);
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(40, FlxObject.UP, null, null, 4);
			
		}
		
		//this just loads the backgroundMap from whatever you set backgroundCSV to
		public function createBackgroundMap():void
		{
			sky = recycle(FlxTilemap) as  FlxTilemap;
			sky.loadMap(new skyCSV, data.skyTilesPNG, 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
		}
		
		//this runs a for loop that checks a map based on interactCSV
		//and creates an interact element in it's respective FlxGroup based on the CSV data
		public function createInteractiveElements():void
		{
			interact = recycle(FlxTilemap) as FlxTilemap;
			interact.loadMap(new interactCSV, data.interactPNG, 16, 16);
			
			//initialize the interact element FlxGroups
			levelGears = recycle(FlxGroup) as FlxGroup;
	
			
			//scan the y axis
			for (var ty:int = 0; ty < interact.heightInTiles; ty++)
			{
				//scan the x axis
				for (var tx:int = 0; tx < interact.widthInTiles; tx++)
				{
					
					//check for goal tiles and add them to the stageGoal FlxGroup
					if (interact.getTile(tx, ty) == 4)
					{
						var tempGear:Gear = recycle(Gear) as Gear;
						tempGear.reset(tx * 16, (ty * 16)+8);
						levelGears.add(tempGear);
					}

				}
			}
		}
		
		public function openExit():void
		{
			//	Removes the two blocking tiles on the right of the map and sets them to nothing, so the player can walk through
			map.setTile(98, 16, 0, true);
			map.setTile(99, 16, 0, true);
		}
		
		public function setDimensions():void
		{
			width= map.width;
			height = map.height;
		}
		
	}

}