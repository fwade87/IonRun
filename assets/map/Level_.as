//Code generated with DAME. http://www.dambots.com

package src
{
	import org.flixel.*;
	public class Level_ extends 
	{
		//Embedded media...
		[Embed(source="../assets/mapCSV_Level1_Sky.csv", mimeType="application/octet-stream")] public var CSV_Level1Sky:Class;
		[Embed(source="../assets/backdrop.png")] public var Img_Level1Sky:Class;
		[Embed(source="../assets/mapCSV_Level1_Map.csv", mimeType="application/octet-stream")] public var CSV_Level1Map:Class;
		[Embed(source="../assets/tiles.png")] public var Img_Level1Map:Class;
		[Embed(source="../assets/mapCSV_Level1_Wax.csv", mimeType="application/octet-stream")] public var CSV_Level1Wax:Class;
		[Embed(source="star.png")] public var Img_Level1Wax:Class;

		//Tilemaps
		public var layerLevel1Sky:FlxTilemap;
		public var layerLevel1Map:FlxTilemap;
		public var layerLevel1Wax:FlxTilemap;

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
			layerLevel1Wax = new FlxTilemap;
			layerLevel1Wax.loadMap( new CSV_Level1Wax, Img_Level1Wax, 16,16 );
			layerLevel1Wax.x = 0.000000;
			layerLevel1Wax.y = 0.000000;
			layerLevel1Wax.scrollFactor.x = 1.000000;
			layerLevel1Wax.scrollFactor.y = 1.000000;
			layerLevel1Wax.collideIndex = 1;
			layerLevel1Wax.drawIndex = 1;

			//Add layers to the master group in correct order.
			masterLayer.add(layerLevel1Sky);
			masterLayer.add(layerLevel1Map);
			masterLayer.add(layerLevel1Wax);


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
