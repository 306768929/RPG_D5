package
{
	import com.D5Power.Controler.Actions;
	import com.D5Power.Controler.CharacterControler;
	import com.D5Power.D5Game;
	import com.D5Power.Stuff.HSpbar;
	import com.d5power.MyScene;
	import com.d5power.controller.HeroContorller;
	import com.d5power.objects.Hero;
	
	import flash.display.Stage;
	import flash.events.Event;
	
	public class MyGame extends D5Game
	{
		public function MyGame(config:String, stg:Stage, openGPU:uint=0)
		{
			super(config, stg, openGPU);
		}
		
		override protected function buildScene():void
		{
			_scene = new MyScene(_stg,this);
		}
		
		override protected function init(e:Event=null):void
		{
			super.init();
			
			var ctrl:HeroContorller = new HeroContorller(_scene.perc,CharacterControler.MOUSE);
			var player:Hero = new Hero(ctrl);
			
			player.setPos(500,500);
			player.speed = 6.5;
			player.setName("寂无名",-1,0,-130);
			player.action = Actions.Wait;
			
			player.hp = 150;
			player.hpMax = 150;
			player.hpBar = new HSpbar(player,'hp','hpMax',10);
			
			_scene.createPlayer(player);
			_camera.focus(player);
			
		}
		
		
		public function openRob():void
		{
			// 随机生成50个角色
			var px:uint = 0;
			var py:uint = 0;
			for(var i:uint=0;i<100;i++)
			{
				px = 20+int(2000*Math.random());
				py = 400+int(150*Math.random());
				(_scene as MyScene).createMonser(px,py,0);
			}
		}
	}
}