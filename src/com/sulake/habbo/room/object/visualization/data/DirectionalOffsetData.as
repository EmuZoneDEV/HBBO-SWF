﻿package com.sulake.habbo.room.object.visualization.data
{
    import flash.utils.Dictionary;

    public class DirectionalOffsetData 
    {
        private var _offsetX:Dictionary;
        private var _offsetY:Dictionary;

        public function DirectionalOffsetData()
        {
            this._offsetX = new Dictionary();
            this._offsetY = new Dictionary();
            super();
        }

        public function _Str_19089(k:int, _arg_2:int):int
        {
            if (this._offsetX[k] == null)
            {
                return _arg_2;
            }
            return this._offsetX[k];
        }

        public function _Str_21951(k:int, _arg_2:int):int
        {
            if (this._offsetY[k] == null)
            {
                return _arg_2;
            }
            return this._offsetY[k];
        }

        public function _Str_9421(k:int, _arg_2:int, _arg_3:int):void
        {
            this._offsetX[k] = _arg_2;
            this._offsetY[k] = _arg_3;
        }
    }
}
