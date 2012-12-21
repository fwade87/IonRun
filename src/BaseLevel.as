package  
{
	import org.flixel.*;

	public class BaseLevel extends FlxGroup
	{

		//Get Registry
		public var registry:Registry;
		
		//TileMaps and CSV classes
		public var sky:FlxTilemap;
		public var map:FlxTilemap;
		public var interact:FlxTilemap;
		public var skyCSV:Class;
		public var mapCSV:Class;
		public var interactCSV:Class;

		//enemies and enemy groups
		public var slimeMob:Slime;
		public var buzzerMob:Buzzer;
		public var slimes:Enemies;
		public var buzzers:Enemies;
		
		//gears and interactive
		public var levelGears:FlxGroup;
		public var levelcWalls:FlxGroup;
		private var elevator1:Elevator;
		private var elevator2:Elevator;
		private var elevator3:Elevator;
		public var totalGears:uint;
		
		//deminsions
		public var width:int;
		public var height:int;

		
		public function BaseLevel(skipMobs:Boolean = false) 
		{
			//Get Data from reg
			registry = new Registry;
			setData();
			
			//The create functions for Sky, map and Interact tiles
			createBackgroundMap();
			createFloorMap();
			createInteractiveElements();
			
			//deminsions
			setDimensions();
			
			elevator1 = new Elevator(26, 6, 10, 0);
			elevator2 = new Elevator(82, 6, 0, 7);
			elevator3 = new Elevator(42, 6, 0, 3);
			
			add(elevator1);
			add(elevator2);
			add(elevator3);
			
			totalGears = 0;
			//enemies functions
			if (skipMobs == false)
			{

				addSlimes();
				addBuzzers();
			}
		}
		
		
		//ACTUALLY ADDING THE ENEMIES TO THE LEVEL
		
		//slime
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
		//buzzer
		private function addBuzzers():void
		{
			buzzers = new Enemies;
			
			buzzers.addBuzzer(16, 10);
			buzzers.addBuzzer(28, 11);
			buzzers.addBuzzer(56, 10);
			
		}
		
		//this assigns the registry to the variables used in map creation. Override it to generate different stages
		public function setData():void
		{
			skyCSV = registry.sky1;
			mapCSV = registry.map1;
			interactCSV = registry.interact1;
			
		}

		//this just loads the floorMap from whatever you set floorCSV to
		public function createFloorMap():void
		{
			map = recycle(FlxTilemap) as FlxTilemap;
			map.loadMap(new mapCSV,registry.tilesPNG, 16, 16, 0, 0, 1, 31);
			//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
			map.setTileProperties(40, FlxObject.UP, null, null, 4);
			
		}
		
		//this just loads the backgroundMap from whatever you set backgroundCSV to
		public function createBackgroundMap():void
		{
			sky = recycle(FlxTilemap) as  FlxTilemap;
			sky.loadMap(new skyCSV, registry.skyTilesPNG, 192, 336);
			sky.setTileProperties(1, FlxObject.NONE);
			sky.scrollFactor.x = 0.9;
		}
		
		//this runs a for loop that checks a map based on interactCSV
		//and creates an interact element in it's respective FlxGroup based on the CSV registry
		public function createInteractiveElements():void
		{
			interact = recycle(FlxTilemap) as FlxTilemap;
			interact.loadMap(new interactCSV, registry.interactPNG, 16, 16,0,0,1,31);
			
			//initialize the interact element FlxGroups
			levelGears =  new FlxGroup;
			levelcWalls = new FlxGroup;
			
			//scan the y axis
			for (var ty:int = 0; ty < interact.heightInTiles; ty++)
			{
				//scan the x axis
				for (var tx:int = 0; tx < interact.widthInTiles; tx++)
				{
					
					//check for goal tiles and add them to the stageGoal FlxGroup
					if (interact.getTile(tx, ty) == 3)
					{
						var tempGear:Gear = new Gear(tx*16, ty*16);
						levelGears.add(tempGear);
						
						totalGears++;
					}
					
					if (interact.getTile(tx, ty) == 4)
					{
						var tempConWall:ConWall = new ConWall(tx*16, ty*16);
						levelcWalls.add(tempConWall);
						
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