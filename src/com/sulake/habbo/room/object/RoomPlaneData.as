﻿package com.sulake.habbo.room.object
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3D;

    public class RoomPlaneData 
    {
        public static const _Str_12684:int = 0;
        public static const _Str_6072:int = 1;
        public static const _Str_6206:int = 2;
        public static const _Str_7988:int = 3;
        public static const _Str_18788:int = 4;

        private var _type:int = 0;
        private var _loc:Vector3d = null;
        private var _leftSide:Vector3d = null;
        private var _rightSide:Vector3d = null;
        private var _normal:Vector3d = null;
        private var _normalDirection:Vector3d = null;
        private var _secondaryNormals:Array;
        private var _masks:Array;

        public function RoomPlaneData(k:int, _arg_2:IVector3D, _arg_3:IVector3D, _arg_4:IVector3D, _arg_5:Array)
        {
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:int;
            var _local_12:IVector3D;
            var _local_13:Vector3d;
            this._secondaryNormals = [];
            this._masks = [];
            super();
            this._loc = new Vector3d();
            this._loc._Str_2427(_arg_2);
            this._leftSide = new Vector3d();
            this._leftSide._Str_2427(_arg_3);
            this._rightSide = new Vector3d();
            this._rightSide._Str_2427(_arg_4);
            this._type = k;
            if (((!(_arg_3 == null)) && (!(_arg_4 == null))))
            {
                this._normal = Vector3d._Str_7423(_arg_3, _arg_4);
                _local_6 = 0;
                _local_7 = 0;
                _local_8 = 0;
                _local_9 = 0;
                _local_10 = 0;
                if (((!(this.normal.x == 0)) || (!(this.normal.y == 0))))
                {
                    _local_9 = this.normal.x;
                    _local_10 = this.normal.y;
                    _local_6 = (360 + ((Math.atan2(_local_10, _local_9) / Math.PI) * 180));
                    if (_local_6 >= 360)
                    {
                        _local_6 = (_local_6 - 360);
                    }
                    _local_9 = Math.sqrt(((this.normal.x * this.normal.x) + (this.normal.y * this.normal.y)));
                    _local_10 = this.normal.z;
                    _local_7 = (360 + ((Math.atan2(_local_10, _local_9) / Math.PI) * 180));
                    if (_local_7 >= 360)
                    {
                        _local_7 = (_local_7 - 360);
                    }
                }
                else
                {
                    if (this.normal.z < 0)
                    {
                        _local_7 = 90;
                    }
                    else
                    {
                        _local_7 = 270;
                    }
                }
                this._normalDirection = new Vector3d(_local_6, _local_7, _local_8);
            }
            if (((!(_arg_5 == null)) && (_arg_5.length > 0)))
            {
                _local_11 = 0;
                while (_local_11 < _arg_5.length)
                {
                    _local_12 = _arg_5[_local_11];
                    if (((!(_local_12 == null)) && (_local_12.length > 0)))
                    {
                        _local_13 = new Vector3d();
                        _local_13._Str_2427(_local_12);
                        _local_13._Str_6038((1 / _local_13.length));
                        this._secondaryNormals.push(_local_13);
                    }
                    _local_11++;
                }
            }
        }

        public function get type():int
        {
            return this._type;
        }

        public function get loc():IVector3D
        {
            return this._loc;
        }

        public function get _Str_5424():IVector3D
        {
            return this._leftSide;
        }

        public function get _Str_4968():IVector3D
        {
            return this._rightSide;
        }

        public function get normal():IVector3D
        {
            return this._normal;
        }

        public function get _Str_25207():IVector3D
        {
            return this._normalDirection;
        }

        public function get _Str_20277():int
        {
            return this._secondaryNormals.length;
        }

        public function get _Str_6845():int
        {
            return this._masks.length;
        }

        public function _Str_22585(k:int):IVector3D
        {
            if (((k < 0) || (k >= this._Str_20277)))
            {
                return null;
            }
            var _local_2:Vector3d = new Vector3d();
            _local_2._Str_2427((this._secondaryNormals[k] as IVector3D));
            return _local_2;
        }

        public function addMask(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number):void
        {
            var _local_5:RoomPlaneMaskData = new RoomPlaneMaskData(k, _arg_2, _arg_3, _arg_4);
            this._masks.push(_local_5);
        }

        private function _Str_8361(k:int):RoomPlaneMaskData
        {
            if (((k < 0) || (k >= this._Str_6845)))
            {
                return null;
            }
            return this._masks[k];
        }

        public function _Str_25133(k:int):Number
        {
            var _local_2:RoomPlaneMaskData = this._Str_8361(k);
            if (_local_2 != null)
            {
                return _local_2._Str_5120;
            }
            return -1;
        }

        public function _Str_23609(k:int):Number
        {
            var _local_2:RoomPlaneMaskData = this._Str_8361(k);
            if (_local_2 != null)
            {
                return _local_2._Str_4659;
            }
            return -1;
        }

        public function _Str_25097(k:int):Number
        {
            var _local_2:RoomPlaneMaskData = this._Str_8361(k);
            if (_local_2 != null)
            {
                return _local_2._Str_9124;
            }
            return -1;
        }

        public function _Str_25617(k:int):Number
        {
            var _local_2:RoomPlaneMaskData = this._Str_8361(k);
            if (_local_2 != null)
            {
                return _local_2._Str_12156;
            }
            return -1;
        }
    }
}