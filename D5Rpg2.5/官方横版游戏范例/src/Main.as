package
{
	import com.D5Power.Objects.NCharacterObject;
	import com.D5Power.mission.EventData;
	import com.D5Power.utils.CharacterData;
	import com.d5power.ui.NPCDialog;
	import com.d5power.utils.MyUserData;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	[SWF(width="1200",height="650",frameRate="30",backgroundColor="0x000000")]
	public class Main extends Sprite
	{
		private static var _me:Main;
		
		private var _game:MyGame;
		private var npcDialogBox:NPCDialog;
		
		public static function get me():Main
		{
			return _me;
		}
		
		public function Main()
		{
			Global.userdata = new MyUserData();
			Global.userdata.getCanSeeMission(1);
			_me = this;
			_game = new MyGame('map25',stage);
			addChild(_game);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,showtree);
		}
		
		public function npcWindow(say:String,event:EventData,npc:NCharacterObject,misid:uint,type:uint=0,complate:Boolean=false):void
		{
			if(npcDialogBox==null)
			{
				npcDialogBox = new NPCDialog();
			}
			
			npcDialogBox.config(say,npc,misid,type,complate);
			if(!contains(npcDialogBox)) addChild(npcDialogBox);
		}
		private function showtree(e:*):void
		{
			tree(stage);
		}
		//列出下级的所有树级显示目录
		private static var arr:Array=new Array();
		public static function tree(dis:DisplayObject,layer:int=0,num:int=0):void
		{   
			if(arr==null) arr=new Array();
			var str:String="";
			var addStr:String="";
			for(var _num:int=0;_num<layer;_num++)
			{
				if(arr[_num]==false){
					addStr="        ";
				}else {
					addStr="      ||";							
				}
				if(_num==layer-1) addStr="      ||";
				str+=addStr;
			}
			if(layer>0){
				if(num>=dis.parent.numChildren-1){
					arr[layer-1]=false;
				}else{
					arr[layer-1]=true;
				}
			}
			trace(str+"==>"+"【"+dis.toString().substring(8,dis.toString().length-1)+"】"+dis.name,(dis.hasOwnProperty("mouseEnabled")?dis.mouseEnabled:" "),(dis.hasOwnProperty("mouseChildren")?dis.mouseChildren:""),"x:",dis.x,"y:",dis.y,"layer:",layer);
			if(dis is DisplayObjectContainer)
			{
				for(var i:int=0;i<dis.numChildren;i++){
					var child:DisplayObject=dis.getChildAt(i);
					if((child as DisplayObject)!=null){
						tree(child,layer+1,i);
					}
				}
			}
			if(layer==0) arr=null;
		}
	}
}