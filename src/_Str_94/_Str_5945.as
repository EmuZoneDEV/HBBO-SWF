﻿package _Str_94
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_5945 implements IMessageComposer 
    {
        private var _Str_578:int;

        public function _Str_5945(k:int)
        {
            this._Str_578 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._Str_578);
            return k;
        }
    }
}