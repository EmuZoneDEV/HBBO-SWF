﻿package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11552 implements IMessageComposer 
    {
        private var _Str_2156:Array;

        public function _Str_11552(k:int, _arg_2:int)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
            this._Str_2156.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }
    }
}
