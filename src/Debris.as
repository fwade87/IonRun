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

		}
		
		public function createEmitter(xa:int, ya:int):FlxEmitter 
		{
		
			//	Pixel Explosion
					

			 var emitter:FlxEmitter = recycle(FlxEmitter) as FlxEmitter;
			 _explodes.add(emitter);
			 emitter.maxRotation = 0;
			 emitter.gravity = 1000;
			 emitter.setXSpeed( -100,30);
			 emitter.setYSpeed( -100,100);
			 emitter.makeParticles(bitsPNG, 10,16,true,1); 
			 emitter.x = xa;
			 emitter.y = ya;

			emitter.start(true,1);
			add(emitter);
			return emitter;
		}
	

	}

}