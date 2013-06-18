package uk.co.dubit.whackamole {
	import flash.utils.Dictionary;
	
	public class EventManager extends Object {
		private var _subscribers:Dictionary;
		private var _calls:Dictionary;
		private var _feeds:Dictionary;
		private var _requests:Dictionary;
		private var _notify:Dictionary;
		private var _services:Dictionary;
		private static var __instance:EventManager;
		
		public function EventManager() {
			if (__instance) {
				trace("EventManager is a Singleton class which should only be accessed via getInstance()");
			}
			_feeds = new Dictionary(true);
			_subscribers = new Dictionary(true);
			_requests = new Dictionary(true);
			_services = new Dictionary(true);
			_notify = new Dictionary(true);
		}
		
		public function getFeedData($name:String) {
			if (_feeds[$name]) {
				return _feeds[$name];
			}
			return undefined;
		}
		
		
		public function unpublish($name:String) {
			var _post:* = _feeds[$name];
			delete _feeds[$name];
			return _post;
		}
		
		public function cancel($name:String, $subscriberFunc:Function, ...args): void {
			var _cnt:Number;
			var _subscriberArray:Array;
			if (_subscribers[$name]) {
				for (_cnt = 0; _cnt < _subscribers[$name].length; _cnt++) {
					if (_subscribers[$name][_cnt] == $subscriberFunc) {
						_subscribers[$name].splice(_cnt, 1);
					}
				}
			}
			
			if (_requests[$name]) {
				_subscriberArray = _requests[$name];
				_cnt = _subscriberArray.length;
				
				while (_cnt > 0) {
					if (_subscriberArray[_cnt] == $subscriberFunc) {
						_subscriberArray.splice(_cnt, 1);
					}
					_cnt--;
				}
			}
		}
		
		public function subscribe($name:String, $subscriber:Function, ...args): void {
			var _funcArray:Array;
			var _func:Function;
			
			
			if (_feeds[$name]) {
				$subscriber(_feeds[$name]);
			}
			
			if (! _subscribers[$name]) {
				_subscribers[$name] = new Array();
			}
			_subscribers[$name].push($subscriber);
			
			if (_notify[$name]) {
				_funcArray = _notify[$name];
				
				for each (_func in _funcArray) {
					_func();
				}
				delete _notify[$name];
			}
		}
		
		public function request($name:String, $feedFunction:Function): void {
			var _requestArray:Array;
			var _request:Function;
			
			if (! _feeds[$name]) {
				if (! _requests[$name]) {
					_requests[$name] = new Array();
				}
				_requests[$name].push($feedFunction);
			} else {
				$feedFunction(_feeds[$name]);
			}
			
			if (_notify[$name]) {
				_requestArray = _notify[$name];
				
				for each (_request in _requestArray) {
					_request();
				}
				delete _notify[$name];
			}
		}
		
		public function publish($name:String, $data:*, $args:Object = null): void {
			var _subscriberArray:Array;
			var _func:Function;
			var _cnt:Number = 0;
			_feeds[$name] = $data;
			
			if (_subscribers[$name] != undefined) {
				_subscriberArray = _subscribers[$name].slice();
				_cnt = 0;
				
				while (_cnt < _subscriberArray.length) {
					_func = _subscriberArray[_cnt] as Function;
					
					if ($args) {
						_func($data, $args);
					}else {
						_func($data);
					}
					_cnt++;
				}
			}
			
			if (_requests[$name]) {
				_subscriberArray = _requests[$name].slice();
				delete _requests[$name];
				_cnt = 0;
				
				while (_cnt < _subscriberArray.length) {
					if (_subscriberArray[_cnt] != null) {
						_subscriberArray[_cnt]($data);
					}
					_cnt++;
				}
			}
		}
		
		public function notify($name:String, $subscriber:Function): void {
			if (_requests[$name] || _subscribers[$name]) {
				$subscriber();
			}else {
				if (! _notify[$name]) {
					_notify[$name] = new Array();
				}
				_notify[$name].push($subscriber);
			}
		}
		
		
		public static function getInstance(): EventManager {
			if (! __instance) {
				__instance = new EventManager();
			}
			return __instance;
		}
		
		public static function get instance(): EventManager {
			return getInstance();
		}
	}
}