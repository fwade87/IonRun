//Code generated with DAME. http://www.dambots.com

package src
{
	import org.flixel.*;
	public class Level_ extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../mapCSV_Level1_Sky.csv", mimeType="application/octet-stream")] public var CSV_Level1Sky:Class;
		[Embed(source="../backdrop.png")] public var Img_Level1Sky:Class;
		[Embed(source="../mapCSV_Level1_Map.csv", mimeType="application/octet-stream")] public var CSV_Level1Map:Class;
		[Embed(source="../tiles.png")] public var Img_Level1Map:Class;
		[Embed(source="../mapCSV_Level1_Interact.csv", mimeType="application/octet-stream")] public var CSV_Level1Interact:Class;
		[Embed(source="../interactive.png")] public var Img_Level1Interact:Class;
		[Embed(source="../mapCSV_Level2_Sky.csv", mimeType="application/octet-stream")] public var CSV_Level2Sky:Class;
		[Embed(source="../backdrop.png")] public var Img_Level2Sky:Class;
		[Embed(source="../mapCSV_Level2_Map.csv", mimeType="application/octet-stream")] public var CSV_Level2Map:Class;
		[Embed(source="../tiles.png")] public var Img_Level2Map:Class;
		[Embed(source="../mapCSV_Level2_Interact.csv", mimeType="application/octet-stream")] public var CSV_Level2Interact:Class;
		[Embed(source="../interactive.png")] public var Img_Level2Interact:Class;

		//Tilemaps
		public var layerLevel1Sky:FlxTilemap;
		public var layerLevel1Map:FlxTilemap;
		public var layerLevel1Interact:FlxTilemap;
		public var layerLevel2Sky:FlxTilemap;
		public var layerLevel2Map:FlxTilemap;
		public var layerLevel2Interact:FlxTilemap;

		//Sprites


		public function Level_(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerLevel1Sky = new FlxTilemap;
			layerLevel1Sky.loadMap( new CSV_Level1Sky, Img_Level1Sky, 192,336 );
			layerLevel1Sky.x = 0.000000;
			layerLevel1Sky.y = 0.000000;
			layerLevel1Sky.scrollFactor.x = 0.600000;
			layerLevel1Sky.scrollFactor.y = 1.000000;
			layerLevel1Sky.collideIndex = 1;
			layerLevel1Sky.drawIndex = 1;
			layerLevel1Map = new FlxTilemap;
			layerLevel1Map.loadMap( new CSV_Level1Map, Img_Level1Map, 16,16 );
			layerLevel1Map.x = 0.000000;
			layerLevel1Map.y = 0.000000;
			layerLevel1Map.scrollFactor.x = 1.000000;
			layerLevel1Map.scrollFactor.y = 1.000000;
			layerLevel1Map.collideIndex = 31;
			layerLevel1Map.drawIndex = 1;
			layerLevel1Interact = new FlxTilemap;
			layerLevel1Interact.loadMap( new CSV_Level1Interact, Img_Level1Interact, 16,16 );
			layerLevel1Interact.x = 0.000000;
			layerLevel1Interact.y = 0.000000;
			layerLevel1Interact.scrollFactor.x = 1.000000;
			layerLevel1Interact.scrollFactor.y = 1.000000;
			layerLevel1Interact.collideIndex = 1;
			layerLevel1Interact.drawIndex = 1;
			layerLevel2Sky = new FlxTilemap;
			layerLevel2Sky.loadMap( new CSV_Level2Sky, Img_Level2Sky, 192,336 );
			layerLevel2Sky.x = 0.000000;
			layerLevel2Sky.y = 0.000000;
			layerLevel2Sky.scrollFactor.x = 0.600000;
			layerLevel2Sky.scrollFactor.y = 1.000000;
			layerLevel2Sky.collideIndex = 1;
			layerLevel2Sky.drawIndex = 1;
			layerLevel2Map = new FlxTilemap;
			layerLevel2Map.loadMap( new CSV_Level2Map, Img_Level2Map, 16,16 );
			layerLevel2Map.x = 0.000000;
			layerLevel2Map.y = 0.000000;
			layerLevel2Map.scrollFactor.x = 1.000000;
			layerLevel2Map.scrollFactor.y = 1.000000;
			layerLevel2Map.collideIndex = 31;
			layerLevel2Map.drawIndex = 1;
			layerLevel2Interact = new FlxTilemap;
			layerLevel2Interact.loadMap( new CSV_Level2Interact, Img_Level2Interact, 16,16 );
			layerLevel2Interact.x = 0.000000;
			layerLevel2Interact.y = 0.000000;
			layerLevel2Interact.scrollFactor.x = 1.000000;
			layerLevel2Interact.scrollFactor.y = 1.000000;
			layerLevel2Interact.collideIndex = 1;
			layerLevel2Interact.drawIndex = 1;

			//Add layers to the master group in correct order.
			masterLayer.add(layerLevel1Sky);
			masterLayer.add(layerLevel1Map);
			masterLayer.add(layerLevel1Interact);
			masterLayer.add(layerLevel2Sky);
			masterLayer.add(layerLevel2Map);
			masterLayer.add(layerLevel2Interact);


			if ( addToStage )
			{
				FlxG.state.add(masterLayer);
			}

			mainLayer = layer;

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 1920;
			boundsMaxY = 336;

		}


	}
}
