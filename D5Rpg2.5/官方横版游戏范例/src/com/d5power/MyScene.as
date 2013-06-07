package com.d5power
{
	import com.D5Power.Controler.Actions;
	import com.D5Power.Objects.NCharacterObject;
	import com.D5Power.Stuff.HSpbar;
	import com.D5Power.mission.EventData;
	import com.D5Power.mission.MissionData;
	import com.D5Power.scene.BaseScene;
	import com.d5power.controller.MonsterController;
	import com.d5power.objects.Hero;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	
	public class MyScene extends BaseScene
	{
		public function MyScene(stg:Stage, container:DisplayObjectContainer)
		{
			super(stg, container);
		}
		
		override public function missionCallBack(name:String, say:String, event:EventData, miss:Vector.<MissionData>, obj:NCharacterObject):void
		{
			var misid:uint=0;
			var type:uint = 0;
			var complate:Boolean=false;
			if(miss!=null && miss.length!=0)
			{
				if(miss.length==1)
				{
					say = miss[0].info; //"<font color='#FF9900'>" + miss[0].name + "</font><br><br>"+
					misid = miss[0].id;
					type = miss[0].type;
					complate = miss[0].isComplate;
				}else{
					for each(var data:MissionData in miss)
					{
						say+= "<br>任务："+data.name+"（完成状态）";
					}
				}
			}
			
			Main.me.npcWindow(say,event,obj,misid,type,complate);
		}
		
		public function createMonser(posx:uint,posy:uint,camp:uint = 2):void
		{
			var ctrl:MonsterController = new MonsterController(perc);
			var player:Hero = new Hero(ctrl);
			
			player.setPos(posx,posy);
			player.speed = 6.5;
			player.camp = camp;// 阵营
			player.setName(
				(camp==2 ? "寂无名·假" : "D5机器人-"+int(Math.random()*100)),
				(camp==2 ? 0xff0000 : 0xffff00),
				0,
				-130
			);
			player.action = Actions.Wait;
			if(camp==2)
			{
				player.hp = 50;
				player.hpMax = 50;
				player.hpBar = new HSpbar(player,'hp','hpMax',10);
			}
			
			addObject(player);
		}
	}
}