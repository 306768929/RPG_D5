package com.d5power.utils
{
	import com.D5Power.utils.CharacterData;
	
	public class MyUserData extends CharacterData
	{
		private var _item:uint = 0;
		public function MyUserData(ispc:Boolean=true)
		{
			super(ispc);
		}
		
		public function set item(u:uint):void
		{
			_item = u;
		}
		
		override public function hasItemNum(itemid:uint):uint
		{
			return _item;
		}
	}
}