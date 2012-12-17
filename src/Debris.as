package  
{
	import org.flixel.*;

	public class Debris extends FlxGroup
	{
		[Embed(source = "../assets/bits.png")] public var bitsPNG:Class;
		public var emitter:FlxEmitter;
		public var _explodes:FlxGroup;
		
		public function Debris() 
		{
					super();
				_explodes = new FlxGroup();	
				
					//	Pixel Explosion
				 var emitter:FlxEmitter = recycle(FlxEmitter) as FlxEmitter;
				 _explodes.add(emitter);
				 emitter.maxRotation = 0;
				 emitter.gravity = 1000;
				 emitter.setXSpeed( -100, 100);
				 emitter.setYSpeed( -500, 100);
				 emitter.makeParticles(bitsPNG,50,12,true,0);         
				 add(emitter);
				
		}
	
		public function explodeEnemy(xa:int, ya:int):void
		{
			var emitter:FlxEmitter = recycle(FlxEmitter) as FlxEmitter;
			xa = emitter.x;
			ya = emitter.y;
			emitter.start(true, 3,0.5,0);
		}
	}

}