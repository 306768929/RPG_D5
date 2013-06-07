package com.d5power.objects
{
	import com.D5Power.Controler.Actions;
	import com.D5Power.Controler.BaseControler;
	import com.D5Power.Objects.CharacterObject;
	import com.D5Power.graphics.ISwfDisplayer;
	import com.D5Power.graphics.Swf2d;
	
	public class Hero extends CharacterObject
	{
		private var _face:Swf2d;
		public function Hero(ctrl:BaseControler=null)
		{
			_face = new Swf2d();
			displayer = _face;
			super(ctrl);
		}
		
		override public function setDirectionNum(v:int):void
		{
			if(v==_direction) return;
			super.setDirectionNum(v);
			
			if(v==directions.Left || v==directions.LeftUp || v==directions.LeftDown)
			{
				(_displayer as Swf2d).scaleX = -1;
			}else{
				(_displayer as Swf2d).scaleX = 1;
			}
		}
		
		override public function set action(u:int):void
		{
			if(_action!=u)
			{
				_face.changeSWF("asset/character/1/"+u+".swf");
			}
			super.action = u;
			
		}
	}
}