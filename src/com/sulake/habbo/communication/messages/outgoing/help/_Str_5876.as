﻿package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_5876 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_5876(k:int)
        {
            this._Str_2156 = [];
            super();
            this._Str_2156 = [k];
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }

        public function get disposed():Boolean
        {
            return this._Str_2156 == null;
        }
    }
}
