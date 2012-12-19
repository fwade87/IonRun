package  
{
	/**
	 * ...
	 * @author Frank Wade
	 */
	public class LevelData 
	{
		[Embed(source = "../assets/mapCSV_Level1_Map.csv", mimeType = "application/octet-stream")] public var map1:Class;
		[Embed(source = "../assets/mapCSV_Level1_Sky.csv", mimeType = "application/octet-stream")] public var sky1:Class;
		[Embed(source = "../assets/mapCSV_Level1_Interact.csv", mimeType = "application/octet-stream")] public var interact1:Class;
		
		[Embed(source = "../assets/mapCSV_Level2_Map.csv", mimeType = "application/octet-stream")] public var map2:Class;
		[Embed(source = "../assets/mapCSV_Level2_Sky.csv", mimeType = "application/octet-stream")] public var sky2:Class;
		[Embed(source = "../assets/mapCSV_Level2_Interact.csv", mimeType = "application/octet-stream")] public var interact2:Class;
		
		[Embed(source = "../assets/tiles.png")]public var tilesPNG:Class;
		[Embed(source = "../assets/backdrop.png")]public var skyTilesPNG:Class;
		[Embed(source = "../assets/interactive.png")]public var interactPNG:Class;

		
		public function LevelData() 
		{

		}
		
	}

}