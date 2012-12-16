//Code generated with DAME. http://www.dambots.com

package 
{
	import org.flixel.*;
	import flash.utils.Dictionary;
	public class Level_Level1 extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../assets/mapCSV_Level1_Sky.csv", mimeType="application/octet-stream")] public var CSV_Sky:Class;
		[Embed(source="../../Reference/Building a retro Flash game in Flixel Part 2/Building a retro Flash game in Flixel Part 1/Building a retro Flash game in Flixel Part 1/Nutmeg Part 2 - The Map/map/backdrop.png")] public var Img_Sky:Class;
		[Embed(source="../assets/mapCSV_Level1_Map.csv", mimeType="application/octet-stream")] public var CSV_Map:Class;
		[Embed(source="../../Reference/Building a retro Flash game in Flixel Part 2/Building a retro Flash game in Flixel Part 1/Building a retro Flash game in Flixel Part 1/Nutmeg Part 2 - The Map/map/tiles.png")] public var Img_Map:Class;
		[Embed(source="../assets/mapCSV_Level1_Stars.csv", mimeType="application/octet-stream")] public var CSV_Stars:Class;
		[Embed(source="../../Reference/Building a retro Flash game in Flixel Part 2/Building a retro Flash game in Flixel Part 1/Building a retro Flash game in Flixel Part 1/Nutmeg Part 2 - The Map/map/star.png")] public var Img_Stars:Class;

		//Tilemaps
		public var layerSky:FlxTilemap;
		public var layerMap:FlxTilemap;
		public var layerStars:FlxTilemap;

		//Sprites
		public var ObjectsGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Level1(addToStage:Boolean = true, onAddCallback:Function = null, parentObject:Object = null)
		{
			// Generate maps.
			var properties:Array = [];
			var tileProperties:Dictionary = new Dictionary;

			properties = generateProperties( null );
			layerSky = addTilemap( CSV_Sky, Img_Sky, 0.000, 0.000, 192, 336, 0.600, 1.000, false, 1, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerMap = addTilemap( CSV_Map, Img_Map, 0.000, 0.000, 16, 16, 1.000, 1.000, false, 31, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerStars = addTilemap( CSV_Stars, Img_Stars, 0.000, 0.000, 16, 16, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerSky);
			masterLayer.add(layerMap);
			masterLayer.add(ObjectsGroup);
			masterLayer.add(layerStars);

			if ( addToStage )
				createObjects(onAddCallback, parentObject);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 1600;
			boundsMaxY = 336;
			boundsMin = new FlxPoint(0, 0);
			boundsMax = new FlxPoint(1600, 336);
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null, parentObject:Object = null):void
		{
			addSpritesForLayerObjects(onAddCallback);
			generateObjectLinks(onAddCallback);
			if ( parentObject != null )
				parentObject.add(masterLayer);
			else
				FlxG.state.add(masterLayer);
		}

		public function addSpritesForLayerObjects(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Star, ObjectsGroup , 144.000, 112.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 16.000, 32.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 16.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 688.000, 208.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 688.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 688.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 672.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 704.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 256.000, 112.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 256.000, 96.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 256.000, 80.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 256.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 256.000, 48.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 240.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 272.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 112.000, 112.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 80.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 128.000, 96.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 16.000, 0.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 48.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 480.000, 48.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 448.000, 48.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 464.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 464.000, 48.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 464.000, 32.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 64.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 32.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 816.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 784.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 800.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 800.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 800.000, 208.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1040.000, 80.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1136.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 992.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1056.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1072.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1088.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 960.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1008.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 992.000, 208.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1040.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1024.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1104.000, 96.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1088.000, 96.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1088.000, 112.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1104.000, 112.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1200.000, 80.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1216.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1232.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1232.000, 32.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1184.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1200.000, 176.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1280.000, 144.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1296.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1376.000, 176.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1392.000, 144.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1152.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1344.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1520.000, 128.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1424.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1408.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1408.000, 48.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1472.000, 80.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1504.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1440.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1280.000, 32.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1280.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1296.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 1296.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 768.000, 64.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 768.000, 48.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 768.000, 32.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 768.000, 16.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 448.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 448.000, 224.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 448.000, 208.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 592.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 192.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 208.000, 256.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
			addSpriteToLayer(null, Star, ObjectsGroup , 880.000, 96.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"star"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
